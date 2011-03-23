Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Q2Xxp-0002iz-5H
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 00:59:45 +0100
Received: (qmail 20442 invoked by uid 1003); 23 Mar 2011 23:57:52 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.162.57)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	23 Mar 2011 23:57:52 -0000
Message-ID: <4D8A88FF.8070600@balister.org>
Date: Wed, 23 Mar 2011 19:57:51 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>	<20110323154018.GI2224@xora-desktop.xora.org.uk>	<1300896184.3488.17.camel@scimitar>	<20110323175229.GN2224@xora-desktop.xora.org.uk>	<1300921337.3018.45.camel@rex>
	<20110323235316.GQ2224@xora-desktop.xora.org.uk>
In-Reply-To: <20110323235316.GQ2224@xora-desktop.xora.org.uk>
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Wed, 23 Mar 2011 23:59:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2011 07:53 PM, Graeme Gregory wrote:
> On Wed, Mar 23, 2011 at 11:02:17PM +0000, Richard Purdie wrote:
>> On Wed, 2011-03-23 at 17:52 +0000, Graeme Gregory wrote:
>>> On Wed, Mar 23, 2011 at 04:03:04PM +0000, Joshua Lock wrote:
>>>> On Wed, 2011-03-23 at 15:40 +0000, Graeme Gregory wrote:
>>>>> On Wed, Mar 23, 2011 at 08:19:31AM -0700, Khem Raj wrote:
>>>>>> On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> I'd like to import the EFL recipes Martin did from meta-shr into the meta-openembedded repo. Before I go bothering Martin about it, what would be the best place to put them?
>>>>>>>
>>>>>>> Inside meta-oe:
>>>>>>>
>>>>>>> meta-openembedded/
>>>>>>>         meta-oe/
>>>>>>>                 recipes-efl
>>>>>>
>>>>>> Can efl we layered directly on top of oe-core  ? i.e. without needing meta-oe
>>>>>> in that case its better to be an independent layer. otherwise I would say put
>>>>>> them under recipes-efl
>>>>>>
>>>>> That is certainly not how I see layers being built up. I am expecting
>>>>> in future us to have things like.
>>>>>
>>>>> meta-gnome
>>>>> meta-kde
>>>>> meta-efl
>>>>> meta-lxde
>>>>> meta-xorg
>>>>
>>>> Me too, in fact I think this image from the Yocto Project website
>>>> succinctly portrays the goal:
>>>> http://www.yoctoproject.org/sites/default/files/yocto-layers_1.png
>>>>
>>>> Possibly less the meta-yocto but you get the point.
>>>>
>>> I hope not as thats a truly horrible diagram.
>>>
>>> I dont think there is anyway in modern linux to produce a nice neat stack
>>> like that. Once you move beyond trivial images.
>>
>> The diagram is idealised but I think the concepts there are valid, for
>> example, bring in the meta-linaro layer to use the linaro toolchain,
>> bring in a BSP layer for a particular piece of hardware support and so
>> forth. Certainly, a developer is likely to have local tweaks in a layer
>> of their own on top.
>>
>> Why wouldn't that work?
>>
> The diagram demonstrates a nice stack, but what about if you want two
> gui layers. Real life example, gnome and kde have cross dependencies on
> each other.
>
> In a real system you just cant pile up a nice little stack of components. It
> works more like lego where you have multiple components that fit together
> depending on multiple components to hold them up.
>
> The diagram is overly idealised to the point of zero information, fit for
> marketing but not engineering.

At the risk of being blunt, anytime I see a figure that looks that neat, 
my bs detector goes off.

Graeme managed to say that much better than I did.

Philip


