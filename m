Return-Path: <anders@chargestorm.se>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 83DBB719B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 07:11:56 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b84so11010895wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 00:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=h+g5T5gSHVSz6hFF14zBl1lNFkeCASgfpfylCdedjVw=;
	b=0jywkojqZYiMuILLLcEa2bNxdTadgwtPiN70S+QagHsVh0ToMy5NCCxXdqX6pJcnYc
	1H8R9jlaibbRCqmXUN0b+L57dhPRu5dLZNYxvl6eoYPv85OnPcglyovfU8Pq03bVAcwl
	0LdljTPgYwmUbLNUSC2gB7/sbAtyqvae8LIogx+D5WICXgQpGL36Y6wIF/dYgQLRHu7F
	jZrkBd2dNOplm7RH4XHEaD8GDm1U+NtWFsggxcboPeegq1SbP/vm+GlbNv+K1xN+Etc1
	NnVAx1316i3ggo1/oI+gLBFtPGcfsg5sxIlJj3kgFkmzBZesjMpIFarlNXzppvPUIV6d
	eotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=h+g5T5gSHVSz6hFF14zBl1lNFkeCASgfpfylCdedjVw=;
	b=mHglkmLZc49CSWjwBMJWmfcUd07UbXPG+bfYVsndDbRYwLmzIG2CegiG1j4ibfmi+2
	KPBelNaVkS5ob3cUfNfS8pbHHaG1ss5osG1vGaT6MNuiefbMZ1ugXXocu5ofnTRMrKdK
	+E0eaXK/+wAR+T/0Md8+LcJZunncLHW6G/Cyc/evq1aBhQr6TRjnW6EnPcPToKZahuZN
	ezpX4wYOLZ6eY8VlHq56AvQiwW8Z+/1cL4wseI6Le7AHn9N7xam/PJdpn1TS7xtUAOGj
	Xv0YG01TOnhQ+w7DFJUrLbzvkRmTPav5Q+XOV6IhhGupBp05J2NjA61F82E0tIZY9CiA
	TzYQ==
X-Gm-Message-State: AODbwcDIR336dA8OiZDq1Tj3GAs9RPa3++VDSq6cj0f/kuA7h8TqZtc1
	iZKdM9nafeA/KpdjB3k=
X-Received: by 10.80.179.131 with SMTP id s3mr1942152edd.57.1494573115578;
	Fri, 12 May 2017 00:11:55 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id f38sm862769edd.10.2017.05.12.00.11.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 May 2017 00:11:54 -0700 (PDT)
Date: Fri, 12 May 2017 09:11:52 +0200
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20170512071152.ymakvgyczix7enxf@ad.chargestorm.se>
Mail-Followup-To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1494406033-28833-1-git-send-email-B40290@freescale.com>
	<1494406033-28833-3-git-send-email-B40290@freescale.com>
	<20170510132055.hnr22ktoy74xlw33@ad.chargestorm.se>
	<DB5PR0401MB18485FA0120D685F729EBDDB84ED0@DB5PR0401MB1848.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB5PR0401MB18485FA0120D685F729EBDDB84ED0@DB5PR0401MB1848.eurprd04.prod.outlook.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170306 (1.8.0)
Subject: Re: [PATCH 3/3] kernel-fitimage: fix KERNEL_DEVICETREE includes subdirectory issue
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
X-List-Received-Date: Fri, 12 May 2017 07:11:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* C.R. Guo <chunrong.guo@nxp.com> [170511 06:08]:

> Hello Anders Darander,

> Thanks for your comments.


> dtb inherit Linux-dtb (http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-kernel/linux/linux-dtb.inc).

> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Anders Darander
> Sent: Wednesday, May 10, 2017 9:21 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 3/3] kernel-fitimage: fix KERNEL_DEVICETREE includes subdirectory issue

> * Chunrong Guo <B40290@freescale.com> [170510 11:02]:

> > From: Chunrong Guo <chunrong.guo@nxp.com>

> >     * For example:
> >       KERNEL_DEVICETREE ?= "freescale/fsl-ls1046a-rdb.dtb"

> >       ${DTB}= "freescale/fsl-ls1046a-rdb.dtb"

Ah, what I didn't know, is that the dts-files in arch/arm64/boot/dts are
located in subdirectories, as compared to arch/arm/boot/dts, which
directly holds all the dts-files... That explains your problems.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

