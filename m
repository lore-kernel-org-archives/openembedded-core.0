Return-Path: <VINEETHC@xilinx.com>
X-Greylist: delayed 2029 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Feb 2018 07:03:41 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0067.outbound.protection.outlook.com [104.47.32.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5E39478434
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 07:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Db88tvQXJfFcm+Jm+9MiY8OxANUOfb+fXx+KTaqZgBo=;
	b=bfAJhK7RHhhiN+uRUvyVX0j6fUrsCdviWJ9qzvJmnKEVGbE4yqFDNbGw8YKiti8KVRhLgGxWDFxYquIz3mPUyHjAq9CRzIuOMxta9gAMep2lJZXxhZRiWZZwecMO6D+VmO+e0wU4pI49qSApw2UeUsgKGuVtViiWNaP+cIO2LZk=
Received: from BY2PR02CA0009.namprd02.prod.outlook.com (10.163.44.147) by
	DM5PR02MB2715.namprd02.prod.outlook.com (10.175.85.21) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.485.10; Thu, 8 Feb 2018 06:29:53 +0000
Received: from BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by BY2PR02CA0009.outlook.office365.com
	(2a01:111:e400:5261::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.485.10 via
	Frontend Transport; Thu, 8 Feb 2018 06:29:52 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT009.mail.protection.outlook.com (10.152.77.68) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Thu, 8 Feb 2018 06:29:51 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1ejfiR-0006Pg-88 for openembedded-core@lists.openembedded.org;
	Wed, 07 Feb 2018 22:29:51 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1ejfiR-0000g5-4w for openembedded-core@lists.openembedded.org;
	Wed, 07 Feb 2018 22:29:51 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w186TnAJ020704; Wed, 7 Feb 2018 22:29:49 -0800
Received: from [172.23.37.139] (helo=xhdvineethc42.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1ejfiO-0000fs-M0; Wed, 07 Feb 2018 22:29:49 -0800
From: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <manjukum@xilinx.com>
Date: Thu, 8 Feb 2018 11:59:36 +0530
Message-ID: <1518071376-7716-1-git-send-email-vineethchowz.chowdary@xilinx.com>
X-Mailer: git-send-email 1.8.3.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(376002)(39860400002)(39380400002)(2980300002)(438002)(199004)(189003)(77096007)(305945005)(6666003)(6636002)(4720700003)(50466002)(356003)(48376002)(4326008)(2906002)(5660300001)(107886003)(106466001)(59450400001)(7696005)(51416003)(336011)(50226002)(8936002)(575784001)(81166006)(8746002)(8676002)(81156014)(36386004)(63266004)(1857600001)(186003)(26005)(47776003)(72206003)(478600001)(316002)(5890100001)(9786002)(36756003)(106002)(110136005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2715; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT009;
	1:lUcmJdZXp8c0vgsAAG1XAfr6DVT5BBwnZtHl9dqKTz4blQnl+yfTnQRwA+wgqnadepuCMazorQykiOnIlwnZuUqSE3+KSF+xihoXuQNi1Hf5B5whu1nHhrhU1mmug0UV
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7671e7ae-d378-429f-933c-08d56ebd5c5a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM5PR02MB2715; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2715;
	3:ptTUNDYVnamtXnxANhdTjDAW7mDDBrjbbNg0cZvi+l6a6nMH5DBou6DZUzipG34zLn3LaO16KN6n80JZ2604cnvJP0IMJAcdeTTMNeOTGRxgCnF8KZtJDl/oRRdHgDuUk9Dv1YqBoiGI+Q7JVK0uhNdA/IOF3t4oVW4BoPdZ5jU4NMlqHxuxT75XivLpbIqDsbcltOe51v55vbQwmsu0tgw6sKCdf4NR0TUllQ7MtEf9RHUOvTPCjcGChIUUAVEl1B+8HiXIk15E//TckTRmmM48kPvv5wgWSknEvoCMKZbq+1+Sq34g3YXp77SiHaA02nF3Du/n7zl689BKO9ZGcB6KNGCRjCO3MKVMvjYeuqQ=;
	25:+LnkJipkTUHwJphw8Xwyhw+xbNI5Muls4b2GKTutwFDJrp2CU3ROmT1005MUKU+CM56isDA3lQuOoZkz7+F/xAeD0cqXCBdCFP1zXI7IE0hcf/mf6sUPw6U2iT3w18QhxQ5JdJXaaVkesQr1yBuIA9DRJHGNacNAFojw9Nj3kpW6HiRBnHiwJjnJZKJuba5/5ask3+hi+/PJkqbJla6eu/tUTFN4AXNC+0gdR/rhk3q/fHApw4abmkur0UZNkUoxAJGTa3dkwMr5DW54qwb+cfD2+PBzHcapFexYa0WkwqLM1T5Tsi7RyRXAuM9GwmC2VnqIvaGv1X74Z4wvC5WLqQ==
X-MS-TrafficTypeDiagnostic: DM5PR02MB2715:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2715;
	31:pyf2bGJPwcGImePgRTq30w3BiVF8khYzipdODh4tKx/ljMZr6Y7hxSwfpvUDKmVUYSIw+T/jUEU9q4USPTVU6kIUMn8TTbxS6x6sxn2Z3Vd/EQGjw3WMj3dNClfR7fQPvAnxUQcOOFyAd3ICgYkO1mz7ujBoWV1HWlmfTHA/l/4UPQF6xQyO4Ntwjy0Gx4ZC4gxFtaD+X21S3rtbI1ywyAk/qSARIZEtMsPc2xe8Y6A=;
	20:P5j2rJlNmeNF7qe3lE4koPjUZoDBrFHjXECbuK7TUDCdDdo90iuwz6NhTPmiuniTJ0T/BT0+oQ/YBSMeiegCJLE3hVEjqSj5Fq+HTjZZt5d1UNkQlaR8Pk5CVDr+Mt7tsFIHc1V1YIK6CxtFeYqmztyO5eBHzCOZ5V4iU1o0pQ5JaaXJbH9ze6y1pgDFhKYtzITOOjvd3uQNY8+hrcVo232E9Lz049Vb/47QN1m3l3AsRrrHsaKXRmriNRNtrh0RYo5A+xSZ7IfbDj37CgKjT3zdnatB60jk3jtSZXiq5Xj7BHgtNJbr27Br1H8JWti7CMjVUPoE41KH/LAxWqAnAAscWyVrUSrKAabdQRumQBoxgZHC+0MLBDjHeyZ68ia1KCJperX+bkoIA5XrfAd1kXShOE44xWDIha5YgGvczpP0mhAaDrXpZoWyu+DVXcSsRUeuXVHvzbXS3unZ/2iKrJxiduRPpPYP7h3X0H31MGkVuZfYIlaESSHDSxIypBd0
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB27157673F2FD73A6D8176699B9F30@DM5PR02MB2715.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(10201501046)(3231101)(2400082)(944501161)(3002001)(93006095)(93004095)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:DM5PR02MB2715; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2715; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2715;
	4:U1MR6fCbxSZ3Qq70xtaPABT9PlwGElZ37Gi4WzkhpvhDxcCPoRS9y2+dFqfb5PQrfZ2x2/7qtkGjpzFNvQtzZ3Qnu5VDBic3PQkQYIfh3mh9FNTVy3uxmx4brTHaks9e8pSAP43r2tu3PGrrZbzvE80QG1Fqdzqn9tlokaaIhfiT6VoVSZPubDtWEs7NHCTC1l8vepAvYe8KU81M11oxaRjrnuzs97srlxphuaYf6lRyit6Drsag01i2amGuGN4wrqYCyXSNDYooZATI7fX+1l4dTqQTXZoS7hzrG+SQ4DeG6vVKPGvHT3bmwUj+v7nF
X-Forefront-PRVS: 0577AD41D6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB2715;
	23:bwNClrgbDMPIBB/2mTFVPgF30cUP7bKCp8Y2hEXuO?=
	=?us-ascii?Q?6cb2aCtWyYkOQ/rgBDUZGlXZip3SAVojxbfR02nOU20fi5A6W3gfHss2vnhU?=
	=?us-ascii?Q?QmtzREnEmEEihEImPcqnCn2wo86kUst1DY7UbU0Jnj5mu8PAsOdeM04Xju88?=
	=?us-ascii?Q?JvNxJAzDb94umo1soztaDKk20uUkafELAT30RZ/f3MXSed/Ye4nyieAPKL7F?=
	=?us-ascii?Q?/0bNaFVy1B1PJxicKz49Y93Wo6M34dlAis3qXG9DYZ4IqhPBDK7tp1ed+tNB?=
	=?us-ascii?Q?zBfBzvoULRb9nsNaFJVI4/wXmUJEUjbY+HtHVZ+UbJEWjIHdMpLg1+uFSxbQ?=
	=?us-ascii?Q?W37C/+bNXqig2ylfnu+Ix2XC2EPKYK6UZ0JKbCcFDZO1k74mVUrgLY+U20DL?=
	=?us-ascii?Q?4n5kyD6MAFFPF+Lr2sU4SiNinPTR5vYI3YUMJ5Xeov8j4TuS7wA0OipGFZvG?=
	=?us-ascii?Q?wGAGrtl3RleOwDVfwLxs/quNRY1VTf1wWz+iU1uNDTtXtxsZL4DMeYV7Pfic?=
	=?us-ascii?Q?IBtkuK51XN3XWXhyQ/7ymjoXd/LbHHsRsSXjl5pLqQzHHN8L4nbZSOuqhw/R?=
	=?us-ascii?Q?zKPlQzfyccUFAGPlNmXOhuULTs5BkeBDc1Zb9oES/ieJA0w+9BlUJ+dqxBUt?=
	=?us-ascii?Q?hSXTAlaY8Gdpx4uSBlr3DjBCCfzor+XEmL5hl9RJrfvP3Mz3MrFyDmL82z7X?=
	=?us-ascii?Q?TYqdq2PcnrvtqKRTDQlp0u86FAqS6QxNaenV2318ICFb17P26E3rMUpvVmrw?=
	=?us-ascii?Q?/Guy8vaof81UeX3veRrb2Mr2zpHdAIuVFJxc7HEjj264mrwGOmGNX26SRyd3?=
	=?us-ascii?Q?N19U5XwkbKf3ypcRdH1ST0Ds+HSZTRwz5MVDGOUs1RNLFRwlq8+caIg1O0E5?=
	=?us-ascii?Q?QjVq85fwxGn0STANfc4TQgeXvnNFrWSuFXV3R2EZMgY71wdOgFmfGfXMDAS1?=
	=?us-ascii?Q?0zkKYgkPjcNz6Kp0FlBjD1geAL2IBcXLq8/Aid6kUygQ1XyNpLOU87+oJP0e?=
	=?us-ascii?Q?uPnDyGUrtY2qxxxQgtwVVNYcP9JsDitKW+i8wfN662mraQ2+lcSYVhlXHFh1?=
	=?us-ascii?Q?kP4RTknkEHwkYpBvA/+1pL96VGN8QKrEIuBmrD1yjgZNny76EjNoRI6T9Ozz?=
	=?us-ascii?Q?zXqsfJlQ5w=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2715;
	6:/ETv3SgIGZLlJ31/3X0mDMPrjzV3KH0hl2Y0sQBOt7ws3S3uLjoXQaUvcWzZqM8/XUE8rnXVXYucE9V9Y5fEpnQsPE1Ynf1DsUDdbWrYL14uJwaPnYBwP2DSnnnYrcRojzQt7ftX9LeePGxEdMu2RuX1tiD1eDmYBGKvnrAeuZ5B+oI2FqzdpESyaipDJF0NGOsi1En1POtjzFOzkPy3ZLAfl2aottGBaJLGFKNfjkuyNmYZTeQoWCSePHz12SHAb3bDtz1KnaTvWgpOtM3LPUdVVeJmCEg6v9BtFZk3XI6Oy+OjdubkA9cPVthjtwel0Lv1fCv6Hf15qRPUMek3jnVogqMxI41n9Xs2ObaKpk0=;
	5:0CppinoKzyqzOkdxeZHm/FK8E70FXxEhD9iuEQcCTsKSMqf6xhpiGmGgz3hYgQkYEddKqNjYw4De9QhetyRdgws67TneR4M2cfpbpM3QUXe6wxd+OZpkQapgurF/tIC+GdqP7Osk0LyyoZf8nqvoA4TLq4XPhmE7vocMFoqowyU=;
	24:O6PCO1/btP83oKvIjwFB5tLO4wBfOnmEw499Ms+JYg0yI2EzMJSGL+yBmV+aMs3GBSHRZvVcAUq+xCplNhZyVIbgK4imaDy+1CmMncnLXyg=;
	7:2vpCSygKJ3AiJZJnT24oVkmaH6VlJfQ9kjoQjvhXAu8Z3q+w4+ny0rBhG3qydG55/9tVmfB8mFf8g1XmzLHowLFVkIzZ5HyZqAi8/Hfa+XKj3mKrJsdu9TKNSkThqpHcIXJ/4FSqasdwvQVcH2i1Rgb7wL0LkIofNYLDzukI4CbV+THDLD5836Q37+W3gcohVlgPvx5DjELBIg9bzlHvVeCTrSnlxf5AuxzO2N42CTQOLFZ8+uKQU23yLTGnZZsb
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2018 06:29:51.8232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7671e7ae-d378-429f-933c-08d56ebd5c5a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2715
Cc: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
Subject: [PATCH] kernel-fitimage.bbclass: Fix 64 bit ENTRYPOINT
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
X-List-Received-Date: Thu, 08 Feb 2018 07:03:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

64 bit entry point should be passed in 2 literals ( "0x1 0x00008000"
).ENTRYPOINT is assigned with first half only and erroring out as
'command not found' for the second half. Adding quotes while assignment fix=
es the
issue.

Signed-off-by: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.co=
m>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fit=
image.bbclass
index 914358e..b7d0e10 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -109,7 +109,7 @@ fitimage_emit_section_kernel() {

        kernel_csum=3D"sha1"

-       ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
+       ENTRYPOINT=3D"${UBOOT_ENTRYPOINT}"
        if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
                ENTRYPOINT=3D`${HOST_PREFIX}nm vmlinux | \
                        awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print "0x"$1;e=
xit}'`
--
1.8.3.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

