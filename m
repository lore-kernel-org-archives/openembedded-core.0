Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1839F750C8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 21:46:55 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c19-v6so18067pls.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 14:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FhdMezKGxTE1yO6dnXf1JOK0XWEhDrypZRdiG3vSgL8=;
	b=MnkpOStN9O/peGJmcpcGZcfJFOPHlUY5q+lGglM4mzPdhkVtz15ilwEJgT2FP3Y7z0
	tRqoRhRuK/2IxTcc7K67SpdCp0UIYZ0daTXcw4n0k0jJvLjGOdHDZ0i0hRWl5gLZaBhh
	ITVDcUqg4xlsYGQY9nmgXIH+KtjvLkAl+Y5u55KwUEi9luiJqH0I2zOaUnmmhCh60DxI
	7ZFv6jQw1V1xzf2Dp9pN8GGoISxZLNiuR3PaSrQEHRaa8ygAGM0fnuECr1kkrFzELWE/
	S6UzedxbSQaNELcwcRkz2E9YeZYWZ8fgxPijDn69Ljivw0wmjTSRx8XnkamueibYPRWJ
	i1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FhdMezKGxTE1yO6dnXf1JOK0XWEhDrypZRdiG3vSgL8=;
	b=UH6MoxtYmkr3sxLnmXhqOHNoToD2jUCFEq3WtY43vTqJtLoT2nc42hHwRTWauWeile
	Dghbzvw2XHhz0bK4DqN9FDae1lsZ09Rk/uA1WDI6cg/26zYDXy2wRGb71H6B7ZpR5NGD
	9uq0UbgOLjsV3OLzVudUY6JhQrz9eI6PkXTxsG4u43Vxbb7RP9lBKqKqo4gR8nvroRPM
	YjHvdVoEN773R1VvjAGsWOOQe0DR2KThcztAxy645FsrncXkO56z6riAEX6qPbIZkFhj
	FJeZQ/3lhHll95GFHMZgnS6nV234XW0nt/vaVCeapFmmmuFBJIa3qCupD5q/4iT1STu1
	qX9g==
X-Gm-Message-State: ALQs6tDkt0e/VQMRIDQabInFtwMANSPw98ldotR3uoTq41ryM0OiGXea
	LFwgpeeHS6JFCRQo009WuV4HJg==
X-Google-Smtp-Source: AB8JxZpd3OD8YpXV2990tVNtTrjb+3CTIB1t47iyD2qz+MioEZSj+zoAX/7hAvvuX1eILdF/MwYBuA==
X-Received: by 2002:a17:902:566:: with SMTP id
	93-v6mr47682240plf.327.1525902416750; 
	Wed, 09 May 2018 14:46:56 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	76-v6sm3699193pge.75.2018.05.09.14.46.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 14:46:56 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 14:46:42 -0700
Message-Id: <1525902408-6796-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
References: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 2/8] babeltrace: move ASNEEDED over-ride into the babeltrace recipe
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
X-List-Received-Date: Wed, 09 May 2018 21:46:56 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Also misc minor recipe cleanup (re-order variables to follow the OE
style guide, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc        |  1 -
 meta/recipes-kernel/lttng/babeltrace_1.5.5.bb | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 6a8ad9d..38de3a1 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -1,7 +1,6 @@
 
 ASNEEDED = "-Wl,--as-needed"
 
-ASNEEDED_pn-babeltrace = ""
 ASNEEDED_pn-console-tools = ""
 ASNEEDED_pn-distcc = ""
 ASNEEDED_pn-openobex = ""
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
index 5d7a7ef..2a2fa1e 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
@@ -2,18 +2,18 @@ SUMMARY = "Babeltrace - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
 HOMEPAGE = "http://www.efficios.com/babeltrace/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-
 LICENSE = "MIT & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-inherit autotools pkgconfig
+SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
+SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
+
+S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5 \
-"
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-debug-info"
 
-S = "${WORKDIR}/git"
-SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
+ASNEEDED = ""
-- 
1.9.1


