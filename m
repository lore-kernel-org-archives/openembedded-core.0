Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8F29E73D39
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:09 +0000 (UTC)
Received: by ignm3 with SMTP id m3so23416954ign.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BM9RVB0oxSUjPdG9RMkZH5jnVH73Aqpy59ZvoaW5VqE=;
	b=sRUFFuYeCJyvlDXeSphGxvt7OiOk8RIOxtQx7ma16ybtIshxJfhyzSssMRrOGoTHtI
	9FJxe6IzMuGe6f7/0kMwD5PQGLVuWrgrJ+rcozfrTsiIdf9H9BcJ8oYDPAv2UKhJWER2
	bxlwKPVSZaqCIKDfvYU95nUAWQJsKZlHRd76TNa9r1u8CmE4zmwnjM5RPpLLza51YKIk
	LUFh1PlWZHJPuY2rZkXewy6k0CALqEjY987gGWpVWf/NKQMYUl+z/6nFehfDFoTfNCnM
	O+oKux3dTvluXtNLkMwfnRXWzLLQ6WiGuR8B0Y1yxbwOw6fs9ck4G2/FnlXwHNsi7cfg
	AotA==
X-Received: by 10.50.64.244 with SMTP id r20mr16156132igs.48.1428341829431;
	Mon, 06 Apr 2015 10:37:09 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:38 +0000
Message-Id: <fe0b629b44f28a11a1ac2ca5edb65fec4b28d4c3.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 10/24] quota: Upgrade quota_4.01.bb -> quota_4.02.bb
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:10 -0000

Change-Id: Idea094dfe4b49eef58b90296c4cd2b3e239eeabb
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/quota/{quota_4.01.bb => quota_4.02.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/quota/{quota_4.01.bb => quota_4.02.bb} (86%)

diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.02.bb
similarity index 86%
rename from meta/recipes-extended/quota/quota_4.01.bb
rename to meta/recipes-extended/quota/quota_4.02.bb
index 82f7899..020ed35 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.02.bb
@@ -6,13 +6,10 @@ LICENSE = "BSD & GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://quota.c;beginline=1;endline=33;md5=331c7d77744bfe0ad24027f0651028ec \
                     file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
-PR = "r1"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
            file://config-tcpwrappers.patch"
-
-SRC_URI[md5sum] = "5c2c31e321d2e1322ce12d69ae5c66d6"
-SRC_URI[sha256sum] = "a36300bbc126b79b745bf937245092808b4585aa3309ef3335d4ab9d873cd206"
+SRC_URI[md5sum] = "a8a5df262261e659716ccad2a5d6df0d"
+SRC_URI[sha256sum] = "f4c2f48abf94bbdc396df33d276f2e9d19af58c232cb85eef9c174a747c33795"
 
 S = "${WORKDIR}/quota-tools"
 
-- 
2.1.4


