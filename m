Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TZPlR-00082u-FI
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 18:31:37 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 16 Nov 2012 09:17:37 -0800
Received: by mail-ee0-f69.google.com with SMTP id b57so832626eek.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 09:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=oKyLHHAvdPjgtYkkyd/YNfEKaY3iuAUJs/5O9yT9YLk=;
	b=HykCNCts0xmZmaCxp11x1r7r+3Q8uDm7DIFwfE9Y2w1dahOZDfcRhNaMOFkd7KiseC
	QasoL3DKy+vkF/Y8edikXoizMoDdNCg9Zkec10SstzYIPd3KJFJBwighPwpzOYLQ7X5l
	hW177ykyLII5uQQBQvtRqXJZSJdRZE/QaIneSfBof1iymQN9zy3FXiSrctoYHr5dWlVN
	wYAoOAF2Wc7pkVbWV7QquB4kkR79SmwlF7pkTjjOietKZruvlXyRIVYFojPmSbz0Iq9c
	A7u5/mETQkIt83aI8dTJujrfwmeYxMuoWvq/UFDiCHWf+rF/fbCqJxXW5sdT5TAAkBPQ
	6BCA==
Received: by 10.216.219.5 with SMTP id l5mr2169267wep.12.1353086255613;
	Fri, 16 Nov 2012 09:17:35 -0800 (PST)
Received: by 10.216.219.5 with SMTP id l5mr2169259wep.12.1353086255394;
	Fri, 16 Nov 2012 09:17:35 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id az2sm1583310wib.7.2012.11.16.09.17.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 09:17:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 17:16:06 +0000
Message-Id: <1353086167-5604-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlBcUcz9fhC/8Eenbz4/xF6dori3sKb09Ye63tzYEVqdWC3LgLvaw6+ki0gcorV6FLmt0ejHAi/da3gGfujHN5quZOrzz6PUk8p8TllJ1BiTI+MiZ4XfmOYbFYgpdCVks08P/gc9vWJJGRck1VJeaMnS01/Dhu5yXq+3yosl+fqamReQihoFIscR6ogEaIRc+ri/0gB
Subject: [PATCH 1/2] default-providers: add default provider for make
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
X-List-Received-Date: Fri, 16 Nov 2012 17:31:37 -0000

remake PROVIDES make, so we need a default provider.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 07222c2..8ed703c 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -36,3 +36,4 @@ PREFERRED_PROVIDER_opkg-native ?= "opkg-native"
 PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
+PREFERRED_PROVIDER_make ?= "make"
-- 
1.7.10



