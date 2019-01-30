Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFDD7C320
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:01 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x10so25487570wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SJP4DWLGnNq33eOnd4m3y56YH3zNcTOmAhzBsYa67zk=;
	b=ELTWbWKnOG9BS7Gsf37/IBDdNMbPPqggvsIGRSkcZp+HSdLntPiJwVb8jQV9ea88SC
	2mPujw8CiidLkn/oCx3N0Bz3SAgNENQM5WKvz+ydl+R6cSnUqKws8E4k5eXou1mcXzIZ
	PNp7ZDFOPWc0W+rCkQdfARIhv9RZ19RSUBSDtuOFDFOe0f8+dJEhfA/o3LnO7U6ZHOzg
	3GObnj8jhIWNE0Bo15tIrXf4m9STkFwwVjcbU3BIi7cLGxHj8ry0AO/6XnutgAcvQxYu
	xxX3Wv21wplGAJq/P4q1snKTkOu4iJOiQtZ9ZABXSUWWTQEIPr3ay5MxujbSdPd6nsrb
	IUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SJP4DWLGnNq33eOnd4m3y56YH3zNcTOmAhzBsYa67zk=;
	b=Ev8+rwOXC2uZxfki3pRan+hRoqY6mkscAKHbM8f7aeI33y8/j+23M88mDsNAlWp1mT
	q0bVg2IHkg1UiuHNGT5JG/TS6X86afs7OSWVfe7ToYKbQqIdBZn/0UX4lCbUdBeuji6n
	xNxRfr+igp2wiWcmrWRdqovXUmEZHPk8clXRk5EzuxIgayP89Z70FOAfWW6/1QqkVQ4C
	sY1N5u/FW69YsOnRGaaKKGP1vEebjuawk7cuj+YBeMjWCF38BQv4Qalw3bYcvo21df6w
	Kj+f5MsKsM5HopJF5TGnQGM2os4Tfle76B76vBq4lsHRnt0OSANlOKAKnyK9Nab9BlY9
	Ic0g==
X-Gm-Message-State: AJcUukdG1DlpOg4DJGgWIBLMcsONDrQV/fqw0+FUhTt83Z1TiZMuMWQZ
	dFKI6PNgoHWA3vLYwRJqlic4D2t8
X-Google-Smtp-Source: ALg8bN65DAigR1BMvZeRinEVhYXuSFARi1WxD30HesOk1rL2jBbsEouYTJ7V18J3aesJHkiZpKrbbA==
X-Received: by 2002:adf:e911:: with SMTP id f17mr31453460wrm.126.1548846001576;
	Wed, 30 Jan 2019 03:00:01 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.03.00.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:00:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:33 +0100
Message-Id: <c676b1af9696b7c9709d7376ef67af94b9277b91.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 10/20] qemu: remove support for building against host sdl
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:01 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 07f78058e7b..dccf9dcb00c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,14 +39,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1


