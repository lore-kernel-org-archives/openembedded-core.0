Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 678D6784C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 20:39:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6SKdLtg015461
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 28 Jul 2017 13:39:22 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([fe80::d894:a649:cd4c:89b7]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Fri, 28 Jul 2017 13:39:21 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "SULLIVAN, CALIFORNIA" <california.l.sullivan@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] module.bbclass: move make scripts earlier
Thread-Index: AQHTBwQ8o6yq0Cg8JEKxucKjoVv7iqJptMD9
Date: Fri, 28 Jul 2017 20:39:20 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF3B9B2B@ALA-MBD.corp.ad.wrs.com>
References: <20170727181406.22872-1-california.l.sullivan@intel.com>
In-Reply-To: <20170727181406.22872-1-california.l.sullivan@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.7]
MIME-Version: 1.0
Cc: "WOLD, SAUL" <saul.wold@intel.com>
Subject: Re: [PATCH] module.bbclass: move make scripts earlier
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
X-List-Received-Date: Fri, 28 Jul 2017 20:39:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This will break application of a patch submitted a little later yesterday w=
hich moves the make_scripts task.=0A=
=0A=
Joe=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of California Sullivan [california=
.l.sullivan@intel.com]=0A=
Sent: Thursday, July 27, 2017 11:14 AM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: WOLD, SAUL=0A=
Subject: [OE-core] [PATCH] module.bbclass: move make scripts earlier=0A=
=0A=
Some out of tree modules require the scripts for configuration. For=0A=
example, backport-iwlwifi.=0A=
=0A=
Signed-off-by: California Sullivan <california.l.sullivan@intel.com>=0A=
---=0A=
 meta/classes/module.bbclass | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass=0A=
index 391776d..78d1b21 100644=0A=
--- a/meta/classes/module.bbclass=0A=
+++ b/meta/classes/module.bbclass=0A=
@@ -1,6 +1,6 @@=0A=
 inherit module-base kernel-module-split pkgconfig=0A=
=0A=
-addtask make_scripts after do_prepare_recipe_sysroot before do_compile=0A=
+addtask make_scripts after do_prepare_recipe_sysroot before do_configure=
=0A=
 do_make_scripts[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"=0A=
 do_make_scripts[depends] +=3D "virtual/kernel:do_shared_workdir"=0A=
=0A=
--=0A=
2.9.4=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

