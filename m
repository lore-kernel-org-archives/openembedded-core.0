Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5A47DDA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 14:02:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 453x8c4Gncz60;
	Wed, 15 May 2019 16:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557928977;
	bh=F4mebhwsRDuVJ1dL7T2+ycdRMmYGRfAdYlxNBvu+rFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYhhEz97PVp4iubtbY7bacP6rqrJ2DxaAap28iPMjD8GrMcvaz7M3N3uTpse85Z+f
	TKeCD9zy/vYgOQ58sKLHQC2Q/pQGZN4RN+0jjqYjnH3mcDhdc6Y8K1dM26s6Of7y5i
	/gI1gQwD97QWKDEl8BDxyEdth3BGlrlwmJn060WBZzxTMgEVfy7ZBhnpnwIQO2Q9pm
	HxHLjldFGTz071R8fc6KKn8hwNMkm97fTDztyHh3/Pto3UJiYYYevdDom424qITs7C
	m7TmnGjrV2SWVRqbBzEBRym4lYaR667ycZC35ysKC4gGEm5Ncj1zCLVhjfldXR9mJ8
	ebN6Z/F2NoAXnlpmAKXLi3MeesqHvL+Q73Kn0wTT2RQ7pbDo2+z37DQVOt51SHRLuZ
	AXHhXfuurU/EZVtP4v2QemeYeqbJGC2RaNEgjgo+il1uMd+tBXrxM4w7F0/yiPVKIk
	qwGewklWafckz2ClpsTKJ+KqCN36TpI45l1ECEwWnc+DAgelGJVA6TZ3eLxRhnT63P
	Mcw+eDyGTj8tjctU5uJKhLUFEmai5v/owCFcl1ctmq41wH2i0wkwfI2ufOHNQRHpMg
	tq+JARwYP6MESect91FFCur+cZopvXb3q47sF82fuvrvrqy6W45xxjPZPQ4hlzqZUC
	FOtMOVIXY9yc2EbHR657MnXI=
Date: Wed, 15 May 2019 17:02:53 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190515140253.GA23229@localhost>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
	<0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
	<20190515110813.GA13420@localhost>
	<6e3c7d20-a86b-9487-5640-0de47f716d95@windriver.com>
	<20190515134218.GA20396@localhost>
	<da1db475-e2ea-d474-e335-1c56285b9361@windriver.com>
MIME-Version: 1.0
In-Reply-To: <da1db475-e2ea-d474-e335-1c56285b9361@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: output failed config.log
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
X-List-Received-Date: Wed, 15 May 2019 14:02:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 15, 2019 at 09:50:35PM +0800, Hongxu Jia wrote:
> 
> After applying my fix, here is the sample
> 
> ...
> 
> checking for i586-wrs-linux-gcc... i586-wrs-linux-gcc  -m32 -march=i586 --sysroot=/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/recipe-sysroot
> checking whether the C compiler works... no
> configure: error: in `/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/build':
> configure: error: C compiler cannot create executables
> See `config.log' for more details
> NOTE: The following config.log files may provide further information.
> NOTE: /buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/build/config.log
> NOTE: This file contains any messages produced by compilers while
> NOTE: running configure, to aid debugging if configure makes a mistake.
> 
> ...
> 
> The content of config.log has prefix `NOTE:' and also tells user
>...

The problem is that the last > 1000 lines are NOTE: - and they all get 
dumped to the terminal.

It is a problem when you have to scroll up through more than a thousand 
lines of mostly irrelvant information before you are seeing the most 
relevant information.

> //Hongxu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


