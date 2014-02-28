Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 956C96D8E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 11:33:33 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id l4so1786523lbv.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 03:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=cA10Z+IMnZj68pZjMBS9zbCBv39TLmklsfctTfb4iYk=;
	b=brpnYvuz6Rb9wht6Zq5tTNCUWuS/wN2WfyBROhRkCgaYEaJOBwmXobhQfCt/m3vvHM
	B1Qbn4nIBkMqHfRId7a3nRf3JodbSZklGVqGW5QNq9aadC6zvU5BQ8YkGTLBU/no/VzI
	htc8OH1PwlCMmvC9i/Sg7kmAQFyJhayAlzmafpfUZ0/u5jksRDxr9xKUrAu/lcwtWnuE
	a5/sZHIpUkEKjzGEn8ZX0jme4czdzTZyJc/HRXpDC7ZHHBNAhqm1HaIjbj7GxTTzDDCQ
	Bs9uUZu8ccvUTS4dfz4IwjWSBNYVgBZ6Gt0rQvPJm8qcf36Sw4sRXh1+qTB0lfQSojqx
	bJ9w==
X-Received: by 10.112.201.164 with SMTP id kb4mr10246158lbc.32.1393587212604; 
	Fri, 28 Feb 2014 03:33:32 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id h7sm3566623lbj.1.2014.02.28.03.33.30
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Feb 2014 03:33:31 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id CAF111C60BD; Fri, 28 Feb 2014 12:33:21 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 12:33:20 +0100
Message-Id: <1393587200-16322-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: Add util-linux-libuuid to DEPENDS
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
X-List-Received-Date: Fri, 28 Feb 2014 11:33:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

http://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/59/steps/BuildImages/logs/stdio

| checking for pkg-config... <snip>/build/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for uuid_generate in -luuid... no
| configure: error: external uuid library not found
| Configure failed. The contents of all config.log files follows to aid debugging
| ERROR: oe_runconf failed
| WARNING: <snip>
| ERROR: Function failed: do_configure <snip>
NOTE: recipe e2fsprogs-native-1.42.9-r0: task do_configure: Failed
ERROR: Task 279 (virtual:native<snip>/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb, do_configure) failed with exit code '1'

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index a34df37..436fc0e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b48f21d765b875bd10400975d12c1ca2 \
                       file://lib/et/et_name.c;beginline=1;endline=11;md5=ead236447dac7b980dbc5b4804d8c836 \
                       file://lib/ss/ss.h;beginline=1;endline=20;md5=6e89ad47da6e75fecd2b5e0e81e1d4a6"
 SECTION = "base"
-DEPENDS = "util-linux"
+DEPENDS = "util-linux util-linux-libuuid"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
            file://mkdir.patch"
-- 
1.8.3.2


