Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13585.1795774910514982996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 02:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yBlEpXpw;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4703232f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 02:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774909; x=1796379709; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UXvP7+MHCO6TEKx0fCmEwvLv0I7UtY5hQCWbb+s+HM4=;
        b=yBlEpXpwKxptVI91w9LyldNCDYAThvMhWdpJELmPlXZQ/zMlbm3XxXHtyvR+beKFnE
         WOTpHrbSQnHBxWFATqYN+nEQPhMzuP0TDNdFgW6FWwyReOcLmvrIk9gkASNMG3gVyM91
         Hgvg8AfAgeUw9MOqPSfaEyHwf+5Ve7+B41wtlu/nB83cBNfw3/QPpINUIvDDp3fAZ+d4
         zHQJAsSzBRix4zdl5VJjHcDbht3WbY3j212HCc8R0DJd/NuK0wLxcyzUEMtZY2ZluH/R
         I7RAVvgRwp9HQcXqOHCkgcF6GJCbVD1IiPB522GG5dfLcVNi5o2MqNNSAPo8jXCWflxv
         8eqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774909; x=1796379709;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UXvP7+MHCO6TEKx0fCmEwvLv0I7UtY5hQCWbb+s+HM4=;
        b=Koeme5IlPaE8zl/xbMAzw7alYRx1fWGFo5KwfxKbG2nyciSXb1ks3vGSlMV3+xHdxg
         y5SzgQ7om3qp89Wnsg7lBFRsMHIYfAEuKQSRTnlQdj/4LuQ6QFLuoNVlobbKTl7cHGNZ
         H8Q2KL4uCDwVgxGaoCsD0D5x/YPuvUSfoVabm9gvOijcg/W7uZZVcX3Fzypzj94Klc4c
         1jjBoCx85qjP6drVYMSrO/YYECvpklhjJM5b2n0nzZGKAbJcpCti/xSthOsLt3FBpxiN
         okOQiq5VrTKzYDZYffsyF8nizh6921jtmD8GYVkJMH5GvMp66icgmlrrbvxdf7X/+Gda
         v5Gw==
X-Gm-Message-State: APuU4Z/5JrRNIdX8OcVfzoN18hlfYkc6NMZKw5LJfnWWvmgWJ2jgGpSH
	xQgWJFyP0IBFO+gbGuhA4j1QZ30GLWzZvUdvZle6tGXE2VZJlmccOKHxyErerA==
X-Gm-Gg: AZFdTZcdz7Ly1dvESkTtrYus7H0YfMPo52EDCkH9831QT51a5+kCtzQNFyuMAkU9c2t
	vPkj6pMfYpAcGziHfjSW1hCGjYrP4KQR3ga9YNGeGShV/G32hSOy+uS5mc1+qC9i+5MArqchVLy
	GR5hOHpu/avYu4DVIaItloBbh2gtxRw/d8FCBhHjim8fSnoXsi4TnTSW1WK0Fi7NyVc1XaI9IFR
	rvG9E7f8oqbDEU1HOXKnHVnwWZevc073IMh0LV24U5blcKKrWjdH+QqyXd0mv7zyvTYdwATwjpG
	gRhehXmM4kOq4uRu28scJdF9gWstN5A2JPoxqbynOvI7pSY9WlgS0GUQwR+5EhB6S1SVEX0GsQN
	CV9VTGe7kfYKkdPnAfFWzafIjQ1mqzKCUA9wIaDET6sWH3kpY9HcVkB7Zb5/CSKsgB7qad2ut85
	u16HtpMu2/eUVotNxSHZBzzBTpCbaqjeDoq6OSeP7wCgdRr+HqEhNTceaO0LGh4UyYxKaKjpNMQ
	ulAeoEjwdiBQpH1RY5/1qMNJtBRWkK8HZlhTATrtvn8kcuDrbOP8bGzjbt6eqXKY9mriLD/sPN2
	BtulDH8G+FVzFH6toJCPO5P1z/tiIsJ06EWp8y7ZEdAo0lVof/1FEqCgo4gToudQ+QbQo/swrbW
	KMD7gu1RQderFyBB3i79Du5c8Dw==
X-Received: by 2002:a05:6000:178d:b0:4bf:2f91:dc71 with SMTP id ffacd0b85a97d-4bf2f91de3bmr3886808f8f.42.1795774908639;
        Fri, 27 Nov 2026 02:21:48 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm46279431f8f.42.2026.11.27.02.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:21:48 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 27 Nov 2026 10:21:33 +0000
Subject: [PATCH wrynose] busybox: fix garbled ash tab completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-busybox-lineedit-tab-completion-v1-1-b03e71a045b9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKxZCWsC/yWNQQ6CMBBFr0Jm7SRtFTVexbBgyqBjsCWdohDC3
 a26fHn576+gnIQVLtUKiV+iEkMBu6vA39twY5SuMDjjjta6E9KkC8UZBwnMnWTMLaGPz3HgXLZ
 Y97Q3tT2TORgolTFxL/Pv4QrvtISoDM1f6EQP9vnbh237AIc0hFyMAAAA
X-Change-ID: 20261127-busybox-lineedit-tab-completion-5fb30518b040
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 10:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251368

busybox 1.37 moved line editing to stderr (fd47f056765a) but left the tab
completion list on stdout, so a double-tab completion garbles the command
line and leaves the cursor a line low. Backport the two upstream fixes,
which are in 1.38.

AI-Generated: Claude Code (Claude Opus 5.5)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Double-tab completion in ash garbles the command line on busybox 1.37:
the completion list went to stdout while line editing moved to stderr.
Upstream fixed it in 1.38; this backports the two fixes.

master has 1.38 already. The same patch applies to whinlatter and
walnascar, which also carry 1.37.0.
---
 ...-fix-printing-lines-during-tab-completion.patch | 37 ++++++++++++++++++++++
 ...02-lineedit-fix-left-over-print-to-stdout.patch | 33 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb        |  2 ++
 3 files changed, 72 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox/0001-lineedit-fix-printing-lines-during-tab-completion.patch b/meta/recipes-core/busybox/busybox/0001-lineedit-fix-printing-lines-during-tab-completion.patch
new file mode 100644
index 000000000000..59ced37744d2
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-lineedit-fix-printing-lines-during-tab-completion.patch
@@ -0,0 +1,37 @@
+From 7e469dc3697df810973394b5cfaf81fbe48bc330 Mon Sep 17 00:00:00 2001
+From: Ahmad Fatoum <a.fatoum@pengutronix.de>
+Date: Tue, 15 Apr 2025 23:45:54 +0200
+Subject: [PATCH] lineedit: fix printing lines during tab completion
+
+Indentation and escape characters are all output to stderr now, but the
+matches themself remained on stdout leading to garbled output on Tab
+completion.
+
+Print the results to stderr as well to fix this.
+
+Fixes: fd47f056765a ("lineedit: print prompt and editing operations to stderr")
+Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=37abfb919dfa92132bc7a14c583016a46026729b]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ libbb/lineedit.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libbb/lineedit.c b/libbb/lineedit.c
+index 543a3f11c3e4..1f4b011008b6 100644
+--- a/libbb/lineedit.c
++++ b/libbb/lineedit.c
+@@ -1170,9 +1170,10 @@ static void showfiles(void)
+ 			);
+ 		}
+ 		if (ENABLE_UNICODE_SUPPORT)
+-			puts(printable_string(matches[n]));
++			fputs(printable_string(matches[n]), stderr);
+ 		else
+-			puts(matches[n]);
++			fputs(matches[n], stderr);
++		bb_putchar_stderr('\n');
+ 	}
+ }
+ 
diff --git a/meta/recipes-core/busybox/busybox/0002-lineedit-fix-left-over-print-to-stdout.patch b/meta/recipes-core/busybox/busybox/0002-lineedit-fix-left-over-print-to-stdout.patch
new file mode 100644
index 000000000000..03edb41f4573
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0002-lineedit-fix-left-over-print-to-stdout.patch
@@ -0,0 +1,33 @@
+From d19748647d03ca9a067119ce6e040fbd7b45c695 Mon Sep 17 00:00:00 2001
+From: Ahmad Fatoum <a.fatoum@pengutronix.de>
+Date: Tue, 15 Apr 2025 23:45:55 +0200
+Subject: [PATCH] lineedit: fix left-over print to stdout
+
+There's code printing to stderr both before and after the single call to
+puts inside put_cur_glyph_and_inc_cursor().
+
+This is likely an oversight as we want everything to go through the
+same file descriptor, so switch it over to fputs.
+
+Fixes: fd47f056765a ("lineedit: print prompt and editing operations to stderr")
+Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=952a7b9cececa314b2f5a9827dac8213b1a74460]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ libbb/lineedit.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libbb/lineedit.c b/libbb/lineedit.c
+index 1f4b011008b6..206fc36ef5c0 100644
+--- a/libbb/lineedit.c
++++ b/libbb/lineedit.c
+@@ -451,7 +451,7 @@ static void put_cur_glyph_and_inc_cursor(void)
+ 		 * have automargin (IOW: it is moving cursor to next line
+ 		 * by itself (which is wrong for VT-10x terminals)),
+ 		 * this will break things: there will be one extra empty line */
+-		puts("\r"); /* + implicit '\n' */
++		fputs("\r\n", stderr);
+ #else
+ 		/* VT-10x terminals don't wrap cursor to next line when last char
+ 		 * on the line is printed - cursor stays "over" this char.
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index b020c923be32..6cabd6252653 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -67,6 +67,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2026-29004-01.patch \
            file://CVE-2026-29004-02.patch \
            file://CVE-2026-38754.patch \
+           file://0001-lineedit-fix-printing-lines-during-tab-completion.patch \
+           file://0002-lineedit-fix-left-over-print-to-stdout.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"

---
base-commit: 16a03ed6c2db2fa1d7edac4f288a74958a00eb9f
change-id: 20261127-busybox-lineedit-tab-completion-5fb30518b040

Best regards,
--  
Alex Kiernan <alex.kiernan@gmail.com>

