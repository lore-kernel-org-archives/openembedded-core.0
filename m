Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2hCG-0002nf-5W
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 11:55:48 +0100
Received: by eekc1 with SMTP id c1so1071212eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 02:47:19 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.32.139 as permitted sender) client-ip=10.14.32.139; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.32.139 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.32.139])
	by 10.14.32.139 with SMTP id o11mr6872464eea.10.1330512439900 (num_hops
	= 1); Wed, 29 Feb 2012 02:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=V2OJ/7V4p1tx4wqrzLmBhwzs/lO9l3q1AqycYGE1rDc=;
	b=iHqo51RqqkGTf7EYCN4bSKWWA96UdmHfIge0yRwcwE77VIWRxm51fuM4LsCyeCebOx
	IBxLJLiq52UYk1LEsVhyidqIiH6H1qtuDgVOTn9z+gCqxJEp7ssk91LNeAs/woWJacaD
	5La5oHKv3RjiVqFh4oDUNKg/dSZAz7IyqkTno=
Received: by 10.14.32.139 with SMTP id o11mr5270158eea.10.1330512439783;
	Wed, 29 Feb 2012 02:47:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm81403336eem.11.2012.02.29.02.47.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Feb 2012 02:47:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 11:47:09 +0100
Message-Id: <1330512429-29934-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <20120229104508.GA3844@jama.jama.net>
References: <20120229104508.GA3844@jama.jama.net>
Subject: [PATCH] layer.conf: exclude meta-environment with SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Wed, 29 Feb 2012 10:55:48 -0000

* it's machine specific and depends on TIME
  basehash changed from 30e97f9eeed1df8488b62b4fb47a3a0c to 72ea9a277e6599ae9052b169b9a94f1b
  Variable TOOLCHAIN_CONFIGSITE_SYSROOTCACHE value changed from
  /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/share/x86_64-oe-linux_config_site.d
  to
  /OE/oe-core/tmp-eglibc/sysroots/qemux86-64copy/usr/share/x86_64-oe-linux_config_site.d
  Variable TIME value changed from 084543 to 085638
* causes task-cross-canadian to be also machine specific

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/layer.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 76ae58c..87208fa 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -28,4 +28,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   pointercal \
   base-files \
   keymaps \
+  meta-environment \
 "
-- 
1.7.8.5



