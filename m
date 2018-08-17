Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2119748D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 01:58:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7H1w29c020730
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Aug 2018 18:58:02 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 16 Aug 2018 18:58:01 -0700
To: Konstantin Shemyak <konstantin.shemyak@ge.com>,
	<openembedded-core@lists.openembedded.org>
References: <1534326204-395700-1-git-send-email-changqing.li@windriver.com>
	<20180815110817.GA71089@builder0.em.health.ge.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <7a56787d-8736-5fdd-8294-1e94fa439315@windriver.com>
Date: Fri, 17 Aug 2018 09:57:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180815110817.GA71089@builder0.em.health.ge.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] unzip: fix CVE-2018-1000035
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
X-List-Received-Date: Fri, 17 Aug 2018 01:58:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 08/15/2018 07:08 PM, Konstantin Shemyak wrote:
> On 15.8.2018 12:43 changqing.li@windriver.com wrote:
>
> [...]
>> +++
>> b/meta/recipes-extended/unzip/unzip/0001-unzip-fix-CVE-2018-1000035.patch
>> @@ -0,0 +1,46 @@
>> +From 349f566e6e757458843fa164a0f0584280e1501e Mon Sep 17 00:00:00
>> 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Wed, 15 Aug 2018 16:20:53 +0800
>> +Subject: [PATCH] unzip: fix CVE-2018-1000035
>> +
>> +Upstream-Status: Backport
>> +
>> +backport from unzip6.10c23
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
> Would you please add a line:
>
> CVE: CVE-2018-1000035
>
> somewhere after "Upstream-Status:" to let the automatic CVE checker
> detect that this patch solves this particular CVE.
>
> Konstantin Shemyak.
>

OK,  I will resend one

-- 
BRs

Sandy(Li Changqing)
+861084778653


