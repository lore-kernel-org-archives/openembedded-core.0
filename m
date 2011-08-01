Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QnsjG-0002Ib-U3
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 15:40:22 +0200
Received: by wyg30 with SMTP id 30so1703857wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 06:36:03 -0700 (PDT)
Received: by 10.227.53.210 with SMTP id n18mr6130344wbg.63.1312205762915;
	Mon, 01 Aug 2011 06:36:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gg16sm4185965wbb.34.2011.08.01.06.36.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 06:36:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1312204220.2344.436.camel@rex>
Date: Mon, 1 Aug 2011 15:35:56 +0200
Message-Id: <CB5490B0-1A6A-4DFA-A23B-BDB3EB975B97@dominion.thruhere.net>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<e115e9e68704cb7b327f4f7c215953873f1fdea9.1312182844.git.sgw@linux.intel.com>
	<1312204220.2344.436.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 20/22] arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case
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
X-List-Received-Date: Mon, 01 Aug 2011 13:40:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2011, om 15:10 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
>> From: Koen Kooi <koen@dominion.thruhere.net>
>>=20
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
>> The fix might look like it's in the wrong line, but it's only place =
in the .inc where it works.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/conf/machine/include/arm/arch-armv7a.inc |    4 ++--
>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc =
b/meta/conf/machine/include/arm/arch-armv7a.inc
>> index ce9cee5..6ac2950 100644
>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>> @@ -17,7 +17,7 @@ TUNE_FEATURES_tune-armv7at-neon ?=3D "armv7a vfp =
neon thumb"
>> PACKAGE_EXTRA_ARCHS_tune-armv7a =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a-vfp"
>> PACKAGE_EXTRA_ARCHS_tune-armv7a-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
>> PACKAGE_EXTRA_ARCHS_tune-armv7at =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a-vfp armv7at2-vfp"
>> -PACKAGE_EXTRA_ARCHS_tune-armv7at-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv7at-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a armv7a-vfp-neon =
armv7at2-vfp-neon"
>=20
> Nearly :)
>=20
> You need to add it to the PACKAGE_EXTRA_ARCHS_tune-armv7a and
> PACKAGE_EXTRA_ARCHS_tune-armv7at lines.

I tried adding it to those and it didn't show up in 'bitbake -e'. A new =
try today:

--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -14,9 +14,9 @@ TUNE_FEATURES_tune-armv7a ?=3D "armv7a vfp"
 TUNE_FEATURES_tune-armv7at ?=3D "armv7a vfp thumb"
 TUNE_FEATURES_tune-armv7a-neon ?=3D "armv7a vfp neon"
 TUNE_FEATURES_tune-armv7at-neon ?=3D "armv7a vfp neon thumb"
-PACKAGE_EXTRA_ARCHS_tune-armv7a =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7} =
armv7a-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7a =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7} =
armv7a-vfp testv7a"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7at =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a-vfp armv7at2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7at =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a-vfp armv7at2-vfp testv7at"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a armv7a-vfp-neon =
armv7at2-vfp-neon"

koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ bitbake -e | =
grep testv

PACKAGE_ARCHS=3D"all any noarch arm armv4 armv4t armv5 armv5t armv5-vfp =
armv5t-vfp armv5e armv5te armv5e-vfp armv5te-vfp armv6-vfp armv6t-vfp =
armv7-vfp armv7t2-vfp armv7a-vfp armv7at2-vfp testv7at armv7a =
armv7a-vfp-neon armv7at2-vfp-neon beagleboard"
	ipkgarchs=3D"all any noarch arm armv4 armv4t armv5 armv5t =
armv5-vfp armv5t-vfp armv5e armv5te armv5e-vfp armv5te-vfp armv6-vfp =
armv6t-vfp armv7-vfp armv7t2-vfp armv7a-vfp armv7at2-vfp testv7at armv7a =
armv7a-vfp-neon armv7at2-vfp-neon beagleboard"

So it doesn't work in 'armv7a', but it does work in 'armv7at'. I'll send =
an updated patch.



