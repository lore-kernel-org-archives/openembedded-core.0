Return-Path: <cjp256@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4D97C319
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 16:54:54 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id m17so2483670qki.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=omdEvlJge4aW9F6FTCYuhGnNy8iLBz576LZkze+KQ5E=;
	b=KyeqiOZIQTMoKBvIsB4XFW6hAipMwxiDBYooj6dcGaJpTU4lTh/HZYOQfynnTvMSK4
	DkVHm8Gc5xswAtaK38QYXBMak8DkQyyCzQh9Z5k8x6zi+m5aSwzlph0Tjg28xx5JLd+h
	WLJdz97JbGWRhLc6mHJRVxPWklU1hbuk0dcqu2ZLwKlmu1rHDqMyLQ9B56LsnOwtbtUk
	ZeihVlRD7bIDqgMJMsGVt8pzGob9yJH7jbVKRm7NOpIISL1gEnJneU7K+Lod2X3Q8oC+
	D5P3yVs/QdkqHBUG7dncX8J2LJk3f6eNxaghFeSudRNJpw90GGZ4P980SQOA2m1fq63t
	Li4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=omdEvlJge4aW9F6FTCYuhGnNy8iLBz576LZkze+KQ5E=;
	b=lKZNvFWqN397/gzCdxfjEjwBP8k2hyUH8C/Psecg99gBTjwRP6+EwlLCuLiqzT431a
	AS7Bv2/WIsETmn+hcRMCPAy7o8+0lTieSHc4Gnbnxj2yWTIeDRcmuvZDfbeN1+DJe5fW
	d0y0lyrKOKJNeO4dJEiSl6joAFwXrrkBqEIIplpzEOAQ7+xQKVue4GfKEPmbeB6kfivA
	UyhP0QQEfoaS56gGS8k9Fyyu1KYvaKuscAX85UzSD9Pqm2dcGXBzeY6I+MdS5k/Kj9uo
	9M1SzhZRBSOq/KuD4JcYK47gfCJFI/083gTy15VS2qLeg35YRiNi+898pKoHM0Exelrc
	d2EQ==
X-Gm-Message-State: AHQUAubk8PHMRs4npk3my2WXh6W0/Z2QyUe45wiFj+Nt/m/uzrq7egp/
	pjguJwHHMkxRG6I0FDxOhLuTnn+u
X-Google-Smtp-Source: AHgI3IZN2/XSqr97szK7r4w0tQpIiYNJ41J92iKQnUmLJCpJwgkBcGS/hcpSP6t5rjRVLWDfZNF2qw==
X-Received: by 2002:a37:9046:: with SMTP id s67mr3978734qkd.289.1549385694670; 
	Tue, 05 Feb 2019 08:54:54 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	y70sm15014543qka.75.2019.02.05.08.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Feb 2019 08:54:54 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 11:54:50 -0500
Message-Id: <1549385690-15124-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] qemu: remove --with-gtkabi=3.0 configure flag
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
X-List-Received-Date: Tue, 05 Feb 2019 16:54:54 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Upstream dropped support for GTK2 (in v3.1.0) and this flag was dropped.

Relevant upstream commit ID: 89d85cde75143325205e332dd97bf1bb8402d7c1

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b05c1ce..c127434 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -95,7 +95,7 @@ PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng
 PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
 PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
-PACKAGECONFIG[gtk+] = "--enable-gtk --with-gtkabi=3.0 --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
+PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
-- 
2.1.4


