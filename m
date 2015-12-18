Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id B8A177014A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 16:47:52 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id k90so58039536qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=2B8QiC8AepbMoISLHdvBkPe8bJh3KWZ7FNMjNaZhcqk=;
	b=P5CkjG4rWmHbng0hAdxm/zqktvNmmwqiR9t78v3SyFQS30GPRPZvAKdVWAFf7IuGOR
	KvJNBN/qYhM46mrWAftylrCYNT3pxa1SSelUbCa019/MGkl5jIbc8pmEQ3Z0FKeJVRr/
	NLvKAApqMYKMVPDQjegXaupmMgpewObhwF8tWlNUJG0bS3zR1nOcGaPTh9uG3PHbap7D
	ieFP2yKqr4DSYhTWrB/hnqxcSzKbKxl2lqaMNCTg6iTz/DiwMFEHdZr9InmQWdwVjhU6
	3Au/l8JEYK8V/H1s/eH26y6QApAHWD6nBEhY/m7M8j33Hn0fP8eOItcZCROX8V71k4YL
	PbFg==
X-Received: by 10.140.19.52 with SMTP id 49mr6274538qgg.65.1450457272794;
	Fri, 18 Dec 2015 08:47:52 -0800 (PST)
Received: from localhost ([177.127.6.55])
	by smtp.gmail.com with ESMTPSA id k9sm7127383qgd.21.2015.12.18.08.47.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 08:47:51 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 18 Dec 2015 14:47:46 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Dec 2015 14:47:44 -0200
Message-Id: <1450457264-13741-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] util-linux: Fix floating dependency upon 'readline'
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
X-List-Received-Date: Fri, 18 Dec 2015 16:47:53 -0000

The configure script checks for 'readline' availability and enables
it, if available. Now, a PACKAGECONFIG (readline) controls the
feature.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/util-linux/util-linux.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index cf321c6..fb384e1 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -61,6 +61,9 @@ PACKAGECONFIG[libcap-ng] = "--enable-setpriv,--disable-setpriv,libcap-ng,"
 # Build python bindings for libmount
 PACKAGECONFIG[pylibmount] = "--with-python --enable-pylibmount,--without-python --disable-pylibmount,python"
 
+# Readline support
+PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+
 FILES_${PN}-bash-completion += "${datadir}/bash-completion"
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
-- 
2.6.4


