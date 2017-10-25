Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 29787 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Oct 2017 16:11:47 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0110.outbound.protection.outlook.com [104.47.41.110])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDDF77D6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=8qiYFlYMvPUJ7PXUJLKQSL42JCwaJ1TKne436yPT1PI=;
	b=P3Sv1npqp4sHj5W4FeBad2iHNgLAF8ScyIBdH6ACtqVk+12tQ8syfYMG/fsnZCATSsm6aKc3lc+zvnrfIz52fZbAGpQbpNKnbDpUa/HnCMOLNShOZJaQpto2jPNpcM60bGgYNL2Lz7eGMQ4YVd36XYVfU2/DdaY5Emj4MpflPJs=
Received: from BN6PR03CA0052.namprd03.prod.outlook.com (10.173.137.14) by
	CY1PR0301MB0777.namprd03.prod.outlook.com (10.160.160.13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 25 Oct 2017 07:55:20 +0000
Received: from BN1BFFO11OLC004.protection.gbl (2a01:111:f400:7c10::1:128) by
	BN6PR03CA0052.outlook.office365.com (2603:10b6:404:4c::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.178.6 via Frontend Transport; Wed, 25 Oct 2017 07:55:19 +0000
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11OLC004.mail.protection.outlook.com (10.58.145.15) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.20.156.4 via Frontend Transport; Wed, 25 Oct 2017 07:55:19 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v9P7tH9H017572; Wed, 25 Oct 2017 00:55:18 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Oct 2017 15:55:12 +0800
Message-ID: <1508918112-9459-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(39860400002)(346002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(8936002)(6666003)(5003940100001)(105606002)(356003)(81156014)(81166006)(8676002)(36756003)(104016004)(50986999)(2351001)(4326008)(48376002)(316002)(53936002)(50466002)(106466001)(47776003)(16586007)(97736004)(77096006)(50226002)(68736007)(2906002)(498600001)(189998001)(305945005)(8656006)(6916009)(42882006)(5660300001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0777;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11OLC004;
	1:9MaArghKrX9iOM32Yd42MaKxf05GNdCn5wYFw1DtSf8EZOHPbCXTOES4+aYi1lVj8kHbBA7Qyc6PZb7qjPIgfCgEamk4FwrlL9xqCxKZ4pOXuG/wylU/PBdeoanzfexp
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49ba7e74-aa7c-4fed-a95a-08d51b7dbd10
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603238);
	SRVR:CY1PR0301MB0777; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0777;
	3:KCfvyRAI4Oxuzqco4x+hnvwXT86f1bVHUNaFAIbvXaqDu/eM8FC2Jbdh1x3Mxb3Ax2zpf8XPbhbEKnAJZ50paZntOfYcsKpoqBOyb0vQa885h1H9wa17cPED+v/tspFfNFEHTQtc5Tzqca7rkBg4XYFVzcdQaXBraUB/91LwOF/NnYF+vlP0DSdEJx6yRkij3Qk4LXfptzAKdfLNatrZZN6FZnAoz5Kx/sTc3/mpgIApRH2MHKJEZ3XPGpApzpm8pF/XUSaAZCDur0lqRoiDnALhIo0lMST5R2+EDqQ8fyTzmwZKb5PADmOeUGFJbHx3nns0C5h6H9YVFoyduFdR2P2zVXVq5EoHUp+8t34iSq8=;
	25:KXMl+i4mtc76Ce3kvRIMHR/jrSf3U2QO+G9HZfSBbuuy0z6OrSeFpFt78D9W3LPSJzq32PZCh1yC79kRV+BiZkTngweWV5I8KvkZb4pkKu8oohV4cU1SC9RPS0dZ4i01XBDyvGUOfvrv8m2FW5VDVEwKEc8+yEQZya1O5sYT0iFiYdD7DAQKxkapxc9NGuFpZcMeU6lNnhOivk/+gNubVF/WyQugUx+a9RX5r9UFee6uehisfh7Z2ukaPGuusEP1jjqEBWVEWCK9v/6QgHltFPVVkHU5Sot3wcym1aBb1W3QRI/b/q9iEbam93nhvugISX8h+B0LhKmnpNgc63eBHkEu6LJONEfRdGPipIR80Wo=
X-MS-TrafficTypeDiagnostic: CY1PR0301MB0777:|CY1PR0301MB0777:
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0777;
	31:Ike9baHz4/Fx9TxP6HC7nWxDhffnz60mN8eNNMW4QvPBM2jlIx7U8LQjzUF279fynLzysWnYlUmi+wzkGjm9um7GwqUj0ForhyFHDIP8u8yQxBl06Lw8cjiAfQuNj3d2SSRsHGgwgDk+0MWXFkE5FLDsBUfZQFXzq5q/DZCf2JE3BTQGoPVbU/zc4iKkndmUM3Twx0X7F+OqMTGh2iChg9yle0C5hewBQ3STIMQ3Vq8=;
	20:Z1sTZp1I3rJnNx/DCpgV/Btf3NugnSfGrxqG4kf1LT6H+LlIbl9e44z++Mnlj74tUZvNMoUqske/fdW8Z4W4s+6BQT9VBUfYyphhW9THWYXp6Y6LtN0fNl/SWEUedNWo9Ri6sXsjUwJZiJg+7OjyoGbqbOpYdAUVVn+jcbEehjjPPXdBzxowWqPrKyRIDn73ew791Ii6Sf4wI9qB3bL5w/KGZBTwQ67PsRAuxLyg0RNr2764ASC5zh7cqX8Qx+nG3dWzolEF9MZ1aKpnYSc1L396hDSOsJ9SRJI5fwAdaqUNM7p21QISUmdmCQrIkD3xwj0+B1WgsZEo7zg8PEW65mEghIMgyoZZ+pNODTBPw3CaD56u46emLr8vJnLBinm+8x5BolM12sZAiIs6LGiYXI1AxlGZ390lOPcZpOKWMOubrY669O5wdH0XqFB34DobF0NzIIJUgCIMt8fObXmn70rpGrP15rJEwG+EFOxRf4A4ZmmJi2oyFRI72RyBmew5/+RYF+Qe+tp5u4iczxJeAcMMoRX3qobIPJZul0zlWDtuq7Ld34hU+wADesYgE2yF0AkLskRxVXsS3z4b+wjtUuRv2HtUmexEOkBi9cgErAY=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <CY1PR0301MB07777AB77D591B1867A0C9C884440@CY1PR0301MB0777.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3231020)(3002001)(93006095)(10201501046)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061750153)(20161123558100)(20161123555025)(20161123564025)(20161123562025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0301MB0777; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0301MB0777; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0777;
	4:YzKkIwK217xG4QCSpzMMImKJFOpKNnzUHwGVE2OYliM6/PDVD4stITaoxVxpWFa1jiiAMAu+7/v9jgkcNomxtg8LjX33SRRV6abzWZlFcvbulDqgKttHHF71dG+hsAiC+44h+OwHxP2H5u0p9ERK1tccptWs/Sxp4+gsj1mKDBygmOseVRYnZ3KNIinEB4oTMmCq6qs8mdcjsWUVjRp7K55H+eiOZQ2AEGlHXkulvYgo/lgHQ21WFd8QGXDGedFzoaVTMjBR2nxz08+60an8hGOMVtdk/1z0bUxHSmaq6kQ=
X-Forefront-PRVS: 0471B73328
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0777;
	23:wKneB1VekHusf47gRih2OhdXENGul1htbUPFGsh?=
	=?us-ascii?Q?F0nzz+31B171q6lMAMaJOMopl6SPYG6m1YS34E+g6E9ny4x3qe9djuiKkQGd?=
	=?us-ascii?Q?kIOhfYQ4CsKQQHy45aMVa4OGcFrOlYGdeVhZnETl03lK6lBsTIQpO7MqQ4Rb?=
	=?us-ascii?Q?lbbomv9k4q1DCkYLMNDSkvo+5nHhhqJLaZ7A6VyOkYy/d5ysMoAKeMtWyXqs?=
	=?us-ascii?Q?8PtolVQMItbalCxMnNU0jEM+TJRfrh2GdK97fDC4ytE/KCciMJVX1PtYAY53?=
	=?us-ascii?Q?avpJ+wshz0VWKNBRBDIodVdDjIoCXiVWelJtvydBfgDkc9pUdYeWFaPp6OxK?=
	=?us-ascii?Q?tYzcxB5ZfTyy+XFfQFoIULQ84EqCI2cnW4bUrpRqRqDDPNL3D1Iir3Y/hCUS?=
	=?us-ascii?Q?j5b7BqnfCWxplVEj0wzFlpoBo3Gb7O3xbFSDcxpyVIlZYgteoHpBBn7owpvI?=
	=?us-ascii?Q?oPzEFcm64U4htpdagN8FfTmOAtWUKYGEhpCIL5YOAr/qdjClKnObei34Cc9d?=
	=?us-ascii?Q?5uu0z5WAzIr8VEldgZ3kC28uBiqp1bXJW/fCu3sVXIdF4zemx+jg65WyHyTE?=
	=?us-ascii?Q?wkswwGEILOJ3JN0Rs7uq9yHiSLD2hWUjNAat6O8B+XfJzmtYeU36bsF6qISZ?=
	=?us-ascii?Q?8vtOIXxd5G9PlnvDf+7tN7DigDd0DsYpajCf8yvELGZ5MbWCldDLuyMNKb4H?=
	=?us-ascii?Q?HQZl8VwBbuzf8UJjtS7/Fbge6/BNKg7QtqD7FwOhzcPPVhZBfeV3vzKZtKL5?=
	=?us-ascii?Q?CeIiAMLCitc3PCWtqCouSB42xCAGPIbG2noHWnTHAfyoPEzCZIPmNYOExemr?=
	=?us-ascii?Q?lzdNk0iYHBO4IO+B1htKWq61Y9giIgK/LNq/50/cXU+IMQ9CmJM8Vs5kIphg?=
	=?us-ascii?Q?DrkToups7KfyCIB5nZkLy26LMV5I8eWlFEojj/NJ/hADGtwR7VtRjovyXUKB?=
	=?us-ascii?Q?O1uA3tBKCnMSVqTaWapRlJzkkvb2YqYhrn58QXqHlQQCzu0xEtqUSsJGvNIn?=
	=?us-ascii?Q?54q8tyLsuEyKji5iPwBWaNpbv?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0777;
	6:LUVs1LEV8qe1LnyczVG6UE1gLHnGBhetDf1TzlnxfMOTvzzQQdflnUbC/yP0McpnMmsacwcmvQ0aqV4/KxjtG9s6VgnhutCq25/jyydNryFr/Jka7ccdCaP/RaODc8brpgt6JxJ2KKiLIW9k5GfijOkqVo5C69Dc1kFxILKm9svGGhw7bi8rGWHoPek675c4b+BQCEiHATr4Qpt5GSCBI9VB4qooV3KArLyMw+I6h5QKXuIFQ2PLi0tdPMNFr8OTCrv670wjYvDrW438o/pocAvcwarNAmHpdmZgLy7IzLWNr3qW70c9p4cLf5FEzUx9z4Oul8Q5lyD+O5A70s3tuA==;
	5:Fqhtk38eShpEmOmdxEn3KTYxiqwgqoIqDMG4U7KKAUOm9Qx8AntbhaUqVpeXhi6NSvPOsaVF8KwOVbkc1QtXfd2YTMTG+RWLIQ3vJ08mJuP1Z4rw1oTnEadrEajNcpMMAC0AsmSK1teHsSLfCIdxgA==;
	24:M2s5pbFuhd/LDxzVsmgqRjYWBMs66/4e7L+tf4d0baDSAbj4JKBTgGvWlu4hAb+AAG4KwcXxcTnipMZZDE4Qlwjx9RuUq6A7Uvv8zYcDFFo=;
	7:2lj5662nlVTJavfXZlPtvGyEOGrf5H3Mt21P4ARfxe29QxU7yIZpGD7p9weJskaOklvcUXyy7stxwn/mfc/cE0IKNv639N1XpdqrTB3lpx9uu0UOUXpjh/IinQ4s2d4xEeAvt53uxSmyfXIEdRXwzr9jE8KEND0NZSZO9LhdGDRvmw7PuZ9UrP0n+SOY96vS7bLVlO/1ZC5uvVUwyvXWqRQhO0W1erDNE8Yoe+xgrKI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2017 07:55:19.7924 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0777
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0777;
	23:oCVqSixzV/+i5naFy3C/ByFoce6zcRyKQ99oy93BvkDhhlgu3bcrlm1lY7fiMZA7KkakU9nzhdgj/8NOSAeA0wbXDr1byAz5mLzh0baEsd7qpnXlryK5tJi355olLHjbXR7ByZueCLsVHUGq8M2IDw==
X-OriginatorOrg: freescale.com
Cc: chunrong.guo@nxp.com
Subject: [PATCH] kernel-fitimage: add DTB_LOAD to set dtb address
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
X-List-Received-Date: Wed, 25 Oct 2017 16:11:47 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

kernel-fitimage for arm64 and arm need dynamically sets dtb address,
thus we need a flexible way to load dtb address value.

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/classes/kernel-fitimage.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 179185b..479ffd4 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -36,6 +36,8 @@ python __anonymous () {
 # Options for the device tree compiler passed to mkimage '-D' feature:
 UBOOT_MKIMAGE_DTCOPTS ??= ""
 
+# Options for load dtb address
+DTB_LOAD ??= ""
 #
 # Emit the fitImage ITS header
 #
@@ -137,6 +139,7 @@ fitimage_emit_section_dtb() {
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
+                        load = <${DTB_LOAD}>;
                         hash@1 {
                                 algo = "${dtb_csum}";
                         };
-- 
1.9.0


