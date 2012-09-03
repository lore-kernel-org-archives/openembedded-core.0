Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8VCL-0007My-J8
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 13:52:09 +0200
Received: by bkcik5 with SMTP id ik5so2552219bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=z9oPNo93fuAFqQE2I3g1gNbTkItEshfVQExTQpyGzGo=;
	b=QUb+lCO7UGopfAszyk4f7hS69/NMqoPtj6Mab+nbHrpx4Q43myg1/foHWGHTeIbcxU
	n65W82Lm7G5g6E+gaXiUk91BzalQvfDlrtTABKsADtNY+OiqvMlDtSMV2F/r5VHTRLmv
	04LNO96yiA6iaRkt8DDzPPq50lM+KNEZvV2FLBjsDLPuTR3Nnrir1d7nHqFl0Oun72GP
	gvGJJYf8/6KUpzfndg0v4qTDQ825DP+gLqOClqjtkH3BFwQJr5dGhHRNBSr7V7Ri7XXe
	pxA0GTRdNW7OO/ASP16H5AMp/ECgizD3SIwUAGnI8SeubSb6AancvlGnd+cktTguQjx0
	LI9A==
Received: by 10.204.152.216 with SMTP id h24mr6601441bkw.42.1346672388968;
	Mon, 03 Sep 2012 04:39:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g6sm7676440bkg.2.2012.09.03.04.39.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 04:39:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 13:40:09 +0200
Message-Id: <1346672409-15640-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH] tclibc-eglibc.inc: add PREFERRED_PROVIDER_virtual/nativesdk-libintl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 11:52:09 -0000

* fixes warning:
  NOTE: multiple providers are available for virtual/nativesdk-libintl (nativesdk-eglibc, nativesdk-gettext)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match virtual/nativesdk-libintl

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tclibc-eglibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index 1c9e7e9..cb4965d 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -11,6 +11,7 @@ OVERRIDES .= "${LIBCOVERRIDE}"
 PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
 PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
 PREFERRED_PROVIDER_virtual/libc ?= "eglibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-eglibc"
 PREFERRED_PROVIDER_virtual/libc-locale ?= "eglibc-locale"
-- 
1.7.12



