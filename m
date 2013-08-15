Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9E66B8D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:14 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so182414eei.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=S2YpdSEm8jeucpLTK/qd26y8H3xwRYy6o7C1pq5UZuA=;
	b=HuA19cKQorML6tHObjuI4iWGVAFj8t34tODnpw8rSDTmE1E+x/C9Hmi8FT6H40styX
	Odb9GRqNGLsgyJUvuI0GODgmOdUG2X0IDwV4wudXkOrcOaIJ8xDu9RiU6kKTGHbFxh7G
	DdujXJ1PVqJFOmYqXHUgKfeaM6NP5zGossHKTTbobwHEjPIhosxHqqGtEYJ8WyEESj5Y
	/EgRBxfY1ElEPyVvWU4AbxP3o/JuCToC/1RGzWwmN6OlLt4Pt4jB8/+apnGa26xn1nRG
	44E82ZJYNdJDNMAMdkWAOo2UXZCrObrHk1Bk32VnnaQOphL9YZ471LUy8orJDpn7DrUM
	TAXw==
X-Received: by 10.14.100.141 with SMTP id z13mr242571eef.81.1376551394760;
	Thu, 15 Aug 2013 00:23:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k3sm82027976een.16.2013.08.15.00.23.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:28 +0200
Message-Id: <4f581e6fc6c9d38a9cb1927387892fc9c42993d8.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 17/33] ccache: add zlib dependency
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:14 -0000

* when it's not detected in sysroot it uses bundled version
* add explicit dependency to make it deterministic
* PACKAGECONFIG wasn't used because configure doesn't have an
  option to select which one should be used

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/ccache/ccache.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index 29ac409..087cb7d 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -7,6 +7,8 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 LICENSE = "GPLv3+"
 
+DEPENDS = "zlib"
+
 SRC_URI = "http://samba.org/ftp/ccache/ccache-${PV}.tar.xz"
 
 inherit autotools
-- 
1.8.3.2


