Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id E717B7706A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 13:42:40 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id ma7so89707460igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=OiekI1TP9eHlMrGkIz/MF4TP2XUeahVu1Q7QIaflgeA=;
	b=G2BmFYRk2i3gZL7COZKvcNDsI56DlsWNpVr1Z3mcgqAuSfUqMKFdaSMJepR57RHnvi
	JP+X+oIZgxh3Qx6cLt2UTuM/ZZtYLxqXGZ+LDdirfCns39/8YaMattaCJC7Z5Um7AHz6
	9Uum4n6PgVb8t1SJ2DpM3N0cXrKKuaf9VqVjawNIyBYinlQITuHblvZT//xpC/nz12yD
	DtvyOaUGnQxW/zpTEMMTx+N8skW8+GK3dqRAQxNFbTnd3PQA3LaDTcCVcfGwbmKJsTGc
	lZDwM8EWM4cf3YwVvV7GO1AjMKGmMDR6shXOxe2nbtLUAWQzGHp7ElUn5sMoxrQR+gS/
	LU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OiekI1TP9eHlMrGkIz/MF4TP2XUeahVu1Q7QIaflgeA=;
	b=SDpMTuvGHs0C4kfHob0c9lC8T9T8XYsvZWhYcH1ZJdIsqv49OSVDnz9EoOsCHbJEIg
	dJcvlAI9zppUqjz5ZuXYUJzTRexHk8gNcr+3yBYZ+yLKGrNuQXD3M6wtgY+4eDKnbhXC
	jD9tmX8Uoap750QRjJkJXWZEtA9/EWF2QoYLmmqeVuN37GnmFIQziQnKBAiEAlFiz1ad
	9ApG8B1v8VunyzHkhJF2feR3J9Ag3N7w8wKekNfA55hpjmKs81yRtyE0fZvkFULTP/27
	W/LSTbk4UgoA+d4FZDChgY9hhoAkFYW6kYGTEZT4rJXtnBTFVuUGlUqRbNHto+ztyspC
	Tiow==
X-Gm-Message-State: AD7BkJKYOR94LaQDG2T0+zTkLeNtSpGb9QSqK+hSlf2dF1L+aj0xRsfh1M/uD8EDlMI6iUY/
X-Received: by 10.107.130.11 with SMTP id e11mr17131069iod.175.1459777324749; 
	Mon, 04 Apr 2016 06:42:04 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56B6F.dip0.t-ipconnect.de.
	[87.165.107.111]) by smtp.gmail.com with ESMTPSA id
	g67sm11657048ioe.34.2016.04.04.06.42.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 06:42:04 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 15:41:40 +0200
Message-Id: <5176fefb8fd31cc9ccc22e49c06e9fb4594ee275.1459776943.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <bcd7b4f85a904081342992ec49c92ca3bcf0449b.1459776943.git.patrick.ohly@intel.com>
References: <bcd7b4f85a904081342992ec49c92ca3bcf0449b.1459776943.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1459776943.git.patrick.ohly@intel.com>
References: <cover.1459776943.git.patrick.ohly@intel.com>
Subject: [PATCH 2/5] ncurses: reorder PACKAGES
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
X-List-Received-Date: Mon, 04 Apr 2016 13:42:41 -0000

Having ncurses-terminfo-base before ncurses-terminfo is currently irrelevant
because the current file lists are completely disjunct. However, when building
"stateless" via a .bbappend, the content of curses-terminfo-base also needs
to live under /usr/share and then it becomes important that files
belonging to ncurses-terminfo-base are checked first.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index acd2579..ff0117b 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -269,8 +269,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES += " \
   ${PN}-tools \
-  ${PN}-terminfo \
   ${PN}-terminfo-base \
+  ${PN}-terminfo \
 "
 
 FILES_${PN} = "\
-- 
2.1.4


