Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 066A460851
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 10:26:12 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id D41A324E1171;
	Thu, 18 Oct 2018 03:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1539858374; bh=Y/hg+Jjf7QHbKTyZDKLHp9N5392P9JNKlONJ7rWBZpc=;
	h=From:To:Cc:Subject:Date:From;
	b=WkLCogcLplPteZNIz4B/Wxaai1VN6o9QyuFVsiCqH9UBZdkkW3b4sr4mOpv87TIPO
	7O/sr9KhdmTnLvnCc5EP+/88M6xmWfRbL3pQDDKscPPsWGQDJA8Rd3fTCY3bpuw3aW
	/9LlRTqAQciekrysCwG75Z9k7wBsdpTdw8fI/W5TlY7ojhlWPFgPuGl9hnHwu9VKjm
	mT6LKXA62WbUldm6eNMGgEFa53+Pr1BwyeVd5VMnplUWUqHCaZM3DRD0yFVTDDm2K+
	sUjEFn2H+djepUbtOJypq17CU4DrEixJEqTCKKQNBQIHCYkbHzhP2lWwdW9rBSTrJn
	T6a38Zf/WIUAw==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 5BB2954F9;
	Thu, 18 Oct 2018 03:26:12 -0700 (PDT)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 13:26:09 +0300
Message-Id: <20181018102609.12234-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] packagegroup-core-tools-profile: disable valgrind on arc
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
X-List-Received-Date: Thu, 18 Oct 2018 10:26:13 -0000

As of today there's no port of Valgrind for ARC so disabling it.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 520d907714..4ec1f9284f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -55,6 +55,7 @@ VALGRIND = "valgrind"
 VALGRIND_libc-musl = ""
 VALGRIND_mipsarch = ""
 VALGRIND_nios2 = ""
+VALGRIND_arc = ""
 VALGRIND_armv4 = ""
 VALGRIND_armv5 = ""
 VALGRIND_armv6 = ""
-- 
2.16.2


