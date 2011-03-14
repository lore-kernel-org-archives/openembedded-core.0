Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzAwM-0001r2-A4
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 17:48:18 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PzAuk-0003oH-Sr from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 09:46:38 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Mar 2011 09:46:27 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Mon, 14 Mar 2011 09:46:38 -0700
Message-ID: <4D7E4660.5050808@mentor.com>
Date: Mon, 14 Mar 2011 09:46:24 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>	<1299958038-25216-6-git-send-email-otavio@ossystems.com.br>	<AANLkTimiahf+8xJ_nNePkXzB3Lhton2+5JqquPmruN24@mail.gmail.com>
	<EC0F161F-7C09-42FD-929D-67914A54AC25@dominion.thruhere.net>
In-Reply-To: <EC0F161F-7C09-42FD-929D-67914A54AC25@dominion.thruhere.net>
X-OriginalArrivalTime: 14 Mar 2011 16:46:27.0974 (UTC)
	FILETIME=[5CFC5260:01CBE267]
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
X-List-Received-Date: Mon, 14 Mar 2011 16:48:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2011 03:03 PM, Koen Kooi wrote:
>
> Op 12 mrt 2011, om 21:21 heeft Otavio Salvador het volgende geschreven:
>
>> On Sat, Mar 12, 2011 at 16:27, Otavio Salvador<otavio@ossystems.com.br>  wrote:
>> ...
>>> -PACKAGES =+ "libudev libgudev udev-utils"
>>> +PACKAGES =+ "libudev libgudev udev-utils udev-consolekit"
>> ...
>>
>> Koen, can you take a look on this change?
>>
>> It seems Angstrom is the only used of this version and seems better to
>> not provide support for consolekit by default so adding it as
>> recommends or suggests seems wrong to me.
>
> If someone can quickly explain me what it does then we can see what needs to get changed. Without having looked into it I think adding RRECOMMENDS_${PN} += "udev-consolekit" to the consolekit recipe should fix most possible breakage.
>
> Adding oe-core to CC:
>
> What are the plans in oe-core for udev? There currently is a recipe overlayed in meta-oe because I haven't had time to look into the differences between the oe-dev and oe-core version. If we're going to touch udev we might as well do it properly :)

Not sure off hand yet, but udev is one of the things we might need to 
keep a few versions around of, depending on how far back we want to 
support kernels out of the box.

-- 
Tom Rini
Mentor Graphics Corporation


