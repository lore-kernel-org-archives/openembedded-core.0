Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 26022766C7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 19:41:44 +0000 (UTC)
Received: by pacrr5 with SMTP id rr5so34383752pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 12:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lOIbmVNVFjPlUVQysWOPKk4iak10Qp+4/A1kNYp6rA8=;
	b=ppRkI2qKF3x8fr/GzqL/VCzOlprtqOy+WMgAo9G9HaO7oAJAbfar6yI3ErJDSnS/Cg
	eeXnv8ckJMsKVJbsqOglJ6gT6scv6IQUzGo3GAsv0zjCqNbOIR57POJ7neAU3CnUWv5H
	Fzw5f6oMgOU1wZTSeUEFsZzqhya7NUcLlSyRSbyJbe0C0DGEdZw2F4f33ZEG5xdr9MZB
	QsEEWvhaLHlHn8O5GNdoRdxDrEOxkNFnpqDSvfIzTQM6mubXI3rBrMjhBsJnbbnbUIFA
	FyI4PInV8kQ65WfmdVmn8B2o/0OXT0Y5cju+dpXVAMLckWF1JUqkNDvz1TMgZlaeB31s
	qwcw==
X-Received: by 10.66.161.232 with SMTP id xv8mr6520627pab.137.1438890105090;
	Thu, 06 Aug 2015 12:41:45 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	aw16sm7491315pac.29.2015.08.06.12.41.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Aug 2015 12:41:43 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 12:41:24 -0700
Message-Id: <1438890086-2710-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
References: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/3] uclibc.inc: remove unused UCLIBC_EXTRA_LDFLAGS
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
X-List-Received-Date: Thu, 06 Aug 2015 19:41:45 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 08465c4..c483228 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -59,7 +59,6 @@ export V="2"
 #
 CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
 UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
-UCLIBC_EXTRA_LDFLAGS := "${@oe_filter_out('(-L\S+|-l\S+)', '${LDFLAGS}', d)}"
 
 do_compile_prepend () {
   unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-- 
1.9.1


