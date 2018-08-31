Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
	[209.85.222.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8E0745F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:18:33 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id h1-v6so7478722uao.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 00:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jObMdEodF6bE8fB8ca0t5uDhIKSSSKnH40L3hwBqLDU=;
	b=PKANh6E8+kiaZKijQgZ6I4AUTOsvSPc1fdirmfVgOBbQHcjFD++35JCRI7mfxZUVYU
	H2JJ3ho3K8dG37pW0OfuQFHY+ahhmMS6oG52X/IMkeEzVWXxeOgJemPu+zWRiYSfVsZq
	J9cAv5jOob0bwIV7Fk7QsH8Pwy0qVBiOO8qoXLMBTsBs0b80Ie0L3svk9PFT2Z/mvm9X
	XcuGaQ4AgWYB8lcE9oJYwSvi+DgS6QKdxORNhLB+eCwSSghtDJRzLuFPHtSs9/UgA38M
	YhEsEvxJ0mbtSv1CIcEUJ7zoFXbWDp1R9R/HCR7aj/2bifFNhHeUOIPOFiICuebuN2No
	ZdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jObMdEodF6bE8fB8ca0t5uDhIKSSSKnH40L3hwBqLDU=;
	b=QFqS6fx89PSaE0f1fja6MJHXwuZLxelwCnUFaYRWB9Szekz/T7sw4/CXkJAEr6XqCs
	LyYodsWdkmjIZClv9uY3BHd9C/R1wTr8dtk4ir4ZDapUl50kLL8VNpKN7YKQl1tq8kA6
	JqCY4IrBVJfUI5n7qBAope/m9iadddHrZz5PBqm4zsJ+Yi37qgz+MeMNYoFG8HGzuxRZ
	g7uRuiPCHdKPPdPtL4Rr7yVhbSVF9l+7dgCgYh0V5UFzZSrfJSxhyll3tg0KOjSzqVk+
	q+j5MDcpO0m16iiOtiPQIWvSw3Lt0ua5/L9vj0qyCzsXuFeXPckqvFpIjljJpSv4Daog
	slhA==
X-Gm-Message-State: APzg51D49MLq8pZZ8AawqIRd81MAGr64X17HRia01aflSuYRIo+4iIGQ
	4mY+kjPtv0h5tuau2LfCNgeS1AAuaTKlGMyCDXs=
X-Google-Smtp-Source: ANB0VdY0QK8tXEJUob3W+B3VKKMX42wqvFfY4hcsnWY3FNa7zE2QT5kC7a8B7uUSCAqOXXJ2IsiJdoMjSkuE+5QmhL4=
X-Received: by 2002:a9f:318a:: with SMTP id
	v10-v6mr9303352uad.36.1535699914315; 
	Fri, 31 Aug 2018 00:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <1535618064-18215-1-git-send-email-alex.kiernan@gmail.com>
	<CAJTo0LYyqaNRO39badfpH8F-H97-v0M_NpBrGhYamzaOn+MqEQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYyqaNRO39badfpH8F-H97-v0M_NpBrGhYamzaOn+MqEQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 31 Aug 2018 08:18:23 +0100
Message-ID: <CAO5Uq5Ro-s04ePOeODyktaVS42POFwut6ADYAzYFf7Qve9SbCQ@mail.gmail.com>
To: ross.burton@intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sudo: Add missing dep on virtual/crypt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2018 07:18:33 -0000
Content-Type: text/plain; charset="UTF-8"

I have to admit, I didn't look, I just assumed it was working for the
pam case, since I don't have a build which needs pam.

Looking at the sudo code/libpam, it looks like you need it, but you'd
get it through transitive dependencies - should we just add it
unconditionally here?

On Thu, Aug 30, 2018 at 9:52 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> That suggests that the crypt dependency is only needed if pam is
> disabled, is that the case?
>
> Ross
>
> On 30 August 2018 at 09:34, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > Ensure we have virtual/crypt even if building without PAM; fixes:
> >
> >   sudo: error in /etc/sudo.conf, line 0 while loading plugin "sudoers_policy"
> >   sudo: unable to load /usr/libexec/sudo/sudoers.so: /usr/libexec/sudo/sudoers.so: undefined symbol: crypt
> >   sudo: fatal error, unable to load plugins
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/recipes-extended/sudo/sudo_1.8.23.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/sudo/sudo_1.8.23.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
> > index ab9c8cb..18add22 100644
> > --- a/meta/recipes-extended/sudo/sudo_1.8.23.bb
> > +++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
> > @@ -10,7 +10,7 @@ PAM_SRC_URI = "file://sudo.pam"
> >  SRC_URI[md5sum] = "ea444d747feb1decfebdffd0b38b0739"
> >  SRC_URI[sha256sum] = "d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679"
> >
> > -DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> > +DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', 'virtual/crypt', d)}"
> >  RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
> >
> >  EXTRA_OECONF += " \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Alex Kiernan

