Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QamSD-000467-VZ
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Jun 2011 12:20:38 +0200
Received: by wyg30 with SMTP id 30so708085wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jun 2011 03:16:58 -0700 (PDT)
Received: by 10.216.136.202 with SMTP id w52mr907959wei.68.1309083418753;
	Sun, 26 Jun 2011 03:16:58 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm3279071wbh.29.2011.06.26.03.16.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Jun 2011 03:16:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=_Vn+SqWKy0z9nOqpFV=-D0H48Bw@mail.gmail.com>
Date: Sun, 26 Jun 2011 12:16:51 +0200
Message-Id: <95FEC74D-2042-486D-B446-9C902751D6F3@dominion.thruhere.net>
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com>
	<BANLkTi=_Vn+SqWKy0z9nOqpFV=-D0H48Bw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Sun, 26 Jun 2011 10:20:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jun 2011, om 11:18 heeft Khem Raj het volgende geschreven:

> On Sat, Jun 25, 2011 at 7:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> change the install command like below in gcc-cross-kernel.inc
>>=20
>> install -m 0755 xgcc
>> =
${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gcc-${PV}
>>=20
>>=20
>=20
> here probably
>=20
> install -m 0755 xgcc  ${D}${bindir}/${TARGET_PREFIX}gcc-${PV}
>=20
> is needed instead

Thanks, that gets it into sysroots:

koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy$ find =
../sysroots/ | grep 2007q3
=
../sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross-k=
ernel-4.2.1/arm-angstrom-linux-gnueabi-gcc-4.2.1+csl-arm-2007q3-53

It isn't in PATH yet, but it's progress :)=


