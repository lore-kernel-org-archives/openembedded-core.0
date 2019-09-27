Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 909187F22D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 01:19:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8R1JWtB023446
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Sep 2019 18:19:32 -0700 (PDT)
Received: from [128.224.20.140] (128.224.20.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 26 Sep 2019 18:19:32 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	<ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
References: <20190923180109.15157-1-Trevor.Gamblin@windriver.com>
	<47210e81-33a4-4f87-c258-e7b63b71482e@intel.com>
	<7ffb41b488386caef3c4de5178369beea8f189a0.camel@linuxfoundation.org>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <a83e7507-5bb0-2904-3045-378b17cc9a37@windriver.com>
Date: Thu, 26 Sep 2019 21:19:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7ffb41b488386caef3c4de5178369beea8f189a0.camel@linuxfoundation.org>
Subject: Re: [PATCH] lighttpd: remove fam as a PACKAGECONFIG option
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
X-List-Received-Date: Fri, 27 Sep 2019 01:19:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/26/19 4:33 PM, Richard Purdie wrote:
> On Mon, 2019-09-23 at 21:16 +0100, Ross Burton wrote:
>> On 23/09/2019 19:01, Trevor Gamblin wrote:
>>> From: Trevor Gamblin<trevor.gamblin@windriver.com>
>>>
>>> lighttpd builds fail if "fam" (and therefore gamin) is enabled.
>>>
>>> In conf/local.conf:
>>>
>>>       CORE_IMAGE_EXTRA_INSTALL += "lighttpd"
>>>       PACKAGECONFIG_append_pn-lighttpd = " fam"
>>>
>>> bitbake error:
>>>
>>>       ERROR: Nothing PROVIDES 'gamin' (but /yow-lpggp31/tgamblin/oe-
>>> core.git/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb DEPENDS
>>> on or otherwise requires it)
>>>       NOTE: Runtime target 'lighttpd' is unbuildable, removing...
>>>       Missing or unbuildable dependency chain was: ['lighttpd',
>>> 'gamin']
>>>       ERROR: Required build target 'core-image-minimal' has no
>>> buildable providers.
>>>       Missing or unbuildable dependency chain was: ['core-image-
>>> minimal', 'lighttpd', 'gamin']
>>>
>>> Since gamin doesn't appear to have a recipe and hasn't been
>>> maintained for several years, this should be removed from the
>>> list of lighttpd PACKAGECONFIG options.
>> Non-default PACKAGECONFIGs are allowed to depend on recipes that are
>> not
>> in core, plenty of recipes do this.  Otherwise there'd be no way to
>> turn
>> on options that have dependencies in other layers.
>>
>> However, the fact that Gamin is very much dead is a good reason to
>> remove the PACKAGECONFIG and simply hardcode --without-fam for good
>> measure.
> Agreed, can we have a v2 with --without-fam hardcoded in EXTRA_OECONF
> please?
>
> Cheers,
>
> Richard
>
Done!

