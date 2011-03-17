Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fwb-000260-RN
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:21:02 +0100
Received: by yia13 with SMTP id 13so1172612yia.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=kDOsjCe0tAR5816sQbwF+CZvQxdFQN/oMQoMdN9CRQQ=;
	b=Sx00lQaaI8T1njnR5o0nGHm7v+4V/0hr3IAZKeHokBdqYJdHYhb5g9WfCNVlwJ7Fi1
	q44X/rfLl3Nj+gHFyL6O2c2MjD1eF8xH9xB44jbMlS8jVASbWk1c2RksOlCd958GShgQ
	hnn+rl/o5jYJUfNtSFnbu6jm6WBn7eImB93Tg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jBGBqk1WWlBndcNvxnIlpAPoqcnPvlKs63F5jImeH3yOKTDv8ofR9WsX3djZ+tPa2I
	NWw1Gvuf0JbyXCRsiCePQ0nP7rU/hlsqjHEjIGHiWok2IpPKDiCKe7ektr3598Lw+NbP
	9BlFYEq/i1KBi+L/RDJ0JRw97IeJ0lomOXPFs=
Received: by 10.236.170.69 with SMTP id o45mr334682yhl.211.1300378756906;
	Thu, 17 Mar 2011 09:19:16 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:16 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:18:59 -0700
Message-Id: <14c0b5c9cbb73b48580de9b033b1ff942226f083.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 01/12] oe.utils: add bb, bb.data imports
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
X-List-Received-Date: Thu, 17 Mar 2011 16:21:02 -0000

From: Chris Larson <chris_larson@mentor.com>

While the metadata can and should rely on bb always being available, this
needn't necessarily be the case for imported python modules.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/lib/oe/utils.py |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 3469700..69f9384 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -1,3 +1,5 @@
+import bb, bb.data
+
 def read_file(filename):
     try:
         f = file( filename, "r" )
-- 
1.7.2.3



