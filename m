Return-Path: <chunrong.guo@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0080.outbound.protection.outlook.com [104.47.2.80])
	by mail.openembedded.org (Postfix) with ESMTP id B8EB878956
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 21:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UhqMQloiODLhUuxRfVzzYln5z4r50/QEhpEgaQckEi4=;
	b=lU2/B51P77Gdt7BKBElPC0MJRrGXkEcvn9QJRJj1NQCItUwunFscNpcTuaLwBKfUPYjy7xECQXEoB7rEIcAKzDYEruakEmBuvnLr49BAmLsZp835wm0xByqAUWvna0W1yhHoOIJTXbxLlPkuSEsxDy8ng83A3XPIMii5dFse2qI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
Received: from sun.ap.freescale.net (119.31.174.73) by
	AM0PR04MB5057.eurprd04.prod.outlook.com (2603:10a6:208:c9::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.906.23; Tue, 3 Jul 2018 03:02:06 +0000
From: chunrong.guo@nxp.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 11:01:39 +0800
Message-Id: <1530586899-2928-1-git-send-email-chunrong.guo@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: HK0PR04CA0009.apcprd04.prod.outlook.com
	(2603:1096:203:36::21) To AM0PR04MB5057.eurprd04.prod.outlook.com
	(2603:10a6:208:c9::22)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 447b2e8d-6e54-47fa-130b-08d5e0915cd8
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR04MB5057; 
X-Microsoft-Exchange-Diagnostics: 1; AM0PR04MB5057;
	3:0lMrkXzbTKNATCCRoi2/ygOEIwgNyaJ+VhZVMfPzesVSg/aBNLFad1UBCh7eTyndMpyrr174kBUujuJNFiJnibDZiWi/hTuV/9kemsNSYnEpkFm1F1aKJuEO3ejSLvspErBCRpUCqtT3k4zuYTtnOVK+80cQeMMBKw86AarSuIGzsaDKcfe3BdzCD1qJPFEyxRfW0CO6XFEba+1OGC9RfXihD6JCraeE6y8tX10CHY2EB9tZUphAan6+oW/qv8Nw;
	25:k4zXBNsRC85BaNmS8DuhYoQlo8W1TwFyhZ49GlyyXG4l9lD8mwFcQvnQqyq6rE8XLFLp5VHmE7X97wTyRgG7LbQT/qwvxZVv+o7GBeurOgJf76OF1V1NwmvY93CjP1OJxygUXTT8GMEkJ8cre9HqUMWI261t8ob8n8WtW1L9WMpcuQZeZ4GBUcVp+MBHkF9Eo4I6dUqAL+nwvSuguEQWBvWlQ7/VWFrZ7sHzvQ8qHH7pcEnt8gtHkfFJXNUESNfwgXYFez6LKzrhRxMoGh+ZIk2EwYwvFAzeG+GpgZ7diLvh/tvXLFF8NmstUz+dknD32lgJSGIPrAoO2lnxpA0Dsg==;
	31:rdL6I5YIlml6YQYBnViGgGSj7eqrQU1DbwSSYXFtKhwoiVWEvINHDHn4CY5erjy/4m4MIPVAPk8uOCdAkYYGPGXO47H2mL6dbqyVlrGmsjsWPKh+nSqHDm7fBYICnoCfku2Pc1vE7QrD10d99Cmq0iY0cz1ZxVLbi5G1nJFtibF7EL+HwZY/lFfEfWMhKxYAHu3RcZHHxnQRgN7hwBHPio/KVOz/0PKcCmYZ/MC671w=
X-MS-TrafficTypeDiagnostic: AM0PR04MB5057:
X-Microsoft-Exchange-Diagnostics: 1; AM0PR04MB5057;
	20:OKZkaWpXNYkpvv+hVsQbA4py7AJ5cucjGdtDIy5/nV3NxtKa7i+QNA0HmdSTL8r8wm2dM3MtU4AiNHpZIbovdIjcHdhjVr7OsGM09mJYa7m3eLJQLCRcv8Vc00FcYfLqhzjxH8MxTY1h5tlxbtvmjqO//R+jUQBkc6IAnQIoHHoVRA86ivJEkR4ogrZKy2Gb6cbMvl0Y6rfBmdQo6frhMu9zlaJNVqBlxp4nW80I4avEZ9WmL9Qqu4d2aYLnD0lEc6YLgIkPGMipSy9TbAp76tdbMBPL9DMd8afJt5/GDPdF2e4rdHVbSmmstZTNFoS8lCDBMB5vkp58ayvMGKwWc5z300fj63cMMZZvmen4hA2of4EfhPBkAUWIasljRFph5+57VScgqfn4qxKR/aXWDwHUvJtyvF4ruijJs7nsefGSZEYpPnVkwNMzHZx/Jfx5HYzdeLeq2dQOGP7Cry1nAFlDG8/UURK//Hd+v4BHdlORpBLZJbwNA36ZsZ4ACGxm;
	4:4w7UFqGPYTtXUr7bFogOhdKNScxUIcVTRaZExjMzi1WcLfopA4Md59Ovkx8ntT9C0L5JfqwEALMSsB9RtmeMuImwA4HsOHApPrYrcoFRXhEYKS+jdPmxK4a2bQheX84ZVKI1FAu3FtV660lJZ9doytIkIvYt6TXB6nojKCKiTEmMEqlfNU9PelC0ktsgATLqpgilUFzaNNE7URA6xaUY+f03UenmTkt5lz1Kz+/3An5ytcn+1snPA9YlhitcZDhmtBrDU8DTZ0ptw9e9KCB0LEj06Lx/ncZaNvZNJnVkhj5UamOhD7CRSpavcrgHE9+/
X-Microsoft-Antispam-PRVS: <AM0PR04MB5057BFF27FBB73FB0BA3F32484420@AM0PR04MB5057.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231254)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:AM0PR04MB5057; BCL:0; PCL:0; RULEID:; SRVR:AM0PR04MB5057; 
X-Forefront-PRVS: 0722981D2A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(6512007)(8936002)(33896004)(52116002)(51416003)(2361001)(6916009)(50226002)(97736004)(8676002)(81156014)(14444005)(86362001)(6666003)(305945005)(6506007)(81166006)(386003)(36756003)(9686003)(1857600001)(6486002)(50466002)(68736007)(7736002)(5660300001)(48376002)(26005)(316002)(956004)(6116002)(53936002)(2351001)(2616005)(486006)(186003)(85782001)(106356001)(47776003)(66066001)(478600001)(16526019)(476003)(2906002)(3846002)(16586007)(25786009)(105586002)(4326008)(85772001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5057;
	H:sun.ap.freescale.net; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM0PR04MB5057;
	23:jjoil+xx9ONoUM9KlCmyYguBQxkxA9ixxw9pNSpzS?=
	=?us-ascii?Q?kmStHJ4xZTbx38UFPieuh5OJxfIP0cuaRwy+M18ZBmwrugYU9b1xEz0PIkGK?=
	=?us-ascii?Q?AWYd4y1isW5lsupZFHkOJBH1mE+72YLQxVClVhqGxv8z/LAWLg2aYeRLLkdW?=
	=?us-ascii?Q?zsHX/5ANYdIwvPMBuZ0cHlboZxlIAmJ3XvTnWwFVve/x8l3sTaWZNYXeDInZ?=
	=?us-ascii?Q?HygF4DaBLo+TdKV566Nhvy17HbET8KvzbMvYz8ovK4YnmAvPLXkqfej9M3qN?=
	=?us-ascii?Q?mg5khTL3TZYNF2sdbO+ZuwiYqpjtft5GR7taLcrpqeoLLddS6ZLoAPwr2FrN?=
	=?us-ascii?Q?uLJpWC1Fv8Fw1YiJ+9JJnNe5MV8Peh8CPHvlibKZUI0+vGjqX00oSUVDAnc9?=
	=?us-ascii?Q?A46D8QRjSSFGgKxjfVgFtKc250bJd0RbqVXcS3r2ZSTCzIarN+qDGVnj9XgW?=
	=?us-ascii?Q?mAmVmibAPjwYO4iDLEqtV0p5D+1ifddkJHO15KJzRTTTnHdVpJqMidVqsC7v?=
	=?us-ascii?Q?YncSZez2n4q36A/MoCGpXgOFxLaGoBgvqi5MfDfTKavOPigZeqbL7t9UZgcM?=
	=?us-ascii?Q?4lcAk6WhCdiWWbhoxMv/NCUY2AjIFTbLKuWIODOiS/on00Ten+zkMBezdpP1?=
	=?us-ascii?Q?2BnGj7eOi1n0NFXElBzeVf9VZLil15CWhEBlH0D+gwRwSh0mIlixMO1ZyjYF?=
	=?us-ascii?Q?0dJTt4+gBuTflQH45hKMYOTmehIyCNWKrz9SGuddatoN+Q7DIACjWWPuve2L?=
	=?us-ascii?Q?2O1bNzjd+8IjfZUZ+dWv+UoRlT7bAo5LxDI5po6qo6rvkdhc+Go3botIsWKv?=
	=?us-ascii?Q?MYZx4vkjCPBQoyYPn6djqH7CFZ0/UNWO1Hy270MAZsazz8i7GAzGQ95yE9i3?=
	=?us-ascii?Q?Nm6k0PVufDRZwWnmKDYAOMI1+TSv8KYIMmxP4ox4VOAqeob2mcEdZh6rctS/?=
	=?us-ascii?Q?J+HimOmuZRf9CUdFshE/hwZZZepHPm4F871NmCvNCIludO1gRNFhjEE2L36t?=
	=?us-ascii?Q?zDsTRBXO1vdChFQY6yRZbBuX3+AvhvR1DNlLzd6DI/NveUzbVBCcPOOzCumS?=
	=?us-ascii?Q?QP6Bymw+cucaBPKws6FTzjhDcxw7Oy8BOLc11/+wjCap9zO128aIbJ03hkVx?=
	=?us-ascii?Q?DYRSt6hUNV9vX16cF7VAQNOcpkzf03YgWG4PtBUuYkzOpIKpsn2fUFutCtvY?=
	=?us-ascii?Q?nTHLoTJWQWV8g51AN0mDzbDf8cSUa0DKD3cYaOE4uHnSRfFPuq6brJvNWyvX?=
	=?us-ascii?Q?td1tDACo6rMRmSWcZPS1nApJBb2DxJkXYjjHk7g?=
X-Microsoft-Antispam-Message-Info: 2bR5tw1wyueeWWtA9ABRlC1bBws+L8MohwsLT8x2ca+TSs98Vk7zr36PAqkATpTWSFtAa6JTNeTLIkcJrx1tOZf+NAgv8/L1S97rKEZV0V0M4l6pcHflJiQsAuTelGlGfal35zdedtynuzRhIy2aN9rNLIZVUyOCWrnk5c4FlksNmN/6x1PntqXewFvy4Fs6QIkEBC8Q2Sh6cK8RxwOIwf42xG33R8z6CfE1OV2RNvzjOnmiGLiHwoICjLL2jNE41XrLO9YP1HguzF2gbYty5uMxHWVnn+AKRIHaJ4VBlL76Zn0DVfKpL3OjNeSwVnPC8XzdgYsahnh9uams1+2pbWJwSIVby/UrWjlUnBt5SVY=
X-Microsoft-Exchange-Diagnostics: 1; AM0PR04MB5057;
	6:+2NHvEfCljQHhS3X/sabFoXvY8FdCUhtYbUefNtwWNLqOIRbPYM3c8TG7qclfRlcLqAk15V8HO1xHtSSV5zk4KgtQ89LHXQgA9J1ceo4fP+jR5rq5Ra2z6fN4VT5ycMP2Mvzh5mtueS988T3kNP9wkiVnJ6hcExsVkI1KVHnDvHTNzFPHBpbkZcZu40tfhgXlryx3ZgC2cnV6ZPaQSe3h6vJH36Hvhy0vrYGE3obXRgrAq6voMdKsnptN5+KlbJofStHJwp4ad/rZfeD4zm+yue8H4XQuPHgGDSn1Tor70NCAUcNuQ2r325CfLmQ0O94Clld5ZPaKBUljdMlX3bvnX2mTrU2LozCnHVsmi7DjykxVwfUejXK8HU1AQ1YKo8oW9IuJseHYDaw/clVxG6gnmwTb61aATTL+3gZxoNqFItbHU+OiyfvwQ+Ul4AtqFMS870bGWrigZBaQBhCmAnb6g==;
	5:nyyiho8pyJBEJ2IAixk0R6/ghT20FZ/zEAxdW+b3WkJ6Kzyd0H3qjMbixCPiUwdBz+JKmMvjz/9u2a7YgTtX/TPZ7P1cv5JEMTvvOkP/HBF3PNWVhBrSuFdqVxoEgAtDUPd9fqIJN04C/c7ve/EZ4tuB1pRCfrWFwNtbcOK3pTk=;
	24:QSQ+yVHsvXJko/W+guQDPRo2akyEiZ5Qk040EjnHevCzHRzl2d/UftSZkYxUun31VlPnrd7PWY57K2j2Tnu4KjqpAuBnNn7p8zutosf7FZc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM0PR04MB5057;
	7:qcQ1ri8IgDXVO8kL0bhkMfYc6IBW3g42f41FY8P+LvVB7E8NJWeOk2O+QIPK+BBzms6X2bnWg61jSy0WEImUbyNmOgB8sFm0tskHn49AlUBK76yibJaCsooSTsL0f9hqLc0jitPTZcKMmOvI50gmN6uyiyiAFaL5frpYIp9VofkNYv+t4oNKrIwdarRgc4y0TyEHuVb9jJr0h91trP2DrEgWJwDWiDajFYTzJ56h3crZx0gAj1+uqtlLETPcHEhE
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2018 03:02:06.4349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 447b2e8d-6e54-47fa-130b-08d5e0915cd8
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5057
Subject: [PATCH] kernel-fitimage: add support for ext2.gz initramfs files
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
X-List-Received-Date: Tue, 03 Jul 2018 21:36:58 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f84be44..8698022 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -404,7 +404,7 @@ fitimage_assemble() {
 	#
 	if [ "x${ramdiskcount}" = "x1" ] ; then
 		# Find and use the first initramfs image archive type we find
-		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
+		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
 			echo "Using $initramfs_path"
 			if [ -e "${initramfs_path}" ]; then
-- 
2.7.4


