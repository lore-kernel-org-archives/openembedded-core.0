Return-Path: <prvs=996553dfac=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 90862770FE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 14:16:20 +0000 (UTC)
X-AuditID: 0a000213-f79116d0000013a5-d3-575585b3cc36
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	66.7E.05029.3B585575; Mon,  6 Jun 2016 09:16:20 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0235.001;
	Mon, 6 Jun 2016 09:16:19 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-CORE][krogoth][PATCH]] syslinux.bbclass: Added
	configurable SYSLINUX_ALLOWOPTIONS variable
Thread-Index: AQHRv/3+hxYH9n1q7EGyKQcq2/7pvQ==
Date: Mon, 6 Jun 2016 14:16:19 +0000
Message-ID: <1465222404-3305-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.137]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWyRiBPQ3dLa2i4wY7pTBZ7Py1itLjz8x27
	A5PHzll32T3ObVzBGMAUxW2TlFhSFpyZnqdvl8CdMXXxd7aCX1wVnXtOMjUwdnF2MXJySAiY
	SCy//5cRwhaTuHBvPVsXIxeHkMAJRom+Vx+gnJmMEmvufAarYhMwkjh3fROYLSIQLbF0xkx2
	EJtZIFHi4+1eFhBbWCBT4vqWbSwQNXkSy1dPZ4Ow9SQ+/Z/BCmKzCKhIbPx0lwnE5hXwkOjp
	+Q82hxHoiu+n1jBBzBSXuPVkPhPEdQISS/acZ4awRSVePv4HNIcDyJaT+L/FA6JcT+LG1Cls
	ELa2xLKFr5khxgtKnJz5hGUCo8gsJFNnIWmZhaRlFpKWBYwsqxgFcxMzcwz1UouLy/JLUvWS
	83M3MQIjgYuBSXgH45wptocYBTgYlXh4L0wKCRdiTSwrrsw9xCjNwaIkzqsipBQuJJCeWJKa
	nZpakFoUX1Sak1p8iJGJg/MQowQHl5RIcWpeSmpRYmlJRjwotuKLgdEl1cCo7Cz47KH7fBb7
	lJ8tZWuryvWnP3km3HsvVuhEIUfE5pBY24rgGj3H1+9WZJb/WFd5sOkew87Opd7fRGS/czuE
	tYWvKxLNOLc5IvLQuqn6+d9bVu5h0/Z1F+0quTMl739OTc2dm08ip9l9ld02X6yZY58re9en
	mivTeEOe6eTpixSJ/Qhmc1JiKc5INNRiLipOBABSGKtpgAIAAA==
Subject: [krogoth][PATCH]] syslinux.bbclass: Added configurable SYSLINUX_ALLOWOPTIONS variable
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
X-List-Received-Date: Mon, 06 Jun 2016 14:16:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The new variable allows for images to be created without an
editable boot line in syslinux.  Default behavior remains unchanged.

Backport from master (935578c139a260c18e437419be82d7fd7e8be81a)
---
 meta/classes/syslinux.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 4fcb0c5..52fb51f 100644
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

