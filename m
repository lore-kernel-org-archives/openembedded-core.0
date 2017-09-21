Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88B05782C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 21:20:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8LLKWVX009262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Sep 2017 14:20:32 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 21 Sep 2017 14:20:31 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Tom Rini
	<trini@konsulko.com>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<CAP9ODKquj79BCNcRg66C+GSbDeoAeO6nb61Nk2FQG75w_CCTjg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a6131189-f150-5383-6858-5d296e2389ed@windriver.com>
Date: Thu, 21 Sep 2017 16:20:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKquj79BCNcRg66C+GSbDeoAeO6nb61Nk2FQG75w_CCTjg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Thu, 21 Sep 2017 21:20:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/21/17 4:15 PM, Otavio Salvador wrote:
> On Thu, Sep 21, 2017 at 2:46 PM, Tom Rini <trini@konsulko.com> wrote:
>> When we have been told to use the UUID we should also update the fstab
>> to make use of PARTUUID instead of hard-coding the device in question.
>> This will make the resulting image much more portable.
>>
>> Signed-off-by: Tom Rini <trini@konsulko.com>
> 
> Adding more features which changes the fstab goes to the opposite
> direction of reproducible builds; is it desirable?
> 
> 

There should be a corresponding way to specify the UUID for a generated
partition.  This would allow someone to pre-allocate the UUID and use it for
their generated image, and thus the reproducible build.

--Mark

