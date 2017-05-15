Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 06E9171DC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:24:04 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id k91so71962358ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 05:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=CouXcothH5M88hCK190I71M2jzd66w8v/7dzVBpyk6w=;
	b=qIim7SCcaNQEkSgbYCZZ9dO/2Nut9mtxHkCZkciUE6TErPAi+SBU8y4CTtxWm447Y+
	YR+ebFZ6B1gR7KsbfHz3gEC1TmFVikhxq7KDk+qaiV+b/BBSQBXnfegPQrZaSxTtNE/b
	jfYvVLma/9NEz88xQO1Ixu+r/KGiCzfCSAtBG/U94bClZg4pT4NFlJHL1vCd1P5okObl
	TXHNrX7u6r1x6hfahfdlMNnwOlzY8A2jXtsAgAhcTmJH8bBmTqtPmFvXrZsb7H+OUhT5
	Bd04qD+Cjd3I1ecytDHMzGCaXzpgx8V3dSbojbuh237AG59+1fYMVTVH8SnBCFhuhQwK
	yrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=CouXcothH5M88hCK190I71M2jzd66w8v/7dzVBpyk6w=;
	b=P60q0gspMBYFYita0gcWec6z1SgPGrCN1fI+V+luNVSOqWklHPYKJZHzxY2xsEutuR
	ujGBOMOzrFKt0AiavlLRdf4SMfO3mmxmNJwPUdFkT7IW+5r9fPhH971VcMNF5djoSHb1
	iP1CkSvSGlYyVALP979Bi7W0SpE7rcPjCd/6HmYAx/tSo+0c9xcXemmatDPzaXIQTwMQ
	eUIqR5wZMs4fCLziMbArsS8zHKFD5DtaD+AIV0cQRw6cZs75RSK8S+zzR36cvM/tKvIs
	aRhP/fv+YON6UQrMz4JdyoDd7352XrpzUFyijUwnaybuFlbr9Rrxeo1T/yXHwBFIJ7JB
	53Bw==
X-Gm-Message-State: AODbwcBvyEo/NufhyoChD+61mG1nUJhmA5k80Qkh8wB6lO547w54nb4/
	0bqavg8Imq1pr5Qb4Bs=
X-Received: by 10.107.2.6 with SMTP id 6mr4748360ioc.165.1494851045572;
	Mon, 15 May 2017 05:24:05 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F79A.dip0.t-ipconnect.de. [93.232.247.154])
	by smtp.gmail.com with ESMTPSA id
	k79sm4516640itk.26.2017.05.15.05.24.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 May 2017 05:24:04 -0700 (PDT)
Message-ID: <1494851042.1179.246.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Mon, 15 May 2017 14:24:02 +0200
In-Reply-To: <237a1d6e-7c01-2488-c6a2-e5d0c95aff53@linux.intel.com>
References: <9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4.1494837087.git-series.patrick.ohly@intel.com>
	<237a1d6e-7c01-2488-c6a2-e5d0c95aff53@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] manpages.bbclass: avoid QA warning when "manpages" feature not supported
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
X-List-Received-Date: Mon, 15 May 2017 12:24:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-05-15 at 14:47 +0300, Alexander Kanavin wrote:
> On 05/15/2017 11:32 AM, Patrick Ohly wrote:
> > Activating API documentation with:
> >   INHERIT += "manpages"
> >   DISTRO_FEATURES_append = " api-documentation"
> 
> You do not need to add the first line at all, why are you doing it?

I thought that was how the class was meant to be used. "Inherit this
class" in manpages.bbclass is ambiguous.

> manpages is inherited on a per-recipe basis when the recipe itself 
> supports the manpages PACKAGECONFIG.

Now it starts to make sense...

>  This patch is unnecessary.

Agreed.

Patchwork-Status: Rejected

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




