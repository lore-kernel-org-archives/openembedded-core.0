Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2159F7FAB7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 19:28:04 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id a5so4256947wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 11:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=e//L453DZ2+Ea0IMxUayniJ1Pr92Y1hqOqGWIOmkFTg=;
	b=p4SRqzqY4kFEwQRC1n3qYHv2PvsDOn3G/yyowqwtNC1lOUALVisRJrNg+vUf6BGEZQ
	qlVqXSjgHVPFycxy+Yj6GlqZkXlyNGOcidc50jkgwnS0BIsNXcxgg8Eyw1EvPyL8VcHf
	gJwlMTwMqg3JY3orO4Qm7Nqh2pjZCi+dFNL5o9nSpWenxjwkJ4B1lQfvJ3B52D6I0eur
	xA3bp2e0EXMhpdnox9nWfjL1B6wFxjvaSfEW58snRNhtxv/1sYItlC35ZMH+GUuG1nog
	Iv2651JyH2f+yjOcr1f6g/byqsNCqnOJo9hOuv7P6GSKp5cDoAeGo0/12kBazGRTNPh2
	QnZw==
X-Gm-Message-State: APjAAAX3XV60YbCTjBEFigI2NbtkacR7QBCMsJ6uOP95yItNq/HlrZME
	gmqBwyGWl78ZFuN0pFLfMq/oWAqp
X-Google-Smtp-Source: APXvYqz8MgYHoxroyRWbi2tqlNE9n+56/lUGVgS14HCdcxoN/BgcjEWRa6k77YJEXbC1mbzhQURHSg==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr6617865wmi.151.1578598084601; 
	Thu, 09 Jan 2020 11:28:04 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	a184sm4076714wmf.29.2020.01.09.11.28.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 11:28:03 -0800 (PST)
Message-ID: <8f8e989f2e630df2fcbee68f1ea18034549e069d.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Jan 2020 19:28:02 +0000
In-Reply-To: <CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
	<CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH 05/28] python3: update to 3.8.1
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
X-List-Received-Date: Thu, 09 Jan 2020 19:28:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-09 at 16:31 +0100, Alexander Kanavin wrote:
> On Thu, 9 Jan 2020 at 00:02, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> > > Drop backports, rebase other patches.
> > > 
> > > One patch I wasn't able to rebase as upstream code changed too much:
> > > 0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> > > Please determine if it is still needed, produce a new version,
> > > and work with upstream to get it merged.
> > > 
> > > 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> > > is removed as the use case (allowing python 2 and 3 to coexist
> > > in SDKs) is no longer relevant with Python 2.x reaching end of line
> > > and upstream has refactored the code making a rebase difficult.
> > > If needed, please re-add the patch to py2, rather than py3.
> > > 
> > > Python 3.8 no longer adds "m" to "3.8" in paths, so adjust the
> > > recipes
> > > and classes accordingly.
> > > 
> > > The manifest for the 3.8.0 version is updated; particularly pkgutil
> > > module is now packaged in -core (as other things in core need it);
> > > this also necessitates allowing empty -pkgutil package to avoid
> > > breakage across layers.
> > 
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1442
> 
> This is a weird one, and I can't reproduce it locally. Hints?
> 
> File: '/home/pokybuild/yocto-worker/beaglebone/build/meta/lib/oe/sstatesig.py', lineno: 544, function: process
>      0540:                else:
>      0541:                    add_perm(stat.S_IXOTH, 'x')
>      0542:
>      0543:                if include_owners:
>  *** 0544:                    update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
>      0545:                    update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
>      0546:
>      0547:                update_hash(" ")
>      0548:                if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
> Exception: KeyError: 'getpwuid(): uid not found: 6000'

I believe this typically means that the file is owned by the user running bitbake.

It could be useful to add the file in question to the exception trace, for easier
debug / fixing.

This will happen if
* files were installed outside do_install() in a different task
  that is not running under pseudo (fakeroot), or alternatively:
* cp without --no-preserve=ownership
* tar without --no-same-owner
* cpio without --no-preserve-owner


HTH,
A.



