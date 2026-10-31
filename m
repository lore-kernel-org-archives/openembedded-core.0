Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3752.1793405767245853208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=PzzR6iO2;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13645195e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405765; x=1794010565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e7UAWR+Nk7/pNeu2Y9kU1H0diu/iQ72DNQgmENMeLT8=;
        b=PzzR6iO2KralpF85YjwjXboed/5MNwzTPzESQmpB8yMgzFSWw35wdjxZZtz4SFw9qN
         vEJcHw6oOmnbvRIicYmAkyQ2oSPf94hBkKXDxDWPURLKnr2m4Rma3h9p7UqHRC4PoZrl
         oSTx3BO0oktn6Gnp+CiH5a5prP74zcejBt7z4xQ9NvO5cFzw0u30GLjMkG7l/I+W435n
         1hqkj/wlp+Cq5euZJ9hG0AOZvZoJhj3zwFz2wo40XtQu3QdqpkeViuHhVqwFyyY6N0S5
         ii8+tLsgqx4ml27eKXrqa+7LH9tF6EN+r3UsFU4Oyswa4vX0Z5dCeeAMuavJKMjoYBu4
         CITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405765; x=1794010565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e7UAWR+Nk7/pNeu2Y9kU1H0diu/iQ72DNQgmENMeLT8=;
        b=RMzCVOW1rFz0Yt0YFgG99KoXC6pV9YHIQXhSP/f6RMHZ39thW07/x9c6nAB2uZXUYi
         wSJ/htMGKvazHI0V4kHsaP1TtY/jq3RKqZMOzCDDs9oX7kKnq7dGAzfHWbMlP51CCEyT
         EypFMYuC96lVBWyYEsa7HrkR+qM3A//CH9nUKRHsIk/z4PbLgyN2CWEQKhsiHo5Vfa4A
         EidlBAAXXusdd6EnnqB/g4Wd92qr8xK8CNEY0ztlcVboDdSz/v2OtGH0HXmXj7pjLaKm
         EWYEkY9kit3SslWuFvm4D14FdD2bwABaCeQXhC3cjfdY3u7uBfQUBI4J8Ob0uag+mF/j
         RIxw==
X-Gm-Message-State: AFq9FYJozOfrsIdgzGYimj3nR4DtWeI5DBd0C2TIA3rtp//5mslLYOXc
	5oB7xj1i4iR7R1XA750UUftzDh9s54JTkZ29DLArqZWvKMIL66cUr0xa2g4h1jvlb0lsK6OSjQN
	AkcZyf2I=
X-Gm-Gg: AYBFou19/NPRIso+o82COA22pE7kE+u7Hta/B1CHkhz/9yOJYA+fykYjsS4xkufTOsc
	fi3d/pbsT7zN7PjOVNf1bdXGA40Wu3mo26Z8/PNb7xe5cvakZTKlTUGXo7uCHNby5JYp+jVS4ez
	VWiiSJl5cEoiHX4SjS0g+QNddsZcRlYqpGH9KE8RLnyUow4LW1XARr2p7ut/sdZQyN3HvAHOjXl
	skyO80j1oP95IxLdSf5zbif12QRqjTgkzo3mLSNg0yfifhVq5BmXtFRqkgrxvsvRC/5qvhK34oT
	M8v0s5UqnEPYUZSvx2PrX7mxx/JWH7u69p/+5atMX0EasxZqa5nLNwswjy1aO5pndA207b2sPFH
	vu6b3rrKsphEp5oghzilXVrRFO4Y+Piyu8j8vtaTk5kwVEiV0OrXx2omx2Ggq9VdHtkr2QI7Tfi
	KIi817otJJkTyKRhF0HUESQm8BEDESD/q0TCxt7NU+0LaD51T4S6oBZ9SZskEeHdolokj4oPh2z
	YVqn5kIMx26+3wJvFj8Vh/FWpQ1IzSBXE/AZudHIYiBvahORLQm4CWgLeKHJJrn4smxlYJAHndH
	JC7HpiQdOwdblPLFg+TgGxmDf6TsnETW1bYD8YrzBys36WascIsDcGeCLE9vQytRA1XuL4MRVJK
	8Vct/hmK1yWk5yEG+MPTP12w2vhhE
X-Received: by 2002:a05:600c:8b63:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4ac17ff9d41mr82056125e9.20.1793405765441;
        Fri, 30 Oct 2026 17:16:05 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 38/55] shadow-native: Disable syslog usage
Date: Sat, 31 Oct 2026 01:14:59 +0100
Message-ID: <8f136272878dea4e0540e2f53491a2b5c37821f3.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249113
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Spamming the build host's syslog with useradd information during image creation
isn't great. Add a patch to disable that.

It may be possible to convince upstream to make it a configure option but for
now the patch is trivial and reduces host impact to the logs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a52572886e60e4aff9d54b57bf45a301e1dec1ee)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../shadow/files/disable_syslog.patch         | 22 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/disable_syslog.patch

diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
new file mode 100644
index 00000000000..7299a8e61cd
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -0,0 +1,22 @@
+When building images using shadow-native, we shouldn't be spamming the host's
+log with lots of syslog messages which aren't relavent. Disable syslog use
+in the native case.
+
+Upstream-Status: Inappropriate [Would upstream accept a configure option?]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: shadow-4.17.2/lib/defines.h
+===================================================================
+--- shadow-4.17.2.orig/lib/defines.h
++++ shadow-4.17.2/lib/defines.h
+@@ -88,7 +88,9 @@
+ 
+ /* cleaner than lots of #ifdefs everywhere - use this as follows:
+    SYSLOG((LOG_CRIT, "user %s cracked root", user)); */
+-#ifdef ENABLE_NLS
++#if 1
++#define SYSLOG(x)
++#elif ENABLE_NLS
+ /* Temporarily set LC_TIME to "C" to avoid strange dates in syslog.
+    This is a workaround for a more general syslog(d) design problem -
+    syslogd should log the current system time for each event, and not
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index a308ea00d24..37aa7b1f17c 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -24,6 +24,7 @@ SRC_URI:append:class-target = " \
 
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
+           file://disable_syslog.patch \
            "
 SRC_URI[sha256sum] = "a305edf5d19bddbdf5e836d2d609fa8bff2d35458819de4d9f06306a1cf24342"
 
