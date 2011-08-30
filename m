Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QyIaV-0001pJ-57
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 09:18:23 +0200
Received: by wwe32 with SMTP id 32so5196005wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 00:13:30 -0700 (PDT)
Received: by 10.216.203.79 with SMTP id e57mr436589weo.42.1314688410157;
	Tue, 30 Aug 2011 00:13:30 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id q19sm833873wec.42.2011.08.30.00.13.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Aug 2011 00:13:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAD=GYpaL73siZqSoSChCG2rbXSy7nBsJ6LmujxxmqhqubiFCWQ@mail.gmail.com>
Date: Tue, 30 Aug 2011 09:13:25 +0200
Message-Id: <C6123C3E-8A31-4E18-85E1-99007B0DD3A8@dominion.thruhere.net>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
	<CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
	<CAD=GYpaL73siZqSoSChCG2rbXSy7nBsJ6LmujxxmqhqubiFCWQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 30 Aug 2011 07:18:23 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 30 aug. 2011, om 01:08 heeft Joel A Fernandes het volgende =
geschreven:

> On Mon, Aug 29, 2011 at 4:03 PM, Jason Kridner =
<jkridner@beagleboard.org> wrote:
>>>>>=20
>>>>> This script is BSP specific and shouldn't live in the OE-core =
layer.
>>>>=20
>>>> The only issue is this script is used from within the =
IMAGE_CMD_sdimg
>>>> code which lives in OE-core (meta/classes/image_types.
>>>=20
>>> classes shouldn't be calling external scripts
>>>=20
>>=20
>> Is the right approach to add parameters to the IMAGE_CMD_sdimg class
>> such that it can be used generically to produce SD card images,
>> instead of trying to move this to meta-ti?  Should it perhaps be a =
bit
>> closer to what is being done by the Linaro image tools [1]?
>>=20
>> [1] https://wiki.linaro.org/Source/ImageBuilding
>>=20
>=20
> Don't the Linaro scripts need to run on the target? Does it fit well
> with OE(-core) ?
>=20
> I took lot of pain to write it for OE and its almost done, so suggest
> we use my method atleast for a few days ;-)

I'm immune to the "but I spent a lot of time on this" type of arguments=


