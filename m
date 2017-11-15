Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E79B76FEFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 09:24:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAF9OcwL016692
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Nov 2017 01:24:38 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 15 Nov 2017 01:24:38 -0800
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
	<a4f2cfac-2714-ef11-c4ff-308ce183f1e1@windriver.com>
	<1510654568.4049.64.camel@andred.net>
	<CAJTo0LZFWFV-ZThaf0aNxC6r8+guutmNU68759hHND7zESmc6A@mail.gmail.com>
	<CAJTo0LbnJtZG2LTe_NsOgH5-q1y7JectDHDM0h9nJMbi5txb9w@mail.gmail.com>
	<1510668148.4049.71.camel@andred.net>
	<4a8c2156-35df-8786-31c8-b35b8a6588d3@windriver.com>
	<1510736807.4049.75.camel@andred.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <e65fb1a6-f2fd-e294-fac6-9c587d8b386e@windriver.com>
Date: Wed, 15 Nov 2017 17:24:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510736807.4049.75.camel@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Wed, 15 Nov 2017 09:24:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/15/2017 05:06 PM, André Draszik wrote:
> Hi,
> 
> On Wed, 2017-11-15 at 10:23 +0800, Robert Yang wrote:
>>
>> On 11/14/2017 10:02 PM, André Draszik wrote:
>>> Is that an ipk / OPKG issue? Should something be removing the old
>>> packages
>>> from deploy?
>>
>> I tried PACKAGE_CLASSES = "package_ipk", I got the same result as ross:
> 
> OK, so I tried with autoconf-archive myself now. I get the same result as
> you two.
> 
> But - When moving a recipe from MACHINE_ARCH to TUNE_PKGARCH then the old
> package is not removed.
> 
> [...]
>> I guess something is wrong with your build.
> 
> To summarise:
> - moving a recipe from TUNE_PKGARCH to allarch removes the old package
> - moving a recipe from MACHINE_ARCH to TUNE_PKGARCH *doesn't* remove the old
>    package.
> 
> Where would I start looking?

It is removed by sstate.bbclass, take a look at sstate_clean() may help.

// Robert

> 
> 
> Cheers,
> Andre'
> 
> 

