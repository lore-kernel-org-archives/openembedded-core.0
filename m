Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0073.outbound.protection.outlook.com [104.47.32.73])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBCB748C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 20:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=XeM1mXkiDgOZ13Nm625O/eTehCKutv7+1jEUHeIEvt0=;
	b=m71ipT+R1NKfmEhhVNXvFf1VwV0BkYvrohuC7O/vTVQiTmWS2kFXZ3bLq4Lm53zWcf1sMWhTHzfihLf2lIr+crMBGFXmQtitqWDY1BDhipgYgqtSMwAewwk1VbSpveaFwvsvhdfZgBnGsNqso/oOzTmyFCez18GXsprYgFQGZHA=
Received: from CY4PR02CA0019.namprd02.prod.outlook.com (2603:10b6:903:18::29)
	by BLUPR02MB486.namprd02.prod.outlook.com (2a01:111:e400:88c::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.631.10;
	Tue, 3 Apr 2018 20:35:17 +0000
Received: from BL2NAM02FT011.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by CY4PR02CA0019.outlook.office365.com
	(2603:10b6:903:18::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.631.10 via
	Frontend Transport; Tue, 3 Apr 2018 20:35:16 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT011.mail.protection.outlook.com (10.152.77.5) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.653.8
	via Frontend Transport; Tue, 3 Apr 2018 20:35:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1f3SeA-00014o-FC for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2018 13:35:14 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1f3Se5-00029N-Aa for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2018 13:35:09 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w33KZ5XE005835; Tue, 3 Apr 2018 13:35:05 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1f3Se1-00024y-62; Tue, 03 Apr 2018 13:35:05 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Apr 2018 13:35:04 -0700
Message-ID: <1522787704-31367-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39380400002)(39860400002)(346002)(376002)(2980300002)(438002)(199004)(189003)(126002)(50226002)(9786002)(426003)(63266004)(48376002)(50466002)(26005)(106002)(5660300001)(186003)(2616005)(77096007)(316002)(7696005)(106466001)(356003)(8676002)(305945005)(51416003)(16586007)(486006)(81166006)(476003)(2906002)(1857600001)(336012)(8936002)(81156014)(6916009)(36756003)(59450400001)(72206003)(36386004)(107886003)(4326008)(47776003)(478600001)(2351001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB486; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT011;
	1:F6NkkOaVUjsrnfdUNSfE6P4jtGRXYl45rKcCA2W0benNNWXbK1U/+5Vmm7RZbl5kHMXuNVbBG4V4RLl2OnzemBFJ8JAjI1q0AAJDlxB+jl8MnLirbkaN4ixHlQFNOxc2
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79ad98bb-2ad7-4781-03c9-08d599a26804
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BLUPR02MB486; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB486;
	3:WDtLFOhhP1p2MKP6z+Sm+tka4hQSt6xdQSg/tlSF+A9K60gm4YoZ+BtysjgYzpk918Yb38eY30fi/75LUSzQL5dDHbw6UTtru4bCsTQUA1EPqUS2YQ6JK8t3G5dgzuXB4ZALtgEgXfq9Zqagas7/wB/hbg3y/0tBT8XzUw39LnOH9AgD2bcj6U62746fWJBL3vwUG1xAAEIGlGklNieTMPLCvaBy9CIUG+vXSdiaH9XSFgZ/NfHy/tXXB17Ya9QsGs5xyXX7KPwhdjzhGAZUnULatOYct6qtQNZiqgKciBlppot5jvO+CAgEbIRAFToTLwH9cGM3s6rU56wBjN0LAt3rzZTQkjeIoRUvDVpt5L4=;
	25:JBY025PS63IW48mPh0+ESBosx2J+NFniF8pStMjBqbXgYdTk4rL+GdvlfI+r2+Ea8z+5ErioZNhpq2nen570ThJOgoj7my3yosf4pwPoE05CEV/TYwS/cY4ymQ2RQc7V0gnKhYC5I0pgaovwOMpUdXJ4aboZTVIoZUOhT1TPYCX3C7Lp35jeVUv3DKRINanPh8d/HYV2qeuqZdofCSvnlrPUZNE2jGExiAlnf6ivbK1zqwUooos6Mfd+mNVSYeKDFSnZaPPbVT1rt0w965tcbXqrf2wpT63PlEX9tGaQCFwTEqYf8A3NAKrxwNGEXHxA88V8LqGuwpqBqm1rL2OD3Q==
X-MS-TrafficTypeDiagnostic: BLUPR02MB486:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB486;
	31:+INKqmIBK+UlmSQuZi1sOAlnFwwjRMMwaoKo6w8ues+I8IIdZSDPX7sJ3CPr+/MKCcmcF+VeU69qctBh8G1Z6AWxPh5o8w1HJ/T2MUCz01dYGw/jwreC9E6OevCz/E4KDG4UUngwsh3GR6xCIQ5u06WYmuV6fVi8jkUQNIF8FCKDXdTbKUY7OSg9PD2T6FtWfvR13Pl+NpHlmYx5min7hNa8cxfMR23TBE66TKwYu6w=;
	20:U6HWjRWQrRHFBLzDv9wnILUjkz2IhxdEJHmQNCHQ6sX6vAn0P90imaRj+/uw5drl3Z/w80tGY6Hen1XhCXaLOsbeTGaXeC8qhRA6vcC30IGyMvjxMWtGBKqfcMVCp54IKWTUni6fgslk9d43kZIJj3JBbNBhHZPhkCbSXTVNjsqdV31OtycudOpKmRs2smWT3ER/JmdRaXUqzmi/Lavo3WY+5AlKmHTybXsB+bmomeFzHPArbq3quUeJ2pER36bMmBuY/Y6P7VBuuDxhHH9PZeI/sZeofgnHqkrymkprnJe5/KJhSrg5RHjgE/VHuBlwZc06EffvIR/YDbsScx3kbf6w6Avs5bfchVUvEqybWTf3kaQ+LGp2v8uhiKOOFqwaoQSsQD89la2z2k7pFqE8PvXYP5O+B4YQ7an7oXT0YufMzMvjaThgpDy14Jd5Yks6W+oxbZUDs48LD2aLA/Hs1MW1hiqeWEA6vJJjmNoNc5UOaNZ1k6ZkPTz4plmLhpAg
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BLUPR02MB486D78D837FD1018602A752B9A50@BLUPR02MB486.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231221)(944501327)(52105095)(93006095)(93004095)(10201501046)(3002001)(6055026)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(6072148)(201708071742011);
	SRVR:BLUPR02MB486; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB486; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB486;
	4:qw7b37uSKEKH1ifIeGmKTyAjRPtwr5bUR/VAwNo/O6H/CbegodMUz/F0hK+lZPU/uFp0UUYyz5Oy6Q+1Y/FGy0h7YmRLqMoBa6cN3QXwZz2/bLRqmZZ9sFHvxxmP++YIEV10Z7jZ+FT8V7hzp1rrop4zfSWgTSIKx9wppMCWm9HsO4B26yKKNV9JyfQ94PXTsj1Egqt5GgURGG+YZRy0gGVnqclyzIl2NQpBD6LL63sij2HE4tp2s2SApAEsa7rlCvtn84si/b8EsQN83m++shdi6X7I2qxbQqxY90xf9ZO5tp45XEIp6nNwMDIU1EHm
X-Forefront-PRVS: 0631F0BC3D
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB486;
	23:4ihZwCZo7pSwIFSEuZ+3GmQBwHmnwVxZxhoC8aNU3L?=
	=?us-ascii?Q?ZBDLSVCW0GZ84apVAdCBWQW0BmcOvWLlrHpHNIzx3tvUH1j3qu+JQ45CYh0D?=
	=?us-ascii?Q?UllnUUjhseIR5dp3fQ/8ZWepsH1SXjliWHJzHIglybPvQqV6C/FdCoMkxbMr?=
	=?us-ascii?Q?LRcF65RWG5kioIv1NEJDenC5x9qcAoHvvvd75dVLnvhCIkePRHOzp6Qg01Mx?=
	=?us-ascii?Q?j9yF+9SVeQByQxloVpwMZtnBNOcTSx/CH2an5SuE/UFhZJ0e1+1HaRlDcdoT?=
	=?us-ascii?Q?qE77TliZE4KZgKHZ0iSwBNPm5r14YLb9IpQ1bkNCeSYU4DKJl0W081idTldX?=
	=?us-ascii?Q?Cd5K3sud0hWEXpupERcRJtjyOYUSgdcLuzhCcLpFB6BlgeNAMrMMl0vtW6Cq?=
	=?us-ascii?Q?ncs9swNeFyN034QGhA1T+HZmnG7rueoxSpdTYMKYgdUZ0lfjij9mZdE7bMbR?=
	=?us-ascii?Q?KkImFOU2A8+m5D4iBGhnB4ItHMZRnYgNpF32DO8mCAS7vqeXbbXWZdfkI6mV?=
	=?us-ascii?Q?XrxyAcMMaluOlHUrvA35CUGDgp8aSf7i6xXEaLWRWB01BfRhffE9YdLxKG9O?=
	=?us-ascii?Q?0EMg7GRuv5VLknQHTvwPZhag2GC0csq6Y7X8bj6pdQiYhbDDlqvN40uqzkVW?=
	=?us-ascii?Q?dgBRURTRsSKdXErdQERvaa8wZAzJK+lR6mymzegwWYVDRghnllYsriUeXH3c?=
	=?us-ascii?Q?lhHw6/kNuoqN2TZgbaJfcjYSswr2ifClrQQ1Tx8cwqMuqaW1Q9roS186i2U+?=
	=?us-ascii?Q?iE+EW2R7SmYai20KBBIuOJ/zxhmsAMS8vEtzpJ7npM1jz7DvGB2U4bCnHgF1?=
	=?us-ascii?Q?aG/0Oa5Lxe+nzxqvo9yH1DFkAnF8ag0idZAqi3NnPbn8x5xhHlREzowUeG1B?=
	=?us-ascii?Q?OQGGtQ714jebXwx45OnzAr6zY+bHewE6qHPu4Bi2xYjm28Ohi4If9h5RGWm8?=
	=?us-ascii?Q?AyLGPFrygDeifbY7m3aKvcHOD7vAoz1NiKF0+Brh7VZQXFxVnq6cXaCl+dzo?=
	=?us-ascii?Q?zP9zh5PgKGAraxoPfwKq9vq8sU0ev9LNpn3TV6P33KcwbPxb9Nj6qd8p6yOq?=
	=?us-ascii?Q?YXCSkTt9hh6jo9fNUg/WxqAvhndaEdkwPGbhkC9TLCYKaMZw=3D=3D?=
X-Microsoft-Antispam-Message-Info: qQ5KTyhI1lVTlc/hszdvHCSZ/cQVrk0ussmyvHi2OR8qQ3kyXbma42QGi+EuRIRDc9URNowFGKj6qZ2SOViuXx3+zAq8AoGRCExs5tC4ZfpNl7TbBPUfalg7mUBxVX9dfeY2zjgaH77HyT//xOyEx+rB3fTwqYVn7YiGS60lgwRr0j1VsVKPDVB8kg0gXFqO
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB486;
	6:c6w8eRziXqO/bz2URe78ZZz2DkPJZn5k05UgZibqhiLxUr5w8Sqjxyki1rN+lMy9kXd4O/m1c/mFVzPo5bNSGN4tDeNnMsCSaTfu6mvHzns2dlYSMPM0Vc612a0KAIz8IGc5bQjNX5Y18itUYs7ZLWEibSD25eWtiKO6WeEXGP+6kf+N8cc2U0MUkINQTnUHdOOVgg639Z0x+pBYhBLCxISMdMqNusKKwHYEHOL6aNlgD7VpdeDXScNwZDwXVcJx9UPwYLjG27SsBAto51IR3CIQanS86equB69OVw1VZHQLU3IlLnjvWty7slcnZ1jgOyx9J4/giDov33atmWu7E1zrPHhh9AAm5uwnrcCh2G4ZVmrSUGix2wy+jQekLsXejOMsHRThfpwvBK6mjRXl5vqvI6xMquvK6S1zxscwetWaaQETfFAoIiggMZxPf0/NPT3D1ohkYbTwhyrBSsig7g==;
	5:Ghjvjz+CdVune6moy+v0w/E84+8TyA5esY7xotweUAKp0VBgeGj3Hb0oSDaYCbuSBbP5MDUluY0Kr4fOQZlw9ic94E/ViqmZjNgFI/Mx8tWlnFoRLE8Z0WrWDyjPTfJDIqZM41jf+8A3rlrt4gnxQSi27Q5khB6mufVo+rod+O4=;
	24:7ThIAKjX0ptp6luH3O9aG6gIcHhLrXqj0qS350Y+6hArDIRVhQtPP/vi22M170sH/Dnc4oS+/a8+IFOzaRtUn+pkdwg+fpiXQoannNnTqsE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB486;
	7:0tJ6dg+82VgY0sfBW8QF+qCLcYI1wktJIcV4/hRw60N6R1LU5ba3c/1k6XfoE7pjidMtIXWD8wTpacYYzt5nX60POiHdEUgsdnKCMYwu9vUWr7squeVgGxwSd2sg2wGF50fBK8Nnx/RpsI3sqUfDIvv8bBYTXoHN6gH8+M/5kMIa7CnWpaN1UClguaL21z7EybHHKpQhTl7h8q0nBlbeKcQeG/9qg4AgIwFRedffFKxxnoEdyoHyN4t5+B63adMJ
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2018 20:35:14.9763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ad98bb-2ad7-4781-03c9-08d599a26804
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB486
Subject: [PATCH] package_manager.py: Skip gpgcheck while using dnf on target
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
X-List-Received-Date: Tue, 03 Apr 2018 20:50:21 -0000
Content-Type: text/plain

By default, RPM_SIGN_PACKAGES is not defined. Add gpgcheck=0 to
oe-remote-repo.repo file, otherwise dnf will complain during
install operation on target

Note, RPM_SIGN_PACKAGES is set only when you inherit sign_rpm explicitly

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e006dc6..9f22fb0 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -674,7 +674,7 @@ class RpmPM(PackageManager):
             gpg_opts += 'repo_gpgcheck=1\n'
             gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
 
-        if self.d.getVar('RPM_SIGN_PACKAGES') == '0':
+        if self.d.getVar('RPM_SIGN_PACKAGES') != '1':
             gpg_opts += 'gpgcheck=0\n'
 
         bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
-- 
2.7.4


