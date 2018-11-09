Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 10828 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Nov 2018 17:22:28 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0058.outbound.protection.outlook.com [104.47.2.58])
	by mail.openembedded.org (Postfix) with ESMTP id 93B9D6C334
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 17:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/1dKc8RgmTAOvq/csreK8zNg46qDD1PvgcJUjaTAta0=;
	b=g+7HNQhd8UFZYeDZDcWMD77aLBvsTStJccdfb661gTP0lHFWZPlJHJeCteSfskl82eaP5svq7/GIUK3Fl6JvZaAiDj11WGEdIdRhygDJlpjTiIbIjmh5BOaRccadR0eUwhvzi5roeS3tPu+3pmY51wsFTUHttQr3P66T1DaT5wA=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4620.eurprd04.prod.outlook.com (52.135.138.154) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.28; Fri, 9 Nov 2018 03:22:24 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::9563:6aa7:dd40:a955]) by
	DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::9563:6aa7:dd40:a955%5]) with mapi id 15.20.1294.034;
	Fri, 9 Nov 2018 03:22:24 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] meta/classes/qemu.bbclass: set -cpu of e500v2 to e500mc
Thread-Index: AQHUd9tu2jqK9exZtE+RPB1AvsQw3w==
Date: Fri, 9 Nov 2018 03:22:24 +0000
Message-ID: <1541733726-19799-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0067.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::31) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR04MB4620;
	6:6Ss7wjdB/Zj5gt2FsWgLhW3E/mbfoDK9Bdwt2mrWRw34ag3/UVnIyPJamubka33175HlDJP5kq0uYBWJjIt63YsY77gSWvD8hXIxK37+djcmP/vP/AgpyJevpoFhsvKOjgwpKQEFIzkEC4c80o7MAROnpoZtrH3R7+RaOq8cHRjFnj9igXPPWymcQ+EvRCG8OdKwhHigUckjhgwrV02CbwTgg1MpXqfZA99IHbwDtvKtQ2yGTMGj1WwZv8+Jr2HRXKE0+iqOCHS+VCmSglVZghgJKuG5WUpqkCqjTFFAs4jQhWfU2Og1thfoCczTUmJaLHIz7mK9P7Fu7VLhmowcrtgjd5rkKX4wcqiMAcayNygtvJJDQFXFKSsHKwXepqY6pMlt7ftau+lFlWfTnivSN//91+zppp3UB3T/otwBbitRj+iSWX0VeYGgbuZAHgWjMP2tGpDDyH6SU10Jtpo0fg==;
	5:+OPqB3aYNASU2ekj9ws0Kw3xROmHc8GR0l3goAriizVlA8CMhZ36SWKS+MkacRp2ciyrJfj866rr6PNpaDSK8Ruo974PlvN015x02gx3jARF3QSZOpSUYwoDwoDsIHB3OoQgnejwmjGvKwk/fue8lCrjQ8TP06yZrEq+vX4CV7g=;
	7:kLzTSsS7u8Xnhkyj+V0cpE5mMQnNcWeSDD/VDtGaDuOmMpS4+rLR5J98juYL01ejry8SuXDCu6EtVcHR2WWFHVuL0RYVlcQbJzu3N3BLsxXChOT23oAGNVio1OUDCTysOk5U2sOMEHZGmmjyDT1XdQ==
x-ms-office365-filtering-correlation-id: b75491a8-81af-4aef-da16-08d645f29125
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4620; 
X-MS-TrafficTypeDiagnostic: DB7PR04MB4620:|DB7PR04MB4620:
x-microsoft-antispam-prvs: <DB7PR04MB4620671258B2827BF1A9F82B84C60@DB7PR04MB4620.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DB7PR04MB4620; BCL:0; PCL:0; RULEID:; SRVR:DB7PR04MB4620; 
x-forefront-prvs: 08512C5403
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(376002)(366004)(346002)(39860400002)(396003)(189003)(199004)(2906002)(106356001)(105586002)(53936002)(478600001)(6512007)(5660300001)(4326008)(5640700003)(36756003)(25786009)(316002)(66066001)(14454004)(6436002)(2501003)(476003)(6506007)(2351001)(102836004)(52116002)(97736004)(99286004)(3846002)(7736002)(305945005)(6116002)(186003)(2900100001)(2616005)(386003)(26005)(71190400001)(14444005)(71200400001)(256004)(6916009)(86362001)(8936002)(1857600001)(81156014)(68736007)(81166006)(8676002)(6486002)(486006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4620;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: fG8fsCON08DA5KzYI6WW2CAQM8dL1aFrJTBBCpwt5+xsLG0PzchO88CQzNcYM8tyuUvgQUFJiywcB6fFH4BB8TutiTQNzjTcYcI608PWnw46f5qZwym1xmbw7MKlu5YkbPwad2x9cmUmPCq459+5CevS/f+LxhMTIosb2KeP2GDDkYCGU4CPsfXrT1lhZfV/3lPUmFyH8V3f5x8sHpdWLYgdXcbZbgkBbQzsUC+iG8nHA9H9hul+AUNdsUEfRYMxMpil0xwVNXiC57cunDuCU62rPmplKX9FVLfRu/yg+6/sfUi9S2e3pZjV8iDTj7XEwgse+IG7a4EissUQxVDAD9UPDtMfjz7DEV90yex6SHI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b75491a8-81af-4aef-da16-08d645f29125
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2018 03:22:24.5497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4620
X-Microsoft-Exchange-Diagnostics: 1; DB7PR04MB4620;
	23:laGiqWPOSkX15vXOjfwK2ROM1PdH8fUAoPxMtbyj7aAc0STRUbWPW74u+3RRAsGg5uJJrnirwJBimhYQeQVfDBO7dqzS9QPYN/my+DNC2V1uJtzgTGm9JGIsEXv8zTxsmOiQTt99RVw90bQSPeTPxw==
X-OriginatorOrg: nxp.com
Subject: [PATCH] meta/classes/qemu.bbclass: set -cpu of e500v2 to e500mc
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
X-List-Received-Date: Fri, 09 Nov 2018 17:22:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Chunrong Guo <chunrong.guo@nxp.com>

*fix the below error
|The postinstall intercept hook 'update_font_cache' failed
|qemu: uncaught target signal 4 (Illegal instruction) - core dumped

This workaround will need to be reverted once the proper fix is found.

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/classes/qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index f5c5780..e8545f1 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -55,7 +55,7 @@ def qemu_run_binary(data, rootfs_path, binary):
 QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" %=
 d.getVar('PACKAGE_ARCH')) or ""}"
 QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
=20
-QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
+QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppce5500 =3D " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc64e5500 =3D " -cpu e500mc"
--=20
2.7.4


