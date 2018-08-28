Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BFE578FBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 00:57:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7S0vYwT026380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 17:57:35 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 27 Aug 2018 17:57:34 -0700
To: <yang.wang@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20180518085550.92085-1-mingli.yu@windriver.com>
	<5B1E1444.9000407@windriver.com>
	<30f93af9-5a38-059e-184f-bbbe52a01105@windriver.com>
	<f248ce00-4c47-7a70-9902-585960c5ccd4@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <39d4429f-e3c6-33fc-3073-8cea08d81794@windriver.com>
Date: Mon, 27 Aug 2018 20:57:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f248ce00-4c47-7a70-9902-585960c5ccd4@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] boost: add ptest support
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
X-List-Received-Date: Tue, 28 Aug 2018 00:57:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 08/27/2018 06:17 PM, Yang Wang wrote:
> Not sure if it's worth to run the Ptest on QEMU though, I also run Ptest 
> on SIMICS simulators, thousands of tests didn't get run, looks like the 
> result was not good as well.
> 
> Now my nightly Ptest runs on x86 device and gets consistent result every 
> day:
> 
>      2018-08-27T06:26 -- 2018-08-27T09:52
>      Passed:  40518
>      Failed:  289
>      Skipped: 1876

Consistent results are good and > 90% pass rate is very good.
What are the stats using qemux86-64 and/or simics?

I don't expect that qemu results would be as close to real hardware
as Simics but it is quite good and freely available.

> 
> Thanks,
> Yang Wang


-- 
# Randy MacLeod
# Wind River Linux

