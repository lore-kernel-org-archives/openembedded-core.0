Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE154605C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 14:48:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9GEmbxD004936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Oct 2017 07:48:37 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 16 Oct 2017 07:48:36 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20171013141832.24325-1-alexander.kanavin@linux.intel.com>
	<077b5862-bb57-8447-4cca-5301740ff945@windriver.com>
	<c4d752b8-c0c5-bfd7-ca5b-e7958a9f31f3@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5a6c4867-6475-189f-cce4-8c2a7fe94ee6@windriver.com>
Date: Mon, 16 Oct 2017 09:48:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <c4d752b8-c0c5-bfd7-ca5b-e7958a9f31f3@linux.intel.com>
Subject: Re: [PATCH] prelink: fix upstream version check
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
X-List-Received-Date: Mon, 16 Oct 2017 14:48:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/16/17 5:22 AM, Alexander Kanavin wrote:
> On 10/13/2017 05:56 PM, Mark Hatle wrote:
>> On 10/13/17 9:18 AM, Alexander Kanavin wrote:
>>> Instead of reporting that we can update to a bogus version
>>> report that upstream version is not known.
>>
>> You do know that there are release branches for prelink right?
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/prelink-cross/refs/heads
>>
>> cross_prelink and master are both 'release' quality branches.
>>
>> Anything put there is a new version.
>>
>>
>> There is nothing for us to 'tag', since there are no formal versions.
>>
>>
>> Should be easy enough for the system to compare the SRCREV to the top of
>> cross_prelink.  If they don't match, an upgrade is needed.
> 
> The system currently supports only comparing tags, not comparing 
> commits. I've filed a bug for it long time ago:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8133
> 
> and no progress happened. In the meantime, for projects where commit == 
> release, the best we can do is to mark them as 'upstream version cannot 
> be established'. For prelink, also an exclusion of a bogus tag is 
> needed, so you, as the maintainer, won't get reminders to update to it.

didn't realize this hadn't been implemented in the system yet.  Definitely
something that should be.

--Mark

> Alex
> 


