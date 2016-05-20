Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0056011A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 02:23:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4K2NP7r025366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 19 May 2016 19:23:29 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 19:23:24 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1463557068.git.liezhi.yang@windriver.com>
	<573DAF56.50601@linux.intel.com> <573DB475.3040008@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <573E751B.4000508@windriver.com>
Date: Fri, 20 May 2016 10:23:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <573DB475.3040008@linux.intel.com>
Subject: Re: [PATCH 0/7][python3] buildtools-tarball: replace python with python3
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
X-List-Received-Date: Fri, 20 May 2016 02:23:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 05/19/2016 08:41 PM, Alexander Kanavin wrote:
> On 05/19/2016 03:19 PM, Alexander Kanavin wrote:
>> On 05/18/2016 10:43 AM, Robert Yang wrote:
>>
>>> Robert Yang (7):
>>>    python3-smmap: add it for python3-gitdb
>>>    python3-async: add it for python3-gitdb
>>>    python3-gitdb: add it for python3-git
>>>    python3-git: add it for buildtools-tarball
>>
>> You can remove the Python 2 versions at the same time. Nothing is
>> requiring them in oe-core or meta-oe.
>
> Nevermind; I just noticed that packagegroup-self-hosted refers to python-git, so
> it can be removed only after bitbake's python3 support is merged.

Thanks, I will remove them in another patch.

// Robert

>
> Alex
>

