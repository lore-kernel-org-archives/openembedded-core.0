Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMOTL-0001fI-01
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:26:35 +0100
Received: by mail-gy0-f175.google.com with SMTP id 4so1449920gyh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ik7ZHw7wV5fOFlS77+Bf63DYheFG3o4sMY7s4Xeh5Qs=;
	b=kiDaQEksnkf1LhkDUU9qZVVDowHsqtlt94AIgtI7TThbdZnjqHi8u1b8K5ojgaUi2M
	O7AQpJbCRvTci9gvirWgK8RLZHOHuaFqyGYXZFxRxBoJc4ScYmqdKOdeRdOMdTF0BZHg
	5Pl/RJIHqa7rIyIw+wySrwSodLr3VmK+dyDWk=
Received: by 10.236.184.36 with SMTP id r24mr7104810yhm.33.1320430825600;
	Fri, 04 Nov 2011 11:20:25 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q57sm16408660yhi.22.2011.11.04.11.20.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 11:20:24 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 18:20:07 +0000
Message-Id: <7e3c2e21652019ed5dd2d45beff62a855152f0a4.1320430778.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
Subject: [PATCH 4/5] dhcp: rename dhcp4.inc to dhcp.inc
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
X-List-Received-Date: Fri, 04 Nov 2011 18:26:35 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../dhcp/{dhcp4.inc => dhcp.inc}                   |    0
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp4.inc => dhcp.inc} (100%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp4.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp4.inc
rename to meta/recipes-connectivity/dhcp/dhcp.inc
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
index 85f473d..223522f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
@@ -1,4 +1,4 @@
-require dhcp4.inc
+require dhcp.inc
 
 PR = "r2"
 
-- 
1.7.2.5



