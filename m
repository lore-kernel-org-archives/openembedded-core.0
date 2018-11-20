Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id E988E6C4B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 22:05:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b13so3590819wrx.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pQOzI4+jt+1W7FrnJCsh260bLuQd51tLDlo5TZgA6ys=;
	b=PnGYZI+/K2vS40L3Syop8mcMdgx0/v3zNTum0EkwtmUsnlFzLWfaoPKBfjwftzfYAO
	t3TES1ASNpSfQHe+wNQW8onzATfcO4V/lg8NUL6qILuaHdAgyFShyOv6QIdDyS1jAY+1
	8sYKTa+cAvtLDu0ZuN3SZDe003d1nMjwNrnCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pQOzI4+jt+1W7FrnJCsh260bLuQd51tLDlo5TZgA6ys=;
	b=oiZsqAs/RWoxvGNtOJ0ZQJ9WnnI7POrHtFSgIfGvVH1pR/vXlR+pDhQ0TMr7OszKvc
	9lNSLjXdGMAVFxbLal79coDWhHDZsuckMXXDx6wwq45xPtxRHQYls1X6rJ0sgla+BuTz
	kdLcvvEsN3eJu3in6f3KOqseiR+rELiM0KUJwVburBgrrgEGe8eRYsfvGxSaaDhksMTX
	E9ekRmtU8wmHa9A26lWBTq7rGCUSTrBQHxMgIxAfWpvfXxFbATo66RSl7252uXz6onUV
	HSVcysHmUt1Z6mgzrbNBR9Yqph76HQqC2yNFQ0SsA722XtnFO2J/L5RX0JK9iQA/4kWl
	s4IQ==
X-Gm-Message-State: AA+aEWYqeQWo+PkF+VolhVUHqzrKMV9bLQw90hZNzM5RqAvaKBRf4kjr
	bvbVZKIQGkBsagCexCpLTbAHkA==
X-Google-Smtp-Source: AFSGD/XKvCQh//PN0wEis1BS3cD2AliBFR8trWubcaGQ3d/btN2rGwNR8oM/IjnkX67AaN+N0iGO2g==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr3756831wrp.59.1542751507285; 
	Tue, 20 Nov 2018 14:05:07 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q14sm2043786wrw.39.2018.11.20.14.05.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Nov 2018 14:05:06 -0800 (PST)
Message-ID: <4a45b8b1d3663ee46d652d8d945e9953373ea440.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexey Brodkin <alexey.brodkin@synopsys.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 22:05:05 +0000
In-Reply-To: <20181120202107.41029-1-abrodkin@synopsys.com>
References: <20181120202107.41029-1-abrodkin@synopsys.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	linux-snps-arc@lists.infradead.org
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
X-List-Received-Date: Tue, 20 Nov 2018 22:05:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-11-20 at 23:21 +0300, Alexey Brodkin wrote:
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
> 
> As of today this utility is added per-board like here [1]
> for Intel Edison board.
> 
> [1] 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> 
> Given there're quite some U-Boot tools that we may want to add later
> this recipe name switch from "u-boot-mkimage" to generic "u-boot-
> tools"
> still for compatibility we provide "u-boot-mkimage" with help
> of PROVIDES as well as proposed "u-boot-mkenvimage".
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
> 
> I may "git grep u-boot-mkimage" in more places:
>  1. meta/classes/image_types.bbclass:311:CONVERSION_DEPENDS_u-boot =
> "u-boot-mkimage-native"
>  2. meta/classes/kernel-fitimage.bbclass:7:        depends = "%s u-
> boot-mkimage-native dtc-native" % depends
>  3. meta/classes/kernel-uimage.bbclass:6:        depends = "%s u-
> boot-mkimage-native" % depends
>  4. meta/conf/distro/include/distro_alias.inc:357:DISTRO_PN_ALIAS_pn-
> u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
> 
> But that's not clear for me if it's required to swap "u-boot-mkimage"
> to "u-boot-tools" see:
>  1. "u-boot-mkimage" is still a valid recipe as we export ot via
> PROVIDES
>     (or I'm mixing package name with recipe name which very well
> might be
>      the case)
>  2. I don't fully understand a mening of "DISTRO_PN_ALIAS".
>     If that's a name of a package from some big Linux distro or how
> target
>     utility is named in that distro. For example in Debian Sid
> there's
>     a package named "u-boot-tools" which includes "mkimage",
> "mkenvimage",
>     "fw_printenv", "fw_setenv" and many more while in
> "distro_alias.inc"
>     we still have:
>     ---------------->8----------------
>     DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage
> Debian=uboot-mkimage"
>     ---------------->8----------------

I meant to say, for cleanliness, all the references you mentioned
should also be converted in this patch. Most will work with PROVIDES
mapping but we should improve them.

Cheers,

Richard


