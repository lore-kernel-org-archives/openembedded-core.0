Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 04D566C4B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 22:02:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r10so3559715wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 14:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8pscv6njz4ZRVdKfz+bEcqRJKt0cvmWFYUM24IFsSwQ=;
	b=Gd2vXFisaO1UdasvyChHMucdnNCSY/wJrgdp897ksXT4LReemGG8MXDNeq1lUQX/Ox
	9fBxLHL7I8am+6M8bahM6UYMvi5fOOlSjm73fLNaxWrTlt8fjGKY5tUw+1ygKAHiuU0I
	EcVLV6gAasGr7KXwdZfAE4K/yYaAWLAGcR8lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8pscv6njz4ZRVdKfz+bEcqRJKt0cvmWFYUM24IFsSwQ=;
	b=Oi5kUadH3DE6/NOhpWJzvYAoLTQFygAm5sndSx1D0D2c8M30XBHcCtp1/DbvKibN0j
	o3b2hrm6aAdM3veCgr5EPCGBUAh3uvnYcTOtagmiHhcF2Ya7kOvsL/fGSm0l+YxNwgab
	OwYc+jlGXAqkLFNesNz1p/t2fP5ADuZOACAa/c4iK/aXrfUap++xQATjHMEJMuZefRSm
	+x8o0Wa38qT/AmbP8T/+P0I7irQjLnNSLtFeliNzTolcb5ISoSRJErTIaqrbl+KEjDoR
	4AcmpqCsy3SqTpPw5Q4rWKw4bu/nO6M7v/PgGKe2qaNY/cTnwFTTz0iZjoqF5kxcR8g8
	UaUQ==
X-Gm-Message-State: AA+aEWY/tc9yhNwuLz2eS83Y4A8ECszJVKQ0y6oXfJv10tgrfVFs+Es4
	uN0yZVC65N8qrjwk846xYfr6hg==
X-Google-Smtp-Source: AFSGD/VKPb1GOF4eHCc2OyCzaM9Uwj1sf7nOP6TREzOg0DS7xzoMopIJASxk4+1jvc+JfhTHeWewbA==
X-Received: by 2002:adf:8b90:: with SMTP id
	o16-v6mr3660741wra.81.1542751361128; 
	Tue, 20 Nov 2018 14:02:41 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w9sm18181421wme.47.2018.11.20.14.02.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Nov 2018 14:02:40 -0800 (PST)
Message-ID: <4091d6f2fe2999ad75ee7da8afd2a87e1299cff3.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexey Brodkin <alexey.brodkin@synopsys.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 22:02:38 +0000
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
X-List-Received-Date: Tue, 20 Nov 2018 22:02:41 -0000
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

Sorry, the tests in meta-oe have exposed another issue:

https://8n1.org/14048/3f99

which means the PROVIDES isn't quite right. The reason is there is
magic in the recipe which extends it to the native and nativesdk cases
but its not quite working.

I think the easiest way to address this may be

PROVIDES = "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage"
PROVIDES_class-native = "u-boot-mkimage-native u-boot-mkenvimage-
native"

since in the nativesdk case, MLPREFIX expands to nativesdk-. The second
class-native line may not be needed. You could check with:

bitbake u-boot-tools -e | grep ^PROVIDES=

and see if it computes the value without manually overriding it.

Cheers,

Richard



