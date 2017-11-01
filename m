Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21D0777D6B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:31:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA1EVZE6009011
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Nov 2017 07:31:35 -0700 (PDT)
Received: from [128.224.56.221] (128.224.56.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 1 Nov 2017 07:31:33 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20171031174357.9502-1-alexander.kanavin@linux.intel.com>
	<20171031174357.9502-2-alexander.kanavin@linux.intel.com>
	<b0ee4a6c-d008-0d49-0651-a3e9c9e7c948@windriver.com>
	<c6d3f2d7-7964-48e8-afac-981ccd92684c@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <1ecad475-1ebf-6377-92e8-aff89d4c660d@windriver.com>
Date: Wed, 1 Nov 2017 10:31:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <c6d3f2d7-7964-48e8-afac-981ccd92684c@linux.intel.com>
X-Originating-IP: [128.224.56.221]
Subject: Re: [PATCH 2/2] oe-core: take UPSTREAM_CHECK_COMMITS into use where possible
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
X-List-Received-Date: Wed, 01 Nov 2017 14:31:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-11-01 04:38 AM, Alexander Kanavin wrote:
> Their data is not of sufficient quality unfortunately. For Python they 
> report 3.7.0 as the latest version even though it won't be released 
> until june 2018. Python 2.x is neglected altogether. Latest 3.6 version 
> is 3.6.3 released a month ago, but they report only 3.6.2.
> 
> Similar issues with webkitgtk: they report 2.19.1 (a pre-release), but 
> not 2.18.2 (actual latest release).
> 
> Then there's the question of who maintains the mapping of their database 
> to our package names.
> 
> Our tracker has over 98% accuracy, while this one failed both of the 
> randomly chosen samples ;)
> 
> Alex

Huh, accurate data, aren't you picky! ;-)
Thanks for following up.

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

