Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5E50E71C0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:13 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e4so3921965pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=NNOo3hzHxe5WWNzZdlepwpGlWwrxLuPH4prNoDU8S2k=;
	b=Wfi8/2F1PPQbP2k/ikNb1CyWOZWPnciiJqTBD46qqorI/f2msUtvo/ffQodsaSZoAA
	aIxu5OINQ6aco68thko+InhhDG14LlQ/PpmUoqDQctlfdW+pQshyxxrjT+BWqCJLVj5J
	oN9SaoQG66v0ZDNo/vDkw1pjsTtRZcfeLLLw//d7ALnwPzoAI+K2Tr9LWT8yyNhmqApj
	9TZ0n09aiGsqdo2gUOyC1qnqnS2TyjWVxjoPpW4TA1xGYT0nnP+d5b11u1i/3bznID8I
	/nF4vbSVjhkdorzPbm50jSlOgxHUkM5urGq9VTyc3BlE3xGw/UGtRkik/M84ADN+x04m
	MapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=NNOo3hzHxe5WWNzZdlepwpGlWwrxLuPH4prNoDU8S2k=;
	b=OrVkj60O4yWCxGa4o79zh2arGUQUGvWCBaJGhnPtLT6FXrpzwqVSp4xrddUkTB+lbz
	1yDpmOEwtCPZ1zgrKg3QOckfp1Yc1/hNszw8o4o75uOOGro5hVhP8/zQYmtKR0qj6jfQ
	HHKvTnSDewTZbHfuUc7CJCPLTjF1Toj6+rM6BfYEdB3tGAYR808lT0jz2giLYf4HR2C9
	QKJKmdWL/x/P0bUydCVvkXWBFrjUmM1nU8rrqCNYyhcQB74zrCScs704TQEFgkX++gmj
	yrQdpFySOKRzp9tsLFwaGVi1RMfggFx5zp/ZM5CQoqMvyPhtMPjWhwyIj42XF2vzCfoy
	4vHA==
X-Gm-Message-State: AIkVDXITPuGXZmCexYcQuQpXwJLBJW5xhmCvdGbg7zsX4PBABGfBsPM7BOBTsg8zpnTEnw==
X-Received: by 10.84.217.18 with SMTP id o18mr50815164pli.51.1484576234742;
	Mon, 16 Jan 2017 06:17:14 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	q80sm48300700pfi.13.2017.01.16.06.17.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:14 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-19-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 19/30] libgpg-error_1.25.bb: Don't replace the syscfg header for mingw32
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
X-List-Received-Date: Mon, 16 Jan 2017 14:17:14 -0000
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
index c6a6ba098d..278ec63bd1 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
@@ -27,7 +27,10 @@ inherit autotools binconfig-disabled pkgconfig gettext
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
 
@@ -42,8 +45,10 @@ do_compile_prepend() {
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


