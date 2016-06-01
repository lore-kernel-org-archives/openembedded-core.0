Return-Path: <prvs=2960505f4b=michael.davis@essvote.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Jun 2016 19:17:49 UTC
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id E38B1771B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 19:17:49 +0000 (UTC)
X-AuditID: 0a00029b-f79436d000000d21-17-574f31579f24
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	76.93.03361.8513F475; Wed,  1 Jun 2016 14:02:48 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0235.001;
	Wed, 1 Jun 2016 14:02:48 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] syslinux.bbclass: Added configurable
	SYSLINUX_ALLOWOPTIONS variable
Thread-Index: AQHRvDgv+p6Lr5O500Cjyad7SmNf4g==
Date: Wed, 1 Jun 2016 19:02:46 +0000
Message-ID: <1464807721-6653-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.126]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWyRiBPQzfC0D/cYGGviMWdn+/YHRg9zm1c
	wRjAGMVtk5RYUhacmZ6nb5fAnbH5wV22gs9cFdMmJzQwNnN2MXJySAiYSDzaeYQJwhaTuHBv
	PVsXIxeHkMBRRondfd2MEM5MRon1Zz+wglSxCRhJnLu+iRHEFhGIllg6YyY7iM0sYCDxbvNG
	sBphgTCJC+/PssPU7Jw0iw3C1pPo6H0PVsMioCKxbspRsM28Ah4Sk1t/g9UwAl3x/dQaJoiZ
	4hK3nsyHuk5AYsme88wQtqjEy8f/WCFsOYmP726yQdTrSdyYOgXK1pZYtvA1M8R8QYmTM5+w
	TGAUmYVk7CwkLbOQtMxC0rKAkWUVI1+ukV5qcXFZfkmqXnJ+7iZGYLhzMTDN3sG4Z4LDIUYB
	DkYlHt7w677hQqyJZcWVuYcYpTlYlMR5VYSUwoUE0hNLUrNTUwtSi+KLSnNSiw8xMnFwHmKU
	4OCSEilOzUtJLUosLcmIB0VVfDEwrqQaGP2VpQp1Hi1qMTk0/9R1M9FdCvmp7w08y4tZladJ
	5ilUTy+Yq5ZY6vdNTPPc71uMi7+tM3v7rclFZLqW6P1laj0xAs93Kt76abevUKNX7urypztr
	b1yymC28cY1S1V2HjI9/SrVTdN54LZzlPv/JHynPZRPqWQRuGTenTNEWn3W+uD2meq5CjRJL
	cUaioRZzUXEiAA0A7BBzAgAA
Subject: [PATCH] syslinux.bbclass: Added configurable SYSLINUX_ALLOWOPTIONS variable
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
X-List-Received-Date: Wed, 01 Jun 2016 19:17:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The new variable allows for images to be created without an
editable boot line in syslinux.  Default behavior remains unchanged.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 meta/classes/syslinux.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index d4ae699..1d310dd 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -30,6 +30,7 @@ SYSLINUX_SERIAL_TTY ?=3D "console=3DttyS0,115200"
 SYSLINUX_PROMPT ?=3D "0"
 SYSLINUX_TIMEOUT ?=3D "50"
 AUTO_SYSLINUXMENU ?=3D "1"
+SYSLINUX_ALLOWOPTIONS ?=3D "1"
 SYSLINUX_ROOT ?=3D "${ROOT}"
 SYSLINUX_CFG_VM  ?=3D "${S}/syslinux_vm.cfg"
 SYSLINUX_CFG_LIVE ?=3D "${S}/syslinux_live.cfg"
@@ -114,7 +115,12 @@ python build_syslinux_cfg () {
         for opt in opts.split(';'):
             cfgfile.write('%s\n' % opt)
=20
-    cfgfile.write('ALLOWOPTIONS 1\n');
+    allowoptions =3D d.getVar('SYSLINUX_ALLOWOPTIONS', True)
+    if allowoptions:
+        cfgfile.write('ALLOWOPTIONS %s\n' % allowoptions)
+    else:
+        cfgfile.write('ALLOWOPTIONS 1\n')
+
     syslinux_default_console =3D d.getVar('SYSLINUX_DEFAULT_CONSOLE', True=
)
     syslinux_serial_tty =3D d.getVar('SYSLINUX_SERIAL_TTY', True)
     syslinux_serial =3D d.getVar('SYSLINUX_SERIAL', True)
--=20
2.5.5

