Received: from mailout02.rmx.de (mailout02.rmx.de [62.245.148.41])
 by mx.groups.io with SMTP id smtpd.web11.12881.1600939967701314051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 02:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 62.245.148.41, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout02.rmx.de (Postfix) with ESMTPS id 4BxqZm3X9WzNlRw;
	Thu, 24 Sep 2020 11:32:32 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4BxqZj5ZxNz2xfM;
	Thu, 24 Sep 2020 11:32:29 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.110) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 24 Sep
 2020 11:32:29 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, Christian Eggers
	<ceggers@arri.de>
Subject: [PATCH v2] packagegroup: rrecommend perf also for musl on ARM
Date: Thu, 24 Sep 2020 11:32:17 +0200
Message-ID: <20200924093217.8218-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <CAMKF1sqTT==wZ7a_HzzvsETmJeYAzX16E3y+RrnZF_kw92HuMg@mail.gmail.com>
References: <CAMKF1sqTT==wZ7a_HzzvsETmJeYAzX16E3y+RrnZF_kw92HuMg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.110]
X-RMX-ID: 20200924-113229-4BxqZj5ZxNz2xfM-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The perf recipe builds fine for musl on ARM.

Fixes: d758a4445a ("packagegroup: Disable packages not available on musl"=
)
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
On Wednesday, 23 September 2020, 18:38:06 CEST, Khem Raj wrote:
> On Wed, Sep 23, 2020 at 1:46 AM Christian Eggers <ceggers@arri.de> wrot=
e:
> > The perf recipe builds fine for musl.
>=20
> which all architectures did you build on musl ?
only on ARM.

> Regardless of that we should still use PERF var so non-core
> architectures can still override it

 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-prof=
ile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.=
bb
index 1c94653d72..d437e28311 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -28,6 +28,7 @@ PROFILETOOLS =3D "\
     "
 PERF =3D "perf"
 PERF_libc-musl =3D ""
+PERF_libc-musl_arm =3D "perf"
=20
 # systemtap needs elfutils which is not fully buildable on some arches/l=
ibcs
 SYSTEMTAP =3D "systemtap"
--=20
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Traunin=
ger; Markus Zeiler

