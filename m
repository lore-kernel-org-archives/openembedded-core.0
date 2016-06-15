Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id C0AF2601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 12:11:08 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id j7so11189002lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 05:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=wsCdTDi600nODuOa4cg71dCuku12FTYKTXU3C7QI43c=;
	b=pZkBAOX6ya++gAqtDrtJUdGGNbIebXzB3hY6acOIbv11RXcTejZ44J8OXPzzkuiiJ0
	NLojsMfVFpRqnKr76VxHxqdi+hH/dq4k3830j26d5xcaGt678IRPSeVlm6r81VFDYvIP
	VhE86KUl60YMZ8hFOve1axg38KZ538mX87/8SdIxw4pxUFhINWcK5Ex0n5rLXu/hsxO/
	JylkZJXFUd3LTpGnI4XwDK0lPsyK3DvhbNQuK+JZhAbqESWvBdESUh+6ErzT6xwuHlyp
	E/u8Fzr3Z5G2Ojfle0DNo6RbsBH7SrlT9iKl1SQbY+R7tn+/T0GRRh6r4P1NqG8b7Pzd
	Uyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=wsCdTDi600nODuOa4cg71dCuku12FTYKTXU3C7QI43c=;
	b=B+4ho6NSv4FfwPCznIix0w2NatOAYGjwqi7vRYNN3VsbxJLCVlbHMlPwqLtSAjjo+W
	W6qG34Fo2F8gyD4pmC4s9Z/rCkgbLrZJHRaNsAIQPZj32TrE0qvwc9UACogVkBhovNmh
	+lvR1q8Eu+zFtfjPa1ebOuOL5lZvaZ6+FTzusf8QyLassd6xOYbJ7g9S7/mCTz7faggC
	m/KOFIHfj8dHRE/8DPKSBz23GwHlvmw9yAiXOUjPiqUHVshRm9u44v980DgYiFj6YPfU
	Iivyh81FdD2BDlhjFgNSQfN7BoECC6yBHON4XeWj6D2mUFtbeNePVZFA7T/BpXBltRaS
	FmtA==
X-Gm-Message-State: ALyK8tLdpt08kgjs/cunX9FE/IoGp/TyVvA3USMtyUKtj7+hAcpXiLRKpi1AujUlkzFW7A==
X-Received: by 10.46.9.80 with SMTP id 77mr630403ljj.0.1465992667107;
	Wed, 15 Jun 2016 05:11:07 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	ea15sm3742629lbb.1.2016.06.15.05.11.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2016 05:11:06 -0700 (PDT)
Date: Wed, 15 Jun 2016 14:11:04 +0200
From: Anders Darander <anders@chargestorm.se>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20160615121104.GC16659@ad.chargestorm.se>
Mail-Followup-To: Saul Wold <sgw@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
References: <1465941589-20879-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1465941589-20879-1-git-send-email-sgw@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: add iwlwifi-8000C-19 version
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
X-List-Received-Date: Wed, 15 Jun 2016 12:11:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Saul Wold <sgw@linux.intel.com> [160615 00:00]:

> This version is required for certain iwlwifi hardware
> can not use the most recent firmware blob

> [YOCTO #9771]

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> When this is merged, I will remove this blob from meta-intel, as they will conflict


>  .../linux-firmware/iwlwifi-8000C-19.ucode             | Bin 0 -> 2382972 bytes
>  .../linux-firmware/linux-firmware_git.bb              |  10 ++++++++++
>  2 files changed, 10 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/iwlwifi-8000C-19.ucode

Would it be possible to get this file from a server somewhere?

Adding a 2MB file, which most people won't need, doesn't feel right to
me.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

