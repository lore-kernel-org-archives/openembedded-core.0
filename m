Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0DC66D041
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2013 01:40:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9Q1e7Kk008203
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Oct 2013 18:40:07 -0700 (PDT)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 25 Oct 2013 18:40:06 -0700
Message-ID: <526B1D75.40304@windriver.com>
Date: Sat, 26 Oct 2013 09:40:05 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1382421718.git.jackie.huang@windriver.com>
	<58deef15f737352489f007488ec2e24bd76be058.1382421718.git.jackie.huang@windriver.com>
	<CAMKF1sqwHn4SU1U9_Cp0hsd8EKGYuteazX+OP7T5mQNDztPSsg@mail.gmail.com>
In-Reply-To: <CAMKF1sqwHn4SU1U9_Cp0hsd8EKGYuteazX+OP7T5mQNDztPSsg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] midori: exclude from self-hosted for mips64
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
X-List-Received-Date: Sat, 26 Oct 2013 01:40:09 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/25/2013 8:32 PM, Khem Raj wrote:
> On Mon, Oct 21, 2013 at 11:04 PM,  <jackie.huang@windriver.com> wrote:
>> midori depends on webkit-gtk which could not build for mips64.
>
> what issues do you see building webkit-gtk for mips64, IIRC I fixed it
> some time ago

I didn't see the webkit-gtk issue, but I saw:
commit 0d2ed6bca55319195b5efd74eac83a459bf58ee8
Author: Kang Kai <kai.kang@windriver.com>
Date:   Fri Jul 5 10:18:10 2013 +0000

     webkit: set COMPATIBLE_HOST for mips64

     webkit packages can NOT be built for mips64 with 64 bit userspace. Set
     COMPATIBLE_HOST to to block them build for such platform.

     Signed-off-by: Kai Kang <kai.kang@windriver.com>
     Signed-off-by: Saul Wold <sgw@linux.intel.com>


and midori depends ot webkit-gtk so it's not buildable for mips64.
If it's fixed, I think you should reset the COMPATIBLE_HOST back for 
both webkitgtk and midori, thanks!

Thanks,
Jackie


>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

