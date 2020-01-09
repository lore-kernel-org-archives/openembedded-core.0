Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0697FDCD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 19:37:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q10so8636324wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 11:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Pj1xE0hpPXg1ENvYLqcgnjtYJgxgPP428HZquu9CezU=;
	b=V09pWhZfcsg648cppnQ0GA4GfyhM6CUYI5pKAk8w2NbtAJRpqKjLcZf3SWsNDuYwWQ
	BImEC+0VhSqhkdVLFhJcex457u5DtIsmAEwaIa6MSUZI1vTbKtL6ttrErVYqMlbYEv22
	YREz2/z91aqKcvxVgGAow/ZMZNzWQdjRe8HpXvP39XStpuXmHwB/vlP+O/oJhgNuKI8a
	Oc6y53lBKWvnH6p+eBvtJiUEPh+yzEbNFA80lVHBWidYBgs05OqLF+kf9vXXmG16GiHH
	DfkWjW2+DlcqqnxX/W23v5eokLby+FmNJUaJ0koQ3sOqsnHBE3vXn1NHU0xYvYRChSHc
	BUeQ==
X-Gm-Message-State: APjAAAVE9PoeMD7ARUMIy8uWWJBeOcxcqN/PxewvTrnzxDADOT8o8h6v
	G3ZPENnhdWClYZlmC1tTjVdz9E9y
X-Google-Smtp-Source: APXvYqzTuH+gJMMcr6Dc595GIiSzsULmYN/prr8pglsg3ZD8BdRkawDJ3edQeBf9gFk85VAiFLIolg==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr12827081wrn.50.1578598646718; 
	Thu, 09 Jan 2020 11:37:26 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	e18sm9090435wrw.70.2020.01.09.11.37.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 11:37:25 -0800 (PST)
Message-ID: <b264b9d4f20106585d8a3daa6da6652f6ec90873.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Jan 2020 19:37:24 +0000
In-Reply-To: <8f8e989f2e630df2fcbee68f1ea18034549e069d.camel@andred.net>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
	<CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
	<8f8e989f2e630df2fcbee68f1ea18034549e069d.camel@andred.net>
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
X-List-Received-Date: Thu, 09 Jan 2020 19:37:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-01-09 at 19:28 +0000, André Draszik wrote:
> On Thu, 2020-01-09 at 16:31 +0100, Alexander Kanavin wrote:
> > On Thu, 9 Jan 2020 at 00:02, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > > On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> > > > Drop backports, rebase other patches.
> > > > 
> > > > One patch I wasn't able to rebase as upstream code changed too much:
> > > > 0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> > > > Please determine if it is still needed, produce a new version,
> > > > and work with upstream to get it merged.
> > > > 
> > > > 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> > > > is removed as the use case (allowing python 2 and 3 to coexist
> > > > in SDKs) is no longer relevant with Python 2.x reaching end of line
> > > > and upstream has refactored the code making a rebase difficult.
> > > > If needed, please re-add the patch to py2, rather than py3.
> > > > 
> > > > Python 3.8 no longer adds "m" to "3.8" in paths, so adjust the
> > > > recipes
> > > > and classes accordingly.
> > > > 
> > > > The manifest for the 3.8.0 version is updated; particularly pkgutil
> > > > module is now packaged in -core (as other things in core need it);
> > > > this also necessitates allowing empty -pkgutil package to avoid
> > > > breakage across layers.
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1442
> > 
> > This is a weird one, and I can't reproduce it locally. Hints?
> > 
> > File: '/home/pokybuild/yocto-worker/beaglebone/build/meta/lib/oe/sstatesig.py', lineno: 544, function: process
> >      0540:                else:
> >      0541:                    add_perm(stat.S_IXOTH, 'x')
> >      0542:
> >      0543:                if include_owners:
> >  *** 0544:                    update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
> >      0545:                    update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
> >      0546:
> >      0547:                update_hash(" ")
> >      0548:                if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
> > Exception: KeyError: 'getpwuid(): uid not found: 6000'
> 
> I believe this typically means that the file is owned by the user running bitbake.

... or more generally that it's owned by a user not known inside the build environment.

A
 
> 
> It could be useful to add the file in question to the exception trace, for easier
> debug / fixing.
> 
> This will happen if
> * files were installed outside do_install() in a different task
>   that is not running under pseudo (fakeroot), or alternatively:
> * cp without --no-preserve=ownership
> * tar without --no-same-owner
> * cpio without --no-preserve-owner
> 
> 
> HTH,
> A.
> 
> 


