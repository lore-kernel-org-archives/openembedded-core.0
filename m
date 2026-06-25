Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB861CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:00:36 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13347.1782399630732702598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 08:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qu/sLcVT;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30bf132969bso3369814eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782399630; x=1783004430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=agTOZFCHaGco+nDcn62e1ac1dA2aZNl3wKi2FDcexOc=;
        b=qu/sLcVTF3F3G1Wt9VvH6Oul7rZ73sLJQ21y9iD9Yw1y1Io2fVJmnRkTjZL0Uo7KXH
         XABft6ZXidSh6Ex26Cx46BrV4WjR5J1/auSF6Q39HPj3LTbF6lx3xq4nE+AhhwjWnAjy
         06MZIOmy8jhdatZgoD4dzH5KHTy+uRIl0B7cMiFa7UBvoir2N058ca6/3gTS3cya1/7G
         CQb6n2DHakikUEmLY4iTwJZZ5Jk6R9N9dLgp44S3UuvVyhIEP/N3nWcbjsPtiySWwIPE
         S4spGaJ1Xn3KLqwQOEq/hkNI3jUmapzYOqaHaBT0rRtSRzzvIun7adAXi5fIOkRlTbbS
         3nLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782399630; x=1783004430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agTOZFCHaGco+nDcn62e1ac1dA2aZNl3wKi2FDcexOc=;
        b=IIiMHs8ll2HDoh8s79smfJyfI71doFULIn3FS4P/Q9MS9qC0IBciXXotlsCWX/b1/y
         PUZ79Qi6g6AEwPHh0mCIoazljZLvaLaJ1crA80+qVK41pM5kvET7b+hNLLZCMvj2+3rt
         s+d2b1QRQ6K50TukiJRtz4hcxwpx0PoVhiGi0vtobkQ+eKYMyCiOXCFBB3Cav+sNgRhR
         El/DNcf3ETCE6hdN8OdnUVZHzsdx/w7cPTYPJnEcCZhaf9ZmfBwJkWb42X2mYTzhrHf/
         hw4LYRiO3KtUuVSTva4PK1vl5Og3zABBNf4ANPwpgjgBRqQxYUG9M4n3ywKTR8JLaOdx
         GmkQ==
X-Gm-Message-State: AOJu0YxtMhR763+Z2axUBZjPgyZ/XSzPA6Ys930VzqFs0s5kc/dNC4AL
	E/Q2ZiEhD7649s2fgybI7ie0p39IJbCmatA6XPcvG2mi775xN9b2qS67Oz/Jmd9qyXw=
X-Gm-Gg: AfdE7cm8Vnj8SkpWI1Q1+2pJIXDrqyZJwgG8LSZIzlHwK2DCNh86AcTbIBrZCmgjRey
	aYxUrwFPgVBWBDoTR8J8YAO9UIKY94MzISeohtqSsqxef6Uo988W1pukaTTfCKXQX0SWEb3HDJG
	e1ZIqt1skZ2Ax2l7rP24O9XQuXTQToRfYYFwyLEiF/kSzkHbZCLW6bO+pq9a4qlFSmuF/gC746m
	JGRZfQe4LSyzzG4aQZ8uAdfuidEURH+H1roQg9s1SD4aRYrRpSsSkkJc15it9DHj6C5llOo4Nam
	mKIjcKx/qcb6BageMIJ0GDkxmvvgpu/N8zTq+hNx7XXC20eA9rwghdMVCLUkwqTkEMg1jg0RiFU
	CUuvGxEUM7G/ZVHZw49q/sVOhp5PX8Uhba5b33/2LAUwTicuyz4zPf+VXPJnReuObGwyKAot3FD
	CYhUPjnlf6oQoNUXeCw86Sky9gpb0/EUCQQlfpS9k78AqJ4wcV4SM1CeIjpw==
X-Received: by 2002:a05:7300:6919:b0:2be:7fc2:fc38 with SMTP id 5a478bee46e88-30c84b72f63mr3565111eec.5.1782399629670;
        Thu, 25 Jun 2026 08:00:29 -0700 (PDT)
Received: from naduvan.timesys.com ([122.178.167.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm12691063eec.7.2026.06.25.08.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 08:00:25 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [wrynose][PATCH] util-linux: backport pam_lastlog2 libpam linking fix
Date: Thu, 25 Jun 2026 20:30:15 +0530
Message-Id: <20260625150015.2832246-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 15:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239571

pam_lastlog2.so uses pam_syslog() and other libpam symbols but the
autotools build did not link the module against libpam. With the
linker default of --as-needed, libpam was discarded and did not end
up in the module's ELF NEEDED entries. The module then fails to load
via dlopen() in processes that do not themselves link libpam (e.g.
systemd on recent Fedora, or weston on journald-based systems without
syslog):

  PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined symbol: pam_syslog
  PAM adding faulty module: /usr/lib/security/pam_lastlog2.so

Backport the upstream fix (in 2.41.5) that moves -lpam into LIBADD so
it is placed after the object files and retained as a NEEDED entry.
Against 2.41.3 only the LIBADD line needs changing.

[YOCTO #16320]

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...ix-libpam-linking-in-autotools-build.patch | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0235862666..3cdc1e2c0f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
            file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch \
+           file://0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch \
            "
 
 SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch b/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch
new file mode 100644
index 0000000000..9aaa56e7b4
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch
@@ -0,0 +1,51 @@
+From c8d0af0421f6491ab1cb2301d2e197315289d34c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 19 May 2026 10:54:57 +0200
+Subject: [PATCH] pam_lastlog2: fix libpam linking in autotools build
+
+The pam_lastlog2 module uses pam_syslog() and other libpam symbols but
+the autotools build did not link the module against libpam. With the
+linker default of --as-needed (and -lpam previously only in LDFLAGS,
+before the object files), libpam was discarded and did not appear in the
+module's ELF NEEDED entries.
+
+The module then fails to load with dlopen() if the calling process does
+not itself link against libpam (e.g. systemd on recent Fedora, or weston
+on journald-based systems without syslog):
+
+  PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined symbol: pam_syslog
+  PAM adding faulty module: /usr/lib/security/pam_lastlog2.so
+
+Move -lpam into pam_lastlog2_la_LIBADD so it is placed after the object
+files on the link line and is retained in the NEEDED entries. The meson
+build already links libpam correctly via cc.find_library('pam').
+
+Note for this backport: against 2.41.3 only the LIBADD line needs to
+change. The upstream commit also removes -lpam from LDFLAGS, but that
+LDFLAGS reference was added after 2.41.3 and is not present here, so the
+net change is the single LIBADD hunk below.
+
+Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2453457
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/c8d0af0421f6491ab1cb2301d2e197315289d34c]
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
+---
+ pam_lastlog2/src/Makemodule.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemodule.am
+index 40d597c58..876171e9f 100644
+--- a/pam_lastlog2/src/Makemodule.am
++++ b/pam_lastlog2/src/Makemodule.am
+@@ -11,7 +11,7 @@ pam_lastlog2_la_CFLAGS = \
+ 	 $(SOLIB_CFLAGS) \
+ 	 -I$(ul_liblastlog2_incdir)
+
+-pam_lastlog2_la_LIBADD = liblastlog2.la
++pam_lastlog2_la_LIBADD = liblastlog2.la -lpam
+
+ pam_lastlog2_la_LDFLAGS = $(SOLIB_LDFLAGS) -module -avoid-version -shared
+ if HAVE_VSCRIPT
+--
+2.43.0
-- 
2.34.1


