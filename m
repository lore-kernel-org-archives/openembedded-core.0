Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadWf-00057D-F6
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 02:20:53 +0100
Received: by mail-gy0-f175.google.com with SMTP id r15so256527ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=kq25CetSuk0AH6Z4w8LojrTGt6Byue3J8SQQAkYARgY=;
	b=rv6RMPtT4b0ktvjG2p/xR+fm3+0DPA0LhLv4IyJpRQSVIg6FFMDkAxgvVzxEz4bV0J
	sjy3ClN8RhBifLl48KqQmcU8aJMTP/YiEzeFB60774NM33OTBSyoq+MXC7y4k+v4+KvZ
	osKN7f0Ombjp7aH6Xuxm5BX4rHXQijdMzEONo=
Received: by 10.236.190.196 with SMTP id e44mr7671275yhn.95.1323825239440;
	Tue, 13 Dec 2011 17:13:59 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q52sm1308849yhh.3.2011.12.13.17.13.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:13:58 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:13:39 +0000
Message-Id: <10234dfb0f1dfe3f641facf76ce290c3d19bdeae.1323825176.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323825176.git.otavio@ossystems.com.br>
References: <cover.1323825176.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323825176.git.otavio@ossystems.com.br>
References: <cover.1323825176.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] icecc-create-env-native_0.1.bb: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:20:53 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../icecc-create-env-native_0.1.bb                 |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
index 6213843..7db3978 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "This is a modified version of the icecc-create-env script in order to\
 make it work with OE."
 SECTION = "base"
-PRIORITY = "optional"
 # source file has just a "GPL" word, but upstream is GPLv2+.
 # most probably just GPL would be a mistake
 LICENSE = "GPLv2+"
-- 
1.7.2.5



