Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9B71A6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 08:14:27 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Xc8rk-0000ZA-Of from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Oct 2014 01:14:28 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.159]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0181.006; Thu, 9 Oct 2014 09:14:26 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] babeltrace: Add missing bison/flex depensencies.
Thread-Index: AQHP2+dwFCHkODSYoESdWeRT1gQbupwnei4w
Date: Thu, 9 Oct 2014 08:14:25 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994E7529E44@EU-MBX-01.mgc.mentorg.com>
References: <1411996493-29494-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1411996493-29494-1-git-send-email-noor_ahsan@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [PATCH] babeltrace: Add missing bison/flex depensencies.
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
X-List-Received-Date: Thu, 09 Oct 2014 08:14:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Any update on this patch?

Noor

-----Original Message-----
From: Noor, Ahsan [mailto:noor_ahsan@mentor.com]=20
Sent: Monday, September 29, 2014 6:15 PM
To: openembedded-core@lists.openembedded.org
Cc: Ahsan, Noor
Subject: [PATCH] babeltrace: Add missing bison/flex depensencies.

From: Noor <noor_ahsan@mentor.com>

* babeltrace do_configure failed due to missing flex/bison
  dependencies.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.2.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb b/meta/recipes-k=
ernel/lttng/babeltrace_1.2.1.bb
index a8ea4cb..dd9961c 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D76ba15dd76a248e1=
dd526bca0e2125fa"
=20
 inherit autotools pkgconfig
=20
-DEPENDS =3D "glib-2.0 util-linux popt"
+DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-native"
=20
 SRCREV =3D "66c2a20b4391fb5c7f870aeb0dde854f0ae1fc79"
 PV =3D "1.2.1+git${SRCPV}"
--=20
1.7.9.5


