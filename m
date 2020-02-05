Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0D81D60674
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 01:08:18 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q8so267442pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 17:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lzG9npLWqVZYaE0fQiDb94dWUmj+kUSUPaD4UqTeXiI=;
	b=ZmRha6GrySmf2755hjQPugcFqqJ7NB3jmQgc7AIOXIqB0k02AdYXl1bxH6FX6B4rw6
	JbPThRnem//iRUhGd5tOS1ZfD/qMcM5ETQgJkNjtN227dJQQfAxftuRQM+tU0/pJjQ+m
	yGShmJOOsvUx6HiTDB80zCW/usr5dVoh6KL0wAL0giQ6n/wmMjGuKCoYOiK+Rv1qlJ3R
	GEHM1i06aRdl9M/hFisyRMd3XnebvFW6DhzaSdN5f6W56a0ZledV+VjyEKsz4GZ3fmDF
	rfMdls5dw6nC+M2klEe0JN4+L3vSeWbdtn/o9FASQUQqwh/seSmu1YgAzTn1F+oiolum
	8MOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lzG9npLWqVZYaE0fQiDb94dWUmj+kUSUPaD4UqTeXiI=;
	b=WrMWoQlfMGAalwr/CDPMiBYrDfS7bcYORPSlK0TxALZKAkNkg8kzydorskWzCnsyF3
	McbVq0AYGF2tcje72gNAkhJequb0jeRk1Ys/wsRVTIjnUVnq7BszWNpB9+XGc1VEdc7F
	BdMGjloLLRXfgVRA3DJFtofFA2x0g85CtloTfKOWjB+8EsAUcdAdiJtWcuErhzAQm7kM
	YchG8dLZDyVVvmgy7/YKvXhi0qybPMkKi9q9mkbLQXPLIUO9jV9dpo9341VuqULnPQsy
	tDXt6SWgm3izV8BSm5fehMMI5sAFN59y6L/KllOyXnY9ezkLzWTvUuSfV+kMb2LCuIvQ
	UVSg==
X-Gm-Message-State: APjAAAVdI6u2I15ZpERjbDAlHA/h1Bfk8I7FGR1OS/Y/jDF/3594HPoP
	3Q/1xrXoMaaEhZFZ2vegzNj9/qU0D9A=
X-Google-Smtp-Source: APXvYqyaJLAPx7oKIcTd6FDwyF44R44w7aXq5AITZ6MkX5JwaHHuqSBmtNN/mBWX8Tw1PBS+1EfuUQ==
X-Received: by 2002:a63:7457:: with SMTP id e23mr22443346pgn.386.1580864899575;
	Tue, 04 Feb 2020 17:08:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1852])
	by smtp.gmail.com with ESMTPSA id l1sm4895352pjb.28.2020.02.04.17.08.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 17:08:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 17:08:19 -0800
Message-Id: <20200205010819.4172914-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] bison: Upgrade to 3.5.1
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
X-List-Received-Date: Wed, 05 Feb 2020 01:08:19 -0000
Content-Transfer-Encoding: 8bit

Minor upgrade on 3.5 release series

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/bison/{bison_3.5.bb => bison_3.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/bison/{bison_3.5.bb => bison_3.5.1.bb} (90%)

diff --git a/meta/recipes-devtools/bison/bison_3.5.bb b/meta/recipes-devtools/bison/bison_3.5.1.bb
similarity index 90%
rename from meta/recipes-devtools/bison/bison_3.5.bb
rename to meta/recipes-devtools/bison/bison_3.5.1.bb
index 3d8f6579b9..e70252d974 100644
--- a/meta/recipes-devtools/bison/bison_3.5.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.1.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
-SRC_URI[md5sum] = "c0230be066069f33c8445766833f3205"
-SRC_URI[sha256sum] = "55e4a023b1b4ad19095a5f8279f0dc048fa29f970759cea83224a6d5e7a3a641"
+SRC_URI[md5sum] = "6fc5fa4488832a65db934b9e93bd5d4c"
+SRC_URI[sha256sum] = "3e7e097bd9709a2d5e40e69446b74b149733b3de864fadb7a9b54eca7b2a4dd0"
 
 inherit autotools gettext texinfo
 
-- 
2.25.0


