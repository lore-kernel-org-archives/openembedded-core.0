Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 90F72771B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 13:49:24 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id q17-v6so3644256otg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=OkEqILyWZgz9Sew/eg2OxppmcxpcVLMT/7erntIaGIM=;
	b=LdJWz1V+mDFSWBIsnb/4dyLQSMfd/j3FrkRTvXCk1+XLZRdsletGCm9vc17rHYg5Wg
	Q6AB8kfzECF4RZDhUQd1It+KxSvn60YUcTgkpfOtuN76ah+dKZzXexIPhpJNC1BPccoU
	WOH7Frg999MpUunk8sZGI5VDuZyctMuboBfIFbGSPteCX69xpU54ay4SgVoWUJhuJwMp
	VOOuf+/9V4MxXCa889hyV1wF6SuCWyu4VGP0dGtrh6V/Yoa63XxNMWhGf8RDQKWT7x1y
	59a7xb2Qxip/MD9vY9V1a5ULXlpwJn+/13d4bWlYbohhTkKrJAhoLOwZgWkCbbfC8Uab
	xKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=OkEqILyWZgz9Sew/eg2OxppmcxpcVLMT/7erntIaGIM=;
	b=GT7teAC41fdLrhQ72dUyUNPZ3JsIv861sQpGs5+JLvuURQVXzRSoR2njYQs9MoEYJW
	cq9AYuDx8gr8y5+GBfdCOymJVVzEtXgCtVDJ6APObe9mtjQJju4FFwnTw8mNO5doDZDS
	QW+6aTgaX+n4cxDXs+Lc7hRWIpkwXJXurHhJRIEGFW1VSu9qD9dHHcyedVdR5ILBYIiC
	h0Fc9Hmhh7xLHVgZbMeVQD/te5EnfY/9UEfaRSVAZ/NeD0YCQitoOpQjlFD2aBSaLexL
	RjpZdjx4FgjbcnJYncj/hWv7NE//fgQ0qcTkCQL+5iHGpVVPiGaNeFrMyV9Ik1+/Rxro
	XBTQ==
X-Gm-Message-State: APt69E3nYrVFFAkBg+pF1n/PIvh8ymAqjthEtPoJZiltBUxzWmjPi2/B
	wmLclcW2DOoRQLVZhQpu9JdPg/I2
X-Google-Smtp-Source: ADUXVKKi8I6Lty9XDUsrWuHm2p1xSM/PUmyt2ATxY8K6atrEVLLanzNSgWwJXS3uNOEA+P+Y0Zn3ag==
X-Received: by 2002:a9d:2c41:: with SMTP id
	f59-v6mr14770750otb.263.1529588965238; 
	Thu, 21 Jun 2018 06:49:25 -0700 (PDT)
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com.
	[74.125.82.177]) by smtp.gmail.com with ESMTPSA id
	b4-v6sm2317163otf.79.2018.06.21.06.49.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 06:49:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f177.google.com with SMTP id r18-v6so3658321otk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 06:49:22 -0700 (PDT)
X-Received: by 2002:a9d:132f:: with SMTP id
	f44-v6mr14439001ote.35.1529588962600; 
	Thu, 21 Jun 2018 06:49:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:58c5:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 06:49:21
	-0700 (PDT)
In-Reply-To: <CAP71Wjz91m61fs9kxg1F7NCTq=X8Mtkc-CeBFNKZGgi=6tEgmA@mail.gmail.com>
References: <20180615032226.9899-1-ayaka@soulik.info>
	<20180615032226.9899-2-ayaka@soulik.info>
	<CAP71Wjz91m61fs9kxg1F7NCTq=X8Mtkc-CeBFNKZGgi=6tEgmA@mail.gmail.com>
Date: Thu, 21 Jun 2018 10:49:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpiEN=zjyr4avWCWoB6FLKY7gDBpFeNP024vcwy+3V6HA@mail.gmail.com>
Message-ID: <CAP9ODKpiEN=zjyr4avWCWoB6FLKY7gDBpFeNP024vcwy+3V6HA@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/5] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Thu, 21 Jun 2018 13:49:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 6:57 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Fri, Jun 15, 2018 at 5:22 AM, Randy Li <ayaka@soulik.info> wrote:
>> There are some addtional instructions apart from bare armv8,
>> also there is armv8.1, armv8.2.
>>
>> Most the processor would support crc, except X-gene 1.
>>
>> Signed-off-by: Randy Li <ayaka@soulik.info>
>> ---
>>  meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
>>  meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++++++++++
>>  2 files changed, 28 insertions(+), 1 deletion(-)
>>  delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
>
> My previous comment still applies here. You can't just delete this
> file. It's used by many BSP. and it's even used in oe-core itself:
>
> layers/openembedded-core/meta/conf/machine/include/tune-thunderx.inc:require
> conf/machine/include/arm/arch-armv8.inc
> layers/openembedded-core/meta/conf/machine/qemuarm64.conf:require
> conf/machine/include/arm/arch-armv8.inc

I think the rename is fine (of course, considering it handles the
rename inside whole oe-core).

Breaking existing BSP in new release is fine. People needs to handle
it when upgrading the branches.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

