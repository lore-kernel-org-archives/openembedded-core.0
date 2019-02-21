Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 74D407CB38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w2so15247235wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zcdhhdzJxeUUJRdTLMHgrA7UHatf21rq3gNRtqBjBsg=;
	b=CqCwlsPpYN7lRERwNCxn1oV5E3ldTkQl0+sacmZXw04DVXOn/NALgbRNlgSnatAU7a
	813fM6aIQJdXh2ryZWvuIQoFFISuh2GeZD9REAi6neBYH4d6WXX34gbu55wauxuc0p7u
	HQW8adxWjsPRdcTPxIfzkBOsQNr8yJIt6umyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zcdhhdzJxeUUJRdTLMHgrA7UHatf21rq3gNRtqBjBsg=;
	b=GK6kHRoQX8t6ZptvwJ9CP+XKoZlz59hWz/t5awTmTrVM+M6VOC3EKh6yfFOTcHfxfL
	I3NuxjLlcxT35WlwFkDWwkprkVwTBGhtqTouJVLU4Mg1RKIqMYVLbZBtlBkifES+PH+X
	i1u/ZIktRlsz/PmQY+LGvgpI9JtCH4hDVEKTTyIElu/otNJmTCmBcvB/VcXIrsMEXfhY
	SknuitPBYuJUUcCKd45DcHYazOv/7VRSrLUfrWC0xU3E9WFoYAXJJz2oU0RV4Ja/+VNx
	OtQEM3EAzEDWbinPIEns+Sp0avGlITpY1PoqMUK6V9Dd+QYDT3P+KPFbHuTyaa0946Io
	Yb5g==
X-Gm-Message-State: AHQUAuZnIWc2QqsGqxLwC6JNWv4dEbBoIXamMk7I0gxuG078DWWaLiin
	Lkz9+QQxFRgeSd/Gcn79RPtUGvTnv4Q=
X-Google-Smtp-Source: AHgI3IYlgRCUDk49hJKckmcw4CN1Xo/DLa08i0YPLNj0pAbAB/WoBlK6LSwfjE//DixE28lGW9KXAg==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr26366151wru.303.1550752898005; 
	Thu, 21 Feb 2019 04:41:38 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:22 +0000
Message-Id: <20190221124130.25733-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 06/14] libassuan: upgrade 2.5.2 -> 2.5.3
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libassuan/{libassuan_2.5.2.bb => libassuan_2.5.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.2.bb => libassuan_2.5.3.bb} (88%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.5.2.bb b/meta/recipes-support/libassuan/libassuan_2.5.3.bb
similarity index 88%
rename from meta/recipes-support/libassuan/libassuan_2.5.2.bb
rename to meta/recipes-support/libassuan/libassuan_2.5.3.bb
index 515d60f7f65..6fb3d2f3a47 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.3.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[md5sum] = "4d0d5738936bd8f4f0287e1dd80432b6"
-SRC_URI[sha256sum] = "986b1bf277e375f7a960450fbb8ffbd45294d06598916ad4ebf79aee0cb788e7"
+SRC_URI[md5sum] = "226c504ea78a232224bf3b6846b3adb9"
+SRC_URI[sha256sum] = "91bcb0403866b4e7c4bc1cc52ed4c364a9b5414b3994f718c70303f7f765e702"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.20.1


