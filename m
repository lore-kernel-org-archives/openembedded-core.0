Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 005BB6E87A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 01:18:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2K1IDp3001113
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Mar 2014 18:18:13 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 19 Mar 2014 18:18:13 -0700
Message-ID: <532A41D3.3040605@windriver.com>
Date: Thu, 20 Mar 2014 09:18:11 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<82dfd76f1ebe7801ed08efc1d93f91d73df5a035.1394555880.git.liezhi.yang@windriver.com>
	<1728094.yUuhkgzBIz@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1728094.yUuhkgzBIz@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] archiver.bbclass: move a few code to copyleft_compliance.bbclass
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
X-List-Received-Date: Thu, 20 Mar 2014 01:18:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/19/2014 08:09 PM, Paul Eggleton wrote:
> On Wednesday 12 March 2014 01:08:22 Robert Yang wrote:
>> Move the code which is only used by copyleft_compliance.bbclass from
>> archiver.bbclassc, and remove the "inherit archiver" from
>> copyleft_compliance.bbclass.
>>
>> The archiver.bbclass is used for archiving various types of sources, but
>> the copyleft_compliance.bbclass is used for analysing the license, they
>> don't have much relationships.
>>
>> [YOCTO #4986]
>> [YOCTO #5113]
>
> I can see the benefit of tidying this up, however I think it's still desirable
> for archiver.bbclass to have the ability to filter the recipes that it archives
> by LICENSE value, so that you can easily exclude archiving proprietary sources
> if you wish. At the moment it doesn't seem like there's an easy way even to
> disable archiving on an individual recipe basis.
>

Thanks, sounds reasonable, we can treat this as an enhancement, I notice
that it is already on master-next, how about we let them get merged atm?
And I will send another patch to fix it.

// Robert

> Cheers,
> Paul
>

