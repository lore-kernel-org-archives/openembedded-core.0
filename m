Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 99E9B77225
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:52:27 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 75so30903531pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=2obiXrx2xBgrPIUg1VKpFGZTH0WMs/YiArdOsldW1hs=;
	b=ArhiBxdL5Awp0oxyYnO8O4lZYBS1Nm/eO4H4mMXkPHalUEg6tdCAj7lRin01PP2EO8
	5B4LOqsRiqOCR4+jCjGvwBaUbWeRvzRvqcanFK3QM7vRe8z/J7KQa14o/YM7pMVRDZj/
	HPUAZR5x60CU5sgOjiYnBk0GZ/M42Zyv1xOk7h9l7+J3R3lVVHLBegnZqv28OyQYewN5
	QIA1jQ+JUxAMaJVSy7b8JIe9LpRUn3Sh6h7BieWIUbFnblWTbjsZ6u6MmAAV6DBqvXhB
	0Our1afHlZtQ3moQMrj35mV1ofPWEhf4b7Ak8viGf9+ynJtK+Nj1JGNZiEmyOgZm6BAQ
	MmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=2obiXrx2xBgrPIUg1VKpFGZTH0WMs/YiArdOsldW1hs=;
	b=ewp/GkwYxunjK8S0tZ4SLM3tkEtvB0Ku+TBDOr0MCZk6gDvIigvQeuU8o0PaEhdHuM
	BMM2eAbfFlae81lGBAKvWis1dhTZJX+5CrPT4QJm1krUXBliq29M+bwDIx0d04GRdAEw
	dV+W25GNEYoah5hRiWbaXvX8VP2VDt/0PuSPSiFlIxAB3v19lvsN+LnpobImzssaAL9i
	GM8+anbz2Cq/Kka8nsYYCyO+TnekKxtvhaxqzRbbVU7owWBc3s6iNmf+8r9W6zFKQaqq
	H4v6ArEpwtZlQSXIKPZC0XM5VnT4uTK03tSJVCFnnj0zOqum0csR0uDMj6+gqze2XCbf
	KnrQ==
X-Gm-Message-State: AIkVDXJdLRwpd6YU5T3hm69dVF10jjbIJEZSzSTEzydf5TFPoWVZ+DeW04B2Fh/gYA1m7A==
X-Received: by 10.98.133.11 with SMTP id u11mr21841898pfd.132.1485762747892;
	Sun, 29 Jan 2017 23:52:27 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	w2sm29687601pfi.65.2017.01.29.23.52.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:52:27 -0800 (PST)
Date: Mon, 30 Jan 2017 17:52:07 +1000
Message-Id: <20170130075207.2639-3-nathan@nathanrossi.com>
In-Reply-To: <20170130075207.2639-0-nathan@nathanrossi.com>
References: <20170130075207.2639-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 3/3] libgpg-error_1.25.bb: Don't replace the syscfg header for mingw32
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
X-List-Received-Date: Mon, 30 Jan 2017 07:52:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

For mingw32 targets do not attempt to replace the
syscfg/lock-obj-pub.*.h as for mingw32 there are no arch specific
headers that are included in the libgpg-error source.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.25.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
index 9d402ffbb6..1fb6067eff 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
@@ -25,7 +25,10 @@ inherit autotools binconfig-disabled pkgconfig gettext
 CPPFLAGS += "-P"
 do_compile_prepend() {
 	TARGET_FILE=linux-gnu
-	if [ ${TARGET_OS} != "linux" ]; then
+	if [ ${TARGET_OS} = "mingw32" ]; then
+		# There are no arch specific syscfg files for mingw32
+		TARGET_FILE=
+	elif [ ${TARGET_OS} != "linux" ]; then
 		TARGET_FILE=${TARGET_OS}
 	fi
 
@@ -40,8 +43,10 @@ do_compile_prepend() {
 	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;; 
 	esac
 
-	cp ${S}/src/syscfg/lock-obj-pub.$TUPLE.h \
-	  ${S}/src/syscfg/lock-obj-pub.$TARGET_FILE.h
+	if [ -n "$TARGET_FILE" ]; then
+		cp ${S}/src/syscfg/lock-obj-pub.$TUPLE.h \
+			${S}/src/syscfg/lock-obj-pub.$TARGET_FILE.h
+	fi
 }
 
 do_install_append() {
-- 
2.11.0


