Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkMZQ-0005rp-3F
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 23:48:12 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3494282pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 14:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DoQiUL5mFck5h0Qg/0zZJRZ7New1vxjdRU8RPNnoZ8I=;
	b=x4UII06XWzbOOqzVy/+oIxgeDGvfNuDfdY9NMoXJEPtIHvFkhwWTM2kXXfSmmSta7z
	DDLobUb+8zobuUFFDO5Wiri8NCa7GqWIFoWjq9KzN0F/VjuBMqTj4EnwwLi04JSkJhmQ
	6qQ7WO5JovgHLmgiBogwpvlqrHnEwanWjio8ck4rHXjHZ9A2ulYN+ewcROOzibqWdczw
	53JZgbr+nN4H99UG/X73LcXsMvL9Z27gRANqkpjqZqUIXFMf/3FW502VNmrs+MrdYKoq
	s2oJIZ/LVRYtis9yAYbW/7ZncmwR1G6VF+/XHTXcySHJl0nFzngUKpwe+Sn7PdLLE9UR
	AXvg==
Received: by 10.68.239.9 with SMTP id vo9mr12206389pbc.41.1340919438991;
	Thu, 28 Jun 2012 14:37:18 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id os1sm3220209pbb.49.2012.06.28.14.37.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 14:37:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 14:36:51 -0700
Message-Id: <9ece5fc3278374eaec8b661fd9ef40d044d46560.1340919157.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
References: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340919157.git.raj.khem@gmail.com>
References: <cover.1340919157.git.raj.khem@gmail.com>
Subject: [PATCH 05/11] eglibc-2.15: Update to latest on 2.15 branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2012 21:48:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc_2.15.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index b2922b4..7dd9810 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -1,6 +1,6 @@
 require eglibc.inc
 
-SRCREV = "17386"
+SRCREV = "19294"
 
 DEPENDS += "gperf-native"
 PR = "r12"
-- 
1.7.9.5



