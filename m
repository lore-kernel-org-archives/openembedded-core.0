Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id D3BA977AAE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 19:00:36 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id j8-v6so2145774pff.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 12:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=52DhvfayZLazkhFuCqjoCgN0fz9gxCRTwHVxDg4n9Ls=;
	b=ey8ovUX15AV0L0GuL+/kLSBP5SKxz1rli6d0ZOHGxL42kEkOFVVvg3SZmoQjmv7iwB
	RdYLewTgD/s8WLhJiPQZgrrLVnXJxnknaUVzDChM1JvwoY3LuuYZI70A3KBiPQ9Uv5wj
	F1nwYXTnaaMA7bHvkIByhxq+uMIVvW+uo9ce9US4MMc42TrCJDvi/Pr196ITIQGu1M+s
	8mKuAxMC3wrfQwZsdAS897R/8IZTyhI7zixmOGRYD3MKJci1KL5DGzOZKUijTn3nrQKU
	VZWI+15OhNgC1N5072tmEXLHeld2+6fU6o/0aHE84w309L2VcTM2j4SXwHeuhaXw3fRs
	9+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=52DhvfayZLazkhFuCqjoCgN0fz9gxCRTwHVxDg4n9Ls=;
	b=ZfoRRZWDs6RWDskydQR8/jnkjXK/bQ+Rn7Zo7WARwdb4FvpD1c4thUUUe9EFNQYVmz
	a99WkDkVYtnt3BAw3wJR5COSIchTAGF12XjJdW0P5S9AeXXDatKZdDQVgjL9+ICdb9Wx
	Z2QD7K4N3TDrCs9DxVxigi/sKiK5S+5bDkVzv1V/FQIVkaIuurxp+YkDzk79rZJ5Ym+K
	Scd0sLC5JhoaJbbT8vr6WJLP6u8RWVLKu4pxyW2NCzqrplf4l7DS6iMVHnzPIzuW6LBu
	sDCDc/MzmzEVhVHce6cpqyupG5QROT2e4e4C+j5LKVf3wkBhn2VgctOjgn4VEO9sLqCh
	UdKA==
X-Gm-Message-State: APzg51DT31P/0unm4wribIaPKPgTluY5Hyyf7cF71+C9/sZVnufImin0
	iyX3NqiF1SBxCIJJecCMBEZbJSGP
X-Google-Smtp-Source: ANB0VdbMF4TcfWNpZl0SRawbHRSiVV6qP6A2Hom2zJi5LBz5i5c70v1nooHN1cafEanAmIFEU843Bg==
X-Received: by 2002:a63:5055:: with SMTP id
	q21-v6mr32534358pgl.397.1536087637400; 
	Tue, 04 Sep 2018 12:00:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	i20-v6sm29364805pfj.82.2018.09.04.12.00.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 12:00:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2018 12:00:27 -0700
Message-Id: <20180904190027.1410-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180904190027.1410-1-raj.khem@gmail.com>
References: <20180904190027.1410-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] musl: Update latest on master
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
X-List-Received-Date: Tue, 04 Sep 2018 19:00:37 -0000

hopefully last bump before 1.1.20 is released

ChangeLog

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=767f7a1091af3a3dcee2f7a49d0713359a81961c..64466094ede4162ddd4049cea5da09feb9abfaa6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index f4f156042a..997eb14959 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "767f7a1091af3a3dcee2f7a49d0713359a81961c"
+SRCREV = "64466094ede4162ddd4049cea5da09feb9abfaa6"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.18.0


