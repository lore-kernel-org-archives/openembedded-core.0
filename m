Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 882E9741A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 19:09:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4LJ91Z7025028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 May 2015 12:09:01 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 21 May 2015 12:09:00 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 May 2015 15:08:54 -0400
Message-ID: <68d80dda934272b231c81da90eb297c699d1286c.1432235097.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1432235097.git.bruce.ashfield@windriver.com>
References: <cover.1432235097.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto: drop suggestion of devshell for patch failures
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
X-List-Received-Date: Thu, 21 May 2015 19:09:02 -0000
Content-Type: text/plain

When a patch fails to apply, the kernel-yocto bbclass attempted to
be helpful and suggest that devshell be used to fix the issue.

The only problem is that you can't get to devshell if a patch is
failing.

We drop this bad advise and instead point to the linux source directory.

[YOCTO: #6202]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 88588d7cacc9..6fd025ef1e0c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -163,7 +163,7 @@ do_patch() {
 	patchme ${KMACHINE}
 	if [ $? -ne 0 ]; then
 		bberror "Could not apply patches for ${KMACHINE}."
-		bbfatal "Patch failures can be resolved in the devshell (bitbake -c devshell ${PN})"
+		bbfatal "Patch failures can be resolved in the linux source directory ${S})"
 	fi
 
 	# check to see if the specified SRCREV is reachable from the final branch.
-- 
2.1.0


