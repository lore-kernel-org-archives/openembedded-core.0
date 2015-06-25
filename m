Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 65CCE7596C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 18:01:12 +0000 (UTC)
Received: by wiga1 with SMTP id a1so171635160wig.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=gS4su9KrIHR9OgF8NJ8g/KwOQ9S5IAPDojuEbM4ScYM=;
	b=F06zeEO3ankNWkr64Mke141imJeJeK4E7mZp7l/rrzawxIZweIb4cIiorSMcLYf+qI
	k7jVXgdWtDAZbLhKgCEnjYHHypOZoytSNTmNpOTZZcR2YHFvKGKaDflu8x3J4eIqofjh
	TDRNzM1I+c74wVUfxaZPudnP+1JkKqfvyr4pYcSx7Wst2M4b/odhK8HQ9BPazHBfwFyC
	blJj3uiazNjK8KVt/g3HlwOHnHIsr4lYmOiiJHbuUydDT/v99CcVhlnTMnU+magu2DNj
	1tEAIP0D6J/fHUE/tGkCH6N+bgUsPqEudj1ej90sATwxHprGI80eXPQXEoke5X48Z+VJ
	ABKw==
X-Received: by 10.194.9.161 with SMTP id a1mr82753171wjb.39.1435255273862;
	Thu, 25 Jun 2015 11:01:13 -0700 (PDT)
Received: from X220.tupi.fr ([37.160.80.150])
	by mx.google.com with ESMTPSA id i6sm46880068wjf.29.2015.06.25.11.01.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 11:01:13 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 20:01:08 +0200
Message-Id: <1435255269-1761-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2 1/2] Set S to prevent QA warning on systemd-serialgetty.
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
X-List-Received-Date: Thu, 25 Jun 2015 18:01:16 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 1c34d5c..768b130 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -8,6 +8,8 @@ SERIAL_CONSOLE ?= "115200 ttyS0"
 
 SRC_URI = "file://serial-getty@.service"
 
+S = "${WORKDIR}"
+
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
 		default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
-- 
1.7.10.4


