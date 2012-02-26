Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1Z0H-0007TH-L7
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 08:58:45 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so31329eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 23:50:23 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.45.72 as permitted sender) client-ip=10.14.45.72; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.45.72 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.45.72])
	by 10.14.45.72 with SMTP id o48mr5291920eeb.110.1330242623323 (num_hops
	= 1); Sat, 25 Feb 2012 23:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=v67xogjvGWGgJIYuRySHFBG3fbbusj+g+ETPlRUkY/c=;
	b=TclLgf8MrLnE+aOpUrrHdEig0z4Tf41sYMPccefwPAnmgoe2KeQ3W51gMX8DLU2bPT
	0i844i7QWrFI2wph9oKq6GOwGKxu+krt1sQrX67mODc8CW0UohOCQdk8Zck01Yh7nKgR
	xGb38s1RrRVzKVTHor+Sn78ig+4mRhtW0B7CI=
Received: by 10.14.45.72 with SMTP id o48mr4006086eeb.110.1330242623263;
	Sat, 25 Feb 2012 23:50:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u11sm34448859eeb.1.2012.02.25.23.50.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Feb 2012 23:50:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 08:49:44 +0100
Message-Id: <29c46687c0d5b88d2fd5d37573985f4607bf7bb2.1330242184.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
References: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330242184.git.Martin.Jansa@gmail.com>
References: <cover.1330242184.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 5/5] layer.conf: add keymaps to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Sun, 26 Feb 2012 07:58:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/layer.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index dac9c97..93c087a 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -27,4 +27,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   xserver-xf86-config \
   pointercal \
   base-files \
+  keymaps \
 "
-- 
1.7.8.4



