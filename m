Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9007C744FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 08:09:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 01:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,410,1517904000"; d="scan'208";a="44249987"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2018 01:09:02 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	PGSMSX102.gar.corp.intel.com ([169.254.6.99]) with mapi id
	14.03.0319.002; Thu, 5 Apr 2018 16:09:01 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-selftest: qemutest: add tests for qemu
	boot	and shutdown
Thread-Index: AQHTzLKmkK/0f2rbYUOp9gaXXDpiSqPxzBAA
Date: Thu, 5 Apr 2018 08:09:01 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335E0006E@PGSMSX109.gar.corp.intel.com>
References: <1522888530-82278-1-git-send-email-ee.peng.yeoh@intel.com>
In-Reply-To: <1522888530-82278-1-git-send-email-ee.peng.yeoh@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDQ3YzEwZWQtYjEwMi00OTcyLTg3ZmItMTVhZWIzNGQxMmNhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlhMK2l6SE1GdGR5Uk40VFwvclpVQnhtRFJxMnBkTFpsNDZ4a0dObmVsd0k4PSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH] oe-selftest: qemutest: add tests for qemu boot	and shutdown
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
X-List-Received-Date: Thu, 05 Apr 2018 08:09:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex & Paul,

I had developed this selftest testcase to test qemu can boot nfs & ext4 and=
 finally shutdown for various qemu architecture.=20

Initially, I was thinking to develop this automated test as part of testima=
ge but as this test involve shutting down qemu, testimage testcases execute=
d after this will face lost connection to qemu.  Furthermore, when I tried =
to add this test to selftest runqemu.py, I realized runqemu was dedicated f=
or MACHINE=3Dqemux86-64 and it was testing various live image (iso and hddi=
mg) but live image was not supported by other qemu architecture. Therefore,=
 this test was developed as independent selftest testcase.=20

Please let me know your inputs and feedback.

Thanks,
Yeoh Ee Peng=20

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Yeoh Ee Peng
Sent: Thursday, April 5, 2018 8:36 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] oe-selftest: qemutest: add tests for qemu boot a=
nd shutdown

QA team were testing qemu boot image and shutdown on each qemu architecture=
 manually. Add automated test to test qemu boot on
ext4 and nfs, finally it can shutdown properly.

This tests was not included into existing runqemu.py as runqemu was dedicat=
ed for qemux86-64 where it test various live image (iso and hddimg) can boo=
t but this live image was not supported on other qemu architechture.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/cases/qemutest.py | 44 ++++++++++++++++++++++++++++=
++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/qemutest.py

diff --git a/meta/lib/oeqa/selftest/cases/qemutest.py b/meta/lib/oeqa/selft=
est/cases/qemutest.py
new file mode 100644
index 0000000..f06e3fd
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/qemutest.py
@@ -0,0 +1,44 @@
+from oeqa.selftest.case import OESelftestTestCase from=20
+oeqa.utils.commands import bitbake, get_bb_var, runCmd, runqemu import=20
+os import tempfile
+
+class QemuTest(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(QemuTest, cls).setUpClass()
+        cls.recipe =3D 'core-image-minimal'
+        cls.machine =3D  get_bb_var('MACHINE')
+        cls.deploy_dir_image =3D  get_bb_var('DEPLOY_DIR_IMAGE')
+        cls.cmd_common =3D "runqemu nographic"
+        cls.qemuboot_conf =3D "%s-%s.qemuboot.conf" % (cls.recipe, cls.mac=
hine)
+        cls.qemuboot_conf =3D os.path.join(cls.deploy_dir_image, cls.qemub=
oot_conf)
+        result =3D bitbake(cls.recipe)
+
+    def test_qemu_can_shutdown(self):
+        if not os.path.exists(self.qemuboot_conf):
+            self.skipTest("%s not found" % self.qemuboot_conf)
+        cmd =3D "%s %s" % (self.cmd_common, self.qemuboot_conf)
+        with runqemu(self.recipe, ssh=3DTrue, launch_cmd=3Dcmd) as qemu:
+            status, output =3D qemu.run("shutdown -h now")
+        self.assertEqual(status, 0, 'Failed: qemu shutdown')
+
+    def test_qemu_can_boot_nfs_and_shutdown(self):
+        bitbake('meta-ide-support')
+        rootfs_tar =3D "%s-%s.tar.bz2" % (self.recipe, self.machine)
+        rootfs_tar =3D os.path.join(self.deploy_dir_image, rootfs_tar)
+        if not os.path.exists(rootfs_tar):
+            self.skipTest("%s not found" % rootfs_tar)
+        tmpdir =3D tempfile.mkdtemp(prefix=3D'qemu_nfs')
+        tmpdir_nfs =3D os.path.join(tmpdir, 'nfs')
+        cmd_extract_nfs =3D 'runqemu-extract-sdk %s %s' % (rootfs_tar, tmp=
dir_nfs)
+        runCmd(cmd_extract_nfs)
+        if not os.path.exists(self.qemuboot_conf):
+            self.skipTest("%s not found" % self.qemuboot_conf)
+        cmd =3D "%s nfs %s %s" % (self.cmd_common, self.qemuboot_conf, tmp=
dir_nfs)
+        with runqemu(self.recipe, ssh=3DTrue, launch_cmd=3Dcmd) as qemu:
+            status, output =3D qemu.run("shutdown -h now")
+        self.assertEqual(status, 0, 'Failed: qemu shutdown')
+        runCmd('rm -rf %s' % tmpdir)
+
--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

