Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6C97F6BEF4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:11 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so348755eek.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Uy4jNzxXT37bvgklCi0g0Oi5VsuGF9JObczA1t76PGE=;
	b=tynUXas3Nr7qQTZh9e8fgWif7/zfGf2PmkR+mIexhgGISB1o3a/k4Elsty5TsdyWk/
	nw3/3Sr7A0PyMLS7rI8GELU8wnjW3KtlziA9N9taWrmi7KU1LM8XpCArLi8u7I2Dix7T
	itLGFyEk4L9LyFH990mUUZ9WeYAxolfMUSEndoiltpfYrq2agjnC+XJopH4el84bfFrb
	Syrpsnz2wQNidZU4c2+dh8e/gNsmZp183eLBLhqCbxeZwaW/zkdjczfF+QnfieyW4d7P
	YyUfEzoXu20QsniJrakTs4p2n4kzkPFd9Ee4UrSbxDk3ZT1lVUKzTEByzERPbz/nlOrW
	JTSQ==
X-Received: by 10.14.174.8 with SMTP id w8mr3336eel.84.1377792131881;
	Thu, 29 Aug 2013 09:02:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm47263229eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:03:00 +0200
Message-Id: <985355a8e4e1d0600488af18687a544c62c61b9f.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 13/20] guile: Add PACKAGECONFIG for readline
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/guile/guile_2.0.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.9.bb
index 0dd61ff..0cbc216 100644
--- a/meta/recipes-devtools/guile/guile_2.0.9.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
@@ -40,6 +40,9 @@ RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
 
 EXTRA_OECONF += "${@['--without-libltdl-prefix --without-libgmp-prefix --without-libreadline-prefix', ''][bb.data.inherits_class('native',d)]}"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[readline] = "--with-libreadline,--without-libreadline-support,readline"
+
 do_configure_prepend() {
 	mkdir -p po
 }
-- 
1.8.3.2


