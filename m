Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SAYkV-0001UV-Rl
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 04:31:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2M3Mi7b017000
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 20:22:44 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 21 Mar 2012 20:22:44 -0700
Message-ID: <4F6A9B02.7090201@windriver.com>
Date: Thu, 22 Mar 2012 11:22:42 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<1332361627.9740.180.camel@ted>
In-Reply-To: <1332361627.9740.180.camel@ted>
Subject: Re: [PATCH] giflib: Move to OE-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 03:31:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/22/2012 04:27 AM, Richard Purdie wrote:
> On Wed, 2012-03-21 at 21:14 +0100, Koen Kooi wrote:
>> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
>>
>>> On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
>>>> * This move will allow the testing of meta-kde for users without meta-openembedded.
>>>>
>>> So what other layers are using giflib?
>>>
>>> Your suggesting that we need to have it in oe-core so people don't need to add the meta-openembedded layer when using meta-kde?
>>>
>>> I am just trying to get more data before making a decision.
>>
>> Let's put everything in oe-core!
>
> Let's try and be constructive ;-).
>
> I think to make a good decision about this we need to understand which
> layers use giflib.
>
> Is this really the only component from meta-oe that meta-kde needs? If

Yes, as far as we know, this is the only component from meta-oe that
meta-kde needs.

// Robert

> it is, I think the request is certainly worth thinking about as we do
> want to try and minimise and untangle the dependency spider web if we
> can.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


