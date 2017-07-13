Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7399277E12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 16:50:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6DGoYSq001319
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 13 Jul 2017 09:50:45 -0700
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Jul 2017 09:50:36 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1499784588.git.bruce.ashfield@windriver.com>
	<17a1741ee4d35f09f91f6b5216507410bb37ddb9.1499784588.git.bruce.ashfield@windriver.com>
	<CAJTo0LaacpM6wxd2Re+W6Vu7o8zPoq9MadE9csf+Pko_QCKX2Q@mail.gmail.com>
	<e99d1232-1ed5-5df1-7fc7-81437053988a@windriver.com>
	<CAJTo0LY6y+FvKgqbqCUwdD414Ub8Ba_1XY4PW3X15==BsDTRYg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <6c3f201c-aa8c-6384-d970-5057fb933b03@windriver.com>
Date: Thu, 13 Jul 2017 12:50:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY6y+FvKgqbqCUwdD414Ub8Ba_1XY4PW3X15==BsDTRYg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] linux-yocto/4.1: update to v4.1.41
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
X-List-Received-Date: Thu, 13 Jul 2017 16:50:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/13/2017 12:40 PM, Burton, Ross wrote:
> 
> On 13 July 2017 at 17:33, Bruce Ashfield <bruce.ashfield@windriver.com 
> <mailto:bruce.ashfield@windriver.com>> wrote:
> 
>     How would you like the fix, a completely new patch, or an incremental
>     fix on my branch ?
> 
> 

Sent.

Note: It says "v2", but I did change the shortlog to reference 4.1.42
versus 4.1.41.

Since I'm still not building AUTOREV for this (I'll start that now to
try and trigger the issue), the fix is by visual inspection only.

Anyone building poky-lsb by the SRCREVs should still get 4.1.39 versus
this updated kernel. SRCREV updates to the yocto-bsp layer still need
to follow.

Bruce

> A replacement patch please, it's not in master yet.
> 
> Ross


