Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBq9y-0001UO-To
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 18:23:48 +0100
Received: by mail-da0-f54.google.com with SMTP id p1so1877600dad.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2013 09:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=43c45/J9V18hXAyCYmj7iogsOuXRPy/DJNk1Q/WoYlY=;
	b=fICCo3ItAAXZM9wzfkOsd1+nCquWp+rJkZvn7R5ugcjS1gSu/E9qSqLJ3IgNJxl+Hu
	hziECWp7IRL65mrbMXn6QFFFxtQLNbBNz+uLp92bIFij4UgDCbHdxOUzExXXzSsM49mg
	YXR5LoFgOyCYudxp5g2/NCdqksjQMq/9NNmX8q2a2lNLO7900BenBqmkfq7nalv7u15m
	MG1x+bq1uY5RXiXCnf1r50jFVHYFJmzjskW+NxZpr8lK1rQflUufsw9H3BXCJCG1Q/SX
	uvaYtoFGmIEBpBcVLT6o0LWp8300M4FL140nRYzh+IvIQ+1nRtgRKa6gZuCSO3CD2FZb
	zOEw==
X-Received: by 10.68.195.70 with SMTP id ic6mr20071322pbc.60.1362244041061;
	Sat, 02 Mar 2013 09:07:21 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x2sm17322274paw.8.2013.03.02.09.07.17
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 09:07:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Mar 2013 18:06:57 +0100
Message-Id: <1362244018-27333-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1362244018-27333-1-git-send-email-Martin.Jansa@gmail.com>
References: <1362244018-27333-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] chkconfig-alternatives-native: just append to PROVIDES
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
X-List-Received-Date: Sat, 02 Mar 2013 17:23:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
index 4c72410..7fd34aa 100644
--- a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
@@ -3,7 +3,7 @@ require recipes-extended/chkconfig/chkconfig_1.3.58.bb
 SUMMARY = "${SUMMARY_chkconfig-alternatives}"
 DESCRIPTION = "${DESCRIPTION_chkconfig-alternatives}"
 DEPENDS = ""
-PROVIDES = "${PN} virtual/update-alternatives-native"
+PROVIDES += "virtual/update-alternatives-native"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # The sysroot branch is 1.3.59 + some git commits from master + --sysroot
-- 
1.8.1.4



