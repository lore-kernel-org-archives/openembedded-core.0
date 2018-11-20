Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4686C489
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 17:41:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k198so3163374wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 09:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zZMhdSWcmTPZReRktX8xoByyX94X4i25OF1X4iKA5MM=;
	b=Z1hO5Jc39WVHaDo6TkMpfpdjHRVQnRHiiSvdcosnndxJoWhzk/YQa/7Yt0CTP7Gjrw
	RTbX43TTtMa91pqafrxEG7ChfqTH8yyotg+mR33dNC5itaV2l+bnyHRmTN5HD/GxqoTv
	9UZVtXeOz+bn+xRdKvNrKyCSod2diIJhhuxLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zZMhdSWcmTPZReRktX8xoByyX94X4i25OF1X4iKA5MM=;
	b=mObNchXm+9/N+SwxeZCENpRXP51K15IRmEDFLIJLjbnFQeKE/WHu3iiwb5k3ElvNjL
	/SebVPJWpMlrF1SeBkk8pRSfiN2viURsIYgULscafqUe1t92CTqJLT7kkKa8ekywCKQH
	ANaInAD1Pt++EquWq70Q3d/V0Y00pkeEYaav4N9NnS4uBcOnAskfyFuKjwcR5/Qpqwfy
	t2dQuVb43n2qhybSJFel4Aj/iloVH0TNW5H3uXuCXU7c9a9XdSiVwKHA/XI+TgUkfjAa
	j7ZJXljg2/IOMV2t1k/x18WaPnb4EC+IVWlvaep8hzgwK/aj3tcbFVnrDsNBNOPoFemT
	6X1Q==
X-Gm-Message-State: AGRZ1gIPSeGC6sB7FtY36WDqa+Y9vmuTHKaLFDOfoZ9th44DY9XTFiiO
	q4IP/w94RqQVvNpPTKeWpfiOWg==
X-Google-Smtp-Source: AFSGD/VETt3O+8Ee4IDjqJSMKYfZXcGxkKciGntIG+E6+OQweLtAd2tYUduvfP6NkxuGCygF+m/bfw==
X-Received: by 2002:a1c:1286:: with SMTP id 128mr3159695wms.70.1542735704475; 
	Tue, 20 Nov 2018 09:41:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h2sm24619387wrv.87.2018.11.20.09.41.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Nov 2018 09:41:43 -0800 (PST)
Message-ID: <3a3d89dc23097b3cc6338e2906eaae904799c008.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexey Brodkin <alexey.brodkin@synopsys.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 17:41:42 +0000
In-Reply-To: <20181119100443.2882-1-abrodkin@synopsys.com>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 20 Nov 2018 17:41:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-11-19 at 13:04 +0300, Alexey Brodkin wrote:
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

I know others are talking about splitting the packaging and I'm ok with
deferring that to a separate patch.

This patch did break the build in oe-selftest as you renamed a recipe
and didn't update conf/distro/include/maintainers.inc.

Could you send a new version with that tweak please?

(grep 
https://autobuilder.yoctoproject.org/typhoon/#/builders/28/builds/242/steps/7/logs/step2d
 for the recipe name to see the test that failed)

Cheers,

Richard


