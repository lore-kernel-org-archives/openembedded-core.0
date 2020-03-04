Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 76AEC61157
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 23:44:08 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id c126so1104201vkg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 15:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Evxpznls2k4kIfO32QgVZ+M7dc0pRiTVW5YASIkIc/g=;
	b=JWY2/od4UBA5V4ZTtCtvy/8eF4HQXi33Qd+f822nvCDK8Y/mxUn4XcWKYsWsrj6sNN
	epboJVwIpXk2eHaYCiNI4hzZEIhvFMP3qYfjg5/KTdzBxLJuHMP0k+EAl3hhr0uOlqGZ
	ZY5wunkkxO9RvMAXkw6DOjRoQHc+ZWkNpqsb08xwYzpQy1lRO+42QrRnBFkgUeK9ZWzG
	OQfomhYI9LACW3Ll3PNc5+0OKZ6kpOckJMMaUjfB5x/2YNaP4zk9lcvu+GJJaUDn2EW0
	/wua6h+LCaGLbWT0erO5f2+v0PpLmXGQjbxtrU4kZF3YFq8K8E6BJEXbfm5arGa5hIdJ
	DmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Evxpznls2k4kIfO32QgVZ+M7dc0pRiTVW5YASIkIc/g=;
	b=iEbG7xmPkYWtM7+uAD3pEaD9HZsoLoH3oumWeH4dUrbj8eNrQaCkjZptLYe4mKRoVs
	5sO2ZxWiHxtApwdZJQmVkHlKNpMstMf25E8th3AMUSFv5Muj/0TsFBhvtSUm/FCVhQDS
	XsdUunjxSEgIxODcOzPDnQGEmRFTY1Neajw2q4CMtXPqNt4mqDNbREhcYzXOD6ArKY8P
	5WCTAhv4/BCbn5kwCUrz8y5T9yDdYJFQbARjWybun35B10KiIWYfuMwQ5lUa8o+H7ANI
	G8hgWTZhckqPTCC9fbob9gZLapJ1rJkxjvz8DNyKol6CIObTjjeUc5WeBLY1SQTKvUfv
	jfwg==
X-Gm-Message-State: ANhLgQ3eR6OBu+/vKK4CxZ/h3CMBw9Eo+l7eXChEQACsmbahPlOIYYGJ
	Wu2WMamKDmkQ54Zk2TUHp0Q3c42YjspZ/OWq6VI=
X-Google-Smtp-Source: ADFU+vvaHW43d7BRbv/BBHXIKyoYxgXeOUd4g3652FZGEycVz2nKxI1KATD30DhApwXHmxDi8vqrIM+RqYeom2gCRrY=
X-Received: by 2002:a1f:78c5:: with SMTP id t188mr3137892vkc.43.1583365449252; 
	Wed, 04 Mar 2020 15:44:09 -0800 (PST)
MIME-Version: 1.0
References: <20200304222447.1787-1-jpuhlman@mvista.com>
	<CAMKF1so0sueuAe73mCuHkU99s9a70EiXDg+5P3CpRE3hbAYicQ@mail.gmail.com>
In-Reply-To: <CAMKF1so0sueuAe73mCuHkU99s9a70EiXDg+5P3CpRE3hbAYicQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 4 Mar 2020 15:43:58 -0800
Message-ID: <CAJ86T=WvfFrSFakLWEXE=TTi1aw9zcVWdAxrAS7N7ZiDA1mvww@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdbm: add depend on readline for consistent builds
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
X-List-Received-Date: Wed, 04 Mar 2020 23:44:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 4, 2020 at 3:22 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Mar 4, 2020 at 2:25 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
> >
> > From: Jeremy Puhlman <jpuhlman@mvista.com>
> >
> > Whether readline is installed on the build host or not
> > influences the way gdbm builds. Depend on readline for
> > a consistent build.

It sounds like configuring with --without-readline would be a better solution?

> > This fails to build on a system with readline, and using
> > the buildtools-extended installer.
> >
> > Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> > ---
> >  meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> > index 7e2efe3c9b..5326184181 100644
> > --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> > +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> > @@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f74
> >
> >  inherit autotools gettext texinfo lib_package ptest
> >
> > +DEPENDS_class-native += "readline"

Don't use += with an over-ride. It doesn't do what you might expect.

