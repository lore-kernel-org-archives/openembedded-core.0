Return-Path: <aaron.chun.yew.chan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CD88B7F092
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 07:06:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 00:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,302,1559545200"; d="scan'208";a="169844157"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
	by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2019 00:06:46 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.4]) by
	PGSMSX111.gar.corp.intel.com ([169.254.2.22]) with mapi id
	14.03.0439.000; Wed, 24 Jul 2019 15:06:45 +0800
From: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core][PATCH] python3-dbus: Add native and native-sdk support
Thread-Index: AdVB7li+r4S6JJISS6OWSejy4Yn+5A==
Date: Wed, 24 Jul 2019 07:06:44 +0000
Message-ID: <AA9B40170ABA1047B45E714CB2B866B706BC13BE@PGSMSX103.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzFlMmE1ZjItZWY2Zi00YmI1LWJiOTktY2UzMjVhYmE3OTE0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYkNMdkt3cHZmbUx3eDFiRlwvaWdBWHZRMDllTXlYSTlCRjZNcDJndnNVYXFzaWwwK1VUT0Q5bnJYcjlHN0t0RisifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: [PATCH] python3-dbus: Add native and native-sdk support
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
X-List-Received-Date: Wed, 24 Jul 2019 07:06:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Chan, Aaron Chun Yew=20
Sent: Wednesday, July 24, 2019 3:02 PM
To: openembedded-core@lists.openembedded.org
Cc: Chan, Aaron Chun Yew <aaron.chun.yew.chan@intel.com>
Subject: [meta-oe][PATCH] python3-dbus: Add native and native-sdk support

From: Aaron Chan <aaron.chun.yew.chan@intel.com>

Signed-off-by: Aaron Chan <aaron.chun.yew.chan@intel.com>
---
 meta/recipes-devtools/python/python3-dbus_1.2.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.8.bb b/meta/reci=
pes-devtools/python/python3-dbus_1.2.8.bb
index 923da3c..2fb1eae 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
@@ -22,3 +22,5 @@ EXTRA_OECONF +=3D "--disable-documentation"
 RDEPENDS_${PN} =3D "python3-io python3-logging python3-stringold python3-t=
hreading python3-xml"
=20
 FILES_${PN}-dev +=3D "${libdir}/pkgconfig"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.7.4


