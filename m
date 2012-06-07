Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Scdjl-0005rH-3S
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 16:30:57 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 07 Jun 2012 07:20:26 -0700
Received: by wibhj8 with SMTP id hj8so230203wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2012 07:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=eQQNIzy3XMWDdnsKOWOvolTEeiW4C2TdWJUDUYF5Td0=;
	b=mvYSf1D2bsB08ikw/TNiu/jsSfT3eDN16gmKs4IeqbkVrr6H5snUKB4iZLjgsTPgPe
	Q8UAnJAqOX8IZEV8/utABu1UCNZYIVA4wqQtJE0T5FEC96lj5VroTt+E4JjLnQx3opDu
	3KPC9HJI3YxeiBIrGQyHWeduFBmUIrXLAOGhPjZNMUiiD5F9e8YoIJ1rf61Uj9I11QFQ
	Y+6tfZGGdVPmxrq4JqDMc71bQ3y1kNe/aVeW9i+9pN1EgZJkTUopmWeU8T8SzBt3mRmL
	y/XyWbugfd1QMNfAfZ9zQ1MfEm6GXUCQgcO+1MlXiTYf8Tzt26ACtfnu7t+J10VRHWRO
	srCA==
Received: by 10.216.196.72 with SMTP id q50mr1052946wen.90.1339078824902;
	Thu, 07 Jun 2012 07:20:24 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	eb8sm1341625wib.11.2012.06.07.07.20.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 07:20:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 15:19:37 +0100
Message-Id: <031b27b3ca07c964ef3c5dc403807ba13d9763fc.1339078729.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339078729.git.ross.burton@intel.com>
References: <cover.1339078729.git.ross.burton@intel.com>
In-Reply-To: <cover.1339078729.git.ross.burton@intel.com>
References: <cover.1339078729.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnF8eYQsxPlGqSFLuAx47EbYFc1aq/YxcGSHHLC7yE4GKEXNaj44Iuwg8qAB+PWc2aDc1dn
Subject: [PATCH 2/3] connman: Document the ACL-breaking sed
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
X-List-Received-Date: Thu, 07 Jun 2012 14:30:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 58e3f56..4fb7b43 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -53,6 +53,9 @@ USERADD_PARAM_${PN} = "--system --no-create-home \
 
 inherit autotools pkgconfig update-rc.d useradd
 
+# This allows *everyone* to access ConnMan over DBus, without any access
+# control.  Really the at_console flag should work, which would mean that
+# both this and the xuser patch can be dropped.
 do_compile_append() {
 	sed -i -e s:deny:allow:g src/connman-dbus.conf
 }
-- 
1.7.7.6



