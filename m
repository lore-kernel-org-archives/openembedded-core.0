Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f46.google.com (unknown [209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB576FC7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 14:27:30 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id kq14so448625pab.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 07:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=esmOZgWyOqhnXQTZIlT9paecC2NCAVwCc6NlL7I5Pno=;
	b=XA48o3VwW3qGFCLqpWfn3aT8BTHj1LQ4xOOqWfZbYtLHar4O3wwuMfkvJWPDv/ecS1
	h+v8d29TIjmxCKxipwoYjESkZGT3XAsFbQBVleSJux+oYoknuPdNEki9KDO4SiDaNTao
	2mQVkmy/KyYsnwqDAbW4SWr/bUqehDUe60f/b1s3BDJ5FX5tLg9547CPm8D2s+uhWSgK
	Jo+7AELOGfTVwQ6Vde7ELX8iRex41pW0bpkYi0W0cy6p0GQn9smCgMouS9Zs2ALH/imH
	EJisoKRW30uWRzXVeKFIbGMqUmLRL2wVEW9Usj0Hb526v9RFr7FKI2xehtSqLwpvX73A
	vb6w==
X-Received: by 10.68.191.138 with SMTP id gy10mr231525pbc.169.1401373652150;
	Thu, 29 May 2014 07:27:32 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id gg3sm1548710pbc.34.2014.05.29.07.27.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Thu, 29 May 2014 07:27:31 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 07:30:08 -0700
Message-Id: <1401373808-24609-2-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1401373808-24609-1-git-send-email-ticotimo@gmail.com>
References: <1401373808-24609-1-git-send-email-ticotimo@gmail.com>
Subject: [PATCH 2/2] weston: fix make-lcms-configurable.patch
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
X-List-Received-Date: Thu, 29 May 2014 14:27:32 -0000

From: Tim Orling <TicoTimo@gmail.com>

In AS_IF([test "x$enable_lcms" != "no"],
"no" should have been "xno"

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch b/meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
index 817ac70..ef145b8 100644
--- a/meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
+++ b/meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
@@ -11,7 +11,7 @@ Index: weston-1.5.0/configure.ac
 +                             [disable lcms support]),,
 +              enable_lcms=yes)
 +
-+AS_IF([test "x$enable_lcms" != "no"], [
++AS_IF([test "x$enable_lcms" != "xno"], [
  PKG_CHECK_MODULES(LCMS, lcms2,
 -                  [have_lcms=yes], [have_lcms=no])
 +                  [have_lcms=yes], [have_lcms=no])],
-- 
1.8.3.2


