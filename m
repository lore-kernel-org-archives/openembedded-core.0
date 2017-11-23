Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 46A6A78423
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:05:02 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r62so13780258pfd.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 10:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=P0QA90F8eO/fznhkSEmOSI/UgNpEaSNaeW5qz9GPG20=;
	b=Hzpve3N5F2449q3nfy6zWR/svYZt/mdVYjXlCuEEmjVfeBpTF6e7KVQFQJVKB6RjJU
	q1EI6L+fgnAIGYD1iD1EICMpG/Yupyb7Me5Z/XS9SzrOj2ejkGltRhfOwXWwqRwWATGh
	qBiVIF0XR2dtdDdh4zyZBv7byg/wlcimf9tLhCbaw6xmolR5IJuxl93vvg33wagR8UUH
	SKjUjuqkfoiZn/ifo9NhNUhMFjl+N72GuG/jJKhj38R7+N+pe1AtBPccrywEVSS5YaYi
	byk/6ELKc8vbty8F7lNHppSPS5haj8/bmPVlrVO1q4iqlhauT1NmwF/PIbHOcjsNOT21
	BUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P0QA90F8eO/fznhkSEmOSI/UgNpEaSNaeW5qz9GPG20=;
	b=GM8CDaPh51gGucWQpCeNHXKzhaELom3E+Uh4K6kvEnifkALQcttHOzklc6Q0z8PbJx
	xBlh7CrNWciXSm++4lTEBqtEaLKPcb80obsrt9ftOaBv36X2SRYRboPsuffSm7mRD7yw
	AvQxvedOpIcWrGJYbeTwNH1vqH5SU9Gh2SHZwl44pcAL/95f2BgbQWlin2nEiqCeGslt
	XEuDIZsKPG5QNHGh8cqQwsTjPjilzaMhPjw7FqZlSd/fTaDzDQ2PJccZyIC3VNlT1Jgy
	AbVa9kcZP/R4Uq88DmB0YTVdoO39pSZAJ2MZ6XZgUJhQi5TLRqv25xyHXe+PvLvlqjv9
	nabQ==
X-Gm-Message-State: AJaThX6+y+ucbaKDezb/Txwc9/hDxgHwQjREAAWctCowpkxz8VPyl8qQ
	rbkvjemkoh3jp2IKC50lx3o=
X-Google-Smtp-Source: AGs4zMZSV7KpNhelj+d07tLUbWTr3yOb2lqWRSLaoHnd2C7NLnqA9oLbr4Ryo/ExNEVuYfG46WShSg==
X-Received: by 10.101.76.3 with SMTP id u3mr13475137pgq.136.1511460304538;
	Thu, 23 Nov 2017 10:05:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:844b:1cda:e660:cce8])
	by smtp.gmail.com with ESMTPSA id
	v81sm28656440pgb.51.2017.11.23.10.05.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Nov 2017 10:05:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:05:02 -0800
Message-Id: <1511460302-27041-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Morty][PATCH] binutils: Fix build issue on Centos 6
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
X-List-Received-Date: Thu, 23 Nov 2017 18:05:03 -0000

From: Armin Kuster <akuster@mvista.com>

Per Yocto Compatable: The following change was made to fix a build issue we are seeing on
Centos 6. Not expecting this to be merge.

binutils-cross-canadian-arm-2.27-r0.47: task do_compile:

gprof' cc1: error: unrecognized command line option "-Wstack-usage=262144"

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Reviewed-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index ae14642..30e3bc6 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -12,6 +12,13 @@ EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VEND
 # e.g. we switch between different machines with different tunes.
 EXTRA_OECONF[vardepsexclude] = "TUNE_PKGARCH"
 
+EXTRA_OEMAKE += "WARN_CFLAGS='-W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow'"
+do_configure_prepend () {
+       sed -i ${S}/bfd/warning.m4 -e "/Wstack-usage/D"
+       sed -i ${S}/bfd/configure -e "s/-Wstack-usage=262144//"
+       sed -i ${S}/binutils/configure -e "s/-Wstack-usage=262144//"
+}
+
 do_install () {
 	autotools_do_install
 
-- 
2.7.4


