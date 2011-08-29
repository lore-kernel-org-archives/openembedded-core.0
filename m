Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qy5mk-0006ys-Iv
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 19:38:10 +0200
Received: by wwe32 with SMTP id 32so4770763wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 10:33:14 -0700 (PDT)
Received: by 10.227.28.152 with SMTP id m24mr3981175wbc.31.1314639194453;
	Mon, 29 Aug 2011 10:33:14 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 11sm3921434wbw.9.2011.08.29.10.33.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 10:33:13 -0700 (PDT)
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
In-Reply-To: <CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 29 Aug 2011 19:33:09 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Graeme Gregory <dp@xora.org.uk>, "k-kooi@ti.com" <k-kooi@ti.com>,
	Jason Kridner <jdk@ti.com>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 29 Aug 2011 17:38:10 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 29 aug. 2011 om 17:10 heeft Joel A Fernandes <agnel.joel@gmail.com> het v=
olgende geschreven:

> On Mon, Aug 29, 2011 at 2:58 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>>=20
>> Op 29 aug. 2011, om 08:12 heeft Joel A Fernandes het volgende geschreven:=

>>=20
>>> Script written by Graeme Gregory
>>> http://www.angstrom-distribution.org/demo/beagleboard/mkcard.txt
>>>=20
>>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>>> Cc: Graeme Gregory <dp@xora.org.uk>
>>> Cc: Jason Kridner <jdk@ti.com>
>>> Cc: k-kooi@ti.com
>>> ---
>>> .../mkcard/mkcard-0.5/COPYING.patch                |  344 ++++++++++++++=
++++++
>>> meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt |   79 +++++
>>> meta/recipes-devtools/mkcard/mkcard_0.5.bb         |   19 +
>>> 3 files changed, 442 insertions(+), 0 deletions(-)
>>> create mode 100644 meta/recipes-devtools/mkcard/mkcard-0.5/COPYING.patch=

>>> create mode 100755 meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt
>>> create mode 100644 meta/recipes-devtools/mkcard/mkcard_0.5.bb
>>=20
>> This script is BSP specific and shouldn't live in the OE-core layer.
>=20
> The only issue is this script is used from within the IMAGE_CMD_sdimg
> code which lives in OE-core (meta/classes/image_types.

classes shouldn't be calling external scripts


>=20
> thanks
> Joel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


