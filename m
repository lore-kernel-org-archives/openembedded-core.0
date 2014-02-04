Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F39116E8C8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 07:48:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Feb 2014 23:48:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,777,1384329600"; d="scan'208";a="469509554"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2014 23:48:13 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.202]) by
	IRSMSX101.ger.corp.intel.com ([163.33.3.153]) with mapi id
	14.03.0123.003; Tue, 4 Feb 2014 07:47:17 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Laszlo Papp <lpapp@kde.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] Putting fltk into oe-core (recipes-graphics)
Thread-Index: AQHPHeuVl78Fa9bX9EWEP9b3Z4VP/pqgHM0AgAOaWwCAAQJV4A==
Date: Tue, 4 Feb 2014 07:47:17 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CFC973@IRSMSX105.ger.corp.intel.com>
References: <CAOMwXhPNi357C8BvFjvVYtQUDepu5VK-c1phR=5UseZg79uJ6Q@mail.gmail.com>
	<CAOMwXhOH0m9PNL10c6gBNhCK+iMoiVtujX1_N3i2KaBAYBgFeQ@mail.gmail.com>
	<1391245344.28575.19.camel@ted>
	<CAOMwXhPwZyCbb3KR-_YZdqRfTaTcnwCazMYAqi1Vch7CeNqWuw@mail.gmail.com>
In-Reply-To: <CAOMwXhPwZyCbb3KR-_YZdqRfTaTcnwCazMYAqi1Vch7CeNqWuw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Putting fltk into oe-core (recipes-graphics)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Feb 2014 07:48:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Laszlo,

Maybe adding more information will make the case for it.
For example, the fact that is used in a lot of OSS.

A very good demo of the possibilities of FLTK is Giada, "A Hardcore Loop Ma=
chine"
http://www.giadamusic.com/

In my opinion, it is one of the best looking apps written using FLTK for th=
e graphical interface.
Also, judging from the screenshots, I think it should be interesting to use=
 it with a touch interface.
However, I don't have any info regarding how well FLTK behaves in this aspe=
ct.
Example screenshot: http://www.giadamusic.com/screenshot-09

Also, while Giada looks complex and with a lot of functionality built-in, t=
he source code seems neat and tidy, which might be an argument regarding th=
e fitness of FLTK in the embedded space.
Giada's authors takes pride of the facts that the source code contains arou=
nd 100 files and has around 30KLoC.

Now, in my opinion, what is a little bit "strange" regarding FLTK is that i=
t doesn't "fit in", because it doesn't have a native look'n'feel on any of =
the supported platforms.
But that's not really an issue in an embedded device, where FLTK might powe=
r up the only GUI needed for that particular device.

Regards,
Cristian Iorga
YP
Intel

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Laszlo Papp
Sent: Monday, February 3, 2014 6:04 PM
To: Richard Purdie
Cc: openembedded-core
Subject: Re: [OE-core] Putting fltk into oe-core (recipes-graphics)

On Sat, Feb 1, 2014 at 9:02 AM, Richard Purdie <richard.purdie@linuxfoundat=
ion.org> wrote:
> On Thu, 2014-01-30 at 18:46 +0000, Laszlo Papp wrote:
>> Ping?
>>
>> I asked this a bit more than five months ago. Shall I take it as "No"?
>
> The lack of responses does indicate that its not something there is=20
> strong support for so I don't think fltk will be moving, correct.

Currently, I do not see any minimal gui library in openembedded core for bu=
ilding some simple GUI on real embedded devices, but OK.
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

