Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXi-00066d-5s
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:18 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so507830lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=mfMclkht2fhK/0d8nOFhDM1/BFyAwb8szQ3o+fGqZ/c=;
	b=IeOLTMu85sccn1iCKyvR+7G8+2Q+hgPImm2jlPUteccVKOGkNkdRu3bYz8OlR9yCpA
	hLYPLUenXjiyvz3hAey8Xv17WXeWUEErPcD8MdLzRSltmG7NpmonlX4l8R+PVaNPyNLm
	Vs7JlF1GEYPYiIMlp8wsqJbQCFElAJXnW7E/jVE2tPDztMY0A4TJDQIR1fgFOXcS9nPY
	TVDhxHKTeSJ4+M2HAlaS/Am55hWWcITUz2ZN0XarPskhI7K3SrGX+ITsneIBAgUvszdt
	lbrf8yq5+iKvRZ8UO56Fs8YjAQI81HxYj0nD0VA/avT919d4rYEHE3EE3TdPQxi6of1Y
	eJlQ==
Received: by 10.152.124.83 with SMTP id mg19mr1616070lab.6.1354288560011;
	Fri, 30 Nov 2012 07:16:00 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id y10sm2216472lbg.4.2012.11.30.07.15.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:15:59 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeSJo-0002ww-UF; Fri, 30 Nov 2012 17:15:56 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:35 +0200
Message-Id: <1354288544-10778-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
References: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 01/10] net-tools: fix license segment md5sum boundary
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
X-List-Received-Date: Fri, 30 Nov 2012 15:30:18 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. Old md5sum was calculated from
the beginning of the file, not from beginning of the license segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-23.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
index 309363b..7760877 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://net-tools.berlios.de/"
 BUGTRACKER = "http://bugs.debian.org/net-tools"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://ifconfig.c;startline=11;endline=15;md5=da4c7bb79a5d0798faa99ef869721f4a"
+                    file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
 PR = "r2"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
-- 
1.7.10.4



