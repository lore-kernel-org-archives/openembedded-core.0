Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id D23D67CF7D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 00:11:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id f14so26990582wrj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 17:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PGuApoByWs0rFAxI5/mSTXhK8wmB0cxAdPFWhPlj6d8=;
	b=NJvFGg7yjqy0kXSD0O9RIj2TRL2bHsq7s5M0FA0rhPsLzKmDkj1AkZaRZzC8xEFu40
	6M8TCVgkeqfaq9wUP+NBko+8iH7udtf4768646O1xmaTUQwctHMLsNQzG3H2tQM+XvgD
	zZ3el8fHQe0ftxj9+fPJ9u6RFfOj4BKkLz1LIrKDPRp5jOmo8HXu6ZxsQusun+mgAUuz
	Eez3/uSDzoWZKRg2e6GqBgLD5nshJWUyxfST/VBOB6DCUyeNVxnVAp6lJKbe8NgaxGJk
	pBW31KSUI35V2dIRmRphXqrNm69YFGrDakoJYbAGNqOUUcSUTbs62Q3DPBDhWu4u0aYf
	FmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PGuApoByWs0rFAxI5/mSTXhK8wmB0cxAdPFWhPlj6d8=;
	b=h79ylnUosggqd9vY2CMERz9QIovmL+UZ1lRFjy1UiNdYjQVVt/7UYDB/R8z23rUSHI
	GLuf+3PA8kJCacEEIP/BrKHxVHPM3Auai0DIlAEiOxDJ2NAkgo/M33mad0tVqdwhkMy1
	uZl+cuzSI0RqxKyTJtoImhm0jHTO4sgXLnv6lXO68AeKbGOSO2GReQfvQ0oUe+ZVgETe
	NT/iMBLDQ3OU3+86YJV5Z5h571u5PcWdNkrIeyxjABb9G/JFhQHT/H9Xi8IIG7NeawS3
	0Tsv0eJ36GI7dVqk4BcXT0qx49dEBEYUHQs26mC/rZ6/zyR1+WOj/ynAjVf+b6YYusWD
	5JJg==
X-Gm-Message-State: APjAAAW9ZEP2eVDQE47aBS+djSd3oOzlY/3WyeRB1w+0yQLv/b0iVOgv
	+qV45OfFFVlCdfyR1HiSTSROdrwE9PU=
X-Google-Smtp-Source: APXvYqwX0zhSpxnf90biMSXq7LD8OvDXXlQ+6GSKLWbrk1mjnTwSDrd2zcveZcqXDctRRR5MmbwmRg==
X-Received: by 2002:adf:9f11:: with SMTP id l17mr4321236wrf.28.1556151068285; 
	Wed, 24 Apr 2019 17:11:08 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F06D0346D2B854BA6962495.dip0.t-ipconnect.de.
	[2003:f0:7f06:d034:6d2b:854b:a696:2495])
	by smtp.gmail.com with ESMTPSA id
	u6sm37737680wrg.72.2019.04.24.17.11.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 17:11:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2019 02:10:54 +0200
Message-Id: <20190425001054.32220-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190425001054.32220-1-schnitzeltony@gmail.com>
References: <20190425001054.32220-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] vte: move shell auto scripts into seperate package
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
X-List-Received-Date: Thu, 25 Apr 2019 00:11:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It bugged me for a while that xfce4-terminal sets (tab-)title to 'Untitled'.
This is caused by bash variable PROMPT_COMMAND not set. vte ships /etc/profile.d/vte.sh
adding PROMPT_COMMAND and a function to handle.

Since

* not all consumers of 'libvte' are interested in this feature
* executable shipped by package 'vte' is not necessary for PROMPT_COMMAND support

create a seperate package.
Once applied patches for xfce4-terminal and gnome-terminal will be send.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/vte/vte_0.56.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.56.1.bb b/meta/recipes-support/vte/vte_0.56.1.bb
index 02b84c38d9..3585e9ce57 100644
--- a/meta/recipes-support/vte/vte_0.56.1.bb
+++ b/meta/recipes-support/vte/vte_0.56.1.bb
@@ -50,7 +50,8 @@ CFLAGS += "-D_GNU_SOURCE"
 # Use libtool-cross (which has a hack to prevent that) instead.
 EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
-PACKAGES =+ "libvte"
+PACKAGES =+ "libvte ${PN}-prompt"
 FILES_libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
+FILES_${PN}-prompt = "${sysconfdir}/profile.d"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


