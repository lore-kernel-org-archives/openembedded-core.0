Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC01170281
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 22:07:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7TM7OqY015847
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 15:07:24 -0700 (PDT)
Received: from msp-dhcp13.wrs.com (172.25.34.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 15:07:24 -0700
Message-ID: <5400F99B.8080908@windriver.com>
Date: Fri, 29 Aug 2014 17:07:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1409333994.29296.196.camel@ted>	 <5400C89C.6070901@windriver.com>
	<1409349076.29296.200.camel@ted>
In-Reply-To: <1409349076.29296.200.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_rpm: Add %manifest support for spec generation.
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
X-List-Received-Date: Fri, 29 Aug 2014 22:07:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/14, 4:51 PM, Richard Purdie wrote:
> On Fri, 2014-08-29 at 13:38 -0500, Mark Hatle wrote:
>> On 8/29/14, 12:39 PM, Richard Purdie wrote:
>>> From: Ronan Le Martret <ronan@fridu.net>
>>>
>>> The manifest file allow custom smack security for a package.
>>>       https://wiki.tizen.org/wiki/Security/Application_installation_and_Manifest
>>
>> I'm concerned with this simply because we're adding a very specific (non-oe)
>> mechanism into the mix.
>>
>> I'd prefer if there was simple a "perform this generic action, which can add to
>> the .spec file"
>>
>> The during the packaging (before writing the .spec) we can call the action and
>> it can insert the %manifest if appropriate.
>>
>> That can then be distribution defined and work with any arbitrary mechanisms.
>
> The rough plan forming in my (and other people's) minds is that we need
> a proper python "spec" construction class.
>
> If we had such a thing, customisations like this would be much easier,
> we could also likely more easily reconcile some of the archiver srpm
> pieces too.
>
> Right now we don't have that, there are people needing to fork the whole
> of package_rpm to add the few tweaks I've posted. I'm therefore minded
> to make things easier. If/as or more like when we implement the class,
> this kind of issue should go away.

I was thinking of a simple interface where you'd just call an external function 
(python) based on a variable set by the distro.

It would be passed the various pieces of the spec file, preamble, individual 
sections and the files..  that way the necessary pieces can be manipulated -- 
the call would be made -after- all of the regular processing occurs.

As for a custom class, we can certainly do that.. perhaps it's something to plan 
for 1.8?  We already have much of the processing setup and broken into the 
constituent pieces..  we just don't have a way to extend it before being written.

--Mark

> Cheers,
>
> Richard
>
>
>


