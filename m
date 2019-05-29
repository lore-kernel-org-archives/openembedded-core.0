Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4053E7E336
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:09:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4TD8okk017174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 May 2019 06:09:16 -0700
Received: from [128.224.56.208] (128.224.56.208) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 29 May 2019 06:08:49 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Sakib Sajal
	<sakib.sajal@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20190528143104.30168-1-sakib.sajal@windriver.com>
	<20190528143104.30168-2-sakib.sajal@windriver.com>
	<638258f243352200f2456b43bc14bd6a83c0579b.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <1c7fb2ac-bbda-7b16-5aee-416ad8ee5be6@windriver.com>
Date: Wed, 29 May 2019 09:08:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <638258f243352200f2456b43bc14bd6a83c0579b.camel@linuxfoundation.org>
X-Originating-IP: [128.224.56.208]
Subject: Re: [PATCH 2/2] Bash: Allow new-exp ptest to pass when run as root.
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
X-List-Received-Date: Wed, 29 May 2019 13:09:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 5/29/19 8:35 AM, Richard Purdie wrote:
> On Tue, 2019-05-28 at 10:31 -0400, Sakib Sajal wrote:
>> The ptest was failing as it was expecting non-root user.
>> Ptests are only run as root.
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
> 
> Rather than patching the code with a patch which we can never upstream,
> can we run the ptest under a non-root user?

We considered that but when I looked for an example of oe-core doing
that but didn't see one. Did I miss it/them?

I suppose the /usr/lib/bash/ptest/run-ptest script could:
  - create a user: say 'bashptest'
  - run the tests
  - delete the user.
Of course we'd need to add dependencies for the user mgmt tools.

Is that what you were thinking?

../Randy

> 
> Cheers,
> 
> Richard
> 


-- 
# Randy MacLeod
# Wind River Linux

