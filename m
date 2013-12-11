Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 76AE76DFC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 05:56:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBB5uC4G018457
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 21:56:12 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Dec 2013 21:56:12 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Dec 2013 13:57:01 +0800
Message-ID: <59aa0b2dd25aa498a61963c2910ff92f40011429.1386741230.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386741230.git.Qi.Chen@windriver.com>
References: <cover.1386741230.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/3] useradd-example: add example for setting clear text password
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
X-List-Received-Date: Wed, 11 Dec 2013 05:56:13 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Use '-P' option for user3 to set a clear text password. This is supposed
to serve as an example of how to set clear text password in recipes.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-skeleton/useradd/useradd-example.bb    |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index 53d2340..2f8d9b0 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -32,7 +32,8 @@ USERADD_PACKAGES = "${PN} ${PN}-user3"
 USERADD_PARAM_${PN} = "-u 1200 -d /home/user1 -r -s /bin/bash user1; -u 1201 -d /home/user2 -r -s /bin/bash user2"
 
 # user3 will be managed in the useradd-example-user3 pacakge:
-USERADD_PARAM_${PN}-user3 = "-u 1202 -d /home/user3 -r -s /bin/bash user3"
+# As an example, we use the -P option to set clear text password for user3
+USERADD_PARAM_${PN}-user3 = "-u 1202 -d /home/user3 -r -s /bin/bash -P 'user3' user3"
 
 # GROUPADD_PARAM works the same way, which you set to the options
 # you'd normally pass to the groupadd command. This will create
-- 
1.7.9.5


