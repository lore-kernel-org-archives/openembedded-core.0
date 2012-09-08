Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TALJV-0006wz-Dh
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 15:43:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q88DUgce013003
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Sep 2012 06:30:42 -0700 (PDT)
Received: from msp-dhcp24.wrs.com (172.25.34.24) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Sat, 8 Sep 2012 06:30:41 -0700
Message-ID: <504B4880.5000304@windriver.com>
Date: Sat, 8 Sep 2012 08:30:40 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1347033943.8619.0.camel@ted> <504A21A5.7000309@windriver.com>
	<CAJTo0LYnG1BdZ=UkKPWju7UwBZWjEJhQ_svmO4bVwaSL1ZGGkA@mail.gmail.com>
	<1347037772.8619.24.camel@ted>
	<1347038143.2673.226.camel@phil-desktop>
	<20120908080502.GC3903@sakrah.homelinux.org>
In-Reply-To: <20120908080502.GC3903@sakrah.homelinux.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a distclean when reconfiguring
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
X-List-Received-Date: Sat, 08 Sep 2012 13:43:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/12 3:05 AM, Khem Raj wrote:
> On (07/09/12 18:15), Phil Blundell wrote:
>> On Fri, 2012-09-07 at 18:09 +0100, Richard Purdie wrote:
>>> The key places people get bitten are eglibc and gcc so those should be
>>> straight forward to test, the question is how widely to deploy this
>>> initially. I think the mechanism is good, its now just a question of the
>>> implementation detail.
>>
>> Eglibc and gcc, at least, support building with ${B} != ${S} so it might
>> be easier/quicker to just blow away the whole ${B} tree rather than
>> trying to distclean it.
>
> yeah and I think separating B from S in general has merits in long run

In principal I agree completely, however in practice at least 20-30% of the 
packages I try won't deal w/ the B/S separation properly.

A good optimization is likely when B != S, blow away B and start over... if they 
are the same, the distclean is likely the best approach..

>>
>> I imagine that most modern-ish autotools-based packages will also build
>> fine in that configuration, though there are bound to be some that
>> don't.  It's hard to say whether there are likely to be more or fewer of
>> those than there are ones where "make distclean" fails.
>>
>
> either way there seems to be same amount of uncertainity.
>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



