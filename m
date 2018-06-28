Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A512D748F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 08:45:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5S8inx2021888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jun 2018 01:45:05 -0700
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 28 Jun 2018 01:44:38 -0700
To: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1528165980-163833-1-git-send-email-hongzhi.song@windriver.com>
	<0c79440f-858d-f155-4cf1-250e79cdcd7c@windriver.com>
	<db096545-45b4-b299-72c4-850b4fb9e248@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <39c14916-285a-c0e6-96a4-6c7812cfd893@windriver.com>
Date: Thu, 28 Jun 2018 16:46:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <db096545-45b4-b299-72c4-850b4fb9e248@windriver.com>
X-Originating-IP: [128.224.162.198]
Subject: Re: [meta][PATCH 0/2] Add kernel-sample tests for runtime test
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
X-List-Received-Date: Thu, 28 Jun 2018 08:45:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

ping

-- Hongzhi


On 2018年06月19日 13:54, Hongzhi, Song wrote:
> ping
>
> --Hongzhi
>
>
> On 2018年06月08日 10:03, Hongzhi, Song wrote:
>> ping...
>>
>>
>> A bug has been created, but the patch hasn't been adapted.
>>
>> bug 12774 : https://bugzilla.yoctoproject.org/show_bug.cgi?id=12774
>>
>>
>> We plan to add more tests about kernel in the next time.
>>
>>
>> If there is no objection, could you adapt my patch?
>>
>>
>> -- Hongzhi
>>
>>
>> On 2018年06月05日 10:32, Hongzhi.Song wrote:
>>> V4:
>>>   * add support for qemu by default
>>>
>>> V3:
>>>   * remove duplicated code
>>>
>>> V2:
>>>   * use shared function to replace similar code
>>>
>>> Hongzhi.Song (2):
>>>    meta runtime testcases: enable kernel-sample features for runtime
>>>      tests
>>>    Meta runtime cases: add testcases for kernel sample
>>>
>>>   meta/lib/oeqa/runtime/cases/ksample.py    | 213 
>>> ++++++++++++++++++++++++++++++
>>>   meta/recipes-kernel/linux/linux-yocto.inc |   3 +
>>>   2 files changed, 216 insertions(+)
>>>   create mode 100644 meta/lib/oeqa/runtime/cases/ksample.py
>>>
>>
>


