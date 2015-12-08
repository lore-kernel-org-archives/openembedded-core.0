Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6A560110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 21:42:55 +0000 (UTC)
Received: by oiww189 with SMTP id w189so16728536oiw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 13:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lsX+2claWDQ6lApj7U2LsHaLcyPLWXrvWYxQx5KXuBU=;
	b=fUKUGDjG8wbMlgEDC0kz+0FvTYL7TgDzrTDr+MiYcRTkJN/iWOUz7fPRj3bmh2cqqF
	AODvgYXrhxmXODTnepuCVJDjg7JHTb7XEKYbWe+aAB9bYHpz0PHSMeY1sqMRaNBe12p+
	M6x60OZdic6MmUo3Dh5CqQhcoY4oOE6qaIVIPDp02S01apcaIdcXbkM+d8YEfvBrZQnB
	7S/6m/jq/xjG0uRGrUmXg/kozuaX7sFO+9XSuN9EqigayTn3f1l1AJ1p8M84Sy5XvT1S
	KiZSqkyilN/Q/LHkXOBFvqC9J+7D2bz+jSocGE4eS0q2voDq4XFBMZ7qp4tu53eueKVQ
	Tp7w==
X-Received: by 10.202.182.133 with SMTP id g127mr1460395oif.41.1449610976515; 
	Tue, 08 Dec 2015 13:42:56 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	e202sm2140533oic.23.2015.12.08.13.42.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 13:42:55 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 13:42:49 -0800
Message-Id: <1449610970-23073-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] dropbear: update 2015.70 -> 2015.71
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
X-List-Received-Date: Tue, 08 Dec 2015 21:42:56 -0000

2015.71 - 3 December 2015

- Fix "bad buf_incrpos" when data is transferred, broke in 2015.69

- Fix crash on exit when -p address:port is used, broke in 2015.68

- Fix building with only ENABLE_CLI_REMOTETCPFWD given, patch from Konstantin Tokarev

- Fix bad configure script test which didn't work with dash shell, patch from Juergen Daubert,
  broke in 2015.70

- Fix server race condition that could cause sessions to hang on exit,
  https://github.com/robotframework/SSHLibrary/issues/128

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/dropbear/dropbear_2015.70.bb | 5 -----
 meta/recipes-core/dropbear/dropbear_2015.71.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.70.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.71.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2015.70.bb b/meta/recipes-core/dropbear/dropbear_2015.70.bb
deleted file mode 100644
index 3da8d5f..0000000
--- a/meta/recipes-core/dropbear/dropbear_2015.70.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "0b0a1d9be6a094710d884209562a626c"
-SRC_URI[sha256sum] = "62a8cc3df1d0f136d46f50d4f8d92f7ab7ce1addac76b25446b3f6aaf80bf257"
-
diff --git a/meta/recipes-core/dropbear/dropbear_2015.71.bb b/meta/recipes-core/dropbear/dropbear_2015.71.bb
new file mode 100644
index 0000000..6332579
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2015.71.bb
@@ -0,0 +1,5 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "2ccc0a2f3e37ca221db12c5af6a88137"
+SRC_URI[sha256sum] = "376214169c0e187ee9f48ae1a99b3f835016ad5b98ede4bfd1cf581deba783af"
+
-- 
1.9.1


