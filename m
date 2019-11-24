Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id A97F57FC05
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:04 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id w8so5585485pjh.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CuXFrH1dY0x1HIQ0+sYXQQeowZHqdq0E329Mm2SrfHM=;
	b=IS81L2DDPXBvbU1j4lbSE9k393qtJxjOrivl1DOetrNrSn+wCKwMHxEVNoTC8ggLlq
	ibU1C0+iDQdFEtlwYocA1CEC98v7pwOZUG//vB9cc0voS9LJ5pMrhxLeqURAAeR3A4m2
	+z8EoxXsdHUGjG4HFgPbtW0OqrTjJ0SukjdKruo5Oywl6Bc1i5mE5+3yoMkfCFJEDQNO
	9vOp3nYmm4BlYl8gY6ZTxmsmHSHoehfBgljvQXqSl45K9v/BNRnRBBhccpF5CVQHi3Yj
	nvIMNgaah0UDBBdclQFxIeFL0bs2/UtTiTluKFHLD1dhdsIUkmPig/n7PldlEK5BIFkI
	QQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CuXFrH1dY0x1HIQ0+sYXQQeowZHqdq0E329Mm2SrfHM=;
	b=nhKYhYTwmgSuPfW6+Dom+/8JIyEGyJtxOeKc8WQncmQhiJbleSmthqFkPfbHTIkP7k
	OzZL2h9KAVAWzPUOYIanUFVcBOnl1hJ0GLxLUdouLzjkcYHI0aYRYVfcrfmRVyyePIaf
	FeewM8VkPo2CYAdgOkFYbUreVEpfu/WwFlV1lLEhRG97Q0JxgJZdDI+Eq6dRSD/mia7N
	6xhviAHxsIEuwI1y7uNsBQ8A5VaT/sBZhgPbmfsx1PsTvhLNvFdQs/OKzefqpiPg0Zgj
	qrd5QSE923URCm6ltFagx1rpExda0Km4paAemGCzpZmOPnhO0lQsTDvEcnJXFvQEvesf
	ulKw==
X-Gm-Message-State: APjAAAXgLI/r9ItASj8BeHwDyr9c+9B5Iaoij/AWq7CuH4ztQ6F8kDcZ
	U+BJDOOxFi2eVsVBvtxF9CGfiwbu
X-Google-Smtp-Source: APXvYqxti0o4Uyc1HS8hErCNu6eLkS+HLQeKVL1rUKh2mb6CxV7o2LTv28lj6cipcvRx3X20RhKq6g==
X-Received: by 2002:a17:902:8f94:: with SMTP id
	z20mr24649112plo.119.1574639465666; 
	Sun, 24 Nov 2019 15:51:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:28 -0800
Message-Id: <886f79903d9a5dadd24b5b2f00a8a4a3a62b3ef1.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 23/35] gstreamer1.0-omx: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:05 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{gstreamer1.0-omx_1.16.0.bb => gstreamer1.0-omx_1.16.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.0.bb => gstreamer1.0-omx_1.16.1.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
index d94bad3..4c6c839 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "c6f8554513980682099a2a9832250b01"
-SRC_URI[sha256sum] = "fef77cddc02784608451c46b9def880b63230a246decf8900f2da2ed54a8af4a"
+SRC_URI[md5sum] = "89772e7a277fd0abfc250eaf8e4e9ce9"
+SRC_URI[sha256sum] = "cbf54121a2cba575d460833e8132265781252ce32cf5b8f9fa8753e42ab24bb2"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.7.4


