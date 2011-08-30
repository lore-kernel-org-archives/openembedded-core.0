Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QyRWe-0003le-G2
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 18:51:00 +0200
Received: by gyg4 with SMTP id 4so5334729gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 09:46:06 -0700 (PDT)
Received: by 10.151.123.5 with SMTP id a5mr6107249ybn.382.1314722764289;
	Tue, 30 Aug 2011 09:46:04 -0700 (PDT)
Received: from mail-gx0-f175.google.com (mail-gx0-f175.google.com
	[209.85.161.175])
	by mx.google.com with ESMTPS id v11sm2492074ybv.0.2011.08.30.09.46.02
	(version=SSLv3 cipher=OTHER); Tue, 30 Aug 2011 09:46:03 -0700 (PDT)
Received: by gxk3 with SMTP id 3so1136868gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 09:46:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.237.9 with SMTP id k9mr6159261ybh.164.1314722762519; Tue,
	30 Aug 2011 09:46:02 -0700 (PDT)
Received: by 10.150.177.4 with HTTP; Tue, 30 Aug 2011 09:46:02 -0700 (PDT)
In-Reply-To: <CAD=GYpaL73siZqSoSChCG2rbXSy7nBsJ6LmujxxmqhqubiFCWQ@mail.gmail.com>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
	<CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
	<CAD=GYpaL73siZqSoSChCG2rbXSy7nBsJ6LmujxxmqhqubiFCWQ@mail.gmail.com>
Date: Tue, 30 Aug 2011 12:46:02 -0400
Message-ID: <CA+T6QPk=XR4M0cVoYn=EdckJxDKifooGv8+_yw+0AXTUQ85pWg@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 30 Aug 2011 16:51:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2011 at 7:08 PM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
> On Mon, Aug 29, 2011 at 4:03 PM, Jason Kridner <jkridner@beagleboard.org>=
 wrote:
>>>>>
>>>>> This script is BSP specific and shouldn't live in the OE-core layer.
>>>>
>>>> The only issue is this script is used from within the IMAGE_CMD_sdimg
>>>> code which lives in OE-core (meta/classes/image_types.
>>>
>>> classes shouldn't be calling external scripts
>>>
>>
>> Is the right approach to add parameters to the IMAGE_CMD_sdimg class
>> such that it can be used generically to produce SD card images,
>> instead of trying to move this to meta-ti? =A0Should it perhaps be a bit
>> closer to what is being done by the Linaro image tools [1]?
>>
>> [1] https://wiki.linaro.org/Source/ImageBuilding
>>
>
> Don't the Linaro scripts need to run on the target?

No.

> Does it fit well
> with OE(-core) ?

I don't know, but I hoped that others would comment to help figure it
out.  I think it is a common challenge not just for ARM architectures.
 I'm not sure if the approach is general enough or not, but it does go
beyond the BeagleBoard.

My primary concerns about leaving it in the BSP are:
1) that there is some room for non-BeagleBoard specific optimizations
to the card layout and
2) there may be improvements to the tools that make it easier to
create images for systems with different boot requirements.

Also, I think we might want to move to an ext3 partition only in the
future or other such layout optimizations.  I'd like that to be
something that can be parameterized by the BSP.

>
> I took lot of pain to write it for OE and its almost done, so suggest
> we use my method atleast for a few days ;-)
>
> Thanks
> Joel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


