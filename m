Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD4DF60107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:38:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4O3cRRn003398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 May 2016 20:38:27 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 20:38:26 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
	<1551285.Qn0PiMd4j4@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5743CCB0.3030105@windriver.com>
Date: Tue, 24 May 2016 11:38:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1551285.Qn0PiMd4j4@peggleto-mobl.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 24 May 2016 03:38:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

On 05/24/2016 11:34 AM, Paul Eggleton wrote:
> Hi Robert,
>
> On Mon, 23 May 2016 20:25:36 Robert Yang wrote:
>> They were required by buildtools-tarball, now replaced by python3 ones.
>
> It's not so much that they are required by buildtools-tarball, they are
> required by various scripts that we have. When you say unneeded, I assume only
> on the python3 branch? In master python-git very definitely is still needed.

I'm afraid no, my previous patch had been merged on master branch,
so I think that python-git and others are not needed any more ?

commit 9f921676a7cfac93117788b8dfeff652dfd65134
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Wed May 18 00:43:44 2016 -0700

     buildtools-tarball: replace nativesdk-python with nativesdk-python3

(From OE-Core rev: 97b5b150b3d3e82a5a42c1ea4351eed60aba7906)

// Robert

>
> Cheers,
> Paul
>

