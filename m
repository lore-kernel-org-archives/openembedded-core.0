Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 858AB7CBE4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 10:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E4F7018324;
	Mon,  6 May 2019 12:28:19 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 8jA0IqiKgJbp; Mon,  6 May 2019 12:28:19 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id F15DB1832D;
	Mon,  6 May 2019 12:28:18 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE6921E077;
	Mon,  6 May 2019 12:28:18 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1ABD1E076;
	Mon,  6 May 2019 12:28:18 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  6 May 2019 12:28:18 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id B4E482ABD;
	Mon,  6 May 2019 12:28:18 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 6 May 2019 12:28:18 +0200
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 6 May 2019 12:28:18 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 6 May 2019 12:28:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jonas Bonn <jonas@norrbonn.se>, Alex Kiernan <alex.kiernan@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [OE-Core][PATCH] systemd: Default to non-stateless
	images
Thread-Index: AQHVAdAvgu2VlQXeoEC6gzcoE2PL1qZdamcAgAB6nVA=
Date: Mon, 6 May 2019 10:28:18 +0000
Message-ID: <a07a16cb88284954a5d1b3774a6b2fcd@XBOX04.axis.com>
References: <20190503164850.130865-1-alex.kiernan@gmail.com>
	<3ddf9772-185b-2f7a-6a27-c8dffaf8bc62@norrbonn.se>
In-Reply-To: <3ddf9772-185b-2f7a-6a27-c8dffaf8bc62@norrbonn.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] systemd: Default to non-stateless images
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
X-List-Received-Date: Mon, 06 May 2019 10:28:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Jonas Bonn
> Sent: den 6 maj 2019 06:54
> To: Alex Kiernan <alex.kiernan@gmail.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [OE-Core][PATCH] systemd: Default to non-
> stateless images
>=20
> Hi Alex,
>=20
> The below is fine and looks good.  The one thing that bothers me about
> this is that "stateless" isn't really a property of the "distro",
> rather
> it's a property of the image/machine.  I suspect, in the same sense
> that
> we have readonly-rootfs, that we should probably have image features
> "stateless-rootfs" (no /etc, no /var) and "volatile-rootfs" (no /var).
>=20
> Furthermore, if you want to boot with 'ro' on the command-line, I
> really
> think you need to build your image with the "readonly-rootfs" feature
> set.  The default should be writable+persistent /etc as that's the
> configuration used 99% of the time (currently).  "readonly-rootfs" does
> a bit more than just creating machine-id but it's all relevant to the
> 'ro' case where /etc isn't writable.
>=20
> Just for clarification:
>=20
> i)  volatile-rootfs:  means there's no point in prepopulating /var
> because it's on a tmpfs and needs to be populated at boot time

This doesn't really say anything about the state of the rootfs outside=20
of /var, i.e., is it writable or read-only?

> ii)  stateless-rootfs:  means there's no point in prepopulating neither
> /etc nor /var because they are on a tmpfs and need to be populated at
> boot time

Same here.

> iii)  readonly-rootfs:  means that /etc is really not writable so it's
> important that: the systemd first-boot stuff needs to be done at build
> time:  machine-id, unit files set up, all tmpfiles.d snippets that
> touch /etc and /var need to be done in advance.
>=20
> /Jonas

Maybe we need some more generic way of describing the intended=20
structure of the image? E.g., what are the expected behavior of=20
/etc, /var and the rest of the rootfs? For each they can typically=20
be "read-only", "persistent" (writable and survives reboots) or=20
"volatile" (writable, but doesn't survive a reboot).

//Peter


