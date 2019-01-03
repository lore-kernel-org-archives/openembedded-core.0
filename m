Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 72640 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Jan 2019 13:04:39 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780082.outbound.protection.outlook.com [40.107.78.82])
	by mail.openembedded.org (Postfix) with ESMTP id AF69B71A74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0dZzSfVrwCpwTNwM6QOJ8LJ2GtAnRDSabkzoSInAcuk=;
	b=p8//WhBpAVofXVdjivboOFE1NBArTeTBqUNBQMHn9osRujAdVB2AllLK0PxEW7W8qj46+7ztnIu7PygucIbLAGNHeZz6ej9R94bz/xWiHZTI4zMorUz624rKSUa0orTYjltzavngc3wxnRupX1eKuaGVfZP8ki8MbZ4brq0G26M=
Received: from SN6PR02CA0033.namprd02.prod.outlook.com (2603:10b6:805:a2::46)
	by BLUPR0201MB1891.namprd02.prod.outlook.com
	(2a01:111:e400:58af::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1495.6;
	Thu, 3 Jan 2019 04:51:55 +0000
Received: from BL2NAM02FT045.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by SN6PR02CA0033.outlook.office365.com
	(2603:10b6:805:a2::46) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1495.6 via
	Frontend Transport; Thu, 3 Jan 2019 04:51:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT045.mail.protection.outlook.com (10.152.77.16) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1471.13
	via Frontend Transport; Thu, 3 Jan 2019 04:51:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1geuz2-000444-O5 for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2019 20:51:52 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1geuyx-0007Iy-Fy for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2019 20:51:47 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x034pfDI022939; Wed, 2 Jan 2019 20:51:42 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1geuyr-0007Ii-Oy; Wed, 02 Jan 2019 20:51:41 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jan 2019 20:51:40 -0800
Message-ID: <1546491100-4909-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(199004)(189003)(305945005)(106002)(4326008)(51416003)(7696005)(36386004)(63266004)(106466001)(5660300001)(16586007)(107886003)(316002)(72206003)(478600001)(476003)(36756003)(77096007)(2616005)(486006)(26005)(2906002)(126002)(6916009)(186003)(336012)(426003)(2351001)(50226002)(47776003)(356004)(50466002)(48376002)(81156014)(81166006)(8676002)(9786002)(8936002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0201MB1891;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT045;
	1:6/D13qFF7A+zyCiKoAe2v+32CWFxzF9NOUbDLSrEzAYA7O957ut/esI2czgM11Q2M6D8r3Ap6dDIIgRpPpfITV1fmw3KbS9mUZ2QK5+hNZt0u3monvUNhhNYpMRYfkJI
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e6a2a35-a554-4a30-0858-08d671372ebd
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BLUPR0201MB1891; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1891;
	3:oQMIoNwUvgLnCgr8P1IdlzZQBR5sqgf30BHrrac8chDOR8/+NVLEM2C0n5/fLXtQuVUujufNksibf+bRmqNSl1Uh8mLUC2ADuXMaA2bZ53flWTE8iGtHczubByVdeo1/zYl+gfzR+GJPN1NTLkC2H+HuFoz/9mEhoBua4xh83QB/BeP8D4JXlrstgopgCOrIQA0tv3S1dgYqI4D6lIf6Z00MTs4oNPjMRymu0huiIo+tPYq1KEsJpAmJlkVvCu3eZC3Phz4X0L3fBJ5qyjWaC5+o/Aacji6GEa3KziN0MqDtvOnvqTj7L4v1SzmBmlbuaSH4JnO0LgoA3wOyOqP0to/Kxhm6s7lFgvnWVF2hL9scUcxQilHheq97LrgEkKhS;
	25:oJWypQ4UTRt6eLmVOsLrv23Eg8EGgWi4WpAmb6c1WKTkQFNaOWAM25I8HEIj2Uy5KJcBEIicvsrP2oC248O8bbirhdigWQN/eroAdxHzGzQmDufSC3nVI2peGbjb23V+SOh37VnU8Nz94IdLTBwx9dfyfHrV2BNhKY7DgQQas20XH1nAnbLwch4cwRg0yxb/ytci5CsYJJBnjnVG4IkPYuiamc8tiaN56sPbaTQvX0YeRrHohOZlR639L82WebOlwsaKLozGxA6K3SHgBUasqXISq7Y+oy0Zk6CWsJ5lZ0g98NMYvF36tspIOY/yEWHYCsP9ZklMmlHFcl4ThaO+Pw==
X-MS-TrafficTypeDiagnostic: BLUPR0201MB1891:|BLUPR0201MB1891:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1891;
	31:nlQ2QQ38HPHDaAEowL4id3qFIMln7+4d22NakGh+rO6QsOqn6LXBJrBYLrCac3zrhm3upDiimAzRxtJPXc3tc0rlGiZisMFzyeUb6uOtaELgNAOWaE05oeECxXMTvNPS0Ny+VprFZL59sAqJMOrkkHqO8/y2UKXg1yKYJj9p5wDnIfg5cHAnFkAWd9hSSnhZSVRLCX2SOoPUiWrcFroY04RTmrJ4pfLGHnxGwyLOLcA=;
	20:NPuv6AF/zRYxK7str1UmOq3UBPs8BroniyRXRVwqBSWy8/RK7i5dNmIP3EaXc+7tHHaArUECQm5Af5sxthh2Z8xWcqtQn/xRUkZnVPZpwNF/9O0Y9++FYX3RhqY05eVR8SqvoMaizqWLow+y3/D5DFgP33dzlFZLKcwKNOeGPgwnLcdvNrc8LKQx28pImPigMli6gASYkdNnAeh3gGrof06SNIAAnTYUEe91pAikHwGGL7USPacfNGZ9lIftB+y9wGEmjM2ZTelCioplq9uAsABz7dkCKu/Eo9kLzaOPB8+7euWzyy98hJ52I6pDaEx815rDXjkstCvq1Rynm0/NZkI9dqYTtKSkKYXuXfRr6kdpd5ubNC5JuT8rOcMjrMcbsMy9TEAXSZtwQ0jHhHFmK8S+URv9NJeoIN6E7HjI08PhTg3OIEC0qHSBsf/K47MvzU+CdoPITJ6WL74mL+KrrHej2DVkqUIz8R7apG8XpjWrVyXIxaJmsXfuj0mTqZuF
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BLUPR0201MB1891A5E83AEB6C5E583F0600B98D0@BLUPR0201MB1891.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(3231475)(944501520)(52105112)(10201501046)(93006095)(93004095)(6055026)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:BLUPR0201MB1891; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0201MB1891; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1891;
	4:9KBWkONvWCxKowj8JnVSB75Ch5pguY/ml6PFirKZ8qJgC3QlutkkALDr5LcvFQJPVbTU/VGbTcw411yU2Io7LOKzqS8YFIQcyvDAYZePVTzcUJvjqlOY7c4mUo4yJ11ePtwWNKggkhj9Cx5nO9nG8FV+UqoQzugBK8R6N3WxCSuCA7As8uEswaJ1U+Z3eGVoIqGS+NW/DWykQYlaNtnVG2fp8GuqwWHfvfXJ3pcMfgRY74cQondg7yxaRYwG+wh/ksj57yMGM7fQFge6v3KKY32t0wAiCwrjL1quVuc4jc6p8yfv9JkghTD8SqvOrnHa
X-Forefront-PRVS: 0906E83A25
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0201MB1891;
	23:n9lmr+tXY0mvFsnouGd6VKgCQTuru9u0yKb261X?=
	=?us-ascii?Q?IjeHZnOgqoHlooJVeJnI7bGvyrrSIiq9+lU34/Gv0rwawn5xjP6p6vBL6N4T?=
	=?us-ascii?Q?aLsSVljn1Rwc8pWjWShryodPHt92BRMOlGrTKn3VASDMQ1SyQleP4718hHSQ?=
	=?us-ascii?Q?HSHrGTux/vp5vBT2gQBWkQAjIrxZvH4pNSNS2XmRAlSTNvzWaw4ricP5aWZG?=
	=?us-ascii?Q?eHOtGFcHGh1YkzEG8JbiZqa3WSXBFd9uYimRxoiufIq4cYBZe72XkDgtCEHG?=
	=?us-ascii?Q?0az4gKU/mKCQaYKOtehYaoGZnaJyYlnuxM1QVWpQVpFfYfUy+nFNm1rFCDoA?=
	=?us-ascii?Q?I/XoYQd6FIVtKsup6iidQFfabSPklSK6D+bjYN9lZZteUDdZ71iBA9svdUQ5?=
	=?us-ascii?Q?b5htDKVBR4VZ3XZKTlUgHoI5u8e7Fe5pjpVN2yg1LXGCKm9FrnYWMQtYh66X?=
	=?us-ascii?Q?7BiPNHo/E71dkXpJJekvAAZ3sbobLvYwExGhqc/6Ien04RxVOULJS4oI2+sW?=
	=?us-ascii?Q?7uOVqcJPODuPdDI+IvUBOFUsAHUJKLKP7+Xj/3hw79lgco3RqrAReXq8ERUJ?=
	=?us-ascii?Q?ZcNmchpd1Koi1peth11zSMGZOJWEJsF3nP6vyjE46kGfkEwvejaJznsc+R+L?=
	=?us-ascii?Q?0Te0ieiirLFZrysAAlOdb+E1jrximeQBwF+n9CfKP8dU7UV/wsxLtUVkg4+m?=
	=?us-ascii?Q?I58MEE2plvnZqQs+u3bjPWuM+q7YenLCKmYdbKTfAWYR2zJt4WyIlOjzIaSW?=
	=?us-ascii?Q?EGZSpTc7ooQJ+gSa7sbjAJMPzlgQRt/r/vT107CoWo3RN2MX5zw1SLc3cMLD?=
	=?us-ascii?Q?XOLMrVycpwNJMfF8SvEC/EMwnFx/jhJKGOIFx+w/Q2gUsiXlh3OYQmBpOIr7?=
	=?us-ascii?Q?dGLSy+KRUC92MPhX0ffES8SSR46yTV859UVZ1sp6V4XLjE9Cc0RHmIGtjLXr?=
	=?us-ascii?Q?uHr4zuu4/uzaSo+lHgLi+au5Du74b15/WLaW3NvMdjc504m6LCiLKA2nFIkn?=
	=?us-ascii?Q?PDiTpZxsoRpGyVdbHvrnutHl8h1mXnUDODY+yzeBf0vFXlA=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vVnGN6CMmdEUa3BgyszwCDMnaDDNDQskFgLA6Qh3XHGqQP3UWo4m8DUUnUTkidBwCadqctE2MHPM3GH+dOkA7ggQ36KJUm+dFHcvZQM+BprbQnUmeMZs6OPu7qSS8y6E5UT5hbP5reYuCskefeZb7DWnEpvUaTzVdp0nGTbt8mwIuvqp6V94ildoLe7gic5Nuz9GnDb5NfW2BLMmqROBCfSWrDUrKW4n2f3Sn512EFtPo28eSvCCXG9E4RxyxKQL2q5MWuaX7wMJ2xM27kuMHu5/Jmxgbqi3wNNNNatIjcMmmiYCosJAQ1SAXs72fZ6c
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1891;
	6:lKPJV2s/JsGSHXuLNbCv8dxG8TDLxr0sYCfBicvA+zsyt2Y3CfgZGk8M7uFTUwkZSWY24EizFzo0pps6k2oxqXRzY+cOoeIyAmHG1uiRwCvCksKcebBB5BFWs5cls9ibxVbKYo75WrvTG69jXo4sLyCHSliAsYsO/UGTuN7bFjnaNdUy+/9XpcuCNoxI34zFm9Us2N0bnHfxe/d8Y8nV0QazG3jPtOx94QNvDU2AajWSiETqJCWYoy2W6i8jLtP3bdrq9qh35W+H6hfgfgdZmXWzrUNQCi0VPukskpQMA29QkKdDhKVZr8YTDobBVfqILSg+TC0/e5/nTOB50wxdK0n195ihbNAbTaZ8E2MNAt13PgB63nl4epmX/CR63o0g+7hOQQ/6huE9X8ix/6QOQ8ULaz4OV15fFc5hXm+VZciSslgWL6inCzK6i4jIlMwz/1+0tzRxqjOxyiBLiZrEQg==;
	5:73F4vUbDFQxV4LJxE6ALdOlaTgioeiwPnvGPnr9pANGND8sApw1pLJYmKDm+2HSd9DhYeyHxYkjBp1Lf8vzVEFH+tNJqS5oDnHQsyi+6qS7QvwCczXRYsRQH9y/nJEAWHaqWlkZ4+NpgVzIhYhIbH3ZY8oUiD70MDncUceMtVyf45gf9U71d9eSnPZyffjVtIvQze8sFvp3qpGpT25jUVg==;
	7:oP0lE19Ji6S6QhLik5abi9BRCykQ3GpKT/DvPD0fluhn2qwIIrgB1TrEpi63JB9PQRYXuzuUFoc00bUdbgKoabVb52S+9KPL7Gcgr+CC5fZb9w+QdDsvuxaMoh53AKuwLVnxyPNPN84EafJWeoeMmw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2019 04:51:53.5940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6a2a35-a554-4a30-0858-08d671372ebd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0201MB1891
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1891;
	23:msMt9R6mBKnNgTDHt52uRWjaovnfEjpoL//cM2jbya/RhL+yMeakfglBRb5kuS3Mja8xMI6+hp48Ck6M52meqUzwuhZIzl60H8DLhjgJL1WNP5u11eQV4eMR4DQYeY+lb8TtN3yAtYNovrBwPCFmcw==
X-OriginatorOrg: xilinx.com
Subject: [PATCH] kernel.bbclass: Fix incorrect deploying of fitimage.initramfs
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
X-List-Received-Date: Thu, 03 Jan 2019 13:04:40 -0000
Content-Type: text/plain

When kernel-fitimage and initramfs is enabled using
INITRAMFS_IMAGE_BUNDLE = "1", kernel do_deploy tries to deploy
fitImage.initramfs with following error

| install: cannot stat 'arch/arm64/boot/fitImage.initramfs': No such
file or directory

Skip deploying fitimage.initramfs, since fitimage does not
create fitimage.initramfs

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e04d2fe..60382bf 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -682,6 +682,9 @@ kernel_do_deploy() {
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		for imageType in ${KERNEL_IMAGETYPES} ; do
+			if [ "$imageType" == "fitImage" ] ; then
+				continue
+			fi
 			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
 			initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
-- 
2.7.4


