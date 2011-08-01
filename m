Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qnt7A-0003EG-C5
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 16:05:04 +0200
Received: by wyg30 with SMTP id 30so1724448wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 07:00:44 -0700 (PDT)
Received: by 10.216.61.203 with SMTP id w53mr523379wec.24.1312207244271;
	Mon, 01 Aug 2011 07:00:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k84sm3353260weq.46.2011.08.01.07.00.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 07:00:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1312206461.2344.457.camel@rex>
Date: Mon, 1 Aug 2011 16:00:39 +0200
Message-Id: <50CF8F6D-804A-4401-8EA3-5F19581E78D2@dominion.thruhere.net>
References: <1312206102-16094-1-git-send-email-koen@dominion.thruhere.net>
	<1312206461.2344.457.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case
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
X-List-Received-Date: Mon, 01 Aug 2011 14:05:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2011, om 15:47 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-08-01 at 15:41 +0200, Koen Kooi wrote:
>> Without this 'armv7a' is used as TUNE_ARCH but does *not* end up in =
PACKAGE_EXTRA_ARCHS:
>>=20
>> arch all 1
>> arch any 6
>> arch noarch 11
>> arch arm 16
>> arch armv4 21
>> arch armv4t 26
>> arch armv5 31
>> arch armv5t 36
>> arch armv5-vfp 41
>> arch armv5t-vfp 46
>> arch armv5e 51
>> arch armv5te 56
>> arch armv5e-vfp 61
>> arch armv5te-vfp 66
>> arch armv6-vfp 71
>> arch armv6t-vfp 76
>> arch armv7-vfp 81
>> arch armv7t2-vfp 86
>> arch armv7a-vfp 91
>> arch armv7at2-vfp 96
>> arch armv7a-vfp-neon 101
>> arch armv7at2-vfp-neon 106
>> arch beagleboard 111
>>=20
>> Which leads to a failing do_rootfs
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/conf/machine/include/arm/arch-armv7a.inc |    4 ++--
>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc =
b/meta/conf/machine/include/arm/arch-armv7a.inc
>> index ce9cee5..704f86b 100644
>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>> @@ -14,9 +14,9 @@ TUNE_FEATURES_tune-armv7a ?=3D "armv7a vfp"
>> TUNE_FEATURES_tune-armv7at ?=3D "armv7a vfp thumb"
>> TUNE_FEATURES_tune-armv7a-neon ?=3D "armv7a vfp neon"
>> TUNE_FEATURES_tune-armv7at-neon ?=3D "armv7a vfp neon thumb"
>> -PACKAGE_EXTRA_ARCHS_tune-armv7a =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv7a =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a armv7a-vfp"
>> PACKAGE_EXTRA_ARCHS_tune-armv7a-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
>> -PACKAGE_EXTRA_ARCHS_tune-armv7at =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a-vfp armv7at2-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv7at =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a armv7a-vfp armv7at2-vfp"
>> PACKAGE_EXTRA_ARCHS_tune-armv7at-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
>=20
> I didn't spell it out but you still need the b versions too for the
> equivalent lines ;-)

Actually, no :) There only is a little endian compat mapping in =
base.bbclass, so it only makes sense to fix that one. There are no BE =
v7as in classic OE or in any layer google.com knows about, so let's =
leave that out.=


