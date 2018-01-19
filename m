Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE0378421
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 08:10:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jan 2018 00:10:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,381,1511856000"; d="scan'208";a="20993786"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2018 00:10:52 -0800
To: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin.hundeboll@prevas.dk>,
	Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1516331459-4093-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1516331459-4093-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<8c9a194b-622d-659c-a1de-459cf56ab63a@linux.intel.com>
	<f671aea7-2a8c-c2b1-b5f9-80fe42fcddd2@prevas.dk>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d221d7d4-8605-9b93-5046-084f5d46fd4f@linux.intel.com>
Date: Fri, 19 Jan 2018 10:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <f671aea7-2a8c-c2b1-b5f9-80fe42fcddd2@prevas.dk>
Subject: Re: [PATCH] bash: 4.4 -> 4.4.12
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
X-List-Received-Date: Fri, 19 Jan 2018 08:10:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/19/2018 09:54 AM, Martin Hundebøll wrote:
> 1.Upgrade bash from 4.4 to 4.4.12.
>>> 2.Delete bash44-001, bash44-002, bash44-003, bash44-004, bash44-005, 
>>> bash44-006, bash44-007,bash44-008, bash44-009, bash44-0010, 
>>> bash44-0011, bash44-0012, since it is integrated upstream.
>>>
>>> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>>> ---
>>>   meta/recipes-extended/bash/bash_4.4.12.bb | 24 +++++++++++++
>>>   meta/recipes-extended/bash/bash_4.4.bb    | 60 
>>> -------------------------------
>>>   2 files changed, 24 insertions(+), 60 deletions(-)
>>
>> You need to delete the patch files too.
> 
> The patches are fetched from GNU_MIRROR, no?

Ah, yes, that's right.

Alex

