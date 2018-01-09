Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F3F63788F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 17:51:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w09Hp2OK009055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jan 2018 09:51:02 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 9 Jan 2018 09:51:01 -0800
To: Patrick Ohly <patrick.ohly@intel.com>, =?UTF-8?Q?Jos=c3=a9_Bollo?=
	<jobol@nonadev.net>, wenzong fan <wenzong.fan@windriver.com>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
	<20180104111826.5c8f9036@d-jobol.iot.bzh>
	<1515062493.10775.21.camel@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <0f571a17-21c2-7d3d-96eb-cabf261af289@windriver.com>
Date: Tue, 9 Jan 2018 11:51:00 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515062493.10775.21.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Tue, 09 Jan 2018 17:51:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/4/18 4:41 AM, Patrick Ohly wrote:
> On Thu, 2018-01-04 at 11:18 +0100, José Bollo wrote:
>>> Do you agree to move the patch to Smack specific layer? Such as 
>>> meta-security?
>>
>> I agree.
> 
> Layers like meta-security should not modify recipes from other layers,
> at least not by default. That would violate the "Yocto Compatible 2.0"
> rules.

You can modify (bbappend) to an existing recipe.  You can't change the behavior
(specifically the md5sum) of the function though, unless that new functionality
is enabled.)

This is why we added an 'selinux' distro_feature.  The selinux layer does not
modify behavior (via bbappend) unless selinux distro is enabled.

'smack' should be able to do the same thing, with a similar distro feature.

--Mark

> Besides, it would be harder to maintain in a separate layer - for the
> maintainer of that layer.
> 
> I still think this patch belong into OE-core, even though it is then
> more work for the OE-core maintainer.
> 


