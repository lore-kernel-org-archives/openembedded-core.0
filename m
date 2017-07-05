Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id AE86771DD2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:54:09 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k67so49806514wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=SHCB/UuWesLR1Wei3ZprW4Y6z1Kt2Pp8Gn58m7ALS1s=;
	b=zlvpHcDKmrGwEjaQtAzS8ZzmMq1QoTfoVyp0eImZ/8liPMFbar86nAFBKEeVEb/SRq
	KlwfcNjb3QHkDO5ueoVqJZz3HNGgX+K8DqwDshHffL3vubNpfFVmSBT2VvhDz8mG+acD
	EtD4M7S15VRILiBCqYzkYo8hYqYfQvKCwWrhnOKBmOnGXr0IQ2TjFX12PEfIxb8bgTYQ
	11PbPMPAH7XzD6oq+atC70Rgh7viSA02kaCJqlLYaXohBP2bb+CcAMW375MVy5Auk3FJ
	c4WalFEFNr74evIdsIK9cxfJ6VGD4EtyO3AyITjchsS6c3tIjDpDn2lzjURJ5vYwtXIY
	FPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=SHCB/UuWesLR1Wei3ZprW4Y6z1Kt2Pp8Gn58m7ALS1s=;
	b=BB9zfJuTOB28g2RZSsm76Ljw3CDN/GKQ9zL5+xxA2FzCla8+GuIochepaBhdcwzN/0
	7G6NGEE5fxiFaMqihc3Cm9tQEIIsHMUeNvosxh4uhP8xZj2hqB+LgtpEOeM1p9jgn9NP
	CH3a1R/qNpAk7MEdOOKJqgQeOoGZzgUoCm0o7tQWJcKC4RD/MlSChWZqhGdKjcWQB2s3
	7M7CB7fqlnZIzleQdPzj7suyLRkJZI6fkbfL+7VIucnkyNKnhoyJk0+ZLyhS/desU2jI
	jnqUoIDLTWMufNAv1YAnOpZm6NcfKwQ4TnHTnLmj2jAS4Oy7LKDGCAzHMzJakl1R92Nd
	79cg==
X-Gm-Message-State: AKS2vOxRjKziv8DHJI38GVgljpAv7DszDIzoyKy8YzYvL6j8GAKsh6bJ
	7fKcXA0fPgjdI7hEi38=
X-Received: by 10.223.130.162 with SMTP id 31mr36184136wrc.202.1499259250250; 
	Wed, 05 Jul 2017 05:54:10 -0700 (PDT)
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com.
	[74.125.82.51]) by smtp.gmail.com with ESMTPSA id
	187sm22430739wma.13.2017.07.05.05.54.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jul 2017 05:54:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f51.google.com with SMTP id i127so165797185wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 05:54:09 -0700 (PDT)
X-Received: by 10.28.113.85 with SMTP id m82mr33564454wmc.21.1499259248854;
	Wed, 05 Jul 2017 05:54:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Wed, 5 Jul 2017 05:54:08 -0700 (PDT)
In-Reply-To: <933095de-34ee-963a-cc7f-55f76956355c@denx.de>
References: <20170704220128.28747-1-otavio@ossystems.com.br>
	<933095de-34ee-963a-cc7f-55f76956355c@denx.de>
Date: Wed, 5 Jul 2017 09:54:08 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqi1vHHWx23hV2w9WaGBTucq277-pWyemQiJBt2SSsTDA@mail.gmail.com>
Message-ID: <CAP9ODKqi1vHHWx23hV2w9WaGBTucq277-pWyemQiJBt2SSsTDA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Wed, 05 Jul 2017 12:54:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 4, 2017 at 8:10 PM, Marek Vasut <marex@denx.de> wrote:
> On 07/05/2017 12:01 AM, Otavio Salvador wrote:
>> This patch upgrades the U-Boot to the 2017.07-rc3 release; for now it
>> is not intended to be merged but to expose possible problems prior the
>> official release so we may try to include fixes for final release.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>>  .../u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc}     | 2 +-
>>  .../u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb}   | 0
>>  .../u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb}     | 0
>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb}        | 0
>
> NAK, you're updating to -rc3 yet mark it as final release , that's wrong.

Marek, did you READ the COMMIT LOG? I doubt you did.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

