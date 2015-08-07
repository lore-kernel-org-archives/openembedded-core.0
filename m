Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id F114C76599
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 01:54:33 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so23249854igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 18:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lOIbmVNVFjPlUVQysWOPKk4iak10Qp+4/A1kNYp6rA8=;
	b=k41vOKto19THmGY93Agnch/AgyHpOcP9ulVZSgR862uAKnAShvfNd67k4VyjvT4ijd
	UJTmt+UUwvJMyQtpDVPruRr7lmnmPkpSwYwvDFVRGJEFgdxeR/NQa7PGYZkrV605+0/t
	tSOu2yeBxjbB4mCjzENTSzU/6q94p3pjfFpsX9ZvzUyy8tVPn0GqMVP6AcwKqZJBtaYK
	jQHRoQ3ZVO9ermzdEFuamo3SkTJMhx0b+X/smawJQWdHkYQXxB8V6vKUhcXbxbuGkjkL
	hJIjeCSN22zAqEjAfT4F19jihZEiJNVIPU7h+dXUUrGwBV4XdiQSxJz25OjiZ1FTXLTI
	aXiw==
X-Received: by 10.50.117.98 with SMTP id kd2mr868566igb.78.1438912474105;
	Thu, 06 Aug 2015 18:54:34 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id j3sm2740140ige.0.2015.08.06.18.54.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Aug 2015 18:54:33 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 18:54:16 -0700
Message-Id: <1438912459-7242-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
References: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/4] uclibc.inc: remove unused UCLIBC_EXTRA_LDFLAGS
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
X-List-Received-Date: Fri, 07 Aug 2015 01:54:34 -0000

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


