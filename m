Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2F36C104
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 01:58:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBS1wLqH006656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Dec 2018 17:58:21 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 27 Dec 2018 17:58:07 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1545901142.git.liezhi.yang@windriver.com>
	<7b35228f2a7f688f6c1a6ecdbcefd6dd436c4b25.1545901142.git.liezhi.yang@windriver.com>
	<e2a93209edc2390de536dd34fdd405ea9ab5b8ab.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <0111de45-143c-b1f7-6a49-803f21ee41b7@windriver.com>
Date: Fri, 28 Dec 2018 10:03:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <e2a93209edc2390de536dd34fdd405ea9ab5b8ab.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/3] oeqa: make it work for multiple users
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
X-List-Received-Date: Fri, 28 Dec 2018 01:58:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/27/18 7:37 PM, Richard Purdie wrote:
> On Thu, 2018-12-27 at 00:59 -0800, Robert Yang wrote:
>> There are failures when multiple users run oe-selftest on the same
>> host:
>>
>> PermissionError: [Errno 13] Permission denied: '/tmp/oe-saved-
>> tests/201812250324_qemu'
>>
>> This is because /tmp/oe-saved-tests was created by user A, while user
>> B tries
>> to write data in it, then the error will happen. This patch can fix
>> the problem.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/testimage.bbclass   | 2 +-
>>   meta/lib/oeqa/runtime/context.py | 7 +++----
>>   meta/lib/oeqa/utils/dump.py      | 5 ++++-
>>   3 files changed, 8 insertions(+), 6 deletions(-)
> 
> Putting this into /tmp isn't good. Why don't we move this to
> LOG_DIR/runtime-hostdump/?

Thanks, make sense, I will send a V2 for patch 1 and 2.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 

