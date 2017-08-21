Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1078606CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 13:17:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7LDHLC4016274
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 21 Aug 2017 06:17:21 -0700
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 06:17:19 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>, Chen Qi <Qi.Chen@windriver.com>
References: <cover.1502879234.git.Qi.Chen@windriver.com>
	<7751264307b6966841699d05c26c8d643fcff3ef.1502879234.git.Qi.Chen@windriver.com>
	<CAHiDW_G9qymXQamiAvFpZmo+drd2TWkOv3eYPTEUxg6pLDNjqw@mail.gmail.com>
	<4df58cdd-1d60-26af-cfe4-7e5c25ffb2f9@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <77b38287-6be2-ded9-c04c-00728f818b74@windriver.com>
Date: Mon, 21 Aug 2017 09:17:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <4df58cdd-1d60-26af-cfe4-7e5c25ffb2f9@windriver.com>
X-Originating-IP: [172.25.44.7]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] shadow: fix CVE-2017-12424
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
X-List-Received-Date: Mon, 21 Aug 2017 13:17:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-18 04:20 PM, Randy MacLeod wrote:
> On 2017-08-16 07:34 AM, Jussi Kukkonen wrote:
>> On 16 August 2017 at 13:28, Chen Qi <Qi.Chen@windriver.com 
>> <mailto:Qi.Chen@windriver.com>> wrote:
>>
>>     Backport a patch to fix CVE-2017-12424.
>>
>>     In shadow before 4.5, the newusers tool could be made to manipulate
>>     internal data structures in ways unintended by the authors.
>>
>>     Reference link: https://nvd.nist.gov/vuln/detail/CVE-2017-12424
>>     <https://nvd.nist.gov/vuln/detail/CVE-2017-12424>
>>
>>     CVE: CVE-2017-12424
>>
>>
>> I don't object to the patch but I'm wondering if there is a reason we 
>> are taking the shadow sources from debian instead of the upstream 
>> github*? shadow 4.5 seems to have been out for months already but 
>> Debian hasn't taken it yet...
>>
>> *) https://github.com/shadow-maint/shadow
>>
>> Jussi
> 
> 
> Good point. It's late in the release but maybe
> not too late to update shadow.
> 
> Qi,
> If you could give it a try and let us know if there are any
> 'gotchas' that would prevent or make the upgrade risky,
> that would be great.

Turns out that Qi will only be able do this at the start of
the oe-core-2.5 development cycle.

../Randy




-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

