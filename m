Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id F07217FA19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 22:38:51 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id az3so5814067plb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1t+Uz3L1Ij3tNGt8+4wXZ9og29yxO5PGHentkeG5TZc=;
	b=tl8sKBsc4CNZZwPFnzv9Fw4sEcxFvqT0MU4sQ2EG6ud9xGUDUtj6/DxjmQKZuc8Moz
	QgEH3Y7SwIYHzGRcXvm4OrdTHnElVYC5uCYZfOtr1eKGCgnKC3Teb8Zolx5B0UJd7F4l
	rDFGu2pJlgegSaPODIG7a2h1VDA+Rb1NeVn5KY9hR896LGEWcxlEVcG2BUBP/H0t9iOw
	sm3C+nlHIzvnAgh0/dFv967y1pb8PIbjrGqSVOjC/Pac0jiMz6rSqWCE3nPLL4qR3rkl
	hBk/R9ZIdFElT+rs+jCnyhYchIULIe7K89ZoP9EhXKrqW9d55TcXpcW3z1VaP6YPlAGy
	z5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1t+Uz3L1Ij3tNGt8+4wXZ9og29yxO5PGHentkeG5TZc=;
	b=iR99qMUbfJo8PW4IE/fclSjL8x0nzOTJpe4GG/nTedD6TS2/i9FssU3FP0ECZf2IHB
	seSNV3i5U88jZoUqO5+GE96kzoxPjZVXNGX57zDUrfSmYKyQl4a/xevomxH+k2S8FoN6
	ikW7T8/sj9MmjliS09mLNPzlQsakDgPjIyEl5p6GqM9TrlPB0MnhHutZhUvvNnCbFUwr
	V1CnvOuPx9fUyblg5kGP67w+5AviUxw9rb3orFCmZQODqv3JNV8VrSagUxb8ggTyAVpg
	UD1U9LZts7zWuHY6cfR+kjuIKwVKkhKQyQWbqJh6FDgZbQVa7PnCatxuAbTCMZTkpE91
	31Ig==
X-Gm-Message-State: APjAAAWd2KkgD4Z/Stmc+M+zvVLrsK0m3pdlDculnRtCokNIohqVSR1A
	ZGUTdF35hrKMlIGaaZSpDdoeu9R884M=
X-Google-Smtp-Source: APXvYqzo6zVZyGDYLeqBdfDw5MBdDsLHzjNtCTyeSzfjb0GcZM9W1FVhvUDyQgfRgQMy3m8naMj1gw==
X-Received: by 2002:a17:902:8b88:: with SMTP id
	ay8mr27995951plb.202.1579041532641; 
	Tue, 14 Jan 2020 14:38:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id a10sm3825431pjq.8.2020.01.14.14.38.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 14:38:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:38:53 -0800
Message-Id: <20200114223853.3600527-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH V2] gstreamer1.0: Enable debug in builds
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
X-List-Received-Date: Tue, 14 Jan 2020 22:38:52 -0000
Content-Transfer-Encoding: 8bit

Packages like gst-shark needs this option to be on

Fixes

| checking whether the GStreamer debugging system is enabled... no
| configure: error: Tracers require GStreamer debug support. Rebuild GStreamer core with --enable-gst-debu
g.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Carlos Rafael Giani <crg7475@mailbox.org>
---
v2: Rebase on latest master-next

 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
index c6fbd398d9..6b8a5a0eb0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
@@ -27,6 +27,7 @@ SRC_URI[sha256sum] = "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af0639d46f1c
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
+                   debug \
                    tools"
 
 PACKAGECONFIG[debug] = "-Dgst_debug=true,-Dgst_debug=false"
-- 
2.24.1


