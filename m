Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ye0-f181.google.com (mail-ye0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 093E5605A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 14:02:49 +0000 (UTC)
Received: by mail-ye0-f181.google.com with SMTP id q2so1241550yen.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2013 07:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=muZMvA4zbM7n7alttsJ5GxUCTjdvso/gZ/mhDcI+4QQ=;
	b=KjLuFR+yTd6imEgpmRoWxRjVouiiONIrd8GvPsXgUDq90cjzCg+uWzf+cE+i614r8C
	77l7HJledwTnOyJHShDLQqj+zu9r/D18TEhR7XkvjKTPm22yXDV4E7TixC3p4TkvNVtc
	Unlz840RFwIQ0VdQSW0x/lT0QcHleQByg/UjnxYyilX86NN8JB+ViX4RHEoVMpVvb73u
	p/oQA2lBVsU2odrrgSGV7ozqhK3lLszRG/UwOIKR1YdRnwSGZUiAex3zR5aaBuJ+AQ/U
	aYNzpd6EzyqfV7QHfm8xHnwZ/Im3TXt6+HW3+QSalQHqwzjO7DIuDA46ROZpin7lLCZo
	t0Wg==
X-Received: by 10.236.188.70 with SMTP id z46mr11229435yhm.82.1375711370365;
	Mon, 05 Aug 2013 07:02:50 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id s29sm36785591yhf.6.2013.08.05.07.02.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 05 Aug 2013 07:02:49 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  5 Aug 2013 11:02:43 -0300
Message-Id: <1375711363-18991-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.2
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] base.bbclass: Fix PACKAGECONFIG usage comment
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
X-List-Received-Date: Mon, 05 Aug 2013 14:02:50 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index bc2b4f6..f30f4db 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -397,7 +397,7 @@ python () {
     #
     # These take the form:
     #
-    # PACKAGECONFIG ?? = "<default options>"
+    # PACKAGECONFIG ??= "<default options>"
     # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
     if pkgconfigflags:
-- 
1.8.3.2


