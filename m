Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 7189 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Dec 2017 21:01:14 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0044.outbound.protection.outlook.com [104.47.42.44])
	by mail.openembedded.org (Postfix) with ESMTP id 86AED7882D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 21:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Odgvm48pSRVkd0MS/V7hxPkYcDsUYWz2nHnWLPettuk=;
	b=d9xoAgJ5laiHTb4YQuV3Ucn1uOsrJDdUgNXHnIZxRDqBIAfx7JmxLkkD2XcPPZ9LsOYfqU1phddPCIFl/+qKCkBz/ASn3L9bFD5EDik6qEmgBOLm5HGD0fZdL8ackPYXieDVGe9k7FyYs8DaIrlrk/7N/KHZL02R3p5awjwU18s=
Received: from MWHPR0201CA0098.namprd02.prod.outlook.com (10.167.161.39) by
	SN1PR02MB1341.namprd02.prod.outlook.com (10.162.0.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.9; Wed, 13 Dec 2017 18:26:49 +0000
Received: from SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::208) by MWHPR0201CA0098.outlook.office365.com
	(2603:10b6:301:75::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.302.9 via
	Frontend Transport; Wed, 13 Dec 2017 18:26:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; tupi.fr; dkim=none (message not signed)
	header.d=none;tupi.fr; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT005.mail.protection.outlook.com (10.152.72.117) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 13 Dec 2017 18:26:48 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:54616
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePBjz-0000Xu-RH; Wed, 13 Dec 2017 10:26:47 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePBjz-0003JY-PJ; Wed, 13 Dec 2017 10:26:47 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBDIQefj001084; Wed, 13 Dec 2017 10:26:40 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePBjr-0003HT-WF; Wed, 13 Dec 2017 10:26:40 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Dec 2017 10:26:38 -0800
Message-ID: <1513189598-9420-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23526.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(346002)(2980300002)(438002)(189003)(199004)(51416003)(316002)(81156014)(106466001)(16586007)(8936002)(2906002)(2351001)(8676002)(107886003)(36756003)(50466002)(47776003)(48376002)(9786002)(54906003)(50226002)(81166006)(305945005)(356003)(106002)(5660300001)(478600001)(63266004)(7696005)(6916009)(4326008)(77096006)(72206003)(36386004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1341; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT005;
	1:dmgzgKAOQxnqfdZfR71fKYRXE8S0v532I2xoeVj9Xue2PLznaHw/pisyi+zKV1qGPrqSn3VNfxrNV5xqoFKN/vfuO5Co/SgQmrmevcT5FmiHK/IH3GNm5hfVIvgabT8j
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f517154-fb13-455c-fda8-08d5425712a1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307);
	SRVR:SN1PR02MB1341; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	3:XmTPIsfKp6YLYjqNkd9NQqPSs5Fc4a/78n9VMX+yOO/8Bsw7Ll0CO3lkd0HNP+8BEeTNOSfg6sJgt0t3lv/ep15d0UPdNn1KRR7xl5xbpsbC66jy9xmstelGhkeE3HgJOwldNeqS21zxXnvf48PB0c3VcRF6RAGL5BmUMCjulFOwsqnDTP58MnrsbNM5YVM6PxHUgXtBtueB3xwIXNdY0j6KmZwNwhpNoUVop0YPQ24P29p1lm/EKvcQrnGMEub495dY7mYucJzHGohN3/DTxC50v5nGVn3Z+QoT+fYnKHh+071CIZ8qoSqBFYzhJAIpTCVgesz5U97529cC8ey7eRUqO4ap3BKgeMV9WMEBXP4=;
	25:pFWOReEicWJ+vb6rFNlBG/4jadgyRWk/dmdpD00X8bojaxHQm7SvuhNZzbQxRmOez8OqHvj4cvTa9zJXTyyQYJ3Ey0sVMfmrpPrk0BANwhqd6fPsvjLRW5g+RJa4p+OSGUXNRA91cJqEzhmFZ1EoliY8C2gRc0Q3a/iEIdT2BrVtWqmQCHr7aiMrp9x+ifPjgV9m1ce+7wsgZ5B13Ng2yvH4NlDpTCFQHAAnm9hEne68orXTacKA9NZUr13MljpoxSAkdBSHVfE9sBF1vf99sUFI6aLq1/vCD3aQgpeCZjScjDmNbP/LQ8qvjn4NaSyRHOfQegMjWvbY9Y4/9rFRMEBQfv9nQS89me90kd/wXso=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1341:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	31:M3TXtfA65ht8q1lCGTCKaR0lWLkJ5ZDY3zEnZG1Z649Ucs2m6L6r2ToLCwsKjqovt/CnUcivQJU6ck/TS5PMrhtgoEtZsFbF8AofOo+vyuf9MZJNo3M2qE+KPaR1hF8IBG7oHRZ/o1rav2Q2RpsNIF5QJXjqqiuR7S/aTyU6MzEgz4s65tLDu3h3Q/Qqrfg1otkjDIpyPLaOGDKN0iP7aBIv2H2AFEF8QO4jpM7P990=;
	20:xPypUKPiBNCEG1XeXwKrHuuJWHgeZKiA5euNqaVwLf1qcaquNLAYPwq1S90/4JxI1155zkFc9lIasZo+Qv2div+QFq+Cd7piyd6/jZWUQJrSSOD28TLU5UzMXIgvSBKMoZS3KL+shfVHDwPYn7t9WXucrqRTQ2yzg2Wxs9/zS3L3swIytDzI69CWc4YF1CL9bqkwOk3SNw0Bnq4AFrmaPxGtWD/mwO+1HD+BNCpc9JC7ugZkfgY+Ix4h9/eKgxJx2A646HuBdeitWZwMG740F9AKQLL3dwQ8M/Hp27+VXa53SK3Ot+DaGr0olvh7xDkBIkasHoBfU4HFqvQ9Z1A6Xi3ss6qQzTYDAeDZiyDpFELvOnSCxTwW048QX2PfUl4SybdizuwhgHCesj0/RAa26yN4bkA7QyyZF1nGndcITa3xbUqUpS6wDreJnjuOAAQkonrsK+mwMalNp5+EcIv0V9GsX7WnUJ1fyMnhexamU2X/DcRIAIjD4XWMgUl/jJXF
X-Microsoft-Antispam-PRVS: <SN1PR02MB1341990E27F313A6A092823EB9350@SN1PR02MB1341.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231023)(93006095)(93004095)(6055026)(6041248)(20161123564025)(20161123555025)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(201708071742011);
	SRVR:SN1PR02MB1341; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:SN1PR02MB1341; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	4:OWPB9GGf1gnEPHdLPa5xIZrMKOnRUdztQYuPL6/2M/HX50xRa10cWSqZLJ3sqGQ5f2TqoAoi1btSE6VbNeqGWJedi9ARR92EpVMe8TxAgfWZ91QNOdgNE29D0eo75jWU0fl1po/mspTkxs1nmYrnLWZ7Am2NQMCojxvEcIXdWd83fZUKtMOaAhuSuqS9LQxTXcAVw3L9dba03kDQwBLrXGY8kOXyVCs8CyKNSfse0eZ6CQbgsKu890/NMH5iwejX0y+DpByW8y8whDWl/3ekgMpIqQ/erpxSuaNJR4lfXhiRi5ibX9wGZU/KroOrJW4t
X-Forefront-PRVS: 052017CAF1
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	23:/+NiTSzZ3xkZoxM9lAHKUHDCuaOh2K74bQH3uxyBSYvMRmpRAFElxMQiG1GnuBQlWkeCT64sx+W/VvCM5WY43RX0rG2PqTTIiz1fk23qQD1qOcFSoZHQLvXMfCXtKf95NaGjuubL28cWSTg8RSJhbUKlNqrdmwcvWzLucWxSp5lk85xSbkk+2ZMkn5l6L3hLa+J7A4V5VtWpnrrkdXaGbpi7ZjPija/n/XI+G0ROmFvj3xXseJ5m3eD3mIExmBraG4riT3FM5C9xia+qsajGLWiQ0CXXkyk5q7z8Z46gQg5ZwnE+pvtMJHdpRw4afCm6M7SH9CeFgpD6j94Bwaba0saKLqngwskJCjWsECl+PfrEdF2NUcnh6awupmsSQ9rKQUqpErihim6H1uFP/wReRFeh/exAb0AiiGDJduSpvcPniDPdNxsv+pPyV7Ky5Dxc1gTcH8EujmkA4a2FsFBMwSJ/r5/VfUHvimBLgrxc54EYAUhRDuC0KEdftRKI8mRVIokMDjvSuO85bLcpUm8Q0hA//I41XLYaBiukXOB3+Iqs8RLtzO5M3uygf0IJerOqCIqJ1BjAyqm3Dr6e4pADhb/AyvXzRKUjzTOrBojWqO4TX3J1wpWF06c0hGFY+ah45ZB+ozdo/jxKa1uGmoQNkm5g2zyygq1UVeepjiLuJx9tQOJp5Mpe06TaDtvMHJk/fylN/IH39NeMeGWrDaTzscJ0UMP3dsGUCK8UHTB/UzgPKoYXNpI3y2Thb6QnFyq5VKNPr0589iNEC8HLmVAoBBU1inpJrKFuHvZlxd1e5ClBPvpOZHiUYHa7BVTYgWK5dcnBvCVuEFJRWU1XWg8Hj/OKcc84oD5zos4vuY0PuKh3R2mbyZEbPRf30yD02alisD1awlNyLUEYPFF/Gs+sdrdDGRoai/ClISscOPrDUR4kWUq3ZFqDq7EDygCY2iea
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	6:9UqNhNmd1D19euwfpUPkjOBPljAx5jIWDwhdqQiBqNXWxMheq7VYrQDHK+/DvE339O30jlu6wVy1EFK+SLc6V6MjMyCVjVOoWufrJkmT7z+t7ADOzuMEoryPbW865JDprLbgm+N72KbRsHVFoDpAY17fewNBpAOcns0dmIXbmEyWwrLeLrK8JUvZGBlsmD22N1qWqdMf+PWPm0WnV7NvaQpNuhOpEl1z9sY8dntDMu9nxobN8e7RoIlmCVnYVy9GjCRXWYM1Cg4XnPQ1WJW9/WgSWOsMiHjBQyHUH7yIjxAuyHk9yiu8aM45j/M6x0sVUfy5gApRnmy4hEdlGGmIo6q4f9McRXeIJAmgdDK9lBc=;
	5:+xbscGkkCj+ATKY04hQwdncJzKuqbpvXy2CLWXHRPDTU6bqzhLfUNXGv1UfLuJpYogEJljnPo5985u/XikO9IuYMbjZJoj2mvNTCTa6UL1Js2UIhy9MavNoqqNhDgk01Nw2m5lPnctz/ixYTsMo7IlYtgv4M+Iv1yzOYz134iIo=;
	24:xvDXDuYPw+29fgLjFx36tA2iwwHXnIIJLHFME16bmVrRVUoVx4HX0bVTmfZRu2DXsHJpmdOrkaA8rAy2WFZeGRZG1gEk8YaHlILIz+R1w4w=;
	7:i/PdN6x5CXUaY/EXV0Vf7Zv6fHmTdcm/f4FBFtewE/s+lf3GehX7/Xcq6KYA8S0XO+edsNgHFoyITXX4ki/EsZI3C6toT5dZs6WNl73En9NfSB5aYXYGOSezr2/jwjDcCRqCMSmTXBafQ2LNGt4w4KRvwm91dk16Knah2aLHL9k+q4yKFw09qGLUXYmSe+rA4lLeQ41uDpHcBP0EIeQuonO+fgks2t2hLn/fTU39guX9h3KEQZK89nmk/i3oq9St
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2017 18:26:48.3581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f517154-fb13-455c-fda8-08d5425712a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1341
Subject: [PATCH] kernel-fitimage: Fix bad image type replacement for aarch64
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
X-List-Received-Date: Wed, 13 Dec 2017 21:01:14 -0000
Content-Type: text/plain

From: Thomas Perrot <thomas.perrot@tupi.fr>

When using kernel-fitimage class with aarch64, the image type has to be
Image not zImage.  This patch fixes the bad image type replacement for
aarch64

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/kernel-fitimage.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 179185b..9baf399 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -7,9 +7,12 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH") == "mips":
+        uarch = d.getVar("UBOOT_ARCH")
+        if uarch == "arm64":
+            replacementtype = "Image"
+        elif uarch == "mips":
             replacementtype = "vmlinuz.bin"
-        elif d.getVar("UBOOT_ARCH") == "x86":
+        elif uarch == "x86":
             replacementtype = "bzImage"
         else:
             replacementtype = "zImage"
-- 
2.7.4


