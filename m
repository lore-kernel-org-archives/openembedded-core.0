Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 26A207FC5B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:02 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q13so6352581pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Kb+2LU1oXfJu6zN0r2hlXimn653vvdxEWU7J7NVW3N8=;
	b=PNLIenU3x8Qen4g8Fz2f2fofmM5PJaxijlVjdzqE8qdutFRUmlrW6A4cvca6dE5Ct3
	Zd7hKq3licfaUfgS/58Lss7R9On0BJ+nlnQlE6dOAqSt1NkdzK0iw41iwLEu2K4Nurj7
	fpPZ8RafdVfGjPX7BNBdVsYtYtgIc3S40ql0NpMDr1kVik/z9G6d0Wc9sLmO3sF/YWf+
	0zFNtZTviouL8O1GRFCDtgdrYmrNeX85Vl0JLJcnWt/Qqyuy3X9152zcEV2IMeB6JRJu
	lzzkvpU87y6eoSjhh5tk06W69ZHN9HF9j2FepOUSY5VvZ8LcLLAAyhvli8bUYEZCBvhu
	R+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Kb+2LU1oXfJu6zN0r2hlXimn653vvdxEWU7J7NVW3N8=;
	b=YUIruDb+vpSV+szqT4+gQWVA+9RDUuMz2/ngu7IKH0fcZ814fhryJ+5W+OMD3pEunB
	3Gurh6cjQQKc9HV2C+eQVadWCAAh9OXazc0lvTCBa6u9IUQIhvhdqNpJ5XWb2Jpx9yZT
	LT48McxfHmt3LUO49yXO4LqCWbmfSamyO5+kXBU5ODJf24ERKeqBKBZ8e3ubD+2ZH4sq
	Y6uVPzaxefNb8SKnoP0xwxEiSmYdkWAnF6cab5zaWVMDnnL1VgeKJ1j4SRLFIILWxkPJ
	xiXAxwZDenD6Do1mYQCgMf4DfZqsJOKRW0plBayD2MYxatl6SDRSyR6uOsrGH6xgiT+5
	w5Rg==
X-Gm-Message-State: APjAAAWrd4WuEtMhvmKB09iv5wK5bjASFunVXSpVNwGOaxMPCVIG26S7
	Ao6ah4m/cWSl7RGX1K6NL96h96tA
X-Google-Smtp-Source: APXvYqz/JE+YQoUl3umIxsaaJJGDrnFyKAHukERJcKc0ZayaXvX4IByT8i34bD0fVa32y4heyN9/zg==
X-Received: by 2002:a63:2057:: with SMTP id r23mr28692330pgm.357.1574639463095;
	Sun, 24 Nov 2019 15:51:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:25 -0800
Message-Id: <b4236ecee472e9fe8ada2414b29613813df8292f.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 20/35] gstreamer1.0-plugins-ugly: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:02 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1.0-plugins-ugly_1.16.0.bb => gstreamer1.0-plugins-ugly_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.0.bb => gstreamer1.0-plugins-ugly_1.16.1.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
index 11a0e79..de677c0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
             http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
-SRC_URI[md5sum] = "1ec343c58d4b17d682f7befa8453c11c"
-SRC_URI[sha256sum] = "e30964c5f031c32289e0b25e176c3c95a5737f2052dfc81d0f7427ef0233a4c2"
+SRC_URI[md5sum] = "668795903cb4971fba9aa89abdea8369"
+SRC_URI[sha256sum] = "4bf913b2ca5195ac3b53b5e3ade2dc7c45d2258507552ddc850c5fa425968a1d"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.7.4


