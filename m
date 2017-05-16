Return-Path: <sona.sarmadi@enea.com>
X-Greylist: delayed 890 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 May 2017 12:20:00 UTC
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.32])
	by mail.openembedded.org (Postfix) with ESMTP id 5961C77D60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:20:00 +0000 (UTC)
Received: from 1dAbDy-0002Lf-VJ by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1dAbDy-0002M2-Vl
	for openembedded-core@lists.openembedded.org;
	Tue, 16 May 2017 05:05:10 -0700
Received: by emcmailer; Tue, 16 May 2017 05:05:10 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <sona.sarmadi@enea.com>)
	id 1dAbDy-0002Lf-VJ for openembedded-core@lists.openembedded.org;
	Tue, 16 May 2017 05:05:10 -0700
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Tue, 16 May 2017 14:05:10 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 May 2017 14:05:06 +0200
Message-ID: <1494936306-1567-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH] Qemu: update to 2.8.1.1
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
X-List-Received-Date: Tue, 16 May 2017 12:20:01 -0000
Content-Type: text/plain

Fixed CVE:

 - CVE-2017-2620 (Severity = High)
display: cirrus: potential arbitrary code execution via cirrus_bitblt_cputovideo

Reference
https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg04700.html

Removed patches (already in upstream):

- target-ppc-fix-user-mode.patch

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-devtools/qemu/{qemu_2.8.0.bb => qemu_2.8.1.1.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_2.8.0.bb => qemu_2.8.1.1.bb} (87%)

diff --git a/meta/recipes-devtools/qemu/qemu_2.8.0.bb b/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
similarity index 87%
rename from meta/recipes-devtools/qemu/qemu_2.8.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
index 19d7e8f..1d5bcf9 100644
--- a/meta/recipes-devtools/qemu/qemu_2.8.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
@@ -19,7 +19,6 @@ SRC_URI += " \
             file://no-valgrind.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
-            file://target-ppc-fix-user-mode.patch \
             file://glibc-2.25.patch \
 "
 
@@ -28,8 +27,6 @@ SRC_URI += " \
             file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch \
             file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
             file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch \
-            file://CVE-2016-9908.patch \
-            file://CVE-2016-9912.patch \
 "
 
 SRC_URI_append_class-native = " \
@@ -39,8 +36,8 @@ SRC_URI_append_class-native = " \
 
 SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "17940dce063b6ce450a12e719a6c9c43"
-SRC_URI[sha256sum] = "dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62"
+SRC_URI[md5sum] = "a6a23a0c59fd0f8ec564b0fb89a79954"
+SRC_URI[sha256sum] = "f62ab18a1fb9ff5b4c81ed44becc945b11581eff777618141bdb787da55d3638"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
1.9.1


