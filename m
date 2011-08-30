Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QySU9-0005Fu-4I
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 19:52:29 +0200
Received: by wyf19 with SMTP id 19so5207281wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 10:47:35 -0700 (PDT)
Received: by 10.216.137.88 with SMTP id x66mr4880804wei.101.1314726455311;
	Tue, 30 Aug 2011 10:47:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c57sm3770566wed.35.2011.08.30.10.47.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Aug 2011 10:47:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA+T6QPk=XR4M0cVoYn=EdckJxDKifooGv8+_yw+0AXTUQ85pWg@mail.gmail.com>
Date: Tue, 30 Aug 2011 19:47:32 +0200
Message-Id: <8954E4C1-E43C-46BE-91AB-6DAFF38D2A4A@dominion.thruhere.net>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
	<CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
	<CAD=GYpaL73siZqSoSChCG2rbXSy7nBsJ6LmujxxmqhqubiFCWQ@mail.gmail.com>
	<CA+T6QPk=XR4M0cVoYn=EdckJxDKifooGv8+_yw+0AXTUQ85pWg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: "Kridner, Jason" <jdk@ti.com>
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
X-List-Received-Date: Tue, 30 Aug 2011 17:52:29 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 30 aug. 2011, om 18:46 heeft Jason Kridner het volgende geschreven:

> On Mon, Aug 29, 2011 at 7:08 PM, Joel A Fernandes =
<agnel.joel@gmail.com> wrote:
>> On Mon, Aug 29, 2011 at 4:03 PM, Jason Kridner =
<jkridner@beagleboard.org> wrote:
>>>>>>=20
>>>>>> This script is BSP specific and shouldn't live in the OE-core =
layer.
>>>>>=20
>>>>> The only issue is this script is used from within the =
IMAGE_CMD_sdimg
>>>>> code which lives in OE-core (meta/classes/image_types.
>>>>=20
>>>> classes shouldn't be calling external scripts
>>>>=20
>>>=20
>>> Is the right approach to add parameters to the IMAGE_CMD_sdimg class
>>> such that it can be used generically to produce SD card images,
>>> instead of trying to move this to meta-ti?  Should it perhaps be a =
bit
>>> closer to what is being done by the Linaro image tools [1]?
>>>=20
>>> [1] https://wiki.linaro.org/Source/ImageBuilding
>>>=20
>>=20
>> Don't the Linaro scripts need to run on the target?
>=20
> No.
>=20
>> Does it fit well
>> with OE(-core) ?
>=20
> I don't know, but I hoped that others would comment to help figure it
> out.  I think it is a common challenge not just for ARM architectures.
> I'm not sure if the approach is general enough or not, but it does go
> beyond the BeagleBoard.
>=20
> My primary concerns about leaving it in the BSP are:
> 1) that there is some room for non-BeagleBoard specific optimizations
> to the card layout and
> 2) there may be improvements to the tools that make it easier to
> create images for systems with different boot requirements.
>=20
> Also, I think we might want to move to an ext3 partition only in the
> future or other such layout optimizations.  I'd like that to be
> something that can be parameterized by the BSP.

I think you're missing the point:

The *script* needs to go into the BSP, you are free to extend the =
bbclasses with code to deal with sd cards internally in OE-core.


>=20
>>=20
>> I took lot of pain to write it for OE and its almost done, so suggest
>> we use my method atleast for a few days ;-)
>>=20
>> Thanks
>> Joel
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



