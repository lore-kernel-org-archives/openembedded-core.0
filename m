Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8940A60290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 05:43:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4O5hCoW005647
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 May 2016 22:43:12 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 22:43:11 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
	<1551285.Qn0PiMd4j4@peggleto-mobl.ger.corp.intel.com>
	<5743CCB0.3030105@windriver.com>
	<1700462.EZHnc1sg49@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5743E9EE.9070605@windriver.com>
Date: Tue, 24 May 2016 13:43:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1700462.EZHnc1sg49@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] remove unneeded python2 recipes
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
X-List-Received-Date: Tue, 24 May 2016 05:43:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/24/2016 11:53 AM, Paul Eggleton wrote:
> On Tue, 24 May 2016 11:38:24 Robert Yang wrote:
>> On 05/24/2016 11:34 AM, Paul Eggleton wrote:
>>> On Mon, 23 May 2016 20:25:36 Robert Yang wrote:
>>>> They were required by buildtools-tarball, now replaced by python3 ones.
>>>
>>> It's not so much that they are required by buildtools-tarball, they are
>>> required by various scripts that we have. When you say unneeded, I assume
>>> only on the python3 branch? In master python-git very definitely is still
>>> needed.
>>
>> I'm afraid no, my previous patch had been merged on master branch,
>> so I think that python-git and others are not needed any more ?
>
> I had missed that change; that puts us into a bit of an interesting situation.
> buildtools-tarball is provided in order to support bitbake builds on hosts
> that don't have the required tools, but the changes required to support python
> 3 in the build system itself haven't been merged to master yet. So unless I'm
> missing something at the moment have a version of buildtools that doesn't
> actually support running the build system?

At the moment, I think yes.

// Robert

>
> Cheers,
> Paul
>

