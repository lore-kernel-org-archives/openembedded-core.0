Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16B07601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 15:50:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2NFoDlD019036
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Mar 2016 08:50:14 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 23 Mar 2016 08:50:13 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
	<fe57bd778472c15f247fbf20491221bdadad8b37.1458638728.git.hongxu.jia@windriver.com>
	<CADkTA4PbOMTOAEyA3GSPFiiiimOaQKB-Sv_TCtsGBmbiET-yCw@mail.gmail.com>
	<56F17064.6040507@windriver.com>
	<CADkTA4NNeTO4LH1s440mxw=RVuWkPFiaWWt3Z6twFH6ugypjGA@mail.gmail.com>
	<56F1F173.7070504@windriver.com>
	<CADkTA4NnAugXBRddkA5ZhbSMXsqx778bPH1U_7qtK0YetXn69w@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56F2BB32.3040709@windriver.com>
Date: Wed, 23 Mar 2016 23:50:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NnAugXBRddkA5ZhbSMXsqx778bPH1U_7qtK0YetXn69w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/16] kernel.bbclass: fix buildpath QA issue
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
X-List-Received-Date: Wed, 23 Mar 2016 15:50:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2016 10:28 PM, Bruce Ashfield wrote:
> Either you patch the kernel, and make it a Kconfig option for the 
> mapping, or we pass it
> in as an intrinsic part of the CC definition, or some variant of those.
>

OK, I will try to choose one way for review.

BWT, currently, package kernel-dbg (which contains sources) not 
generated, should we support it?

If yes, I should do the investigation to fix it.

//Hongxu

> Bruce


