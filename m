Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFF4607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:32:00 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ik10so50248354igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 23:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=Vs4t6xJjudli4ksImYYxmdCtB3GoPPPYcRRJ0yXF+50=;
	b=WYrLCxh83Qtaha6H/xwoB4/Tx8frzVIIN4VXkGmnlemDkxQ9ZLOaUUAMmJoXrcaRr4
	jVAJQdHDyDccXIHr7b08vs5ukq0skmDfbhjcHV+FxGgOdoM2PBr+WD9SN7JIlJomjnY0
	WNldOeBBPDaU3G7/obFoLXK8NiUmdIdHea2zQlbf/gzv0+MDHOsm0+FWxYTTQllYccIk
	JQAPdX6TBgbn0SxUILFdFA2Ahlw2KmpLmF+7qL9A4dkbzU70a9vtmXfV8wpPZe/J+qw/
	9xxxQBTiC7GOmytO+M8d5bJitXb6gtNXj1+tuWHypzEWvAFukNmiBDRyZGk5cWKsyqzS
	xPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=Vs4t6xJjudli4ksImYYxmdCtB3GoPPPYcRRJ0yXF+50=;
	b=ei/bxASGOGMgQ3Cru9COMqQGZF6u4mlVULTV4osScXERG2hkmUQnjgzNqahMJUKojU
	890KLIcH+yAHC+iyFzWNIiPUQuV2i+5j9eGgT85OsWgSDUZKtS3bYTGGJGDDdNBniwV/
	XEsqHLjKWHYt9CzDY6SgZiyGMezGeP5eCFfCT5pNV5cAYG2yOCiDg0N7RuZmH44Z0v5w
	8eQgBx4o2iAaEkVb+w/6ZT0tgVqO03IqRKsQQs8NSjcQ607WwbNS2G/JyyKiD50COPdt
	9mysT01atSPS+s6UR89NncjsmLm7ucXRx3bgsQgnJLRc2wg+d1L75sP0IwEnin/SodRi
	S8Nw==
X-Gm-Message-State: AG10YOTzA4evdj6HWL4+2WVdIVq5d5mCXXgn3D8ZzRvLcEwCcJv04jlzCiqgbJ6VDBBOCdZx
X-Received: by 10.50.66.141 with SMTP id f13mr2493007igt.53.1453102321638;
	Sun, 17 Jan 2016 23:32:01 -0800 (PST)
Received: from pohly-mobl1 (p5DE8CE7A.dip0.t-ipconnect.de. [93.232.206.122])
	by smtp.gmail.com with ESMTPSA id 84sm8711417ioh.3.2016.01.17.23.31.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Jan 2016 23:32:00 -0800 (PST)
Message-ID: <1453102317.7013.27.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 18 Jan 2016 08:31:57 +0100
In-Reply-To: <1452856537.28375.142.camel@linuxfoundation.org>
References: <cover.1452823464.git.liezhi.yang@windriver.com>
	<2f2bda63c8a7f435e76c5d4ea1c5c529847f7f65.1452823464.git.liezhi.yang@windriver.com>
	<1452856537.28375.142.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] e2fsprogs: 1.42.9 -> 1.43-WIP
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
X-List-Received-Date: Mon, 18 Jan 2016 07:32:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-15 at 11:15 +0000, Richard Purdie wrote:
> On Thu, 2016-01-14 at 18:05 -0800, Robert Yang wrote:
> > Upgrade to 1.43-WIP to make "mke2fs -d" support xattr, so that the
> > layer
> > which requires xattr such as meta-selinux can populate images easily.
> > 
> > * Remove the following patches since they are alredy in the source.
> >   0001-e2fsprogs-fix-cross-compilation-problem.patch
> >   0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
> >   0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
> >   0002-misc-create_inode.c-copy-files-recursively.patch
> >   0003-misc-create_inode.c-create-special-file.patch
> >   0004-misc-create_inode.c-create-symlink.patch
> >   0005-misc-create_inode.c-copy-regular-file.patch
> >   0006-misc-create_inode.c-create-directory.patch
> >   0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
> >   0008-mke2fs.c-add-an-option-d-root-directory.patch
> >   0009-misc-create_inode.c-handle-hardlinks.patch
> >   0010-debugfs-use-the-functions-in-misc-create_inode.c.patch
> >   0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
> >   0012-Fix-musl-build-failures.patch
> >   CVE-2015-0247.patch
> >   copy-in-create-hardlinks-with-the-correct-directory-.patch
> >   fix-icache.patch
> >   misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
> > 
> > * Remove cache_inode.patch since it is not needed any more
> > 
> > * Updated mkdir.patch and ptest.patch
> > 
> > * Add --enable-libblkid to EXTRA_OECONF since libblkid is not created
> > by
> >   default.
> > 
> > * Time of core-image-sato-sdk do_rootfs:
> >   - Before upgrade
> >     real    3m18.508s
> >     user    7m42.088s
> >     sys     1m1.984s
> > 
> >   - After upgrade
> >     real    3m21.552s
> >     user    7m38.496s
> >     sys     1m0.644s
> > 
> >    The are nearly the same
> > 
> > * The "fsck -fn" shows the image is OK, and also can boot.
> > 
> > [YOCTO #8622]
> > 
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> [...]
> 
> > -SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
> > -SRC_URI[sha256sum] =
> > "2f92ac06e92fa00f2ada3ee67dad012d74d685537527ad1241d82f2d041f2802"
> > +SRCREV = "0f26747167cc9d82df849b0aad387bf824f04544"
> > +PV = "1.43-WIP+git${SRCPV}"
> 
> What happens when 1.43 is released? 1.43 < 1.43-WIP so we'd have to
> bump PE.
> 
> Can we just call this 1.42+1.43-git${SRCPV}?

However, that is not a more recent version than the one that was in
OE-core before:

$ dpkg --compare-versions 1.42+1.43 gt 1.42.9 && echo greater || echo less
less

As a result, the version upgrade (which is in OE-core master now) became
a downgrade as far as distros with stable package feeds are concerned,
didn't it?

The version for OE-core could have been: 1.42.9+1.43-git${SRCPV}

However, I've had a "1.42.9+git${SRCPV}" in meta-intel-iot-security for
a while now, and 1.42.9+1.43-git${SRCPV} is considered older than that
because of the embedded 1.43. While I understand that external layers
should not be something that OE-core needs to be concerned about too
much, some consistency still helps.

I believe the "1.42.9+git${SRCPV}" string goes back to Ross, so I'd
assume that it is not too unusual. Can we perhaps use "1.42.9+git
${SRCPV}" also in OE-core? Then if I'm not mistaken, the magic behind
${SRCPV} will ensure that the final version number will be higher.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




