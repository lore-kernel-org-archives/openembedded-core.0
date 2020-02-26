Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id D755761615
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 14:58:45 +0000 (UTC)
Received: from [192.168.1.17] (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 607D36014D;
	Wed, 26 Feb 2020 15:58:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1582729125;
	bh=82blCcfFM9+Mozub2O2NEOf88uObpfCBDH0nk9vois0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=ZUZJ4di53MxjSm/BEC0ktXyy/OPCH9LWb5Vh13Bov55TV45qYwbodBs62EiuVDRT1
	BhxB9tMWdXtKXj6iAMIb/gBKlOzb21mQ5n80rSKtaMr13wWrc97dNy+9hQpAaQdPL1
	0Ts222qbGYclXEoXyKDp/F8CBhIYZtQbbVMPja6M56lCFlsEGLaljRRTvPAyD7UcEh
	ihBoJe0hFuYAnGJm0nZylNDS6bNF8fa88HK/5b8L7FtQI7TfNqfVrQ/zD6yB1WCAUz
	zZmRnBXoBVizQ1cesIWwrkzolBf3yviu9B79tby1QzeW6SPew+8rJJgQN6/oFgs9K6
	DheLPuSdJn4jA==
To: Randy MacLeod <randy.macleod@windriver.com>, Mikko.Rapeli@bmw.de
References: <1579631324-16775-1-git-send-email-pjtexier@koncepto.io>
	<20200122092837.GH34396@korppu>
	<a68132ef-a36b-b517-bde0-ca2419ae15fb@koncepto.io>
	<3166a29d-cff4-93c4-760a-0795f19af04f@windriver.com>
From: Pierre-Jean Texier <pjtexier@koncepto.io>
Message-ID: <7212b6ab-17f1-2603-3f27-4847eed90d89@koncepto.io>
Date: Wed, 26 Feb 2020 15:58:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3166a29d-cff4-93c4-760a-0795f19af04f@windriver.com>
Cc: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: upgrade 2.34 -> 2.35
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
X-List-Received-Date: Wed, 26 Feb 2020 14:58:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hello Randy,

Le 26/02/2020 à 15:10, Randy MacLeod a écrit :
> 
> It would be nice to get util-linux updated for 3.1.
> 
> Pierre-Jean do you have time to address the GPLv3/hwclock licensing
> and re-submit (2.35.1?) this week?

Sure, no problem, I will send a v2 with the 2.35.1 version
with '--disable-hwclock-gplv3' enabled, option available since:

https://github.com/karelzak/util-linux/commit/e8c21c894e69ba0c72ecf69e8297cb20ec5f9c1e

Regards,
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io

