Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA31758DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 11:22:56 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id k90so166753811uak.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 04:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=d2BDiCBHuPeQQdrC3H/SgXfb0AL0B/291lIbLsrPleA=;
	b=OgsUIRSw/q+lykNm1x52aPS1c+CFiprcFOKcVOcF5+KfI3MlW14uAR5CUTOSWwBf//
	YJf3yN29zZj6X4/wCS28etidRGziXktE1iNQKZ89D/jh6u3L9eXP9/TzMbr6liQRrB/E
	LzI23mI6d2kg4KM1YbXR96ypbt3sjSd/GDc2ZVZuGHK6XmhWrV5F9dmoKm69g/hYfNfN
	5foGMv9ntBmgFiPsv9jwZUjDFTclxegas8ts5yhZzFBkJTYyc4tLFii3m1pDOre2AvuW
	seKOUXRJEeoZ1yET0Lrs0WNWN3yhsotpcoqJ/bjGZvYbCIVmVyEgcDQ7Jz15+kkWd1fQ
	27Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=d2BDiCBHuPeQQdrC3H/SgXfb0AL0B/291lIbLsrPleA=;
	b=e+oykl7S7S5tjG6v68XskiDosBrs8w8biiOTj93Qva8uFwPRidbIqESVpoxkzy4Vsf
	xLYAfwVo3rlqcdgUj17rwsmOdPtRpKns5xwD4ZN6WxkDR8J5ZMGhpUv6C2qoUawtvbCr
	2G2kSopkRogjTKAmh/pRpcVU7t1zinnKtHB87XLQA+60IKgarl6r7yGfkmzT7PeUBdTT
	BYaXKA3gshIOB6Q82PXIQHfro6Sb/xNKzL68UsErbG4aIuzD246pgl62c+ZrxF8+2L/D
	AEwdIY/xjewwJX2ke3IufNisDD36Zn/I9EVpmKeYfbELLxghbYU7baCNX3EinfZ1IZ79
	6xLA==
X-Gm-Message-State: AEkoout7sVrH+t/OEHjUxfgAegYCshsxzH1p0yvTIHKY88XfObtFJemJzTQwDRen3ZvOnQ==
X-Received: by 10.176.82.71 with SMTP id j7mr12361301uaa.66.1471432976870;
	Wed, 17 Aug 2016 04:22:56 -0700 (PDT)
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com.
	[209.85.217.172])
	by smtp.gmail.com with ESMTPSA id k13sm6615704vki.9.2016.08.17.04.22.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Aug 2016 04:22:55 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f172.google.com with SMTP id 97so166631420uav.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 04:22:55 -0700 (PDT)
X-Received: by 10.31.149.132 with SMTP id x126mr20119983vkd.71.1471432974997; 
	Wed, 17 Aug 2016 04:22:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Wed, 17 Aug 2016 04:22:54 -0700 (PDT)
In-Reply-To: <CAJTo0LZe0X13aKjrqprgDuND+B8F7QVFooJRCWqqbJ5xrTyGAg@mail.gmail.com>
References: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAP9ODKrzOHomALoD28h7nJ6xT5puNkrzbd1FZVr=xij_wYUsxg@mail.gmail.com>
	<00da7e65-bfa1-0ffc-a2bb-1b44e0978864@xilinx.com>
	<CAP9ODKp7XCfL7ozG0GU2x6KfKXW1KJ5jLbVi6guWWKPnpKKLHg@mail.gmail.com>
	<CAJTo0LZe0X13aKjrqprgDuND+B8F7QVFooJRCWqqbJ5xrTyGAg@mail.gmail.com>
Date: Wed, 17 Aug 2016 08:22:54 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr4jD3H7HQegX5zTLY5et_MhtsUq4-2Z66=C7=w6KUhhQ@mail.gmail.com>
Message-ID: <CAP9ODKr4jD3H7HQegX5zTLY5et_MhtsUq4-2Z66=C7=w6KUhhQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: Enable out-of-tree builds
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
X-List-Received-Date: Wed, 17 Aug 2016 11:22:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 16, 2016 at 7:40 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 August 2016 at 23:00, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> But you removed the suffix from the binaries it seems
>
> Just double-checked the diff, I think the line wrapping is making you think
> that.  Or, paste the hunk that is broken please.

I think you are right Ross, sorry for the noise.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

