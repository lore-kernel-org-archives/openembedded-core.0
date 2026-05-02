Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCEACD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9532.1777739497281485942
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JuhaZOIq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso34822475e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739495; x=1778344295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzyMILv3rIbq8oBiHVOh/9LMln6kEnVYT3elmJS/1Og=;
        b=JuhaZOIqK0+v7swKdvDa9jNvRjuZAWPF8I9fHRPl0W+3stHwkzrGudAz/GjA3lqocU
         SeA7yZsHUYLxDHaaPupj34A2/AeKcdnytoYR8GFHs6brt/cPjXGVjvNxShU8zhIFe+1a
         itpCTI7ArR5YQwFXfXMkC62eCubc6QDFzLPX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739495; x=1778344295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UzyMILv3rIbq8oBiHVOh/9LMln6kEnVYT3elmJS/1Og=;
        b=kDUyjAwzI6ObgQqCbAK6Wb4XKgV4OFJif8X/AhVunw0ZLfnuyHj7A57Eab1E7AcOU6
         yMUUMDqGOYcpmjo4YYzOQfhovb5+0VARuQiL6cULZC4hbKApJ3t90FF8nH57BbMCHeVq
         spXQi44I4AOag6oOw/2Iq5J0zkITsShCs5t7Pk+VPbGqHba2UvIjqrnPGt+052Yoiexe
         Ks1aHBziI6g0cq6b4Q6cIMR3sbaHqOTW4OXK8Z7/uqBouEmXuiKlQwc/ZFXEvsAQRbcs
         KejbtCbyzzCWkru8y3nWCatQ3DxBNovzXBpY4PrHyOMBCLFr+YZ9fLwjQFper4uTRQ/q
         cVig==
X-Gm-Message-State: AOJu0Yx9RGobx+UvZRtcWbP/lGNYoWoz/qcZfNu3ziWHYKrOAndCvh5j
	bGCIZmp6IIv8LgZTfGZhWddcpgzq+wsP6nYbTVdJkL5EWqBBnSeUW09atFJqousH5coI71aR9pQ
	G0jTvOlRazi/EnKgQqvO/zbWfTsxZxvLvxIczaFUU4JBBa5oPJdDbLhNf+0NlYQaXLq1xIDi5xi
	Ad8pNak6Uj7yQYGLg=
X-Gm-Gg: AeBDieuOQ5Qi3jPcWdqq5z41/wKlzXvbOgjm6uPrClCz/8BvjfGdxRkauwikGOv8Q+W
	Kx1T9t4UfHIU2D2bbYINjfsMG9Otm/ClY+Mdv5bW4SQHQeUSLyVFj+GSJgtJKToLdTisO9vd8xn
	E0cgbu1NR8bvlhueWZ33EjYe3eZjRlKppQKaT69Yjb1Q/QdK+Pv4DXpFHy5vW+xHxloTo6BKMHL
	SLDnKUUhp6N0D1W99m0iJ4o34NaJRY3uSLDMUPFSLyZHOLVwLrBXm7PoAAqqk9d6Sir0xSECGeh
	Y+2njNXebRFo40wxHB9f6VQXcjZWJFGjq4/VfgmGukuwVN3tU8g7b/YLxM3w8SmLS13J+HRfcMM
	r1zJrFOaZxlsylxPQTiHBhUFRlF0qxVNB8yz7Jt531g9qxDqwspiXvR1wPKnIwED2gt81o1KH1z
	r6KAWiC4tfiKGrRJsEVKeAuCayPD4y8fqL43oEeFFUtcBXuEsQWOmjeHCeCzStReg=
X-Received: by 2002:a05:600c:b4c:b0:488:c21a:4754 with SMTP id 5b1f17b1804b1-48a8609c169mr110621535e9.18.1777739495208;
        Sat, 02 May 2026 09:31:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 61/62] wireless-regdb: upgrade 2026.02.04 -> 2026.03.18
Date: Sat,  2 May 2026 17:29:21 +0100
Message-ID: <20260502162929.1377831-61-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236370

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
index 2f7c8160434..a70e9dd0dae 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
+SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
 
 inherit bin_package allarch
 

