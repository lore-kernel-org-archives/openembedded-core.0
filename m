Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 062AA60778
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 01:41:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Nov 2018 17:41:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,493,1534834800"; d="scan'208";a="107243436"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
	by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2018 17:41:53 -0800
Received: from kmsmsx155.gar.corp.intel.com ([169.254.15.19]) by
	PGSMSX111.gar.corp.intel.com ([169.254.2.208]) with mapi id
	14.03.0415.000; Mon, 12 Nov 2018 09:41:52 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 01/12] build-appliance: Drop test which is
	already	automated
Thread-Index: AQHUeDig1wikiz6h+06OayQK/VaC5KVLX7jw
Date: Mon, 12 Nov 2018 01:41:52 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D0434811E1D4@KMSMSX155.gar.corp.intel.com>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTIyZjgyZDctZDIyZS00YTQzLTk0NzMtMjA1NDg2NWQ3OTYwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVHNVbnlHd2dkZDUxaHoyXC9CT1FYcGVvcFNLc3dJeitlQU5mQjhTQTRVRVBvOTdGZVwvVU50eExHQU5SaWo3ZWJSIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 01/12] build-appliance: Drop test which is already	automated
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
X-List-Received-Date: Mon, 12 Nov 2018 01:41:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I realize the execution action inside "build-appliance.build-appliance.Bitb=
ake_build-appliance-image" was not complete. Actually this particular test =
was testing that using build-appliance-image and vmware, one can bitbake bu=
ild-applianc-image. This was different compare the automated tests inside A=
B where it test that bitbake can build-appliance-image.=20

The correct steps for "build-appliance.build-appliance.Bitbake_build-applia=
nce-image" shall be below. Allow us to submit a patch to add the missing de=
tail for this test.=20

Steps to Reproduce :
1. Get build appliance image from following link
https://autobuilder.yocto.io/pub/releases/yocto-2.6.rc1/build-appliance/Yoc=
to_Build_Appliance.zip

2. boot the build appliance image in vmware.

3. Set MACHINE to qemux86 and add the following line to conf/local.conf :
SRCREV_pn-build-appliance-image =3D "$

{AUTOREV}
"
4. Run "bitbake build-appliance-image"

I am sorry for the confusion it created.

Best regards,
Yeoh Ee Peng=20

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
Sent: Friday, November 9, 2018 10:29 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 01/12] build-appliance: Drop test which is alread=
y automated

The nightly-build-appliance target already tests this particular build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/manual/build-appliance.json | 26 -----------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/lib/oeqa/manual/build-appliance.json b/meta/lib/oeqa/manu=
al/build-appliance.json
index b8f89275d08..70f8c72c9bb 100644
--- a/meta/lib/oeqa/manual/build-appliance.json
+++ b/meta/lib/oeqa/manual/build-appliance.json
@@ -1,30 +1,4 @@
 [
-    {
-        "test": {
-            "@alias": "build-appliance.build-appliance.Bitbake_build-appli=
ance-image",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Get poky source code and prepare the build =
environment",
-                    "expected_results": "bitbake build-appliance-image is =
successful  "
-                },
-                "2": {
-                    "action": "Set MACHINE to qemux86 and add the followin=
g line to conf/local.conf :  SRCREV_pn-build-appliance-image =3D \"${AUTORE=
V}\"",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Run \"bitbake build-appliance-image\" \n \n=
",
-                    "expected_results": ""
-                }
-            },
-            "summary": "Bitbake_build-appliance-image"
-        }
-    },
     {
         "test": {
             "@alias": "build-appliance.build-appliance.Build_core-image-mi=
nimal_with_build-appliance-image",
--=20
2.17.1

--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

