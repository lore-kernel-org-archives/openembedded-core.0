Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1RuKhs-0003Jo-Jo; Mon, 06 Feb 2012 10:17:55 +0100
Received: by wgbdr13 with SMTP id dr13so5309915wgb.24
	for <multiple recipients>; Mon, 06 Feb 2012 01:09:52 -0800 (PST)
Received: by 10.180.78.233 with SMTP id e9mr11703191wix.0.1328519392036;
	Mon, 06 Feb 2012 01:09:52 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ho4sm23950450wib.3.2012.02.06.01.09.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 01:09:51 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRQ4pvGoiv8DopfhgcujQffqOkPpS2+ON8-ad12GDdfH=w@mail.gmail.com>
Date: Mon, 6 Feb 2012 10:09:49 +0100
Message-Id: <DE571684-E868-4851-913C-0A063031BC6A@dominion.thruhere.net>
References: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
	<FA3D8228-A311-4588-90C8-0A12F89723AC@dominion.thruhere.net>
	<CALbNGRQ4pvGoiv8DopfhgcujQffqOkPpS2+ON8-ad12GDdfH=w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnQ5Az4WdnQK9QqU+Q1J9x1DerzCiFPc6GNRW8cU4HqJ6gPx/xPdLwFAqYo+W/BJLmhIvCr
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Buildhistory, was Re: do rootfs does not create log files
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
X-List-Received-Date: Mon, 06 Feb 2012 09:17:55 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 6 feb. 2012, om 10:04 heeft Andreas M=FCller het volgende geschreven:

> On Mon, Feb 6, 2012 at 8:46 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>=20
>> Op 5 feb. 2012, om 23:16 heeft Andreas M=FCller het volgende =
geschreven:
>>=20
>>> Hi,
>>>=20
>>> is it a bug or a feature that do_rootfs does not create the package
>>> information (packed_files / packages ..) in a deploy sub-folder did =
I
>>> miss a switch for this?
>>=20
>> It's this one: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/commit=
/?id=3D370a884b2372b7ddd5f0876119b5f28a2b20074f
>>=20
>> The matching commit it missing, but you can add something like this =
to your local.conf:
>>=20
>> INHERIT +=3D "buildhistory"
>> BUILDHISTORY_COMMIT =3D "1"
>> BUILDHISTORY_DIR =3D "/data/ssd/OE/buildhistory/"
>>=20
>> That will create a tree that looks like =
https://github.com/Angstrom-distribution/buildhistory/. It it's missing =
a feature that you were using in testlab, let us know and Paul or I will =
try to add it to buildhistory.
>>=20
>> regards,
>>=20
>> Koen
> Thanks for the info - will give buildhistory a test.
>=20
> Without having experience on buildhistory I have a question: As you
> might know there was a discussion about the order of packages in
> bitbake.conf [1]. I have no idea of the workflow for this issue:
>=20
> 1. Enable buildhistory as said above
> 2. Build from scratch
> 3. change the PACKAGES order in bitbake.conf
> 4. ??
>=20
> If I just rebuild without any PR-bumps I assume buildhistory can do
> nothing for me. Correct?

No, buildhistory executes at every do_package step, so it will record =
changes even without PR bumps. Note that OE doesn't sort the RDEPENDS =
fields and friends, so you might see a diff where there is only a =
re-ordering.

regards,

Koen

regards,

Koen=


