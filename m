Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id DBFC0607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 18:20:31 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id u190so143630430pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 11:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=EByif11lFUo1wTUr3lBIN2eL+W1fjLmICnmq6J9w+Bg=;
	b=VkL6hmYAa1rwQx3NCIZcux29tPi/j/u7xlvivQTBiUyHLAFQSReL01An16njqFiTbR
	BuCKvNoo82YGsJN1tDpYHeCMhZoxdCWZrl9K57wEMriBiNoOUMMVhnmmp7/UQIC9PA9j
	gx3is5e9KzgVDdPzRVQjcYbLMwZd4jZkY1cL/zhBwFhjqkZEELHOlZ6hw9DISdJGeaSU
	rKL0dEHjP7bMra66SSfvJ7kK3tZj4FHsv4VwDM78g+ApT6AiLpUPrBGMKA2KhFIgV2Ns
	wAp4MquW3QjnxZtwQbUDieS4qt1sh9tOWhSOF/nyIbYmenY9jWUgpwXIfrFZLlUuvOS8
	32bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=EByif11lFUo1wTUr3lBIN2eL+W1fjLmICnmq6J9w+Bg=;
	b=b1T3U2/S3S5IAT+87pnI8iYEFyI5+JHQUCeOPWaNGuu2aRrVPR7dgYzaxASjmrKCji
	YEgNxVRF5miIIUr2o+bWZonCSn38kxjei4v+jbHUHEYKhl5Q2brYsiNwBWVGGC2kTsQf
	KCz6ek0JkUCb6jypi81OOcX9ijSqetEPj+Ex5CPPHLbWV1oiGx/HUZepMRAGJZhExs4u
	2qINJJ9GokD8t5td+ayZCrc7UDPdKMKQv0WacRwzEp6qS1hfpA3SGQIt7qW8vyDiZ5Wb
	4Wbh3kQ4sNCuGaRl/M9qCfBgPG9vreqnO7lnlKWooZLKKxMZE2xIj00w4jVSpo3q1deg
	I+1w==
X-Gm-Message-State: AD7BkJKYazFy8vYOiyl1at+rdogJ3tVWmSTgOR43daFbreWraKSee70X7LZEuLXtAd+yYg==
X-Received: by 10.98.80.70 with SMTP id e67mr45530688pfb.136.1459189232135;
	Mon, 28 Mar 2016 11:20:32 -0700 (PDT)
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com.
	[209.85.220.53]) by smtp.gmail.com with ESMTPSA id
	22sm37325461pfh.48.2016.03.28.11.20.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Mar 2016 11:20:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f53.google.com with SMTP id fe3so103750147pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 11:20:30 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.176.139 with SMTP id ci11mr44687966pac.68.1459189230419; 
	Mon, 28 Mar 2016 11:20:30 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 28 Mar 2016 11:20:30 -0700 (PDT)
In-Reply-To: <56F952F7.2010409@gmail.com>
References: <56F952F7.2010409@gmail.com>
Date: Mon, 28 Mar 2016 15:20:30 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqPzybLhTyx8wz1xCpb4_4R0cXSsmYXB3dtLwc4scBbCg@mail.gmail.com>
Message-ID: <CAP9ODKqPzybLhTyx8wz1xCpb4_4R0cXSsmYXB3dtLwc4scBbCg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Aarch64 u-boot with gcc .5x
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
X-List-Received-Date: Mon, 28 Mar 2016 18:20:32 -0000
Content-Type: text/plain; charset=UTF-8

Hello Armin,

On Mon, Mar 28, 2016 at 12:51 PM, akuster808 <akuster808@gmail.com> wrote:
> I have an arm64 odroid c2 board.  If I build u-boot with the current OE
> 5.3 gcc it hangs at kernel load time. If I use 4.9 gcc it works fine. A
> 5.3 built kernel boots fine with a 4.9 built u-boot.
>
> The vendor supplied u-boot is hacked up and am leaning it that direction
> as the culprit so I am looking for data points.
>
> Is anyone using a current u-boot with 5.3 gcc on an arm64 machine? if
> so, any special tweaks to get that combo to work?

I am using one ARM 64 SoC with GCC 5.2 at this moment and it works
fine. What U-Boot version is the fork based on?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

