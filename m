Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8CDCCFA13
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 17:01:58 +0000 (UTC)
Received: from xmbgsz7.mail.foxmail.com (xmbgsz7.mail.foxmail.com [61.241.55.243])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9.1762553466528332273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 14:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foxmail.com header.s=s201512 header.b=OkpVJrMj;
 spf=pass (domain: foxmail.com, ip: 61.241.55.243, mailfrom: wenyang.linux@foxmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1762553460;
	bh=gaOaEWNzbqa8wlXuc6y3FRfzunfToF5U3o7gNrEWyks=;
	h=From:To:Cc:Subject:Date;
	b=OkpVJrMjcUQZG+zupbCYFjI9V0q1WwZ2bI1moJcbt82Dejl20ywqv9PlRGmr+b+j0
	 RcuirTZ3u/CxFKsGovkuUrpCKvHR/OL1AwTfAmDap3n0N5Nobjav07SFW6wtNtFW2j
	 RhBYt8IUxQvepvDyKrh+ELFw+1REckfKIYgAqX7A=
Received: from localhost.localdomain ([2409:891f:8fc1:ec4:3dc2:f75d:ce02:2668])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 781E40E; Sat, 08 Nov 2025 01:01:56 +0800
X-QQ-mid: xmsmtpt1762534916ts23xgc15
Message-ID: <tencent_27FD029FC5AAAEA8AB837C276FD225996D09@qq.com>
X-QQ-XMAILINFO: NUYPVyrd/y6Pm48PU7xmaVALh/sXHWP1VhwAtdLkaiFbjtZSe/knpDiIa/2mpP
	 Q8PjQqQJ5UJoRQq7wQsJJkakx9cV0R/0IOpnR0zhttfFfj44LmC6XTefmvtR/VVQZG8outmF+4lR
	 RAqVY1ufejlrBjpH2xJ1zIHBSnPD7HgMHVVd0BJ/sI++3fZHrlW6mGn7JTvvwd6acPgJBEnhkXF9
	 tEE1Xvky8ffh+AJuxxByMfVKCBd6IJO2oInw28JvXwXh2BjF3sCT0QDOlkFcJpUIB+9i6DynZVol
	 f0fLEs/XVJu5aTmW0fbPHkZzpZiePFtaRQlWvePwp33PFh8AUXaLwbOQXJmMV1G2Who074BxnRri
	 KO/0x0c0Ahlz2Vj+lXwM5969CiFmR3aMDEXpBEQjq1COQ4ublkflBkt/QFCuFpajx26yojrjNUiz
	 oXsYs+P/lvLnGmXFrLPDscftBxSgs1d4+l31pdZIq9py9Zl3rNeM4wNLIgW9EeZyQLE/sQElBftu
	 2d9rLEJUhr3zAoC0FALNPzIr130IN7M+CImUmAoKQvzueUi3zidAiQrBR8REWRvcfuMrTc2xnV5N
	 HXCfOd6hK2G7Jkj8WS/W84u2eDvm/RPHi2xzchRzdoOvUkxgmS83y9XOdsWeHxjVOVNxyMXAsI5W
	 ESiR/AgduDzSNWgjAf2I6uc8AcE8oIDwfC4a6hUx8JlJHXCi4R3cGl9pv224k2kgcpbnu/fSUKiv
	 T6p0K6jZ21X3uqLS4+OkO2ZnBO+M/mqXgRbq8U/SfVAXxz9yUOKwDlK2A7ZiaB1YfAScQjELrqlN
	 ywCJECPJJvORl1xQoxLCdzQwxxYqSsU6bk99oFm/3RaaS4XdMtfxIcdED3EECAmxDTcOVJKLOoT9
	 Qff7BZ5vsA037Yej8oy0cry/Ff/Qe0c0+xkSfLVvlXqX8SGQ/yCbJE7OHWkCwRHkJ1gzQR0iKPsC
	 KQO8Ma4inMLEI65sPW9IKBoM3ivAgELHSMohRk37SnyTqW8ErkzuqhXw6wbIjmgQeEjCEWvdkyE8
	 qhfXCzXmg6SmTogmP1NkY+MmkFN6rkf4V5JlIzxv15TzfZ6bQH9fNXQBJ9kiw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: wenyang.linux@foxmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Wen Yang <wenyang.linux@foxmail.com>
Subject: [meta-oe][PATCH v2] nethogs: add recipe
Date: Sat,  8 Nov 2025 01:01:49 +0800
X-OQ-MSGID: <20251107170149.8083-1-wenyang.linux@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 17:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226082

From: Wen Yang <wenyang.linux@foxmail.com>

NetHogs is a small 'net top' tool. Instead of breaking the traffic
down per protocol or per subnet, like most tools do, it groups
bandwidth by process.

Signed-off-by: Wen Yang <wenyang.linux@foxmail.com>
---
 .../recipes-connectivity/nethogs/nethogs_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/nethogs/nethogs_git.bb

diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
new file mode 100644
index 0000000000..29af14961c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "NetHogs is a small 'net top' tool that can group bandwidth by process"
+HOMEPAGE = "https://github.com/raboof/nethogs"
+SECTION = "console/network"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/raboof/nethogs.git;branch=main;protocol=https"
+
+DEPENDS = "ncurses libpcap"
+
+inherit meson pkgconfig
+
+SRCREV = "08daf76d8123943392c84a07108beea3e23ea39b"
+
+FILES:${PN} = "${bindir}"
+FILES:${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/lib*.so* ${libdir}/*.la ${libdir}/pkgconfig/*.pc"
+
-- 
2.25.1


