Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0050.outbound.protection.outlook.com [104.47.2.50])
	by mail.openembedded.org (Postfix) with ESMTP id CFDB660797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tdIcmvimVISSu9YgEi/Iikpy90mOZa/6+dn1zUDlpf0=;
	b=vvI/9lZxM0AdavfS2W2kinAjvbmHHa1VgJSpq98fRJYhPdqMkLnbA62sjSTYFB2lqT8+V7+LgC+OR8aAqIV2OFrv9fF44jAbQireJ93YzW+0GmcZLZQkDwHCc9l5oeAvLDe+19KxLo3sNhGrnu2SpASfZJ3vIS/U/4Xa0W1lg4I=
Received: from AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) by
	AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.549.5; Mon, 18 Jul 2016 16:46:04 +0000
Received: from AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) by
	AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) with mapi id
	15.01.0549.003; Mon, 18 Jul 2016 16:46:04 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core][PATCH v3 2/3] weston-init: Fix weston-start to handle
	0 or 1 args
Thread-Index: AQHR4RPfD5btQAaeeEG2xQaJZ1YGyg==
Date: Mon, 18 Jul 2016 16:46:04 +0000
Message-ID: <AMSPR04MB3095303E55F94911E7F8654E2360@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
In-Reply-To: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [192.88.168.1]
x-ms-office365-filtering-correlation-id: 87a54471-d260-4104-127c-08d3af1a73e6
x-microsoft-exchange-diagnostics: 1; AMSPR04MB309;
	6:dWhdOoJChGg4yRRppEUPpCTKGyw6iVcNvx4CzTFrwKAfx1U+xv/jygNsvFYIAOFo0XwT4vo/VckC75aCIEDFS/g83DAFhbjzeLOcrxZJCmf6FzIdrEY6QjyjHc50Pf69IIhreAuU4PynM0jZC+/e3k4fF4IaYe6qBnebUEYgJADvs9N+fh0WDRCCV5dwwOMg2wXFW2cdU3bSKX7h8ie5/qXDPvMu/cningEtb9cPZQgnsvx/DumffVDkeqnWu1dybd8qaLEZZYPQLgTBB5oOODy0LrOhf7GH426Xwh75rWDRNUtWT29c5rbjNJGHPhEKMmjCjJh2eesXuwOuAAU+iA==;
	5:rg/qdPuohg4zCT+BQtjxFQLvan5N4vH3RA+wJ7MmAegdBFPkM3pkJjpIoi+B+awT2kvHDPleE5UWAf7FVsxaks4turfSPr9P+UlS1eRzDpFpwqu2d7oqXo+mZTRvZKLk6oZtD6BBlfioalsxkLV8/g==;
	24:0jN/vg9W0/VnoYZnfNdiKhkpZVyn1HBqxyyk4aNKq1/+SgnF/1yrPOOnCXZQACKX1CyDPkLzWli6nilBA7xPChNs6im9BD2P1J+dSeQngCY=;
	7:0l8xfBlgecuc+cMDUfA7G+gU8swUd0qb2QQ5fm/Qtgx465tSekXwPZjr14Scrj4eu23aOt7QyjngnUemfFAQ51Sfxdquzrvm5P+2HFAqfbJjrV59Ssg14F7NDTTuTeJvtfYbDtCNtlgousb5mREm1tE8lRjbsm51XtTK1SSOjmiU1U4l1/pMVAyBPiMa1xhZe1TfdU7RtOGp+nz79MtmuikmEXm463PA5EwY8+Zk5wKGEIWLXZZIua4OWeV6u3Zp
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AMSPR04MB309;
x-microsoft-antispam-prvs: <AMSPR04MB309DCC2CAC0E0768D9D7946E2360@AMSPR04MB309.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:AMSPR04MB309; BCL:0; PCL:0; RULEID:; SRVR:AMSPR04MB309; 
x-forefront-prvs: 00073DB75F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(189002)(199003)(76576001)(11100500001)(87936001)(2501003)(66066001)(8936002)(229853001)(2950100001)(2900100001)(77096005)(10400500002)(106116001)(106356001)(86362001)(33656002)(54356999)(5001770100001)(97736004)(7846002)(305945005)(6116002)(3846002)(5002640100001)(586003)(102836003)(105586002)(7696003)(5003600100003)(7736002)(3660700001)(9686002)(50986999)(76176999)(74316002)(81166006)(81156014)(8676002)(3280700002)(92566002)(122556002)(4326007)(2906002)(189998001)(101416001)(68736007)(19580405001)(19580395003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AMSPR04MB309;
	H:AMSPR04MB309.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB309;
	9:/XgevTpfQVfdiaxBDSJpW4aUVejC1I+RJTy38tHsBtWEvvx5PbZrWa4w684ZHg/snDIyiDKd/5oj/JWL3y8ki1KtSFlLP2Gj/9Gmi9DMCvje3hquBvlR+7unxkG6JSTPwhqASZqaUT3ftUTiRDBSgkXGVqK6mZHpstELNFvdVxy1C4Fb5RUci9659Y1sPQDS5s7UALFdZA1V6zYpVMg/VA==
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2016 16:46:04.3421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR04MB309
Subject: [PATCH v3 2/3] weston-init: Fix weston-start to handle 0 or 1 args
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
X-List-Received-Date: Mon, 18 Jul 2016 17:01:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The parser incorrectly treated anything less than 2 args as an error.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/weston-init/weston-start | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/=
recipes-graphics/wayland/weston-init/weston-start
index d7358ba..cd64216 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -6,7 +6,7 @@ export PATH=3D"/sbin:/usr/sbin:/bin:/usr/bin"
=20
 usage() {
     cat <<EOF
-    $0 <openvt arguments> -- <weston options>
+    $0 [<openvt arguments>] [-- <weston options>]
 EOF
 }
=20
@@ -23,11 +23,6 @@ add_openvt_argument() {
 	openvt_args=3D"$openvt_args $1"
 }
=20
-if test $# -lt 2; then
-	usage
-	exit 1
-fi
-
 if [ -n "$WAYLAND_DISPLAY" ]; then
 	echo "ERROR: A Wayland compositor is already running, nested Weston insta=
nce is not supported yet."
 	exit 1
--=20
1.9.1


