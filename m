Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 826C06B40D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 15:45:40 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id g27so5325115oth.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=KvLX+hwzwGS+PN5XcZ1fJmUmJQ+GJLYbabPLsjkAojw=;
	b=dHOa7FYauzv0JA6FhANtFv2vrU78GKoEAHNvJHp/gWFxoYdHy70oam/zJjlXOIeoik
	7ANZPhZvQr5qY1XYAKopDredK4TjGRnkxgDF6lHz8tmHn0b2dOxJWi2etU5DlW9CpGlw
	7k8e3/NHZGK+pnaZ1V1qGWglAHh1GeV1AKdZ3w7Kl7cvWGZAnhlwMTY+Ii9ZMb1gNs2Y
	GwUNh2S7VjmQxGTy08LrMEa/kWB5iYWHRwAOdD6xro9jbXCc8fmiE+w9qE+XnTbgGt0m
	G2T1MY1YAvJhJs46UNms+hpnm5nMTiiYoiZeDxh9nwUSl5ylHRKQZzLGVBN5FAIIjqSG
	M9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=KvLX+hwzwGS+PN5XcZ1fJmUmJQ+GJLYbabPLsjkAojw=;
	b=JPC5+XVvx4c3uUYC/lSCT9w0zxlmqL6ifyO7QMR8nsarD9aLhEIIdh7plMF4LSAOnJ
	E8EWHtKe6rkLD9CzCwQl+jO4QtcWMtR80+SiwtteMyLvwRs0WNLBwOVv/eckkoDSn0Ua
	sWfZkzAxveGAQfgS1sDP5i3AAkjNS3/WAekFWJuf7GNtCcFtxF4TAbg/nQjgQ/DgmNbQ
	NkESVdIzCZ31j5tVjbBKDNjm1qw6KjsvBGXkNVlq1SjsmD2kqlNu7Ca2FTG7s3YYcbjv
	JwivGhl0HLqormYdiFRvR9RcrL18yi2osoxlfIoyGKWpHPCOmEzmQ3kB8xLpF0ESBWU/
	fESA==
X-Gm-Message-State: AA+aEWZ+xO6llBp1BwHvqWWWU86QDUvLQsixNQ2WMd3XCU8z8bNVcNJ3
	Ng7u83xF2yfvoI4BLXqqZTl0c8Tl2yk=
X-Google-Smtp-Source: AFSGD/Uovm2zkMj2/DOizfkwGKV5ACwWu3xUxo0IWLK3a5JqxZe5X6c2wF5pnCgDQDZ0eXsKcievjg==
X-Received: by 2002:a9d:2c5:: with SMTP id 63mr4168824otl.271.1542815140788;
	Wed, 21 Nov 2018 07:45:40 -0800 (PST)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com.
	[209.85.210.43]) by smtp.gmail.com with ESMTPSA id
	v141sm4481372oia.25.2018.11.21.07.45.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 07:45:38 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f43.google.com with SMTP id w25so5301780otm.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 07:45:38 -0800 (PST)
X-Received: by 2002:a9d:754f:: with SMTP id b15mr3931449otl.231.1542815137537; 
	Wed, 21 Nov 2018 07:45:37 -0800 (PST)
MIME-Version: 1.0
References: <20181120202107.41029-1-abrodkin@synopsys.com>
	<f9ff2442-e164-d973-6fea-49bfeb9cbbd7@denx.de>
In-Reply-To: <f9ff2442-e164-d973-6fea-49bfeb9cbbd7@denx.de>
Date: Wed, 21 Nov 2018 13:45:21 -0200
X-Gmail-Original-Message-ID: <CAP9ODKodGomFQXWXnKXo321JjrmqW281H8Li+h5tM1vCMXB3cg@mail.gmail.com>
Message-ID: <CAP9ODKodGomFQXWXnKXo321JjrmqW281H8Li+h5tM1vCMXB3cg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Wed, 21 Nov 2018 15:45:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 20, 2018 at 6:22 PM Marek Vasut <marex@denx.de> wrote:
> On 11/20/2018 09:21 PM, Alexey Brodkin wrote:
> > This utility is used for creation of images containing
> > usable in run-time U-Boot environment.
> >
> > As of today this utility is added per-board like here [1]
> > for Intel Edison board.
> >
> > [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> >
> > Given there're quite some U-Boot tools that we may want to add later
> > this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> > still for compatibility we provide "u-boot-mkimage" with help
> > of PROVIDES as well as proposed "u-boot-mkenvimage".
> >
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > Cc: Martin Jansa <martin.jansa@gmail.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Cc: Marek Vasut <marex@denx.de>
> > ---
> >
> > I may "git grep u-boot-mkimage" in more places:
> >  1. meta/classes/image_types.bbclass:311:CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
> >  2. meta/classes/kernel-fitimage.bbclass:7:        depends = "%s u-boot-mkimage-native dtc-native" % depends
> >  3. meta/classes/kernel-uimage.bbclass:6:        depends = "%s u-boot-mkimage-native" % depends
> >  4. meta/conf/distro/include/distro_alias.inc:357:DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
> >
> > But that's not clear for me if it's required to swap "u-boot-mkimage"
> > to "u-boot-tools" see:
> >  1. "u-boot-mkimage" is still a valid recipe as we export ot via PROVIDES
> >     (or I'm mixing package name with recipe name which very well might be
> >      the case)
> >  2. I don't fully understand a mening of "DISTRO_PN_ALIAS".
> >     If that's a name of a package from some big Linux distro or how target
> >     utility is named in that distro. For example in Debian Sid there's
> >     a package named "u-boot-tools" which includes "mkimage", "mkenvimage",
> >     "fw_printenv", "fw_setenv" and many more while in "distro_alias.inc"
> >     we still have:
> >     ---------------->8----------------
> >     DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
> >     ---------------->8----------------
>
> Just make u-boot-tools RPROVIDE the u-boot-mkimage, and make it generate
> a u-boot-mkimage package , no ?

In fact, it should:

PROVIDE += "u-boot-mkimage"

So dependencies are going to keep working; as Richard said, it should
use the new name for the sake of correctness though.

The package split will define how it will need to be handled for the
runtime counterpart.

If we adopt:

PACKAGES += "${PN}-mkimage ${PN}-mkenvimage"

Then we need to add:

RPROVIDES_${PN}-mkimage = "u-boot-mkimage"
RREPLACES_${PN}-mkimage = "u-boot-mkimage"
RCONFLICTS_${PN}-mkimage = "u-boot-mkimage"

So it provides the upgrade path to the original package.

(this is my vote, btw)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

