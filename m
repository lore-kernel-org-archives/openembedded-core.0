Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 865EB705BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:44 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id et14so1925304pad.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=yHQ3hPH4A4Ur05ZFotoPa+xlOw7aT3XxIo9l/K4dHLw=;
	b=IBrakPD7aGSP9MiIDUCZhJ6ONddmlkhu/ZvVD1SpoALhomWrrhjfoMGAFGDQ8mbcLg
	UNPlUAbR9QFSH0g1fcKsKCCE2oKhhHAApFTjBqEmRJ7kX7Cq9d21h5J99Hqx2+kczHLJ
	DS3OiHSq9NdPjj8w8ktiV6mmS/o2ohBJUBf1F/aj4yF4Hw5xyuO7/g/JmEXkdLKMlyD1
	F+bCBUQmJf2jwDVbkZDjGQtZ2DMJwtmmKysBrVI5Xvs74WLNOxcnmV+3ENp7cZR09Vf8
	XNgvnhPKa18I1U+od41JoDxtohHj1HFLaoWMOyiAr0Fw8Ltqc5YYbyQMRx6EYhbIe8iO
	PSjg==
X-Received: by 10.68.102.34 with SMTP id fl2mr23153186pbb.2.1405433986176;
	Tue, 15 Jul 2014 07:19:46 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id kg1sm4097615pbc.22.2014.07.15.07.19.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 07:19:44 -0700 (PDT)
Message-ID: <53C5387D.6040503@gmail.com>
Date: Tue, 15 Jul 2014 07:19:41 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1405430855-12398-1-git-send-email-akuster@mvista.com>
	<CAJTo0LYfG4kCxWHbKK9rM7YScB2NAqVqmTVmMKpGb7UD7WE0Bg@mail.gmail.com>
In-Reply-To: <CAJTo0LYfG4kCxWHbKK9rM7YScB2NAqVqmTVmMKpGb7UD7WE0Bg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ross,

Since we are keeping both versions, should I define  a PREFERRED_VERSION?

- Armin

On 07/15/2014 06:49 AM, Burton, Ross wrote:
> On 15 July 2014 14:27, Armin Kuster <akuster@mvista.com> wrote:
>> Add GNUv3 license
>
> If nettle 3 contains GPLv3 code then we probably don't want to remove
> nettle 2.1, for people building without any v3 code in the images.
>
> Ross
>

