Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA5E7F282
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:00:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Jc790hNCz3J;
	Wed, 28 Aug 2019 22:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567022453;
	bh=5u8cCnztR6/ygS6sm2ulIVKAnNJuu7vu9pu/CKc8WV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofdfTUoVKouP/RtYoTfSYUqhaYdsDZR92mRa0EAhYIiXgKGg5G/VsaMHh8k6x33hF
	TFw1tLR33KEQhsAJRAwa0pjfmdF6qA/Xc8Asr8C/RtJ7fr5e/QF5U0JhLwj+YM9FiL
	egyAyAStGnOog2+lo1qftgbsKazjtWjZyHMgTVYia0PNCFZEpGmH2xLLFm06vKnDXU
	w/jXurW7b+t5i1ilnMG1560lt/tZgoQdcFgNW88ewbtOrWPY530/A6Q6+EeEGuXZiB
	YiKK7nPKInsPwNdPHw4B6i1vfbXv4/wnjM1fm4ol14ZCpT/koByr7tDIqm50+j7VBE
	OquTPNzxVi1YwTFEcW28ZeELCrZav6IgIUSoM5XwGqIDcLaDwhnn65zNmk8HM6W8h1
	Lz/GZut5URnH+7f+Cct5JISPN1z4vWvrxUUxXli3YBf30Iud1qexLCJV1PVUazKWXo
	1hbPJR1ZAYCfkgyTmvvKCi7ru9jL0CUCDUv+JHMDnKLMFKCWxcPr0C4G9gLEQdse2b
	nOZYIsgq+pMBmmieYGdR5VILS/qqAkgFAitw7z39lvCEBgDPzPpI6NfdWbNRwe+RGB
	zeiv9Ok/xbQh0aF6NQ3fWgld1Gv+GlDBbophk9s00Q4r1jDr/33pxcTmbCpN6otDPa
	tjvVfhfblapVePvBgq8Vq2+g=
Date: Wed, 28 Aug 2019 23:00:51 +0300
From: Adrian Bunk <bunk@stusta.de>
To: bruce.ashfield@gmail.com
Message-ID: <20190828200051.GC3044@localhost>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<2b7778d3ad843f67d5e844902a16af93a9e5c6d3.1567019771.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2b7778d3ad843f67d5e844902a16af93a9e5c6d3.1567019771.git.bruce.ashfield@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] linux-yocto: introduce 5.2 recipes
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
X-List-Received-Date: Wed, 28 Aug 2019 20:00:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 28, 2019 at 03:28:36PM -0400, bruce.ashfield@gmail.com wrote:
>...
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/0001-foo.patch
> @@ -0,0 +1,25 @@
> +From 9ddc5e377434e28f1f3c74c9be011b0c9dfb1de4 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Date: Fri, 1 Mar 2019 10:09:43 -0500
> +Subject: [PATCH] foo
>...

Debug change that leaked into the submission,
or missing proper patch description?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


