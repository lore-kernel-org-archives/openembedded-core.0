Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1QyKn3-0005t4-N0
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 11:39:29 +0200
Received: from [10.131.0.186] (188-220-38-49.zone11.bethere.co.uk
	[188.220.38.49])
	by slimlogic.co.uk (Postfix) with ESMTPSA id ADB2313001B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 10:34:38 +0100 (BST)
Message-ID: <4E5CAF0A.9080902@slimlogic.co.uk>
Date: Tue, 30 Aug 2011 10:36:10 +0100
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.17) Gecko/20110414 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>	<CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
	<1314696718.5939.305.camel@rex>
In-Reply-To: <1314696718.5939.305.camel@rex>
Subject: Re: [RFC oe-core] mkcard: Add a script to parition and format an SD Card
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
X-List-Received-Date: Tue, 30 Aug 2011 09:39:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 30/08/2011 10:31, Richard Purdie wrote:
> On Mon, 2011-08-29 at 17:03 -0400, Jason Kridner wrote:
>>>>> This script is BSP specific and shouldn't live in the OE-core layer.
>>>> The only issue is this script is used from within the IMAGE_CMD_sdimg
>>>> code which lives in OE-core (meta/classes/image_types.
>>> classes shouldn't be calling external scripts
>>>
>> Is the right approach to add parameters to the IMAGE_CMD_sdimg class
>> such that it can be used generically to produce SD card images,
>> instead of trying to move this to meta-ti?  Should it perhaps be a bit
>> closer to what is being done by the Linaro image tools [1]?
>>
>> [1] https://wiki.linaro.org/Source/ImageBuilding
> I have heard multiple requests for making general SD card (or USB stick)
> style images so I would love to see something generic. The script as it
> stands looks like it has some issues due to requiring root access
> (and/or special mounts).
>
As the author again, its totally unsuitable and was never designed for
doing that.

Graeme



