Received: from mail-bk0-f48.google.com ([209.85.214.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2l7f-0003zt-V0
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:11:55 +0100
Received: by mail-bk0-f48.google.com with SMTP id jf20so153020bkc.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 07:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=E/d3kPAQxkQfPIol5lM0fPNViO9RYwu/8f1etEewsJc=;
	b=s+rLvRV0SEFMjU5sDqg0psDDwaCqN0ZXV/ReJ6sVpOKVoQpK3o/WzMU3gsf+acJtHm
	wjYQWnT5O88X7QAnkPOVsL7DgDRfnIyRLM+V+m5CYdMQbDIQwgL3/SqDMb8cE5uQaoN+
	BmvV/uw9zTH4AHChXZFol5Sur3bXORE3m54EWsKO2Uv/cLq41VYnDTlA6sAGoypnv2DG
	mvqndQWdWkW/5rJCFhx2qB36bD0P94CZdIz4Ln/XP0aG7Uti7Xy4zCMe/5NhEhN+c2F5
	2T6ttcNqbcHt0bvHENdNeJn7LnOxbEnttxRR9bKuFLfMQXgW7lhdd4lpgwPknP4qCUas
	jwqg==
X-Received: by 10.204.148.145 with SMTP id p17mr6804331bkv.136.1360079762430; 
	Tue, 05 Feb 2013 07:56:02 -0800 (PST)
Received: from s42.loc (91-119-139-175.dynamic.xdsl-line.inode.at.
	[91.119.139.175])
	by mx.google.com with ESMTPS id ge12sm6742670bkc.19.2013.02.05.07.55.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 07:55:59 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1U2ksH-0004Xm-8w; Tue, 05 Feb 2013 16:55:57 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 16:55:47 +0100
Message-Id: <690a52169749151fc06693486c8fde670fde32da.1360079373.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
Subject: [PATCH 7/8] base.bbclass: remove redundant setting of MAKE
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
X-List-Received-Date: Tue, 05 Feb 2013 16:12:00 -0000

oe_runmake() tried to set MAKE a second time, remove it since this is
(nowadays?) redundant WRT the normal export MAKE= in the generated
scripts.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 meta/classes/base.bbclass |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8147a81..3e6fa0e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -54,7 +54,6 @@ die() {
 }
 
 oe_runmake() {
-	if [ x"$MAKE" = x ]; then MAKE=make; fi
 	bbnote ${MAKE} ${EXTRA_OEMAKE} "$@"
 	${MAKE} ${EXTRA_OEMAKE} "$@" || die "oe_runmake failed"
 }
-- 
1.7.10.4



