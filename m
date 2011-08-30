Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QyLin-0007R8-Na
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 12:39:09 +0200
Received: by wyf19 with SMTP id 19so4839973wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 03:34:16 -0700 (PDT)
Received: by 10.227.55.67 with SMTP id t3mr4686509wbg.90.1314700456765;
	Tue, 30 Aug 2011 03:34:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fd4sm4503050wbb.47.2011.08.30.03.34.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Aug 2011 03:34:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E5CAF0A.9080902@slimlogic.co.uk>
Date: Tue, 30 Aug 2011 12:34:14 +0200
Message-Id: <AB4EA34E-7407-4BE3-807F-1A2CC867D6BD@dominion.thruhere.net>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>	<CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
	<1314696718.5939.305.camel@rex> <4E5CAF0A.9080902@slimlogic.co.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
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
X-List-Received-Date: Tue, 30 Aug 2011 10:39:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 aug. 2011, om 11:36 heeft Graeme Gregory het volgende geschreven:

> On 30/08/2011 10:31, Richard Purdie wrote:
>> On Mon, 2011-08-29 at 17:03 -0400, Jason Kridner wrote:
>>>>>> This script is BSP specific and shouldn't live in the OE-core =
layer.
>>>>> The only issue is this script is used from within the =
IMAGE_CMD_sdimg
>>>>> code which lives in OE-core (meta/classes/image_types.
>>>> classes shouldn't be calling external scripts
>>>>=20
>>> Is the right approach to add parameters to the IMAGE_CMD_sdimg class
>>> such that it can be used generically to produce SD card images,
>>> instead of trying to move this to meta-ti?  Should it perhaps be a =
bit
>>> closer to what is being done by the Linaro image tools [1]?
>>>=20
>>> [1] https://wiki.linaro.org/Source/ImageBuilding
>> I have heard multiple requests for making general SD card (or USB =
stick)
>> style images so I would love to see something generic. The script as =
it
>> stands looks like it has some issues due to requiring root access
>> (and/or special mounts).
>>=20
> As the author again, its totally unsuitable and was never designed for
> doing that.

To clarify, it deals only with the slightly weird formatting needed by =
the OMAP3/4 boot ROM to get the bootloader from FAT and not with generic =
sd card images.

regards,

Koen=


