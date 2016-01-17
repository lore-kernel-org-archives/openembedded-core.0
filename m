Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4581B731C3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:15 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id cy9so418759934pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/JMWb1fF8fJn97uqDvs/kshVNHoGEwBJW/9CSAoxEXc=;
	b=y1SaTjT/vc00s9WGJWViLqpCxxX6T2qF+fksg0SVwoQcbQxVijZEs8w+/0WMp3XT8g
	uuYnArVXr04hanTXuAeMjLGpAyJD2Vt4UFdMJfD9uni9KLs28qwXX4CIhB2jh85l6fOz
	l5sOPNjzdXy3pM7kBglHQeDadLjKyd7lNf7H9n1UsZblagpU/x4Nu3mKI5Mur2/oMRlL
	FnXwZ+8eZbZK3vgNG0YwWQ6+4jGZa3FtXUrjJkY8u+ILwAofLm8LySTedrMlKFIAi/J0
	Rq1FOu0MRM2swVQkDAYJYI1IMMgPhrzBr6zP1wwY2hMD4culKQP6MU6RzZJYPtCgfR/P
	gMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=/JMWb1fF8fJn97uqDvs/kshVNHoGEwBJW/9CSAoxEXc=;
	b=hHH/5O2CRGzN7Ci9f71vyoMGPSgUU/0XE7RaRG7B4sE52jYM4SkRuGm4MrQrFVQeo+
	oBpljkZLJTqyUmTtLUxYsj9KlILT3TheVdSUM7u5EvJiG45vD15Pcmf04CqwboykcvTU
	+qdXKjb0mrucRrToYJ/ApLUxqFFMNuWqGaRCafJf/9GtIT98rsoJGO3zda6FWSykyGOo
	O4RIFcQ/XAN0p4wVCPmmCay4L0RuHU6uxenq/mW5CPlPy8jvLHXYs1VzCoDOjCZPt+/u
	SFHAhjWz088U2Rvw/+gtoASaAP74YisI6qjRGanCMCcpHLhyZbHY+UBt+YTtMPy1NyIr
	3GBQ==
X-Gm-Message-State: ALoCoQkl96rNWOrpLVICrUF+ypahXoSJ/GylvDA7Fg0at1y2ez7rYzvYPrg1Y03YnlHPFBHmkdU+IN1xLODIbFQSFIqFbxio2A==
X-Received: by 10.66.156.134 with SMTP id we6mr28374216pab.92.1453030636845;
	Sun, 17 Jan 2016 03:37:16 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:51 -0800
Message-Id: <d6681851b5e871fad3277d4516d783646c8751a8.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 18/73] gnutls: Link with libuargp on uclibc
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:16 -0000

uclibc has its own implementation for libargp

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 5bcfc9c..90597db 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -1,7 +1,7 @@
 SUMMARY = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
-DEPENDS = "nettle libidn"
+DEPENDS = "nettle libidn virtual/libiconv"
 DEPENDS_append_libc-musl = " argp-standalone "
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
@@ -30,6 +30,7 @@ EXTRA_OECONF="--disable-rpath \
               --enable-openssl-compatibility \
               "
 LDFLAGS_append_libc-musl = " -largp "
+LDFLAGS_append_libc-uclibc = " -luargp "
 
 do_configure_prepend() {
 	for dir in . lib; do
-- 
2.7.0


