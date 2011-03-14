Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzCEb-000481-67
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 19:11:13 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PzCCy-000712-Gv from Tom_Rini@mentor.com ;
	Mon, 14 Mar 2011 11:09:32 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Mar 2011 11:09:21 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 14 Mar 2011 11:09:31 -0700
Message-ID: <4D7E59CD.8090507@mentor.com>
Date: Mon, 14 Mar 2011 11:09:17 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
	<1299958038-25216-6-git-send-email-otavio@ossystems.com.br>
	<AANLkTimiahf+8xJ_nNePkXzB3Lhton2+5JqquPmruN24@mail.gmail.com>
	<EC0F161F-7C09-42FD-929D-67914A54AC25@dominion.thruhere.net>
	<4D7E4660.5050808@mentor.com>
	<AANLkTik7cEA=Yw7fwkEbvOUeV28YseMjpexnBfQuM-jT@mail.gmail.com>
In-Reply-To: <AANLkTik7cEA=Yw7fwkEbvOUeV28YseMjpexnBfQuM-jT@mail.gmail.com>
X-OriginalArrivalTime: 14 Mar 2011 18:09:21.0474 (UTC)
	FILETIME=[F16C3220:01CBE272]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Mon, 14 Mar 2011 18:11:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2011 11:00 AM, Khem Raj wrote:
> On Mon, Mar 14, 2011 at 9:46 AM, Tom Rini<tom_rini@mentor.com>  wrote:
>> On 03/12/2011 03:03 PM, Koen Kooi wrote:
>>>
>>> Op 12 mrt 2011, om 21:21 heeft Otavio Salvador het volgende geschreven:
>>>
>>>> On Sat, Mar 12, 2011 at 16:27, Otavio Salvador<otavio@ossystems.com.br>
>>>>   wrote:
>>>> ...
>>>>>
>>>>> -PACKAGES =+ "libudev libgudev udev-utils"
>>>>> +PACKAGES =+ "libudev libgudev udev-utils udev-consolekit"
>>>>
>>>> ...
>>>>
>>>> Koen, can you take a look on this change?
>>>>
>>>> It seems Angstrom is the only used of this version and seems better to
>>>> not provide support for consolekit by default so adding it as
>>>> recommends or suggests seems wrong to me.
>>>
>>> If someone can quickly explain me what it does then we can see what needs
>>> to get changed. Without having looked into it I think adding
>>> RRECOMMENDS_${PN} += "udev-consolekit" to the consolekit recipe should fix
>>> most possible breakage.
>>>
>>> Adding oe-core to CC:
>>>
>>> What are the plans in oe-core for udev? There currently is a recipe
>>> overlayed in meta-oe because I haven't had time to look into the differences
>>> between the oe-dev and oe-core version. If we're going to touch udev we
>>> might as well do it properly :)
>>
>> Not sure off hand yet, but udev is one of the things we might need to keep a
>> few versions around of, depending on how far back we want to support kernels
>> out of the box.
>
> I would think this should be recommended into BSP layers then

I wouldn't since we don't want every BSP to have to "re-invent" the udev 
wheel.  And there's other bits of userspace where there's a relationship 
between the kernel version (the whole kernel headers version and iirc 
hipox machines thread on oe-devel).

I'm not saying we need to keep every version of udev either, I'm just 
saying we know where there's cutoff points and we should have correct 
and maintained udev versions in the core.

-- 
Tom Rini
Mentor Graphics Corporation


