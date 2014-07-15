Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 173FA70534
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:43 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so4623336wib.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=SH23MjXxrDpTu7ZjogdQDraZPJ5+CjLY0ca9W7Pl5ng=;
	b=RMddUwjzc7x0dtjc4L4j8KtxKd67q+v/8BxZoq0+13XlIwAWOFEAf274gadWRRp6In
	D2xlqnBdAn/DO5pzli8UizJg9L63S/lisOqVqIOBIfo+640rFhoLAxvdQ1Iz+W05F0ug
	TKRXy1Lmw5C8xGWKKiYZ+qGz2fIZdd5OLDShc1bAk+iTWdksZd0d3vKztuJeYpF70I57
	BQXaN+oAABcozYESklP6Jp3oOhG4IiRduby7Jc6n+WLKWA0DLBAF1IgpLTcVsnhmhG1P
	NVURlfENJyoH5FmqfXET7FZ8iLQQzWdeBhLcj2YFwITVnilT830QYIs0gRUg4u2KRRUp
	mCIw==
X-Gm-Message-State: ALoCoQmgNWd4hNGupVGBRx/6Hua4G1hphPJTO2SJo+8jwCTwV8hGNSUT/S0DBa3wNv1Ob7xkvFC5
X-Received: by 10.180.9.71 with SMTP id x7mr6621767wia.61.1405441124763;
	Tue, 15 Jul 2014 09:18:44 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:32 +0100
Message-Id: <2124e92b03474bad56401b7a42fa8ce888b92399.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/7] libid3tag: use "foreign" automake strictness
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:45 -0000

libid3tag doesn't want GNU-levels of automake strictness so tell it to be
"foreign".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libid3tag/libid3tag/obsolete_automake_macros.patch              |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
index 8a04b54..2845fb1 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
@@ -6,7 +6,8 @@ diff -Nurd libid3tag-0.15.1b/configure.ac libid3tag-0.15.1b/configure.ac
 +++ libid3tag-0.15.1b/configure.ac	2013-01-03 06:41:02.734835014 +0200
 @@ -28,7 +28,7 @@
 
- AM_INIT_AUTOMAKE
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
 
 -AM_CONFIG_HEADER([config.h])
 +AC_CONFIG_HEADERS([config.h])
-- 
1.7.10.4


