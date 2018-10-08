Return-Path: <michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 8D92C78890
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 19:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=essvote.com; s=omaha.092018;
	c=relaxed/relaxed; 
	q=dns/txt; i=@essvote.com; t=1539028523; x=1541620523;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sz4IR3idTczLWUJrmTQ3WRf0xA3JVlQXJRv3+7dHf6k=;
	b=ajwLMhjUA9R2S9eC5yuUIbtrK+wtAOkGjCO0tDhf6VuQxtpc16esev0nNS+hMVHp
	Rgx8nHfWPF1EQRv38CZXxhkFbQJMXkooqksr7xPARyZkYNMxr3jSGYLkk9K0e33r
	Jvd/LWScgT6R6bWDf5mUYevjB2D0q3ZZpsPVX9sF+uT5wH8soLopbdTJV0H8T8w7
	Zs4FXPF3PvuG02iHHdi+/pURExWpYxI5gPy5VgcobkvzNm9AEnvYcDK2Sx8VsQBI
	WKdTbvMAsKGR+ra3/4AugLJgu0DZaSh31EkmubigWT3ePvB67otvLGvhxxogbsgr
	JZGSfRGej/Pbfh92+G8Q8g==;
X-AuditID: 0a00029b-c4fff70000000f48-4f-5bbbb62a52c3
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	6D.C1.03912.B26BBBB5; Mon,  8 Oct 2018 14:55:23 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e]) by
	ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e%16]) with mapi
	id 14.03.0301.000; Mon, 8 Oct 2018 14:55:22 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-CORE][PATCH] wic: Support for changing the imager.
Thread-Index: AQHUX0DZXNhNdQ89hkCZd4OMrpyRCw==
Date: Mon, 8 Oct 2018 19:55:22 +0000
Message-ID: <20181008195459.16061-1-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.69]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHLMWRmVeSWpSXmKPExsWyRiBPQ1d72+5og1OfJCzu/HzH7sDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujJZN15gKZnJV/Gk9ytbA+Iu9i5GTQ0LAROLh9tssXYxcHEIC
	Rxkljr7YwgThnGCU+LivlQmkik3ASOLc9U2MILaIQLTE0hkzwbqZBQwk3m3eyApiCwvYS+zf
	8Y0dosZFom31X2YIW0/i1JHpYL0sAioSG5fuAqvhFbCTmLjiChuIzSggJvH91BomiJniEree
	zGeCuE5AYsme88wQtqjEy8f/WCFsOYm3c35B3aAncWPqFDYIW1ti2cLXzBDzBSVOznzCMoFR
	eBaSsbOQtMxC0jILScsCRpZVjHy5RnqpxcVl+SWpesn5uZsYgWHNxcA0ewdjT1PsIUYBDkYl
	Ht6w+bujhVgTy4orcw8xSnOwKInz7ujaHC0kkJ5YkpqdmlqQWhRfVJqTWnyIkYmDE0RwSTUw
	2v97oHfpYU9hb1vNn3Pdf7vqZ7swVmWfT/J7HNVm8fPQ8Z4goUzlD/vr7hT9rHxS2MiUNOtv
	0cx0MWHLdQU/ZvBkpa60Ft17Wa8pL+rF/TsTl+sWiz40SWF5u+zBuUtb+gT3L5x1Ofdk+n/5
	NUldW3XnVHE4y8wWsbb6U2lbFRPlfagi5Fy/EktxRqKhFnNRcSIAbMxzjFECAAA=
Subject: [PATCH] wic: Support for changing the imager.
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
X-List-Received-Date: Mon, 08 Oct 2018 19:55:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 scripts/lib/wic/engine.py | 2 +-
 scripts/wic               | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 850cec30e55..e6c830ce789 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -191,7 +191,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kerne=
l_dir,
     if not os.path.exists(options.outdir):
         os.makedirs(options.outdir)
=20
-    pname =3D 'direct'
+    pname =3D options.imager
     plugin_class =3D PluginMgr.get_plugins('imager').get(pname)
     if not plugin_class:
         raise WicError('Unknown plugin: %s' % pname)
diff --git a/scripts/wic b/scripts/wic
index 7392bc4e7f4..37dfe2dc589 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -362,6 +362,8 @@ def wic_init_parser_create(subparser):
                            "bitbake variables")
     subparser.add_argument("-D", "--debug", dest=3D"debug", action=3D"stor=
e_true",
                       default=3DFalse, help=3D"output debug information")
+    subparser.add_argument("-i", "--imager", dest=3D"imager",
+                      default=3D"direct", help=3D"the wic imager plugin")
     return
=20
=20
--=20
2.17.1

