Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56F1162134
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 21:43:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4ELgwNL000732
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 May 2019 14:43:14 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 14 May 2019 14:42:50 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>, "Burton, Ross" <ross.burton@intel.com>, "Hao,
	Kexin" <Kexin.Hao@windriver.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
	<4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
	<8f1030b6-b831-7ac8-88e3-1208272d7533@windriver.com>
	<19e3463fcf6a41f0c35b7227760bd1f2cf6aeac5.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <c6d172d4-80f4-d91b-662f-b9b1de85f032@windriver.com>
Date: Tue, 14 May 2019 17:42:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <19e3463fcf6a41f0c35b7227760bd1f2cf6aeac5.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Tue, 14 May 2019 21:43:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 5/14/19 5:32 PM, richard.purdie@linuxfoundation.org wrote:
> Actually, my test was flawed. I just retested and this time it worked.
> What I tested with was:
> 
> RDEPENDS_${PN}-ptest += " sed perl perl-module-file-glob ${PN} ${PN}-dbg"
> INSANE_SKIP_${PN}-ptest = "debug-deps"

Ah nice. Thanks.

> 
> Can you see if that works for you?

Sure. I'll test and resend the whole series.

> 
> We also have a problem that its overflowing the 4GB limit on some image
> sizes with the debug info included :/

There's an enhancement to track that:
   https://bugzilla.yoctoproject.org/show_bug.cgi?id=13025
Kevin owns it and has it scheduled for 2.8 M2.

../Randy

> 
> Cheers,
> 
> Richard


-- 
# Randy MacLeod
# Wind River Linux

