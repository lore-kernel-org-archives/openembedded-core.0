Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWVyo-00061E-4A
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 17:28:54 +0100
Received: by wgbds11 with SMTP id ds11so1259907wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 08:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Azf3WQzq50QSa4qDQNcVOuaPMIMJWY0ZD5aIBZHjJqE=;
	b=xVQwp7NctOAyeBLsP4o7h2LX5czhaApaOZkuEo10RZDZKJX/T9osA6vRJhCWmCV2ib
	RiadBxqIyecANS8cLlDMZD8BY/td/j9sVgCkLZnnTD4x/q2D9+YX1q063jYpQXQSvnFf
	Ii1r6xxyryJyP0hxFSVqJ2oZ57rgY4Y0UtMV0=
Received: by 10.227.202.70 with SMTP id fd6mr6537630wbb.27.1322842931439;
	Fri, 02 Dec 2011 08:22:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n2sm3449968wiz.16.2011.12.02.08.22.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 08:22:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 17:22:03 +0100
Message-Id: <1322842923-27530-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <20111202161847.GF3770@jama.jama.net>
References: <20111202161847.GF3770@jama.jama.net>
Subject: [PATCH] bitbake.conf: add default PRINC 0 to be able to increment it
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
X-List-Received-Date: Fri, 02 Dec 2011 16:28:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 87efd8e..552942b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -166,6 +166,7 @@ ASSUME_PROVIDED = "\
 PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or 'defaultpkgname'}"
 PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[1] or '1.0'}"
 PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[2] or 'r0'}"
+PRINC := "0"
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE\x7d_'][d.getVar('PE',1) > 0]}"
 P = "${PN}-${PV}"
-- 
1.7.8.rc4



