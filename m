Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fwf-000269-P3
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:21:05 +0100
Received: by gyf1 with SMTP id 1so1171087gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=zLI0RMVo4ciQsteBuqCJj85zDhmQXBNWx/3xASbwskw=;
	b=WUJnI+OC7880LjiatoRlQi/rACXPlSEZ4KJt76xfNMzDPi2t/K/hdXTsT7oN6hQH0U
	CfLe/KuVQV55Z0E1QfbiX0EuXaEluXtnPFHhWVpCc48gZEVmWvs3l9WebCAxQl1br7JM
	R2/tg4SaYXPtAc3S39RBdIqmFox5rzYy9vKgk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vNnqOpIy1AOGfWyfzy410n8sLjEnaNinizRlh6FJucLeJQVaD5awqrbt7/G2D61v1N
	Iesegq70B9Tc3dpECBxnNx0CLN1sQIycS4F4mCU7waS5SucXbwppYZx4GhOF+mtb+R2m
	wgRqy+BL4wHqHFZ9SuS45jltTxQrw23JgbpMs=
Received: by 10.236.138.231 with SMTP id a67mr1587778yhj.216.1300378760835;
	Thu, 17 Mar 2011 09:19:20 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:20 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:19:02 -0700
Message-Id: <3d822bd429248dc917d2899f7365114d8dc3dee3.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 04/12] oe.utils: add inherits (sync from OE)
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
X-List-Received-Date: Thu, 17 Mar 2011 16:21:06 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/lib/oe/utils.py |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 69f9384..f6d4142 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -80,3 +80,7 @@ def param_bool(cfg, field, dflt = None):
     elif strvalue in ('no', 'n', 'false', 'f', '0'):
         return False
     raise ValueError("invalid value for boolean parameter '%s': '%s'" % (field, value))
+
+def inherits(d, *classes):
+    """Return True if the metadata inherits any of the specified classes"""
+    return any(bb.data.inherits_class(cls, d) for cls in classes)
-- 
1.7.2.3



