Return-Path: <VINEETHC@xilinx.com>
X-Greylist: delayed 5500 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Mar 2018 16:13:45 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0048.outbound.protection.outlook.com [104.47.38.48])
	by mail.openembedded.org (Postfix) with ESMTP id A1C8F6FF80
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dB37IJxrjKRDqBi7StrP2wJRGUbfWq5XOz8sqm24nRE=;
	b=gD4Qloc7Iedn++PZGfGAls2A0rX7sHfi/Jt8vUKb06U2of/MHJYYtFeZADV3FHeZvqfc7AtPPwPaFo1tiNqD4j/iqu6pdTOIUMoEPRay54eiOvGi69Cfavk9J3huWkfOk1O8dXTpkv34citymZNLcPzaM2BealpWzvgRz/3yq8s=
Received: from SN4PR0201CA0070.namprd02.prod.outlook.com
	(2603:10b6:803:20::32) by MW2PR02MB3818.namprd02.prod.outlook.com
	(2603:10b6:907:3::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.548.13;
	Wed, 7 Mar 2018 14:42:03 +0000
Received: from BL2NAM02FT021.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by SN4PR0201CA0070.outlook.office365.com
	(2603:10b6:803:20::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.548.13 via
	Frontend Transport; Wed, 7 Mar 2018 14:42:02 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT021.mail.protection.outlook.com (10.152.77.158) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Wed, 7 Mar 2018 14:42:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47734
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etaGV-0001wc-VX; Wed, 07 Mar 2018 06:41:59 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etaGQ-0000kc-Qm; Wed, 07 Mar 2018 06:41:54 -0800
Received: from [172.23.37.95] (helo=xhdvineethc40.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etaGI-0000gX-3e; Wed, 07 Mar 2018 06:41:46 -0800
From: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<manjukum@xilinx.com>
Date: Wed, 7 Mar 2018 20:11:29 +0530
Message-ID: <1520433689-6357-1-git-send-email-vineethchowz.chowdary@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(39860400002)(396003)(346002)(376002)(2980300002)(438002)(189003)(199004)(50466002)(336012)(48376002)(106002)(316002)(63266004)(106466001)(5660300001)(36386004)(51416003)(7696005)(356003)(5890100001)(110136005)(107886003)(305945005)(26005)(77096007)(1857600001)(186003)(8936002)(50226002)(47776003)(2201001)(6636002)(6666003)(59450400001)(9786002)(4326008)(8746002)(478600001)(36756003)(8676002)(72206003)(81156014)(81166006)(2906002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR02MB3818; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT021;
	1:uNJmC6MZJtoO2RO11pg1MfexV5rADzgj9s2js+/TiCAE7l+79BHkcVHy04s9642mvxsbSloWNf3jVgd1lp7d2hX4Ff4TILtmpEvc7St0aNkBnJkJ/HB/hleFFj+KAAm2
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc76fb3a-de1d-4e24-4ec9-08d58439969f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:MW2PR02MB3818; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR02MB3818;
	3:aFyqKZ0ZK5j77x88DkkNlzdyY6rQ4zPFbEEb4tP8F4QGU86/Bx8k1yOZv2YABuyKf9AcRpQ7BRCepdSCFKB6Et4wVgPU3JhDkVlagcMpSIfnUE4kVUaaQiOOSejx7fGPDYlkMX2sHU/d1OGX9yQAQV4hKPMQKXZ1M76nM8HqQm4p/tbkxlCk0qxLriofi3FRr14VoBaMYR5KMaPOq4j61GP7OX9/IpmvZ81InEABOCXvNjxaiscL/T17VG2pD00DlWIFzIpOwOcFpzJwGkKvLI7nAfduMsTFhba9D2/WDYcxRsW3YY3tWk9hYaq3Qae2BPsIXrz6ys9ekWTgQgwIqkXaxiR1D7yNt3uA9O5sD80=;
	25:5UXaZja7BgRDOfTMtnNymxrbVuLk/SOcTzuUwmDEVoNXXbKYRwqOxLHczYeeOJGnnck1ZdDlca6fdUj8/XO6yTzcC1/64JUC0HNPJ5bWkiVoP3hSjG7AQas00jy5jF05wi2dmrg4RX3HWVkDmhEVn2qtTuvzN/4TgVw7oW3p+Gt/4PGsq/KctdiunOaYTj9dXBd5/zuIsSlzam3+4xh9x0TFaCIIDPh+rzjhFl1XGOie0To4HAhwXOc4x/OzLvvtDUsTpWlvXp6NaMTuGfejJX5e/JyvNy8w4LTUdUYM/qqaGb0BzpwrWPI5sW0FjcH4/izw341qN9Xbp2q0TtrHcQ==
X-MS-TrafficTypeDiagnostic: MW2PR02MB3818:
X-Microsoft-Exchange-Diagnostics: 1; MW2PR02MB3818;
	31:xtykcOgbSOMcvLYlaxuTNXUQr7hk+EsvDlflBqZpDBbQniJ/Q31cbl3On1wv5sPlufssrMJ4xGi11Iazjeu0F33vPqyN5ucbc/1C2QWsIdAyVT2WUp0luSL0uzujo+fvjJPq6XhG/PiC+ttGmwX/B8GfPS/ctN0RL4/eH1PwDREjOl/QCoQHCy2fPLUTZKh9IgwV722ZJsmjQDtEUVSrvroKgDzHuTU5Y5KEC4IphD0=;
	20:oV8+76dYvfpqU86ejq3MKbsj9hyumpiGERU2AqMLPzwZD8EyedniOZF170/Cgm46xdvg4Jl7Vz8abo5ykUpQJtZWjBxGQ6NXU0cBUG9esTATSMCyYlXTW2++xoEH/6YqmZhb7O8EOQ65HyXTik4gzju1sJde6RJ4p8mqaFUd4tgkJK5RyTmcGqmQZWIGqrfY+041a67wNd8Fbyx2/0QZhUu8Sl/VYjOJi0m9snuhOb9UsGJiB3kMybQSQomN9OqM8QGZi39DM+PMY4xP3c5hfVSE+Tctka9rd5Wv7PbG8NyutPFQ+RhXAguJu/AIIYUlOMnDoo9bgrxi8Vz8H8baXepm0g31Aionfg/zvEWmcyYYyKUqqZaZyEFYsh/Vf11umdUkn5w2NWzGycsB59i7YEiK7P/CvrtIJixmwIajb9Z3qpsfVgVh8BeJQdb5wO8CsL6gIbYEl7U8/6/MDxzyjW8iY8g5/madjZK1qxhmGZwbAX+JFN0sIh2igNGnee06
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MW2PR02MB381890F93E9F4CA0E5B3B35CB9D80@MW2PR02MB3818.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231220)(944501244)(52105095)(3002001)(10201501046)(6055026)(6041288)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:MW2PR02MB3818; BCL:0; PCL:0; RULEID:; SRVR:MW2PR02MB3818; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR02MB3818;
	4:lnNsMc9IqihZPuFjEkwtqsSDW+DN9qWJEXg7C8uMQ8E9UNMrteh14Lc2JTiy0F73lZ0wL6kImtC0A3LJX2Bd/evx0/7nZ0ker30fVmIzTO2476yfeoLiC5uwTWk5pLAOuwH/VU4tTm2KXFpYrgRZ9vdVDw/4RcrTxj+vrQvx0lpkGlgvweokLl9FC//7ed3gIFKKpurEGaMwPpYQ1bR2lJ0Rq6o6AAOXbmnlGQJdFcgQduUG71CKOGx/bWz9Au3PN0mwV4J+hSIzIZE1qX5IJrF/b/qyoWYN5CWAx1RYoibDBo++XYjJebtn37qFcxYj
X-Forefront-PRVS: 0604AFA86B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR02MB3818;
	23:p2nruDFUl/uhKubEZ7bIiebztSiZmCkoLOJ1+/qE1?=
	=?us-ascii?Q?ujYWHLIxFww7PK4o5K6crmQW8g95YPo8g+mQ2Gt0B4B+dZHR1xit5znL/jtr?=
	=?us-ascii?Q?4ilMsZynNS3LdEHwXeb+vZMxdyHvDgkhI2nG4S8Pb6v3vNp1yFXC713FETWV?=
	=?us-ascii?Q?p3zXHm91Z3hGXMwzCVY6EWSN7SVwBx51igcbRjsk9pWQP/v5FJ+FmoQh0nff?=
	=?us-ascii?Q?0f007boonuuTqefEtPYGRlYD5hf/yp2icOo6OGiJaPVemuEvWfSblKl/Uj73?=
	=?us-ascii?Q?8efG0v3yNQeVetc6PaBaW5ykhKDV0jKArhAeu0YMcwk42ShYpjgvgAY3jjMi?=
	=?us-ascii?Q?PejPUOBJBs+UUKSjjYtzIlKxngnOvvR+ONs1ydehp76gLQctVk6ztlFxpdfV?=
	=?us-ascii?Q?OZFJMSPFzkc33dSFCtKq1VCUQc9+HhQSbhyB1zJYKpDrKMQOGKx8Xcaj6eHs?=
	=?us-ascii?Q?109a6N9oe12in+/RkGoxld2+A8yLmN7flgaoMSjR2jb3V6tYgz4/8uaI8CG6?=
	=?us-ascii?Q?Ct/Q+F8AeesHtDxiVv7wUDbddxjbI1gmJQKquxdvuheh3oIeJLqQ6422b6pB?=
	=?us-ascii?Q?mYnufdaDCi6d8DUThQFpHYq3AUSBxATX+O4QjTZGIoAgo7GfKla2SNaguj1E?=
	=?us-ascii?Q?WfgBQ9purq/PUgMX8bfFIggMr2XscFjuTUupUaVxMvcPLtpHLzUwn3cl8dJM?=
	=?us-ascii?Q?1jzDfnRIm0otf4O7+Ni5+g6nDViqCFYgbWVpIzUGWwscaiU8gt7skKkY4C/o?=
	=?us-ascii?Q?+OAO/tcpDSizeXu12EeW4zOJTcERAWRC38p5d7NYol4198yOWlqdIqHsjFax?=
	=?us-ascii?Q?NhXP0jRcFEqCaeEW7EjNf3fmpYDd5lEGSVL7Dr+1ErePZdy93rjc1IUgCL/C?=
	=?us-ascii?Q?81m+tpl2koUkFnrxTGojL8cwkmEjXNcEyg0YvM+XAmsGWfht7pKtrW6p5VPW?=
	=?us-ascii?Q?N8Rz8Vjx7rxNLW13LJlUjV2CAVAt5oh3GMzSncLLsT2EHys2mAXs/aSjgOdT?=
	=?us-ascii?Q?Smq29KXMe5H4R8mWx4W+1NjtjVQfcYwCdYs0kP08vsVymYArhLnuv7fLYa8F?=
	=?us-ascii?Q?w3hQjUBCFdWrWPZYzvd1UIeOiSXiBWBbEVJYXV+t/tnN2ovSHOQlpQldsdNF?=
	=?us-ascii?Q?e0+8NB9tTQ=3D?=
X-Microsoft-Antispam-Message-Info: zADabwU6phtsI+4FAidx7O7RyMJEdiGfk+nNscbdkT5xI1s7DK2Uoj7hLBWqRhTNsS7NLnI27TffrwAhAj2J1lgnVVMpNA1Rd+CLLXjSGy5idjYNJGIqJZTT31hw9E+Is2wixtaomy5dGd14Fru9ibZKfOm6MTXpGpkB8xi4IEjckcguPS9p5teC4cGcOA/y
X-Microsoft-Exchange-Diagnostics: 1; MW2PR02MB3818;
	6:Ro7cPG73oJu7XYoGfc/NsVJRzOQi8H/HOuxVQulP6qypri3uEaDFpy01IULU4dAKTyoYMeLlsBXSMpVVYnegkU9bYV6ikUn0kCQBEEzybe/UCYsc3ZC6qn5xqZHoTPvHXKNI7v3urx5yI6dx46np5TIVTh3ML4NAmXWlp/bNPy+NHpvO99wDxTiR9343O7psii0Sot2GjYj3oE2uL6hM0/+gOy4zW5AgG6qWf1XgV+j5DhycxUP+qkKlbRVgKaEeLdFPFkGvV+asARNJG9RUSRiWTQa83UzwD81ccJLXJmX8a3X2rQftClDpe+M6BS5LfebOhE/lYJVzAHsYrtdBbhgfoCDFKCJ3mu8e6LsVqkk=;
	5:fz95boT/pzaR25Rp2uY8S6pY/vvKXMpCpVO/hM+NPRO6da1l7o5DkEgemW6A3zINaYskdoLBXhmKmymeb+EFMCvUYcQxKnGezmPcSVOj30Csjjg6/iLo4gav6QDJvynHkcTNcAXcJNONApGaETq+gcWXhycBzp0mgis04e8E/Fo=;
	24:9DMPcHDb5zjoVlYpDWVgXLnv7as661Xzo0ubYfFwUajAtG0RXSzXWpbqjeE6Mdk4Seb0N76w9GpCmbo0NL1o02+tzydTALFhc9JhDp63vjE=;
	7:yjgQRlBHB3pjyJzCdbBW9/lCOAeXx0D5XHhnbIJhg3MBv2tmi3sY7ucBYcFGMmXQxvtHsyXG8PYJiYt77qj3C6lJOoVO1Cvrg9vvVMNocgF1OpGZiuEUjVlf17Z1cndG3AFprPrayFKseuDLBhw2JKJHkGatUQC3HkzbnI51yiqPys7tv80c4LEBCvrFSplqKyblsofORx9/M3LIDnms9ykC3f91EF7Ku8svEWJ9xYW4yZAItSzVHSHeEi2+rYt0
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2018 14:42:00.9224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc76fb3a-de1d-4e24-4ec9-08d58439969f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3818
Cc: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
Subject: [PATCH] kernel-fitimage.bbclass: Deploy fitImage without Initramfs
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
X-List-Received-Date: Wed, 07 Mar 2018 16:13:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch deploys fitImage (linux.bin + dtb ).
The use case is to have 2 partioned sd card, with
FAT partition having bootloader + fitImage and
ext4 partion having rootfs.

Signen-off-by: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.co=
m>
---
 meta/classes/kernel-fitimage.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fit=
image.bbclass
index 50a91e1..25884d5 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -464,6 +464,10 @@ kernel_do_deploy_append() {
                linux_bin_base_name=3D"fitImage-linux.bin-${PV}-${PR}-${MAC=
HINE}-${DATETIME}"
                linux_bin_symlink_name=3DfitImage-linux.bin-${MACHINE}
                install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_nam=
e}.bin
+               fitimage_base_name=3D"fitImage-${PV}-${PR}-${MACHINE}-${DAT=
ETIME}"
+               fitimage_symlink_name=3DfitImage-${MACHINE}
+               install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${f=
itimage_base_name}.bin
+

                if [ -n "${INITRAMFS_IMAGE}" ]; then
                        echo "Copying fit-image-${INITRAMFS_IMAGE}.its sour=
ce file..."
@@ -478,6 +482,7 @@ kernel_do_deploy_append() {
                cd ${DEPLOYDIR}
                ln -sf ${its_base_name}.its ${its_symlink_name}.its
                ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}=
.bin
+               ln -sf ${fitimage_base_name}.bin ${fitimage_symlink_name}.b=
in

                if [ -n "${INITRAMFS_IMAGE}" ]; then
                        ln -sf ${its_initramfs_base_name}.its ${its_initram=
fs_symlink_name}.its
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

