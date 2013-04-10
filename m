Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UQ1CY-00031x-Am
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 22:01:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3AJhdrM000522
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 12:43:39 -0700 (PDT)
Received: from msp-dhcp59.wrs.com (172.25.34.59) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Apr 2013 12:43:39 -0700
Message-ID: <5165C0E7.8030203@windriver.com>
Date: Wed, 10 Apr 2013 14:43:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
	<20130409174646.GD2474@jama>
	<C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
	<20130409190616.GE2474@jama>
	<929FF6AF-2956-41F0-92E5-E08C5C966909@dominion.thruhere.net>
	<CAHUNapRiB5a6XPwSC_geg+QML4raP2LHHfDCUe__U0hc=WDRSA@mail.gmail.com>
	<5165AB03.8020404@gmail.com> <20130410193611.GF2471@jama>
In-Reply-To: <20130410193611.GF2471@jama>
Subject: Re: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 20:01:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/13 2:36 PM, Martin Jansa wrote:
> On Wed, Apr 10, 2013 at 08:10:11PM +0200, Marco wrote:
>> Il 10/04/2013 18:56, Trevor Woerner ha scritto:
>>> This whole thread has me thoroughly confused. Isn't xterm_277.bb
>>> <http://xterm_277.bb> already part of meta-openembedded?
>>>
>>> $ find . -name "*xterm*" -print
>>> ./meta-openembedded/meta-oe/recipes-graphics/xorg-app/xterm_277.bb
>>> <http://xterm_277.bb>
>>>
>>> And from what I can tell, it was added over a year ago by Koen:
>>>
>>> $ git log meta-oe/recipes-graphics/xorg-app/xterm_277.bb
>>> <http://xterm_277.bb>
>>> commit a38efd953c0bfef80fd6819c8339c1d1e79364b3
>>> Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org
>>> <mailto:marcin.juszkiewicz@linaro.org>>
>>> Date:   Thu Dec 13 10:35:26 2012 +0000
>>>
>>>       xterm: added gnu-configize for AArch64 support
>>>       Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org
>>> <mailto:marcin.juszkiewicz@linaro.org>>
>>>       Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com
>>> <mailto:Martin.Jansa@gmail.com>>
>>>
>>> commit 253b1d7bc35c5a2a12dd6a7f2f0c034a34bfae18
>>> Author: Koen Kooi <koen@dominion.thruhere.net
>>> <mailto:koen@dominion.thruhere.net>>
>>> Date:   Fri Jan 13 09:41:51 2012 +0100
>>>
>>>       xterm: update to 277
>>>       License checksum changed due to date changes
>>>       Signed-off-by: Koen Kooi <koen@dominion.thruhere.net
>>> <mailto:koen@dominion.thruhere.net>>
>>>
>>>
>>
>> Yes, it is copied from meta-openembedded into oe-core
>
> Then you should fix commit message too
>
>   * Recipe taken from oe-classic
>
> In all recipes you sent to oe-core.

See: http://openembedded.org/wiki/Commit_Patch_Message_Guidelines

Specifically the Example: Importing fro Elsewhere Unmodified (and modified)

It's a good idea to list where it came from the commit.. that way if the 
original location is ever changed, people can track what changes may need to be 
merged in.

--Mark

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



