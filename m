Return-Path: <jacob.kroon@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B0F7E60229
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 17:12:36 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id c9so20859644itj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 09:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fp8hOdCMNCAn8M+yKPZX9fO4CWTkUU9tYZBw9pbe4Z8=;
	b=nTv5h3xnEsMK4ePzwkGoGuJ8zsMDbmw7qMdvm00VaKidLq/yHyTYES+E6xUyaD59SF
	ddaO0Bb/lsskl2lOfLNGONCfMa33RbFBVlVE4xyQwY6t+/+CLxiJ0DICKRJyjvUHaLwk
	kaywWpZQfSIP/1FBtAsONRbkahdutJofc2RkMen0cT+xhuTzXPNVQrtSp0t4VAq+BNeM
	i3/1+6w2wYCQAbWreblrAuZJQ9TBNeik8PIboLzT2YKB7BDrj1HFhE+K8t9Hyme0gqwe
	lpF1tO4QOaUH8KHLRRo1cUWXjA8qgHERzW8hi9EqrprdgwuJ+uZxPLNuuBdQ2meBxfAS
	G7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fp8hOdCMNCAn8M+yKPZX9fO4CWTkUU9tYZBw9pbe4Z8=;
	b=JmgDfuMY26kF09EweU/uX5i3WX5lx875ZJhZw1hBqH7cifeo5m7tlzoa4X6N4g8Ysp
	4cQO89VaZVcEZVDz5WwJQR8tsSXtTlBnUdEw41Z2/0b6LZCEzOvDme3SEn+PFmkmUsIg
	OI+lBr+HNrGOziLTbbo26LoxGpJ89ys4eDf9YAfptV7jkziE5SEoFjYyOn5rf/TsyClF
	e6TE/cQVHWAGI877oTcADT8XF8zJiqOrrOdslv3n5RNcDerYbiZocUlewQKr40xLe4oY
	eIkDpdC0amdOXocMWz+TOtwax0i2xwnkqKgHIHutNh3D8lFlMka2K75Qx1m/fEiWNrIS
	bfYg==
X-Gm-Message-State: AJcUukccf7QBv7i6997u8W6kXUsFq6U4Aj7d3qxxovC21SgkTmByf++j
	Q8Je6LiXOUPfbrVH2ev9i+QERD/OucdctgArBrs=
X-Google-Smtp-Source: ALg8bN43YuuqXPQaomUQf8HArnl4UvDVg/Hlblbl36wNXj9mvNkozXkdd+3eRxLJ0rZQsPm/IsrSOE599Bzj2cOtUhM=
X-Received: by 2002:a24:214a:: with SMTP id e71mr10985079ita.60.1545844357637; 
	Wed, 26 Dec 2018 09:12:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543484174.git.Qi.Chen@windriver.com>
	<75835e51f6c88a58056350759080d5c0004562b7.1543484174.git.Qi.Chen@windriver.com>
	<CAPbeDCk-GccokSj9tNUj6CGpQ-U946C-emM48=ANdOZATORiCA@mail.gmail.com>
In-Reply-To: <CAPbeDCk-GccokSj9tNUj6CGpQ-U946C-emM48=ANdOZATORiCA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Wed, 26 Dec 2018 18:12:25 +0100
Message-ID: <CAPbeDC=unS=7wKvd5Ac+YSHLmakYC0EYxLAE49Z3k3qGSEXyCw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase: add entry to /etc/hosts according to /etc/hostname
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
X-List-Received-Date: Wed, 26 Dec 2018 17:12:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 26, 2018 at 5:06 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On Fri, Nov 30, 2018 at 3:18 AM Chen Qi <Qi.Chen@windriver.com> wrote:
> >
> > We default hostname to ${MACHINE}, but it's not in /etc/hosts,
> > resulting in commands like `hostname -f' failing due to lack
> > of entry.
> >
> > So add entry to /etc/hosts according to /etc/hostname. We do
> > this via pkg_postinst because hostname is set in base-files
> > recipe.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-core/netbase/netbase_5.4.bb | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/meta/recipes-core/netbase/netbase_5.4.bb b/meta/recipes-core/netbase/netbase_5.4.bb
> > index 5ab0c58..da9255a 100644
> > --- a/meta/recipes-core/netbase/netbase_5.4.bb
> > +++ b/meta/recipes-core/netbase/netbase_5.4.bb
> > @@ -23,3 +23,14 @@ do_install () {
> >  }
> >
> >  CONFFILES_${PN} = "${sysconfdir}/hosts"
> > +
> > +RDEPENDS_${PN} += "base-files"
> > +
> > +pkg_postinst_${PN} () {
> > +       if [ -s $D${sysconfdir}/hostname ]; then
> > +               hostname=`cat $D${sysconfdir}/hostname`
> > +               if ! grep -q "[[:space:]]$hostname[[:space:]]*" $D${sysconfdir}/hosts; then
> > +                       echo "127.0.1.1 $hostname" >> $D${sysconfdir}/hosts
>
> Shouldn't that be "127.0.0.1" ?
>

I thought it was a typo, but apparently there are reasons for using 127.0.1.1:
https://serverfault.com/questions/363095/why-does-my-hostname-appear-with-the-address-127-0-1-1-rather-than-127-0-0-1-in

Sorry for the noise.

> > +               fi
> > +       fi
> > +}
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

