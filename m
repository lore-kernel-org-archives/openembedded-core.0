Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id B22E4731D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 19:21:36 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id xk3so83745302obc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 11:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XctMdqcTjqdI6BKREhaFt0Nn46+ssauu2k/rYP11I7Q=;
	b=geHOHIqS95hh5sjdr45oJOKuXUQtYadH5lrqY90JDenE0+ov86zKTRZpaZplHtnr0u
	Q48T9yZRznQKf6xfjuSP4YNuFthmscF1dGWdoUjtBZFGdmwwm1liMt/KgfJzdj9eg2OA
	CJ7jfv6kx6/ZX9YWlSfIHp4wLXrw35dcKdp9IXbPKU8fTqZfy7kOl9M4EDc5eDg3eNh5
	QFSXXicE9980fALiSXc+OdihQElrR+22TKFYPQBDpZItW1OzRbznrbqSW8i8HBUVvake
	xpjFg4RXuvzD2Ml66jZC92TX/mPlTaca1ikkfI3P1v9JU1GIrMryjm6ZTkWZNolF24F2
	bqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XctMdqcTjqdI6BKREhaFt0Nn46+ssauu2k/rYP11I7Q=;
	b=NuvB2FSH+fQm8rhUIzlfPKlnQMvdtizDqixAjTmotMsIlXWkAUHlJDauWroDdQd++e
	LMcOOqQHqvCxL/OqmC0CYdWbot43sBERANR7ArTolUbZx2FPUEd02wSHvVKh5XD1ZsAM
	tC/u0OqQ1uEUCA6wI0neVC2v7ar2eielUU21A7EB7BZw7CzaQAWInmgG32U4cfE0zPej
	CevhEBH9JdSPXXPpp3yODflTwHdgVBkXG34yJTRWD+ufkuyKSYpZ3z/dpUz6LS39SlCk
	e37Bo6XeC5jiA6E4JukWPHG61PdL5VqHG8SdDiD2/oqd907D3mCbWmtgT3mR6nsmbpUd
	0+6Q==
X-Gm-Message-State: AG10YORG4H0JvXp5L51Era2cjqMQD7CkBU7+BBlZ88ImkIPCt149a7eW7UBtwgs+4gjMRg==
X-Received: by 10.182.114.167 with SMTP id jh7mr7888143obb.70.1455823297600;
	Thu, 18 Feb 2016 11:21:37 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w127sm4626409oiw.17.2016.02.18.11.21.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 11:21:36 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 11:21:25 -0800
Message-Id: <1455823285-32028-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
References: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] libsoup-2.4: disable libsoup-gnome by default
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
X-List-Received-Date: Thu, 18 Feb 2016 19:21:37 -0000

libsoup-gnome is entirely deprecated and has just been stubs since 2.42.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
index 865c1d7..a12f869 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
@@ -18,9 +18,8 @@ S = "${WORKDIR}/libsoup-${PV}"
 
 inherit autotools gettext pkgconfig upstream-version-is-even
 
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
-# by default but let it be easily disabled.
-PACKAGECONFIG ??= "gnome"
+# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. Disable by default.
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 
 EXTRA_OECONF = "--disable-vala"
-- 
1.9.1


