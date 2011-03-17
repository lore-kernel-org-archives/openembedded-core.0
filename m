Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0G1S-0002H4-0r
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:26:02 +0100
Received: by yxn22 with SMTP id 22so1177612yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=ucQ+TeNpH3h+4ArYi/0TplmGyNkDnhrEy2oSacFGstM=;
	b=Lti9Ol2lbmR4yKZrivz4hCS4mfkjVAeFvPzraVxFYnyuKyXzKOdQxlCYwOz9Ht15bw
	DFm/J9yeKFQz68joGxJJynfsHdmNUMo6DYHEeKE9k6atZUk8VbCH/QZYHFPdvDOq36pC
	w4P6zKFfS1gbWRhLqHb6ukQ/HhCb5S0QWZw5M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VzCFSOlSF0BOvH8ntW79iYOkOtBwUGwqOD4Xyw3BMRX5UoRkiA0YUNQK7hgu613Aii
	fEex9H6O0S2fLqWP5XlTEpOJ8Gf36dysQcfyw7jX8Nuz5LAguUa2zl1y45jg3BZoFYmx
	vXBGZIFGs+mWp388sedJCcRsW8+6oHMB7YNFw=
Received: by 10.150.164.11 with SMTP id m11mr25865ybe.263.1300378567688;
	Thu, 17 Mar 2011 09:16:07 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id q29sm67146yba.2.2011.03.17.09.16.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:16:07 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:15:57 -0700
Message-Id: <a69a4958c90ede3faf4884feff291a2b771c6cd5.1300378309.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378309.git.chris_larson@mentor.com>
References: <cover.1300378309.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378309.git.chris_larson@mentor.com>
References: <cover.1300378309.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/4] scripts/bitbake: add -g/--graphviz to NO_BUILD_OPTS
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
X-List-Received-Date: Thu, 17 Mar 2011 16:26:02 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 scripts/bitbake |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 29e7bcd..437d84e 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -1,5 +1,5 @@
 #!/bin/sh
-NO_BUILD_OPTS="--version -h --help -p --parse-only -s --show-versions -e --environment"
+NO_BUILD_OPTS="--version -h --help -p --parse-only -s --show-versions -e --environment -g --graphviz"
 needpseudo="1"
 for opt in $@; do
 for key in $NO_BUILD_OPTS; do
-- 
1.7.2.3



