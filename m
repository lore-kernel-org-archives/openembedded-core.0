Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 1086 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 May 2016 10:22:32 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0098.outbound.protection.outlook.com [207.46.100.98])
	by mail.openembedded.org (Postfix) with ESMTP id E0F7A60796
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 10:22:32 +0000 (UTC)
Received: from BY2PR03CA004.namprd03.prod.outlook.com (10.255.93.21) by
	DM2PR0301MB1230.namprd03.prod.outlook.com (10.160.219.19) with
	Microsoft SMTP
	Server (TLS) id 15.1.477.8; Wed, 4 May 2016 09:49:10 +0000
Received: from BL2FFO11FD018.protection.gbl (10.255.93.4) by
	BY2PR03CA004.outlook.office365.com (10.255.93.21) with Microsoft SMTP
	Server (TLS) id 15.1.453.26 via Frontend Transport;
	Wed, 4 May 2016 09:49:10 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD018.mail.protection.outlook.com (10.173.161.36) with
	Microsoft SMTP Server (TLS) id 15.1.477.4 via Frontend Transport;
	Wed, 4 May 2016 09:49:09 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u449n7K9010132;
	Wed, 4 May 2016 02:49:07 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 May 2016 17:46:46 +0800
Message-ID: <1462355206-27234-1-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131068289496935880;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(104016004)(110136002)(87936001)(48376002)(4326007)(586003)(50466002)(15975445007)(5008740100001)(5003940100001)(33646002)(77096005)(1220700001)(19580405001)(86362001)(2906002)(6806005)(47776003)(229853001)(106466001)(36756003)(105606002)(2351001)(11100500001)(85426001)(92566002)(19580395003)(189998001)(81166005)(8936002)(50226002)(50986999)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0301MB1230;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD018;
	1:EzPIovELzKzpFSUEtCMCsApJDXqFo80GHDTWbVxVHqQnZlj8VkbfdMFc7GMxxTjksTfl1CpBvTwI007kSU4Zb3TMa/QF90BhzdetlfSwfh8r4lrgf6D9XLMvs6k22ZS1vwLnfz0KFmMVL2UOqTyjUhn1ZJbs0NQdAZm4zmZ/8Ibh7YXVzacMuCuMLJGe93TvZ5C1AGzmi0wsO4iDuxkNj4OVrqlJ6K7ALQ/UOrFyVNl1tZByhzh2u/ypMKsc1lcES3Wo1bfPJih3Uh+xK5ijdUoGnRh1LCulIYrb0ayiP2d1H7lwCsikyuIxK8WT5zu9FjlimqjMD5UvY++fYZQ+3hBsevf/5BYp//lFZG+rC4X3MCNpFELYJjTpXJRUVKfVLFKPvuwX4I2CfOLBgfAodKw7TUkRA9Xrcv4KTIFaqzmriA+jKNkz1ni8H/+WIJZD/YlxiT9NMNCqOOQNMkOrkTMK+DXqR4bEuFz8AYwRmPdvlYUQeEI+ixHZ9qHBE0GU0mYrS8vhK75a1neC7fMA7mE04KDKxvuCQdRT//2dHLxvboYB7mM5n09ybwDu6q2ewjkcyE2bwBHxJK3JB8EgFH0YJ9ci70e9X3EG2dK1/bMPfdgtKe95t0MENGGFI6SkSupt3a1eZ1OUNPb/56vuPmyLRNnf7s8HHytBBEA1K4+0hFNGSbRoVGaDSAcQ/pH/SNEx3YYVA2T21hMJDxbfvw==
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 5792f571-676f-45f3-6dc8-08d37401573f
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1230;
	2:e0V+SnJdtP4pdli4bYSwGDbodxiVd5/JzLLw5ZLLxH1frg2XfPR184GRx79YjF4xjJg+Z/6B/pbTUvEJPQOUSNwdK6WcwYg8Y4ddlZRUmMovm4XQaPqxQGyPIGYJMojlYIbzE1FigB7b48jHEA4eT9hACq4YDMV0CRi8MtxyaQPYAWbopxHhABvdsytvVaLI;
	3:qihE/+D79OeEFuBqYLsEs2C+ZbWrLv9bfR289HCmv/ij1C8p3Xl4kkjmdRXpW04o+KRh4ujo7oyB/6esWgYJmWckIzMTwpKS/prCS4Ic7jSvkN4os5LkJW5ceyubzG4DIPmdj02VnRVkvU48qaqH6io9d/0Z2sg0yrcaP5IXb4HeWX/In6o9SjRNZbHC32EAb35omASd1FtRjwGtj/IBNjDRk9Zu/6M+4r+bE8Me2Rg=;
	25:VEeH90V24ETvQthiGU8qeqjVsaFLUniGEQfMapWUgiQIpH9ylBiGxrWoyvKb2AKidRO8PKjWPLRdGSpJFPp782lyPjpybqbEfGa5L5vuqxAxPSDnddqVBRbXt9zYPtEUbJno32b6IrzDCoeXd3avYVD/CnWF9stVKzTN+7HNoT/f/1fXh0W1hxY8Hf/jdEOqolgXtJHVqiE+dscsOUof/tuaAQSbs4G+9Mjljr8A3ZCBEdSfp5MO5FqQ0IdeOkvmQzaAPc60XHMVFtp/dI6JNssMYEKBfAz1HeVmgTLyrlBFQToO+bb/lk1vcIUo0tV7feLHqaLghed6+i7zzt+RSA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1230;
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1230DAD784E6E76E339AD1FEE97B0@DM2PR0301MB1230.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(8121501046)(13015025)(13023025)(13024025)(13017025)(5005006)(3002001)(10201501046)(6055026);
	SRVR:DM2PR0301MB1230; BCL:0; PCL:0; RULEID:(400006);
	SRVR:DM2PR0301MB1230; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1230;
	4:DV9DK3hRC+ibGBSMaPQqiO8UdADeVlHADV7rOgMDi4BQQOHiFYw4gMR2KmahH6DSEIqXwo8Hd0gy77nGvMIRY2J6ZYPey4HdGeHdGxyhsGE6u8d445ZshNQaE5qPQsz0C7ISbdcljTbqJOZNvaW2kPbHSVjgqDA+7/wM9DIt/aeH1O4OBzk1w9KIS1kLu/QRjUoBlEUfKLm+1rwHrqhy4yTIo4uh2xaCW2rG/xsjjMWFHQRRLyF11MZ4MtMVg2hanoxlX1atHInKUyfm/QI6HdiUyrGdV0WW/NHFtN9zk50byAR2gaPzZsgZAR8JLVd8mSUQ7L5TueDBxLOnHRsXPG7XGXMa2GyK0vI8d8oyQfr+I67AenxfsW+9IpC/rQXa/p905mod5h6fQ/OvV1dgIJ7+xvhiA1y0NbeXQNHAtp+L5td0HLgrL+kRPnOGtHkgDrsPQdV6fHjmsp/cUSMXC9MPluZMs1EKJaKNARxqUH8=
X-Forefront-PRVS: 093290AD39
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1230;
	23:7y0xPLGdpAecTKh2uA7GnDESg2+y+AU6sbcUv+Q?=
	=?us-ascii?Q?5Hr3SaGF1NrCL6ZQO000839UREfs2xnfuzfIw8e+/aqY7QVENAWf48W6qFiD?=
	=?us-ascii?Q?znihIwDW/PoFu4iWxiD5SEjRg0vB7Jmk/lFOYkZlpVQpnIVbyDJTgwfIWqta?=
	=?us-ascii?Q?xeP2akfeNEP+GRfg05s0wbaaa647EL7qe4YV5412Lu8ZOH+SqXqsk4hva3xr?=
	=?us-ascii?Q?DaW1qfJ1WijHByO9Ff9+DLTILu4oC/xnooGGG3k7+wIfKYmV20eMRunpkE5r?=
	=?us-ascii?Q?XHb+TMhhrjc2HeiNCckCGPwi1NAvPS8spIWJvw+trOijAFtnfrKGRgsuOD2G?=
	=?us-ascii?Q?BqWj30vE/Vn+V1O7rY53aUyOaxhWqBMg7Re9rt4R3Q2NLxnbovS0w6P87AF3?=
	=?us-ascii?Q?EShrhsVmIKfkwqjLw/KwBYWlLU5TRx9wd5i0ZkV/HUJJbu8m0cJZTCCJBb2F?=
	=?us-ascii?Q?yAMHSJNoGi/q9kUO2qMcpzE6uv77Qzn9XUcLsg+NGL0UOFVtT+Rm7XJ6nEfu?=
	=?us-ascii?Q?lIhtDaryHbnD2BTSB+W8hjQ/aE6cjHZcB41ou5tY6giAfP2vxWdPV7Y90uN+?=
	=?us-ascii?Q?wVUM5CcmWp6WkxICo4DSkALXg3UMYFVQJdOJHSFPNoIBYqlCQ9fagrx6aAvn?=
	=?us-ascii?Q?0xlMyfc+93CTRX+VOVkx9s/hpMpTCumf1mMZqb1zylRPwlaJH6n0RnDoNcF0?=
	=?us-ascii?Q?P1zotcphHzAtidwUTZwj9TzUFQyR1F/20S8NmFpy1j158Q/mKq0S/fSuAVYS?=
	=?us-ascii?Q?AHgSvI1oK1JH/hRVWxNi+hSZfxUJZGJgj/ZJiKlGcuteWH5Gx55cGfmlND23?=
	=?us-ascii?Q?mzxIJAtM/AszhnOSMVLUmyKNpfzjluYU8OUB/OxDtyq2BPL45mIxawsw/4zq?=
	=?us-ascii?Q?1zVqHoh89aox99egI2V0iKJDkXU7qrUZf+fOljYszRRwV+yp3cdqSP0tM/o0?=
	=?us-ascii?Q?C1Trdj7MkyWRTe9zBx9UbQHGWt/pTZmKeaeniBSeEx1Kbqi1/vI52SnQ6fz1?=
	=?us-ascii?Q?0IDg1wgz5AMFIYO6+AnMLwrhjRAYlWn/ngNwSjfCafNPhMuJ2TASsy3tkeLq?=
	=?us-ascii?Q?ySqKfsDc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1230;
	5:NDNpD6jUzgpzWXWdpi0DmYrOaCWZg99mAV1tpNUOVyEe5yMBjOaNqP2wOY9ttiQJASD/HZG3GdHYLorZ6GMSK6Gr6OH7AAlsEhZi+0mZeDzCsImqDRdCXaXPCk7RC6zj3SZ+jgZFKeJHwiivPkH8iwMfQCscRN1Fvf3gofOly7M=;
	24:UCF7wkwzQQ24GgBIAjGF/cqPXUBk9G4RPTaaAGR/odz80A2SHSNGLZzHpr13ufA9KhaxWObw2qXtHoCiprqyARE9iX7T6Q84L1xdErZdJ+Y=;
	7:DWKud8U9v4VPOhTGbAG5nIiHjia725lKaDpQdKpXpPXZ56OaaGKLiiqWvuS5mrqNZwDyHy53nSKSL1PKvXg6f2ri1oKdUbodo9Fsem66pycJ0rnoZFtJc5z/HX1yV9ZjtX29v6ZUEDVkLlL61SrIxWrC7suhxrvbxgVnXiMIztnQHs5ey20dGS1TmfygLRo3
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2016 09:49:09.4751 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1230
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH] alsa-lib: Fix incorrect appl pointer when mmap_commit() returns error.
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
X-List-Received-Date: Wed, 04 May 2016 10:22:33 -0000
Content-Type: text/plain

The appl pointer needs to be updated only when snd_pcm_mmap_commit() is
successfully returned. Or it shouldn't be updated.
This is to fix the avail_update()'s result is incorrect when returns error.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...fix-appl-pointer-not-correct-when-mmap_co.patch | 137 +++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb     |   1 +
 2 files changed, 138 insertions(+)
 create mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch
new file mode 100755
index 0000000..9fd69f3
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch
@@ -0,0 +1,137 @@
+From 7c424edd116e76eee6218a1e9a6ff6c4daaf2a4d Mon Sep 17 00:00:00 2001
+From: Shengjiu Wang <shengjiu.wang@freescale.com>
+Date: Wed, 6 Apr 2016 19:02:12 +0800
+Subject: [PATCH] pcm_plugin: fix appl pointer not correct when mmap_commit()
+ return error
+
+When snd_pcm_mmap_commit() return error, the appl pointer is also updated.
+which cause the avail_update()'s result wrong.
+This patch move the snd_pcm_mmap_appl_forward() to the place when
+snd_pcm_mmap_commit() is successfully returned.
+
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/8760881/]
+
+Signed-off-by: Shengjiu Wang <shengjiu.wang@freescale.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+---
+ src/pcm/pcm_plugin.c | 48 ++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 32 insertions(+), 16 deletions(-)
+
+diff --git a/src/pcm/pcm_plugin.c b/src/pcm/pcm_plugin.c
+index d007e8c..940491d 100644
+--- a/src/pcm/pcm_plugin.c
++++ b/src/pcm/pcm_plugin.c
+@@ -279,18 +279,22 @@ static snd_pcm_sframes_t snd_pcm_plugin_write_areas(snd_pcm_t *pcm,
+ 			return -EPIPE;
+ 		}
+ 		snd_atomic_write_begin(&plugin->watom);
+-		snd_pcm_mmap_appl_forward(pcm, frames);
+ 		result = snd_pcm_mmap_commit(slave, slave_offset, slave_frames);
+ 		if (result > 0 && (snd_pcm_uframes_t)result != slave_frames) {
+ 			snd_pcm_sframes_t res;
+ 			res = plugin->undo_write(pcm, slave_areas, slave_offset + result, slave_frames, slave_frames - result);
+-			if (res < 0)
++			if (res < 0) {
++				snd_atomic_write_end(&plugin->watom);
+ 				return xfer > 0 ? (snd_pcm_sframes_t)xfer : res;
++			}
+ 			frames -= res;
+ 		}
+-		snd_atomic_write_end(&plugin->watom);
+-		if (result <= 0)
++		if (result <= 0) {
++			snd_atomic_write_end(&plugin->watom);
+ 			return xfer > 0 ? (snd_pcm_sframes_t)xfer : result;
++		}
++		snd_pcm_mmap_appl_forward(pcm, frames);
++		snd_atomic_write_end(&plugin->watom);
+ 		offset += frames;
+ 		xfer += frames;
+ 		size -= frames;
+@@ -325,19 +329,23 @@ static snd_pcm_sframes_t snd_pcm_plugin_read_areas(snd_pcm_t *pcm,
+ 			return -EPIPE;
+ 		}
+ 		snd_atomic_write_begin(&plugin->watom);
+-		snd_pcm_mmap_appl_forward(pcm, frames);
+ 		result = snd_pcm_mmap_commit(slave, slave_offset, slave_frames);
+ 		if (result > 0 && (snd_pcm_uframes_t)result != slave_frames) {
+ 			snd_pcm_sframes_t res;
+ 			
+ 			res = plugin->undo_read(slave, areas, offset, frames, slave_frames - result);
+-			if (res < 0)
++			if (res < 0) {
++				snd_atomic_write_end(&plugin->watom);
+ 				return xfer > 0 ? (snd_pcm_sframes_t)xfer : res;
++			}
+ 			frames -= res;
+ 		}
+-		snd_atomic_write_end(&plugin->watom);
+-		if (result <= 0)
++		if (result <= 0) {
++			snd_atomic_write_end(&plugin->watom);
+ 			return xfer > 0 ? (snd_pcm_sframes_t)xfer : result;
++		}
++		snd_pcm_mmap_appl_forward(pcm, frames);
++		snd_atomic_write_end(&plugin->watom);
+ 		offset += frames;
+ 		xfer += frames;
+ 		size -= frames;
+@@ -423,19 +431,23 @@ snd_pcm_plugin_mmap_commit(snd_pcm_t *pcm,
+ 		frames = plugin->write(pcm, areas, appl_offset, frames,
+ 				       slave_areas, slave_offset, &slave_frames);
+ 		snd_atomic_write_begin(&plugin->watom);
+-		snd_pcm_mmap_appl_forward(pcm, frames);
+ 		result = snd_pcm_mmap_commit(slave, slave_offset, slave_frames);
+-		snd_atomic_write_end(&plugin->watom);
+ 		if (result > 0 && (snd_pcm_uframes_t)result != slave_frames) {
+ 			snd_pcm_sframes_t res;
+ 			
+ 			res = plugin->undo_write(pcm, slave_areas, slave_offset + result, slave_frames, slave_frames - result);
+-			if (res < 0)
++			if (res < 0) {
++				snd_atomic_write_end(&plugin->watom);
+ 				return xfer > 0 ? xfer : res;
++			}
+ 			frames -= res;
+ 		}
+-		if (result <= 0)
++		if (result <= 0) {
++			snd_atomic_write_end(&plugin->watom);
+ 			return xfer > 0 ? xfer : result;
++		}
++		snd_pcm_mmap_appl_forward(pcm, frames);
++		snd_atomic_write_end(&plugin->watom);
+ 		if (frames == cont)
+ 			appl_offset = 0;
+ 		else
+@@ -490,19 +502,23 @@ static snd_pcm_sframes_t snd_pcm_plugin_avail_update(snd_pcm_t *pcm)
+ 			frames = (plugin->read)(pcm, areas, hw_offset, frames,
+ 					      slave_areas, slave_offset, &slave_frames);
+ 			snd_atomic_write_begin(&plugin->watom);
+-			snd_pcm_mmap_hw_forward(pcm, frames);
+ 			result = snd_pcm_mmap_commit(slave, slave_offset, slave_frames);
+-			snd_atomic_write_end(&plugin->watom);
+ 			if (result > 0 && (snd_pcm_uframes_t)result != slave_frames) {
+ 				snd_pcm_sframes_t res;
+ 				
+ 				res = plugin->undo_read(slave, areas, hw_offset, frames, slave_frames - result);
+-				if (res < 0)
++				if (res < 0) {
++					snd_atomic_write_end(&plugin->watom);
+ 					return xfer > 0 ? (snd_pcm_sframes_t)xfer : res;
++				}
+ 				frames -= res;
+ 			}
+-			if (result <= 0)
++			if (result <= 0) {
++				snd_atomic_write_end(&plugin->watom);
+ 				return xfer > 0 ? (snd_pcm_sframes_t)xfer : result;
++			}
++			snd_pcm_mmap_hw_forward(pcm, frames);
++			snd_atomic_write_end(&plugin->watom);
+ 			if (frames == cont)
+ 				hw_offset = 0;
+ 			else
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
index a73da28..296a7bb 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://avoid-including-sys-poll.h-directly.patch \
            file://0001-topology-Add-missing-include-sys-stat.h.patch \
+           file://0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch \
 "
 SRC_URI[md5sum] = "69515ca73c3c4a212ef45160dea846c1"
 SRC_URI[sha256sum] = "dfde65d11e82b68f82e562ab6228c1fb7c78854345d3c57e2c68a9dd3dae1f15"
-- 
1.9.1


