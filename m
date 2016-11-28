Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1236271AA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 17:43:43 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id l126so5519668vkh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 09:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=exDby749xCZoga99wNgCxjFYkkU4qwcz6Sf0CZrcqak=;
	b=GQMVQxMJuR/3xLfpkq6v/1fbPAoE0Lvza8V6Ok/uS74SL8yNi5FktZ9eiCG/GisP8Z
	N3kkiEYfzLDFkF03u4evBdOBP41vF5vnfGeCLaDyK0FRKaqf83jDaJOy4kAzUt4k45S3
	rSGKCSfN5y07MuVO851ebFU7GUrA56JSIwdYvBu2Mx1G5FZ4EQF0Ykm6glmRTqumKmJu
	7ZEGooI2VPaCVtsuse55z3KjsE+u00tpMKyrM8KakqEx8NeamBFE/0YIDp+LVBe2SHWI
	R1E/hWgU1HvPDECySdJOEeCM/VMgfHXI7i06r/qD/TKp0joWrR/X7pY6bQBz08CbOx+U
	iV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=exDby749xCZoga99wNgCxjFYkkU4qwcz6Sf0CZrcqak=;
	b=Gr3bEGTld0WedsNvmlb8Hl4IIDDL6HF2LyhE12jM3f3MN9QpUkJA6wgrN1ox0YqYak
	/vkG3Xgdf7DopVnxhE9OzdzklgiLPOXaRyKuJou+kngx98/+doKCkwHX3NuleCKd4VR0
	yUd3gI6ymLGPg3yo1CvbtsDHzWNRd9kdDHVwdQu4cxyrQTMofkPu5D+8jMF3ea5yMsiF
	d1pDdA9AJWd/lajR5YVh99joTHFuLzLPb3LMJEiqgFOB4/uTV1Ch8N+YfhL0aLFKq/8c
	gxG76bRVucc/6sppULMHS8mmNy/Bmm1NYJDhRpnMsFcoEcNohfGwk/pTTqMySLfv6bgA
	hvpw==
X-Gm-Message-State: AKaTC03BSRIj9egzkU/obVvFI6+BWDKD6amFl7ulvIxyFBcmybfLbB6ObKTCw8E/H7FzFWBJck610R0UTGKEkQ==
X-Received: by 10.31.180.131 with SMTP id d125mr8009408vkf.139.1480355024883; 
	Mon, 28 Nov 2016 09:43:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Mon, 28 Nov 2016 09:43:14 -0800 (PST)
In-Reply-To: <CAJTo0LaWCT3zZEqYt4P5_vMApf2FY1b02iYkY25-nznbv9bE0A@mail.gmail.com>
References: <20161123092807.28693-1-raj.khem@gmail.com>
	<20161123092807.28693-2-raj.khem@gmail.com>
	<CAJTo0LaWCT3zZEqYt4P5_vMApf2FY1b02iYkY25-nznbv9bE0A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Nov 2016 09:43:14 -0800
Message-ID: <CAMKF1sqj9MAsrVrEwsBFQcFs9+5SxQww9Pryz_uDGzsuUODWWA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 2/2] systemd: Upgrade to 232
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
X-List-Received-Date: Mon, 28 Nov 2016 17:43:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 28, 2016 at 2:12 AM, Burton, Ross <ross.burton@intel.com> wrote:
> 0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch

I synced this patch with systemd-232 and sent out V4. I did bitbake systemd-boot
on turbot and it surprisingly build without seeing these patch
failures. I must have done something wrong.

