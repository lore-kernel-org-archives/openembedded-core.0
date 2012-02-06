Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1RuJP5-00017P-8c; Mon, 06 Feb 2012 08:54:23 +0100
Received: by werc1 with SMTP id c1so4556145wer.6
	for <multiple recipients>; Sun, 05 Feb 2012 23:46:22 -0800 (PST)
Received: by 10.180.90.225 with SMTP id bz1mr11412263wib.5.1328514382146;
	Sun, 05 Feb 2012 23:46:22 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm7295169wib.1.2012.02.05.23.46.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 23:46:21 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
Date: Mon, 6 Feb 2012 08:46:19 +0100
Message-Id: <FA3D8228-A311-4588-90C8-0A12F89723AC@dominion.thruhere.net>
References: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQkTlKhkPRGVZ9KYO/GDZiNSs5M5BTW3fxILcfBPYADj0PFj8rixW2FG359ADPYPMoDscYIn
Cc: openembedded-devel@lists.openembedded.org
Subject: Buildhistory, was Re: do rootfs does not create log files
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
X-List-Received-Date: Mon, 06 Feb 2012 07:54:23 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 5 feb. 2012, om 23:16 heeft Andreas M=FCller het volgende geschreven:

> Hi,
>=20
> is it a bug or a feature that do_rootfs does not create the package
> information (packed_files / packages ..) in a deploy sub-folder did I
> miss a switch for this?

It's this one: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/commit=
/?id=3D370a884b2372b7ddd5f0876119b5f28a2b20074f

The matching commit it missing, but you can add something like this to =
your local.conf:

INHERIT +=3D "buildhistory"
BUILDHISTORY_COMMIT =3D "1"
BUILDHISTORY_DIR =3D "/data/ssd/OE/buildhistory/"

That will create a tree that looks like =
https://github.com/Angstrom-distribution/buildhistory/. It it's missing =
a feature that you were using in testlab, let us know and Paul or I will =
try to add it to buildhistory.

regards,

Koen=


