Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2384B731C0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:54 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id uo6so404043983pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=264Xx/Oiu9qR+YB2RnqWuhmmlsfV6xQbviCw488xccs=;
	b=JnhNwTHFXWD3+Ub0nD+c+ioUS2TP88SFLvB6fMFjt6H6kI9qGbyGcLkfwAX6OaATJ7
	poRODhGKExSzJSk77K1uK2UV+MIdDucuzCjZDAW9xUNrbbcDbbQ5Nr/8QKrMLi99CKev
	vED4e6OuoJdoxOxpIjJDvz5Hil+jZn5lEYp5bomJZEniuGVQuSzQmGkPCrU0moJWVkNa
	WJuc/TNWOr98kQzNviI7Uo/UHjLm7/OiO8Mb4dKidelF10Mm6AQ+RbSNP7W8ZkV1xyFC
	hAh5pWiIW3wUOgEceLm3OQnqn9BWlcOqypbQHKv1oYrea+Hz8UJJn5YXkkBAb4pY1OQK
	YzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=264Xx/Oiu9qR+YB2RnqWuhmmlsfV6xQbviCw488xccs=;
	b=LDsaiByE9GyDH5pb6OqZ6NKo42SUzYE59O+ys2YoVo4ZL+e5jUkOh4jKB2tsmk2p4G
	dxEDrQ6RlauUsQegoZa09Cczkr+Dy05j4vAhjCTbGXkDjTtAV1Y3cR/tp3sDgw41pkzt
	P8DKO66CwjYsMW01kejsngPSKOpbPsIgvxYWzhTSlRNhWplVE4IqEDeL0eGkSb9a7BD8
	7frq67n/AvEI9CbfpbdWVdg1K0peWZ2QxKBCfdMNoyVwTpR3FswQfHRpon3aJb2iQo6t
	PXEHP3/x060O6XFSLn2DtwZxE60NNbjyvn4NpGIvoY/2TD/SoN9oxtimMYwfy/up7wx/
	RX3A==
X-Gm-Message-State: ALoCoQkvHZJ9tlokTUY9bWlIogRfNjpnt3CBbb8mPMA5oVl/77usE47tifx6oG6E2ilKONkEbIhtPJO6GNjQz/3FyRcCe+aQUA==
X-Received: by 10.67.6.67 with SMTP id cs3mr28680158pad.143.1453030675188;
	Sun, 17 Jan 2016 03:37:55 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:35 -0800
Message-Id: <36a50f4981acbb843000e56760b2e144da168db7.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 62/73] unfs3: Depend on libtirpc when building on musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:54 -0000

needs a rpc implementation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
index 7e9d659..eba1139 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
@@ -9,11 +9,9 @@ RECIPE_UPSTREAM_DATE = "Oct 08, 2015"
 CHECK_DATE = "Dec 10, 2015"
 
 DEPENDS = "flex-native bison-native flex"
+DEPENDS_append_libc-musl = " libtirpc "
 DEPENDS_append_class-nativesdk += "flex-nativesdk"
 
-SRC_URI[md5sum] = "3687acc4ee992e536472365dd99712a7"
-SRC_URI[sha256sum] = "274b43ada9c6eea1da26eb7010d72889c5278984ba0b50dff4e093057d4d64f8"
-
 MOD_PV = "497"
 S = "${WORKDIR}/trunk"
 SRC_URI = "svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV};protocol=http \
@@ -25,10 +23,14 @@ SRC_URI = "svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV};protoco
            file://relative_max_socket_path_len.patch \
            file://tcp_no_delay.patch \
           "
+SRC_URI[md5sum] = "3687acc4ee992e536472365dd99712a7"
+SRC_URI[sha256sum] = "274b43ada9c6eea1da26eb7010d72889c5278984ba0b50dff4e093057d4d64f8"
+
 BBCLASSEXTEND = "native nativesdk"
 
 inherit autotools
 EXTRA_OECONF_append_class-native = " --sbindir=${bindir}"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
 
 # Turn off these header detects else the inode search
 # will walk entire file systems and this is a real problem
-- 
2.7.0


