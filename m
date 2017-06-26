Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4984177D4C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 21:21:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5QLLuUk005059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Jun 2017 14:21:56 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 26 Jun 2017 14:21:56 -0700
From: Randy MacLeod <randy.macleod@windriver.com>
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1498097697-12564-1-git-send-email-Randy.MacLeod@windriver.com>
	<d194290a-fad9-3c63-b3a4-379b50074fd5@windriver.com>
	<CAMKF1sqNKaRB0Dagz8aKG5HR6QPHcw6XZMGcMrBnFogP3fbhgw@mail.gmail.com>
	<393805e4-6d27-42c4-41c4-253508e8527b@windriver.com>
Message-ID: <24dd3ea6-f685-8692-f31d-2df792bfcb57@windriver.com>
Date: Mon, 26 Jun 2017 17:21:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <393805e4-6d27-42c4-41c4-253508e8527b@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH v2] systemd: work-around ppc gold linker error
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
X-List-Received-Date: Mon, 26 Jun 2017 21:21:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-06-22 08:30 PM, Randy MacLeod wrote:
> On 2017-06-22 06:22 PM, Khem Raj wrote:
>> What's the link to upstream bug in linker
> 
> Do you mean: Have I created an upstream bug?
> 
> No, not yet but I'm just reading their email lists and
> trying to understand where and how to report the bug.

Done:
    https://sourceware.org/bugzilla/show_bug.cgi?id=21678

I haven't made any progress on testing master.
I should have time this week.

Oh, webkitgtk_2.16.1 also fails for qemuppc with a similar error.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

