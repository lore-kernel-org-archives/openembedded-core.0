Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id C4F9F608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 00:20:52 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id t7so5835776vkf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 17:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=WkzeJkYZ07rC0t9tOGUVR61W8l+aSzjaiSAWSvaPiAI=;
	b=ZEptUUhjsgjHS4sUi9TgDnZEftR7QyISQCt0fE7iP/FVaZX8ZQP7rTXaS9T8OOeXd1
	UfFF0+wlkRVFGB4lYI1aBhwnXXKY2pgogaL877hSIt5xiR2+wSlHOcmbGYy1P47Wb4uA
	eKmYdI4IIgMc4lehplE1MiYZAuM3IK/1tfsrouWrFVmOu6AqOZ39pFPcR6Fnqm1CMGkY
	Lowi+7QBcPD82XZLR5H9tNe4FolLgylh7a4lbeRvSL8dQ+MKgEYcMahL7YP0EaorGPaE
	hqRWMttAOMo78D/8tzqUisl2M+Pncav9b07v8NOUJfFVHyn/AW4LXYSM1X6u59EwNerE
	zo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=WkzeJkYZ07rC0t9tOGUVR61W8l+aSzjaiSAWSvaPiAI=;
	b=k8jOl7OfmWuENnqquzHm5cUVcWomsETBRBmoHS93d8GBoZ3BASo4X1dTaZ9/4Et9kI
	DaD63PJ5aGUXkzprWznLElbU8llJ9zVSRZYd+sle51DONKn6AY2Kf7PQPLSvMKYnYlFR
	302q5Gk9uliH4zt0ir69pGIva85eXtTGh3z8UDomM0Q2UHHVD+2aQGtJLTFpY/D3wXwD
	UFVngJ49zQXkFz3DunFeicIKEC4dmx2QemqDp2OQ+1VdeX5MgYKUjiGII5VWItnAWesO
	UmenEFRnD4EBanHFboFMKzUJlde0N6LPFMA84qAWyHHaml+2Q0mnpYg2eFUVELLlkCi3
	AUDg==
X-Gm-Message-State: ALyK8tLG0sYagbbo5pxE1dHFrk4SZ08ORqFdapzOc5pNsvxWEnJ04v6E0sKnnlJS0VJhdg==
X-Received: by 10.31.194.73 with SMTP id s70mr704160vkf.114.1466036452215;
	Wed, 15 Jun 2016 17:20:52 -0700 (PDT)
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com.
	[209.85.213.54])
	by smtp.gmail.com with ESMTPSA id t34sm612240uat.20.2016.06.15.17.20.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jun 2016 17:20:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f54.google.com with SMTP id t129so52371895vka.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 17:20:50 -0700 (PDT)
X-Received: by 10.176.7.1 with SMTP id h1mr797705uah.97.1466036445740; Wed, 15
	Jun 2016 17:20:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.189.21 with HTTP; Wed, 15 Jun 2016 17:20:45 -0700 (PDT)
In-Reply-To: <1466002870-9934-1-git-send-email-ting.liu@nxp.com>
References: <1466002870-9934-1-git-send-email-ting.liu@nxp.com>
Date: Wed, 15 Jun 2016 21:20:45 -0300
X-Gmail-Original-Message-ID: <CAP9ODKou=GzthrCpstsHAwJHtykUVL93oEC7b8p7xz=+wjFKUw@mail.gmail.com>
Message-ID: <CAP9ODKou=GzthrCpstsHAwJHtykUVL93oEC7b8p7xz=+wjFKUw@mail.gmail.com>
To: Ting Liu <ting.liu@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: extend UBOOT_CONFIG format to support different binary name
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
X-List-Received-Date: Thu, 16 Jun 2016 00:20:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 15, 2016 at 12:01 PM,  <ting.liu@nxp.com> wrote:
> From: Ting Liu <ting.liu@nxp.com>
>
> When using UBOOT_CONFIG format, the final u-boot binary for each config
> may have different names. Extend UBOOT_CONFIG format to support different
> binary to be copied.
>
> The new format is supposed to be compatible with old one as ${UBOOT_BINARY}
> is copied by default, and images,binary can be empty.
>
> An example format to specify it, in the machine, is:
> UBOOT_CONFIG ??= "sdcard-ifc sdcard-qspi lpuart qspi secure-boot nor"
> UBOOT_CONFIG[nor] = "ls1021atwr_nor_config,,u-boot-dtb.bin"
> UBOOT_CONFIG[sdcard-ifc] = "ls1021atwr_sdcard_ifc_config,,u-boot-with-spl-pbl.bin"
> UBOOT_CONFIG[sdcard-qspi] = "ls1021atwr_sdcard_qspi_config,,u-boot-with-spl-pbl.bin"
> UBOOT_CONFIG[lpuart] = "ls1021atwr_nor_lpuart_config,,u-boot-dtb.bin"
> UBOOT_CONFIG[qspi] = "ls1021atwr_qspi_config,,u-boot-dtb.bin"
> UBOOT_CONFIG[secure-boot] = "ls1021atwr_nor_SECURE_BOOT_config"
>
> Signed-off-by: Ting Liu <ting.liu@nxp.com>

Wow !!! This is great! :-)

I see no problem with the patch; I did not test it though so I won't
ack it until I do a runtime test. If someone gets there before me I am
fine in applying it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

