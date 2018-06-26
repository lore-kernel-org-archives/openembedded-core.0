Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 43044 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Jun 2018 13:31:30 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0093.outbound.protection.outlook.com [104.47.2.93])
	by mail.openembedded.org (Postfix) with ESMTP id EB8666067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2NbtKhyipBqQNYZT/pbIZJm/VZ2oWWt5WLWt9UEl+OY=;
	b=Qb3MvXQ0KZ5TCxifc2xX0Be102MCkm8H3hMfteDbdVQQU2Bl7IHvGAP6RQhc+/beNubEdP0LA5YYOFMGI5uCQDfGBrw+iMaif9q3lf0RHcj4UMHfkX/laeZgvbcHZAlQBULGM7PBTQwjlCV84KJcdkCySD0q14wYcCtONiLl9WA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from munkone.intra.qt (192.89.120.53) by
	HE1PR0201MB2265.eurprd02.prod.outlook.com (2603:10a6:3:7f::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.906.20; Tue, 26 Jun 2018 08:00:10 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2018 10:59:51 +0300
Message-Id: <20180626075951.25183-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM5PR0502CA0002.eurprd05.prod.outlook.com
	(2603:10a6:203:91::12) To HE1PR0201MB2265.eurprd02.prod.outlook.com
	(2603:10a6:3:7f::8)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 653044c9-924d-4b7e-d9de-08d5db3ad747
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(8989117)(4534165)(7022125)(4603075)(4627221)(201702281549075)(8990107)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0201MB2265; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2265;
	3:fB8jdikWMxMMDJx88jZw6Btz+0DHQI7EKYhYS05y7d/BFPJ4AzRoEzAa9SIKvMQoATuBPN61kH0DifJOaEmdK5njqkFPLXhFrL31hJ2QPBU/nOSF+pf7li7dhV+wLT/N4Gm+sCfYE3/x/m3jFXNbKNYDgUZtThZlLE8xzbcCQztlkP3QrfIDm/cDpuhFr6PlAA9cW4w0YoL4zNVAZzlN6w1veVneXqz9qO0XYASTPkKLGAyYq5BiuXIU27lWX9ts;
	25:x1FaGfRUjQphmA80E2yHouG4UP6Aziu67nih9waDnRuLyb3dCLjSWNnZfJD+ZdOlQJ38wBTZfPKNJDTGDUaU/hev4f+mdWFXIF8AUg/I1yVWQ4FNQB9IVDjX9Mf5ycqOTN78j7pFI6DlQkMaVsOFCDPt3vM864KeL5S8RRWp9OgZ0oxpilhPU0h219SshUaPFjpROtjpRAEDIsTKPZBtF4cr7aYTLNcFyUzPETBPnv7e41F7yRbb6ofGnolovYyqo53jwTtWUtrCOm+lutsz1Uc+qsbYyqaNCz4jsyX0JK6goo08tAkTqlmEqDfVhZ8aS0Tz+U9kfsVKxjsUpoWn7Q==;
	31:llOs3CF3fKshnt1aOFD8crvwTnBK8fgPzVv2cbFU4VJ0wLnxTivoFay9tZcZmqBbF3WoFi47XbSXR0GJCjlV6cYWWci/mELnSlgPQZg9D/rKyQMoJHRlado+eA6ifEg5qcqq6NMituvQsHNIWr2rG4QomChEN+7fxbDCPdMcbMDc2dsmyG5oe9TdHR9RCt8+5E2mBnJE1x+izMhesuUfaFnNIBS2XzxpZd4qmIsA3Es=
X-MS-TrafficTypeDiagnostic: HE1PR0201MB2265:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2265;
	20:HRXShlXDtWDX66uLg2wymr5IAthAJNV82A1it5BodxR4Wbu1F079sSvsXS5LJMRT80rWwb84BfozBFczHReScBLgSorocgkUljwGmB5G8ksvFgpo14BsBwId/eoI4E2dZg/tbgoGBVdfmlOBBBmPMVzdz5rWRgVY5TzbfxFCBWTbEXteMuTWWVWI+r+MUeWYyNwa03vE3tGW96IPssc62PuGeOhlOlHKCs24FHnvE76Uovfv6B+M2kBVAu0Z/sLm731dRtdAC2dCnm47iPje8kJFVL1SNzO9iWO3oQTJpIhc44z/cKipsTklfJqPHhJ9wSFz6Kyb9+PVj2kuxEmSz8Ak8EVI6xFS2uhwc+WFYDVM7RvUOs/YKuHjLmnX2Dk3O/l2Fc10vZ/XzPcrVTleS4Q8grQcXLHkRWETj4sAlTP8pp+UvZn7tz/IAdDAAv9OZ6U8sakCNQlHwpd3QOcWQ/KD6ylJyGI0dKetqWX0huAIoymeekeKD78sO/71jtuU;
	4:aUzoaLQu/wCoSBF6I+ab9OFsGLjCeayL9U+KKEkmZbcKG2cP7YT8aK2Yfr3sMllYG9BrNoYi+qQmynKC00Qeqs31bmiT/XhIoc0OQcffrajNzm3K61aHqbJxKufuLgGSdeiMhJIwmeIBgf0p0aJLnFuXJjbyX054OYgzp+Ml2dZbr6Y4J/DgnNYi4vy8I6SlC6e7f97hBGjFTe9PHmBTWqDDiTc98XpKA9AKiIPrH0xhF6j9orHGHFcGsjBDjQD4nUo+5xZ9kiQGZKLwWq8r/g==
X-Microsoft-Antispam-PRVS: <HE1PR0201MB22652D9E1FB3E956642E673EE9490@HE1PR0201MB2265.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(93006095)(93001095)(10201501046)(3002001)(149027)(150027)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(2016111802025)(6043046)(6072148)(201708071742011)(7699016);
	SRVR:HE1PR0201MB2265; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0201MB2265; 
X-Forefront-PRVS: 071518EF63
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(376002)(136003)(366004)(39850400004)(199004)(189003)(74482002)(6486002)(7736002)(69596002)(86362001)(305945005)(8936002)(50226002)(8676002)(68736007)(2906002)(2361001)(81156014)(81166006)(25786009)(5660300001)(6666003)(6916009)(53936002)(97736004)(1857600001)(1076002)(6116002)(478600001)(48376002)(3846002)(50466002)(14444005)(2351001)(956004)(66066001)(106356001)(53416004)(105586002)(16526019)(186003)(316002)(486006)(2616005)(476003)(16586007)(51416003)(47776003)(386003)(33896004)(26005)(6506007)(36756003)(44832011)(6512007)(52116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0201MB2265;
	H:munkone.intra.qt; FPR:; SPF:None; LANG:en; PTR:InfoNoRecords;
	A:1; MX:1; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0201MB2265;
	23:D4+EdDucc0WBY9X3UWdl3Uqi+4LxYppRIV2ElYo?=
	=?us-ascii?Q?nueUn88n3+Pdd6em+/58lHVsGV5CQPIHIdeaNDxHTSBwqc2PfmOjGnJqLEd2?=
	=?us-ascii?Q?rlBbiOPG5P3B/EvBMlOH0cmuhjjxDczAE1bJ2yDzk0ahsvvirknMa8UbUiPx?=
	=?us-ascii?Q?9jZx36GeoErcQNTuvhNyxarZK50rlHPqMYYW02pPnveGofuwrtEkFO98tTAq?=
	=?us-ascii?Q?PgGZWiOrOL6Qa99wLUMMVzRLnwCPo+TVTLJUQDt5gd18cADefxkfNjZzNJjb?=
	=?us-ascii?Q?31ZP3CkmxE+Sluq+H9Et2rsciXwIQ/RU+k+flPwdwdqlo5FITt8ZCsclRfjI?=
	=?us-ascii?Q?cY9THCS62mZQV79Yzd1C0FZQblu/qtm8UrEyUAL8xiiZzYdDsdmj8jIi5YP+?=
	=?us-ascii?Q?138VWgBsnkx/kXqGrFOJFwN9DEQPwaDcsxY9kxoSMhHMDzVmXHpGO3CGs3Af?=
	=?us-ascii?Q?PzUpNG3xSvce282lfbvzX5n5DAyFLSLC74AfRDw59nXp2B8gdD8swbYDy8uO?=
	=?us-ascii?Q?HUNpIrKcjxIkLmatVEdi3Nlsuypx75DFSw/lRh0dDx14tJe6iN51VwZZT5ap?=
	=?us-ascii?Q?fiqsWMsMWqOLyEcTVhALU8XdEF2Bt1Z/ZecghRFg8wDQLWegNCYu91RH2WUe?=
	=?us-ascii?Q?x/Z1XSQuyOrnE1EVRPF3zQzj1+R1J28A7VSqFyFJBzKc0yUcxcYkPtViOzXT?=
	=?us-ascii?Q?KUo8GSJzNwZNL8sV15pGWaCDtdYpKvsLMKFu0JJb7A9P2FnQAuCA5JZI6QGP?=
	=?us-ascii?Q?HPiD0s6YLTAYy6de0u+fWtzuYClaQb9pixnsREc/d9HnwsMvM/IloPKoE6LB?=
	=?us-ascii?Q?wQivj64p9SX7DIFfAAnpr0O8f6rNy38DfxryrqZ0Rke4FPFZYCTSF/GTJ+9I?=
	=?us-ascii?Q?VZ7ar2Y+CftO5T0/PWjOnZbCn7KaQ31d8T1Fbo4vHQJyDimYHadYxCvo5/vi?=
	=?us-ascii?Q?oE4WxGJ3PlkDtmMp7YDhDNlZFX03wepvKd0W9SopfeZUwYtm6Hl8htE8OgoC?=
	=?us-ascii?Q?b5A+lfWqfE/jTkeSNw4jYZ6A4TkanM4IQbeHjAMS3aOXKVC5g7dHEU7nFdmQ?=
	=?us-ascii?Q?sVGFIpVgkn8w+EcN+xpdCSQSnbinXUGZyZu+xWlVQQcCHWAJTwi7n5ftKlnr?=
	=?us-ascii?Q?XMB2ObXiJqGLnODDqW7gBdDWCMv9t+TzzctBBc2J+1yBoeIkr2JWMkVCarcS?=
	=?us-ascii?Q?HtrRAGmnHFknDucKGoVFBE3jA2Er2A8MYx1UIKT7rwBY6QwL4K/HWcGakrJc?=
	=?us-ascii?Q?tJdXvHKIeR0pSg+iuURysoRE9JRNcqAzZwSG7Pzl7We4HYVucZ5+OLivS+S+?=
	=?us-ascii?Q?SGQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: t73YOwli6oIZwf20tcCs+syuLCFllWliJJK0ZM66sMELhej8AuCeIjYtxd9LzKk4VGfqmA3wUhBnYiT/PT6BJMLmftHTYrLHCGlcDGd3iKmQKQi7T8ZHHsxYJasLncoeGM2Kz1QO6oMcypKcrcooTLUUXFXJvSZDMp1GkiKJn4dRlscSgV0P5NyqgGi6t9Vm1cYf9ZiEXctq2Ox9xUnf3vmGEITRTbtdFlgV3mGTYG05Y77v5X1YEtOzliZ/Nq7zpnsa5L8+smtXhKaJwu3DhMBGS4/PK8oejEOOnIH6xf1tMCzv47+5Jyq+cRzxGEKV1tiyDRmNRjtsa7Q4s6uEc1P8du506U8pLbquMCh5Yjo=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2265;
	6:5hlN/Ns/Qc3Ou9po2Dp6uNbyLIIB+LbTOuSmUWKe7iGYzefyyjvpmBjH0oQQfcqwHHOlePAnr7B89cEjP67CQi4kg6UmGn3bEBG+3B00G22hDp8o1q2169TTgcPMQFB0FYSGADKgQLkkpjG1BgPdmpIklRbCBsdD6DVRdAYWriSzhjBRFm9k2J84ONrSYZv5VxV7VYqymrhC9MiuAu2gCUsXPMBiWHrGxILRDh3z4oZM1TQNp0a93DzwpiEZZM6u33fv5Fc3gu1DPrwCnqyYT8Q1fYO2nzV6Abfn38Upzqr7JEz/XwF2OLPBbWvFY10kLdSDASgcqVGnHjNq6UWXXFfuajAmYJPQ585Yln3DtnhXCWHRNt+Vwl3guSHz27aXUDT3a9YE78gQuWO00nbnhEr0bu/sj9alzpvWCW8XTVvXAHgJ2VJBgun0eRzMUs1bbZwUE4zgyFQuEmtfyx30rg==;
	5:MfNrbg1+kvzYOJtEKWPdLjQMlMqA6izqnTr7Xe4dv1n+37Cj+v8XXqS7nxUY4WOLwhVVgmW9EYekbptJBFcpLHVvGshLk53PJoXxxIR4zMlA6BogWy+Gp7Wuba/cdSJk0gGpo5wfTsepGGqxuZBSAALdGhgxioXGfwV1S8g5Apk=;
	24:h0YUaL+OhyREYY+mZJon24axN5EgwDihCrJw7MKy2dZYzgWL/f5Q/NHhMWvumVr74N1/wGgK3wDszAXxpkWDvaB6q8nRcZ/f5NtxiIUtkyM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2265;
	7:zxThtnWaMxUgY8AJ+JBSYbFyxVeNrh0lZ0uIQHtACzma+FnOZk8NiAEq/HIbj4ukFgnfWruk55T9YoHi0Y4ZhnBH/Cr0CzN3d80RDwVgjLcmffeB2Ny+s6uTJ2AtG1K76IG20yZ0yO4rqON8/l2K4cY1AQW/SylelNgZ7l7fLNsEXglAf6D6KXxLfmRczxTPJWF+JncjSTgOpQHXF8qxQoG5Rnwxd3TfcO5t2UI/qiC8XZ6ZtoL8c4cVfLzU4DIp
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2018 08:00:10.4502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 653044c9-924d-4b7e-d9de-08d5db3ad747
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2265
Subject: [PATCH] glib: remove unnecessary dependency to DISTRO_FEATURES
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
X-List-Received-Date: Wed, 27 Jun 2018 13:31:31 -0000
Content-Type: text/plain

Since DISTRO_FEATURES was expanded in the comments, it created
task dependency to the full content of DISTRO_FEATURES, instead
of just the x11 used below. This prevented reuse of sstate-cache
when unrelated feature flags were changed.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 31b74362e3..d6d91335a6 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -117,7 +117,7 @@ do_install_append () {
 
 do_install_append_class-target () {
 	# Tests are only installed on targets, not native builds.  Separating this out
-	# keeps glib-2.0-native from depending on ${DISTRO_FEATURES}
+	# keeps glib-2.0-native from depending on DISTRO_FEATURES
 	if [ -f ${D}${datadir}/installed-tests/glib/gdbus-serialization.test ]; then
 		if ${@bb.utils.contains("DISTRO_FEATURES", "x11", "false", "true", d)}; then
 			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
-- 
2.17.1


