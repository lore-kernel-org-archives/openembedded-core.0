Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UcIO6-0006CW-NF
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 18:47:44 +0200
Received: by mail-ee0-f49.google.com with SMTP id d17so453783eek.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 09:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=QX7g+1edxbc4ILu7RLwwXP7Xb4Ems8XOr836BzLbrVo=;
	b=U+/7JARGjn3jB9Hz5NBL56DtLwvZxt5K0tZFbM1foYtNFXr2bCaLeamTdU+y2Zgsoh
	paQupOH96nJCHsvbVxf2n6oy7jrleGyZAurMt5zQS0FyReTyu0lgWf86aDJy/Wk8znKF
	tgdZ974GR62ZfIJdKso6AFXNTJK4RWwEbaVZOmdUIW9eBWXomo6x+7yiU98uWhncH4PV
	i9DJhj6Pi95xvJUEjhYaoBDFKOv51RORvag7UeI+A/zGYodhe1fKntw5zweoRrbBzNLM
	wU85gTxk7PvODYRe0yWl9qadzDF0OIeOFUiPvbW+umWqthzwZ6wND2Yq6sDFH9BeUjeH
	unZg==
X-Received: by 10.15.73.197 with SMTP id h45mr52252698eey.46.1368548971483;
	Tue, 14 May 2013 09:29:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	w52sm30500941eev.12.2013.05.14.09.29.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 May 2013 09:29:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2013 18:29:36 +0200
Message-Id: <1368548976-28229-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <20130510125303.GF12329@jama.dyndns-home.com>
References: <20130510125303.GF12329@jama.dyndns-home.com>
Subject: [RFC][PATCH] gcc-4.8: temporary disable thumb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 16:47:46 -0000

* temporary work around for build issue on armv4t:
| cp/decl.o: In function `bad_specifiers':
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7171:(.text.unlikely+0x24): relocation truncated to fit: R_ARM_THM_CALL against sym
bol `error(char const*, ...)' defined in .glue_7 section in linker stubs
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7173:(.text.unlikely+0x32): relocation truncated to fit: R_ARM_THM_CALL against sym
bol `error(char const*, ...)' defined in .glue_7 section in linker stubs
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7176:(.text.unlikely+0x3e): relocation truncated to fit: R_ARM_THM_CALL against sym
bol `error(char const*, ...)' defined in .glue_7 section in linker stubs
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7180:(.text.unlikely+0x4c): relocation truncated to fit: R_ARM_THM_CALL against sym
bol `error(char const*, ...)' defined in .glue_7 section in linker stubs
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7182:(.text.unlikely+0x5a): relocation truncated to fit: R_ARM_THM_CALL against sym
bol `error(char const*, ...)' defined in .glue_7 section in linker stubs
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7185:(.text.unlikely+0x66): relocation truncated to fit: R_ARM_THM_CALL against sym
bol `error(char const*, ...)' defined in .glue_7 section in linker stubs
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7189:(.text.unlikely+0x74): relocation truncated to fit: R_ARM_THM_CALL against sym
bol `error(char const*, ...)' defined in .glue_7 section in linker stubs
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7191:(.text.unlikely+0x82): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7194:(.text.unlikely+0x8e): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7198:(.text.unlikely+0x9c): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7200:(.text.unlikely+0xaa): additional relocation overflows omitted from the output
| collect2: error: ld returned 1 exit status
| make[2]: *** [cc1plus] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc_4.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc_4.8.bb b/meta/recipes-devtools/gcc/gcc_4.8.bb
index 9954375..99485bc 100644
--- a/meta/recipes-devtools/gcc/gcc_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.8.bb
@@ -3,3 +3,5 @@ require gcc-configure-target.inc
 require gcc-package-target.inc
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
+
+ARM_INSTRUCTION_SET = "arm"
-- 
1.8.2.1



