Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8F897C03B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 07:47:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0A7lOsg003082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2019 23:47:34 -0800
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 9 Jan 2019 23:47:13 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1545101991.git.liezhi.yang@windriver.com>
	<73748ae8-f16a-43f9-0fac-d62e43b471cf@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6ec99815-8bef-18ad-b8c3-e10858a332ec@windriver.com>
Date: Thu, 10 Jan 2019 15:52:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <73748ae8-f16a-43f9-0fac-d62e43b471cf@windriver.com>
Subject: Re: [PATCH 0/1] package.bbclass: Don not hide cpio's error
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
X-List-Received-Date: Thu, 10 Jan 2019 07:47:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/18/18 11:13 AM, Robert Yang wrote:
> Sorry, the subject should be:
> 
> package.bbclass: Do not hide cpio's error
> 
> Fixed it in the repo.
> 
> // Robert
> 
> On 12/18/18 11:00 AM, Robert Yang wrote:
>> The following changes since commit 20aea61385e1a53ac245353899277ba20104ed2f:
>>
>>    gcc: Drop 7.3 since 8.2 is working fine for us (2018-12-15 17:10:44 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib rbt/package

Ping.

// Robert

>>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/package
>>
>> Robert Yang (1):
>>    package.bbclass: Don not hide cpio's error
>>
>>   meta/classes/package.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>

