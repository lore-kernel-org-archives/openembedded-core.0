Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 4628 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jan 2018 03:21:31 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0071.outbound.protection.outlook.com [104.47.34.71])
	by mail.openembedded.org (Postfix) with ESMTP id CC63278868
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 03:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=D3JuSTs+FZWxSqVMsUT1CbHbRg3TU0o7WqQVZMLLJ30=;
	b=IUNtuTjLDLkB4J+FIpBDOIWEJ7VFcLrmBSpCExXr1oAWXQU9zjFvxB6YhwsopAyyI0Z8iBpA6OpoQjauNbfqlabse8K1o0lP+N/Gxa7Mb/P78rBXTqq9XofaD2/FXurX2c211iNCtB77E+cSESGVDgl+ju1ImJ4VWaBAYx27OHM=
Received: from BN6PR02CA0028.namprd02.prod.outlook.com (2603:10b6:404:5f::14)
	by DM2PR02MB1337.namprd02.prod.outlook.com (2a01:111:e400:50c8::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.386.5;
	Thu, 11 Jan 2018 01:49:07 +0000
Received: from SN1NAM02FT018.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by BN6PR02CA0028.outlook.office365.com
	(2603:10b6:404:5f::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Thu, 11 Jan 2018 01:49:07 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT018.mail.protection.outlook.com (10.152.72.122) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Thu, 11 Jan 2018 01:49:07 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1eZRzO-0008TZ-Ce; Wed, 10 Jan 2018 17:49:06 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1eZRzO-0006iz-9q; Wed, 10 Jan 2018 17:49:06 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0B1mwE2004650; Wed, 10 Jan 2018 17:48:59 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1eZRzG-0006d7-Pj; Wed, 10 Jan 2018 17:48:58 -0800
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jan 2018 17:48:47 -0800
Message-ID: <1515635328-8762-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23586.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(39380400002)(376002)(346002)(396003)(2980300002)(438002)(3190300001)(189003)(199004)(5890100001)(8936002)(8746002)(5660300001)(81166006)(81156014)(77096006)(50226002)(59450400001)(54906003)(36756003)(2906002)(51416003)(36386004)(7696005)(8676002)(106002)(50466002)(47776003)(48376002)(106466001)(6666003)(63266004)(316002)(9786002)(356003)(107886003)(478600001)(4326008)(2351001)(305945005)(6916009)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1337; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT018;
	1:RSC87zr0UnIcjr6adXJM3qktc8U7zgCXuyoYKySJUvJ7RWl+en6/wJxapcktrhghIFwp1WO1TBJVnOnUnkv474tXqkJluzRXUke+U4fJFVbjPcO2Ep+yhFXnvqkSOt3q
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d51b183-6a0d-41da-912c-08d558958099
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM2PR02MB1337; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	3:joIrNFKxJRhj4DVGQ+1ij3bgZe9EjMm6unRfgEMpUMRMlCofPJtQff4NKkHJq0Rrl/aWEsx87ixlAmhSfPnLW6YNDMX2J+NcFbjjpFSXB/+pqu0tMGX4YP2oGsnSfy9XwfFc6Cp4opRLzlMiGCQAPnkqC0pmDMJoUFnpRByIkvTxldm/JM16EniN2qZkw8rDdH5vW5tbpB8XL+y+MARU51Ivg/3GFYJqD/NYibXS7EqY9rlw1tWvjdFUxHLrGi8Jpov0iwxayo2AOKBw0srJzkDqXobV62pPtBJmJNAuU3kdPcuJLExGFIozMnAD4T51rayXkSEQOh12F8L33S6jxtN3z8WIXlSLK7CastQcwq4=;
	25:J1wGfzmHKZBwlUKwhn3KPF2SvMiT0bzUsR/blQiXNbwFZKm6a2WpdvvbvRRN4nBvjZnJXjTnqKvv+E2OcgYqrDSx4dxMTA/KhynDQtjQIVjbJZf80NEO2Vwj30Zy0t/yyr3WrttoYu+OHroTPdXcbUStNXytFh98WHsNjQYJ25EDP8+aR5vXt4i38CLYQorjwmImls9QnK0CNI/7CHpBxFQrec4tK4mxEVMeocAu9Yy5A/pVVRDCrUW3cq/fpDmS7h4PF0pTmnieOmtxhjUzBTXI15v3MjTVkFYxykT+DLYWz6hXlAvsEldbo7EDxeWqJir8CIBSpPlyq2nXjXq7Qg==
X-MS-TrafficTypeDiagnostic: DM2PR02MB1337:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	31:/qjdffjqvuSJECp5RX/aFnTS06qvWHxkil2uN0yZG9YHA8xLaqnxmrQWyA8z5A+AJw330v/txvqZbPPHgYWtnqgjnPd/Uj9A+Zq+zuZWBm9oFGyXR+8Q8L1Nc2DF7x+5KYzSgDhQu3ICkbcP9poter3AFvL2tDB3SIp86ganawAyrq9VhZEXQAgRuVlNgF9Zn31ZuYq2C9Y9FmkYws0usXhSmX2GMuqMjAegIqqZTpU=;
	20:4L7UmzxrsEoSS47x8GgnACb2H1by05qV8VHVjk1DJRFoUSjm1dhMkEJR5n+kTrCiroJSfgh7/OMqwQBo46ZMNTiYZbzuXJm4HPnRpAfuQi8Ch4u4nvEoZ0qBBoShPiCeCV2YttnyDOiENOQIimR0I4D0ZRl013uvBe1hdgYmxJEUjmMX5IyA/+P6ivjuJ803N+3KoH1zxtspODF6HNFZ5sRAOmjiCbjaDL2u9f6O87srt58/9++fYaeW2QFsEYOhuiv8Ii9feLeN/nV/0w5+kP2S8jzPbp2dzACZDhs+XDbbxewsoenU7hQPbsrD6/Xg5b/U+8FlD9h3OAty3M1AgdDPEQZdxPFUYCr3sHThOAQUD7qSaPU1n9Jx1dmwOqhhLk/i6LjlsPoiCKuY4NZmjVPRkgyy1U7GTGN8XaHHq6ib33L1LEa4OS4Z4PlOTDhqBhMvZSyw/0NfMKiZ0jQ+fGmjg9p0jn1ad1sBQucZTR1Bqwu4Q3UesCjt1oTMDALz
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM2PR02MB133745241E28415A5C829766AC160@DM2PR02MB1337.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(944501075)(10201501046)(3002001)(93006095)(93004095)(6055026)(6041268)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM2PR02MB1337; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR02MB1337; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	4:CCXtw9wG7wmICorvd41+EuOeclpgFW1k6GvQRDri2+q8+bAIdCAxHUyCZMI/cAsrd3yfoC+ULimFu6tFu3H2D4lt7DV0gyaE9TrMWhbX5a7swbl9Tg1aPd5Ayya1GqQRussLv6bUoye4li9IEGaGpY5DqqASXW6Ho9UXTJjv1wF4UqmGky9Q4teVVhsyYRq4LGuZiT+2u3S0gLfw5cTap0GheyGL7toVb/2NIZCeAzDiZjIc8u+Q8tO20WoH5iMqvzyDxkT2aqY/vjLj717HuXvKaIEYtrkh2EB+Jr3mhZqrM9P9Si8+ZLDJVHYrhZgB
X-Forefront-PRVS: 0549E6FD50
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1337;
	23:5N3xFVhJp1z8Z5LfeqjnquXIj4VjFLH6/e8mkEotC?=
	=?us-ascii?Q?xPLc1gI9SgYmPE5FhxowrLIg+EepCGzbvK6tfaBkbG7eS5bDqUAu7I2U9sSR?=
	=?us-ascii?Q?Y3T1Btgf+Scggr9Ryw2ygoxxnZD0ZvIeoxv6nHIfR1v21niCg9BqDAvVUGgQ?=
	=?us-ascii?Q?BROIGzlPEohN/sCN1KDcIzuHSgN68ttlB6CRM24aeE6TGYd5kDupmW5tXxss?=
	=?us-ascii?Q?P5w1vCG5MX9T5CScD3HPmA9PsDomq6YUhCp8xT2vRumwPTo9LhTQr9okdYl/?=
	=?us-ascii?Q?VwTBuc4K8vw08pVevZaZGVUk/h0lxN1u5L/0NNjU8uhL/XkE3iWrwmGA3B0x?=
	=?us-ascii?Q?fVdtgNzsDWMm1h7BHSfDNQknHplmHBZyIle4gw36FjOgDaONldaKUNGTN5Nb?=
	=?us-ascii?Q?hu8+v4LY0eR5z7kruxQ9W+caUnDoZP1Y2BZ/nPOdhPQe4pZAmjEyicJdlgkB?=
	=?us-ascii?Q?OTsMlyUF38XrWQ7hLVuhbAGqru6IAPvtJCKx4QxgNxbFTZw2LdHuI17qupQW?=
	=?us-ascii?Q?Gq0/4tWLy0IqjTaPoq9xcq3NPM1ioScdaHygqQ9sHEewMR/KVq4btRwpoQDR?=
	=?us-ascii?Q?NY9COXU3qoHbrp/HWz0EOzCvW1GtCW7MAZVKWAdk8Rm1qwhW3PKGvawsJAmh?=
	=?us-ascii?Q?fGTO+6nidi1uejak/MpbqSSyUIKmYPf4x0U9pJ5x9Tu6MGyWx6JiKQ2DHsKP?=
	=?us-ascii?Q?e2XEYvTd3e4kVgNwQRofN3e7UzU9MAbwEolddQ+N9Ru3NAqac4NMzu4x3GqE?=
	=?us-ascii?Q?8yl73YXf89kttTuqazBdxClyt+Rwx96ZJEaNj8dsTWkVR002Y+tiHs4S8LTB?=
	=?us-ascii?Q?NaDoARQuj+NXshCWwjvYzq5kEsfWrdx9368GHCO/rhxZ3sckXdmnTxZS8LmO?=
	=?us-ascii?Q?NHHoj6igpCuH4Fd9B3AAJ0/0VwZP7Q5+qtvnckQJvOvmWWzRIMuvckm3+M0f?=
	=?us-ascii?Q?KqQpaktcjNgaUP8PmLDxPykxL+g9c+Ddoa9D4UMEmgJhP2p/2MnFnvYEFxxq?=
	=?us-ascii?Q?vPp1ht+BtRu/d83jH206saoSA6NpcqVju18TAQjtzKnKw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	6:Kr7ujx5KhiDTyJSSsAlFPM5KTQkEGxz/qEiR4/41wan7u1klLNMjrtOLnrMU30HbFZuIvqa9fsEvSnnSjGu3eNsOgcsCphN3wyMRdrzx2wlpWfGX0gJJN9qJa4bAcSjBxEedk74OH7rNemIfH8Uuq56RWcpxdsBRrGuxz1UvPp3JbVpWEYfj2uuzmBMQPPobaZHeGcLb5fAtQQebxSuog4uzlcoC37yF2nFySDjkCfWTdcx74L4e9ggvUU3i3hG4gSTvOSdYcb7rFjLFjFatWIOobi8c714TTGH4Jj7H38d1vm/xInT+C9Assq/3NJTNkT9e/VuDAv4fsGXGQIdK8yMw28AJ87s20ifDQXY1DyM=;
	5:OPoHftzxRw0m0tAamIQCDuFdlyaMH2oLlYlC8fyxA6k4wBKBV8qGKo2V976canXGgfCbInupS+XS2En1XDDTSQQm9tn6pxpWfiHtMRujTNsZqBXq6vfxYfVpB9dFFmUl6hVFjuBOU1em4WrMZqZ3ciQuYpEqpydQcv/bO6k4sA4=;
	24:bvPtBxPC4waNWJBIM3tPS8inIk64DEVb/VFqfltlRi3EnrMT6dLSbraigGamJMFrlNnLye2zBaVfWE3+IgDm6WuGwXWrsbp+J5tA1+kBx+0=;
	7:Ri20C/lZXO8x+vhilpWuN8WxaykLTGUSzoemOlHlu1NRRX0NYbanct2jGBy3H4zLKD5TTNxuWXEC0Nabp2MIjwcR+AHNo5evHWBOHK7J9kQS4YcwTONXXzHqvsowKksS9DoZV/9fOIcQcefVbei7ol6gzT3Mt0J4JnL1npv5jceDv3KSunW1mkQmqVx6H0uW6qeLN59HWBD4HohvJgYsCgHknHjQ0aPbLU0AGt3ZVkKgmEZJ40N1mpOot8s8B/o5
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2018 01:49:07.2306 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d51b183-6a0d-41da-912c-08d558958099
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1337
Subject: [PATCH 1/2] python3-manifest.json: Add some binaries that were left out
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
X-List-Received-Date: Thu, 11 Jan 2018 03:21:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Alejandro Hernandez <alejandr@xilinx.com>

With the introduction of a new manifest, since it had to be done manually
some binaries were left out, this patch adds them to their corresponding pa=
ckage
to fix the issue

Signed-off-by: Alejandro Hernandez <alejandr@xilinx.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json
index 72d95d8..031745c 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -2,6 +2,7 @@
     "2to3": {
         "cached": [],
         "files": [
+            "${bindir}/2to3-*",
             "${libdir}/python3.5/lib2to3"
         ],
         "rdepends": [
@@ -508,7 +509,7 @@
     "idle": {
         "cached": [],
         "files": [
-            "${bindir}/idle",
+            "${bindir}/idle*",
             "${libdir}/python3.5/idlelib"
         ],
         "rdepends": [
@@ -881,7 +882,7 @@
             "${libdir}/python3.5/__pycache__/pydoc.*.pyc"
         ],
         "files": [
-            "${bindir}/pydoc",
+            "${bindir}/pydoc*",
             "${libdir}/python3.5/pydoc.py",
             "${libdir}/python3.5/pydoc_data"
         ],
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

