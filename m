Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QxD5L-0005pC-6V
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 09:13:43 +0200
Received: by wwe32 with SMTP id 32so3345943wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 00:08:54 -0700 (PDT)
Received: by 10.227.152.132 with SMTP id g4mr1776220wbw.41.1314428933347;
	Sat, 27 Aug 2011 00:08:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fg5sm1899055wbb.6.2011.08.27.00.08.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 27 Aug 2011 00:08:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAD=GYpZ3sMnyrWj0EztVN-MK0tpRYaLF4R1UHPz12bO7b=dOQA@mail.gmail.com>
Date: Sat, 27 Aug 2011 09:08:52 +0200
Message-Id: <6F590F6E-9EAB-4F37-A923-D7736BC43BB1@dominion.thruhere.net>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<1314318504-9524-4-git-send-email-joelagnel@ti.com>
	<abf615e596934df48ad620207828b227@DFLE70.ent.ti.com>
	<CAD=GYpZ3sMnyrWj0EztVN-MK0tpRYaLF4R1UHPz12bO7b=dOQA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH meta-oe 3/9] libmad: Imported from OE-classic
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
X-List-Received-Date: Sat, 27 Aug 2011 07:13:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 aug. 2011, om 06:12 heeft Joel A Fernandes het volgende =
geschreven:

> On Fri, Aug 26, 2011 at 2:59 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende =
geschreven:
>>>=20
>>> diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb =
b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
>>> new file mode 100644
>>> index 0000000..537d685
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
>>> @@ -0,0 +1,34 @@
>>> +DESCRIPTION =3D "MPEG Audio Decoder Library"
>>> +SECTION =3D "libs"
>>> +PRIORITY =3D "optional"
>>=20
>> That field isn't used anymore
>>=20
>>> +DEPENDS =3D "libid3tag"
>>> +LICENSE =3D "GPL"
>>=20
>> Which version?
>=20
> Hi Koen,
>=20
> Isn't it implied that its GPL v1? I've seen several recipes in OE-core
> that did that.

If it's GPLv1 it should say GPLv1. But you should know, since you =
inspected the license files before checksumming them, no?=


