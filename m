Return-Path: <De.Huo@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C95E661574
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 03:56:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01J3uQ4N014631
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 18 Feb 2020 19:56:26 -0800 (PST)
Received: from [128.224.16.214] (128.224.16.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 18 Feb 2020 19:56:25 -0800
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "chet.ramey@case.edu"
	<chet.ramey@case.edu>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "preid@electromag.com.au"
	<preid@electromag.com.au>, "akuster808@gmail.com" <akuster808@gmail.com>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
	<9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>
	<41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
From: dhuo <de.huo@windriver.com>
Message-ID: <31dfaafd-6dee-4e60-b372-7cb59cfb7cd4@windriver.com>
Date: Wed, 19 Feb 2020 11:56:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
X-Originating-IP: [128.224.16.214]
Subject: Re: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Wed, 19 Feb 2020 03:56:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Anuj,

Do you think there is irrelevant changes to the CVE in 
https://github.com/bminor/bash/commit/
951bdaad7a18cc0dc1036bba86b18b90874d39ff or in this pach?

Could you please specify what's the irrelevant part?

I ask this because we also use this patch in our product.

Thanks in advance.

在 2020/2/18 23:43, Mittal, Anuj 写道:
> On Tue, 2020-02-18 at 15:35 +0000, Richard Purdie wrote:
>> On Tue, 2020-02-18 at 10:28 -0500, Chet Ramey wrote:
>>> On 2/17/20 9:46 PM, Huo, De wrote:
>>>>   I applied the patch to fix CVE defect CVE-2019-18276.
>>> That's not exactly an answer to the question of who produced the
>>> patch.
>>> If that patch is the one causing failures when it's applied,
>>> doesn't it
>>> make sense to go back to the person who produced it and ask them to
>>> update it if necessary?
>> Its likely a general CVE patch where both configure and configure.ac
>> are patched. For OE, we can drop the configure part since we
>> reautoconf
>> the code. Its therefore the OE port of the patch which is likely at
>> fault.
>>
>> Someone just needs to remove that section of the patch.
> There are other issues with this patch which should also be fixed I
> think. It has been marked as a Backport while it is not one. The patch
> includes changes that are irrelevant to the CVE. And, it should have
> gone to master first.
>
> Thanks,
>
> Anuj

