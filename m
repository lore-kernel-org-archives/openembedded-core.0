Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 409707163F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 15:22:44 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id b13so22925440wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 07:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=d2B5MgQf9odLbhfM3uOX1w645nEcfJ1osBSrsrIgSrk=;
	b=OhJ/QtueVmjG0XC01Wp6dIFGkG88yb/v8Ko1Y5SaX0MF31A86VfS57l0jWE6UfyXPY
	W0vrPXj0VdZnCzwNLyWxldOp+5yao2fMkSn5OQJGolzR+7ms9ajLH/radlgzFdtazu7o
	4XxA13Q/RzE88d0qqP2Yv7JHnsDpcdCeRZfMlorGcMKpaj529u2X1EW3adSzA/rZmigW
	l8P5DxURCeulAZuctHVES5G9Yse8smPnA0MLop9rJ3oFWz9K5fF4JBpd9sGhwJ+6WCIt
	r/xTb8lSZZ/8GipwrZTHkliTSbTuGNpiAA0lhn+zJBXHLtV3cjfz7/ZVXjJ3n3CH15DR
	zIPw==
X-Gm-Message-State: ALoCoQn7Osb/jr8owUW8gWzBbb6G8+mSPYlsUG9mQPcWsQolAtuWZyi4i/sKVMj9aaxsoV66h9aL
X-Received: by 10.194.222.98 with SMTP id ql2mr17104129wjc.36.1417706564485;
	Thu, 04 Dec 2014 07:22:44 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	ry19sm40907706wjb.3.2014.12.04.07.22.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 07:22:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 15:22:13 +0000
Message-Id: <1417706534-19738-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] gcc: stub do_fetch instead of removing it
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
X-List-Received-Date: Thu, 04 Dec 2014 15:22:48 -0000

Whilst gcc doesn't have any source to fetch, it still needs a fetch task so that
a world fetch can run without errors.  So instead of deleting the fetch task,
stub it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index ec30865..2340440 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -1,4 +1,6 @@
-deltask do_fetch
+do_fetch() {
+	:
+}
 deltask do_unpack
 deltask do_patch
 
-- 
1.7.10.4


