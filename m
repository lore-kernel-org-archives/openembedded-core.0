Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9026870A8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 13:46:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Nov 2014 05:46:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,313,1413270000"; d="scan'208";a="601971541"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga001.jf.intel.com with ESMTP; 04 Nov 2014 05:46:56 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.56]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.144]) with mapi id
	14.03.0195.001; Tue, 4 Nov 2014 13:45:07 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Huang, Jie (Wind River)" <jackie.huang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] packagegroup-self-hosted: add git-perltools
Thread-Index: AQHP+AKuT6XdEvZusk+kyaH5VEpn95xQeZDA
Date: Tue, 4 Nov 2014 13:45:07 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F386B0E@IRSMSX105.ger.corp.intel.com>
References: <1415086741-29364-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1415086741-29364-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-self-hosted: add git-perltools
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
X-List-Received-Date: Tue, 04 Nov 2014 13:46:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.c=
om
Sent: Tuesday, November 4, 2014 9:39 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] packagegroup-self-hosted: add git-perltools

From: Jackie Huang <jackie.huang@windriver.com>

git-perltools provides some usefull git tools like:
git-submodule, git-request-pull, git-send-email, git-am, etc.

We should have it added in self-hosted image.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../packagegroups/packagegroup-self-hosted.bb      |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/=
meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 65aca7f..f95ce77 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -120,6 +120,7 @@ RDEPENDS_packagegroup-self-hosted-extended =3D "\
     gettext \
     gettext-runtime \
     git \
+    git-perltools \
     grep \
     groff \
     gzip \
--=20
1.7.9.5

--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

