Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web09.8176.1620831519493209769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VrpfmgP2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so10617198otg.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+iwDPAioOW6zpMp6/Ifom+T9aw7c8ABy8YCXpF1AHPs=;
        b=VrpfmgP2HUb3ToAzSdi7tz69KiM3FM9dXZdxM181pWx0YZetYteIcDHREKgZqRIqch
         x3l/Rhs4nUf0/koYKklarea+fIcwaLnJPtxQGUXinIZMJEzp3n6CCg4v1MyPOk/m4eBr
         mdJ0sN2Xsev90HrqelFlNVMT4mNhlfexdIwxaia3BD0tYFtLxAT6aM+DrFcZlEatTjgU
         VCdUT6qzS4UWpzKE8+36p7WWNmaRVIJ0u6Wvh/u8uBfYj/CJsnzqFwaJK0Pk5IkchWZp
         bHJW1SD0AvOKSvmyKxyEzN3e8LhKW/VproIE3+YfXk9bAOwtdWTkAntKeuNGuQEqbQ4d
         ipcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+iwDPAioOW6zpMp6/Ifom+T9aw7c8ABy8YCXpF1AHPs=;
        b=pcvQWhqx0f6jJN9NXBq7E7ug8Kw5oInz43/QGkEt3+VMSgU+nekiVmUjylwS0raVIs
         Rh8EPIj/Q0d1y4FRHzSBAoDKrNARuONRW01zpE5NOTa7IIH+jIKj+KWVBlzG3Y8V5NJz
         WuPpeTtxO+XuN85+5SmCQ+whZ0khFW0pe2bDLS/5vtIX/sq7z21sX+jDaIFhhj3kbbgG
         XF7kWpiXwVZVgiTdOx7CGWAhMPIS5aj60azCXd8VUO97bNxbndiI7Uz4keTilLwmnfUM
         XZcNi7lagl86L2z96EoFIkPktXDWBfdEgG7qglmjQ2zoy8kydhVOjf9MbwLa6Yk8dENc
         tgUQ==
X-Gm-Message-State: AOAM531F1XKxmSWFrrWcaTK/Z9LKsotWN/wgqnmkwElNIcZai2ySFpPB
	kCu4S5LCYS9htyTEpTjgt/GCxy1lUMdlj87ZL9k=
X-Google-Smtp-Source: ABdhPJzoQppkhoA0ZEBdb1fpxXVn1NqioYDHVUCVmt7ekWap5KMDBKe1B1Cj7p/vfQDgQROfrBHyoQ==
X-Received: by 2002:a9d:192e:: with SMTP id j46mr2227980ota.346.1620831518410;
        Wed, 12 May 2021 07:58:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/22] jquery: Exclude CVE-2007-2379 from cve-check
Date: Wed, 12 May 2021 04:56:51 -1000
Message-Id: <5f0fbd7d05d65610e4b260184ec7ec3bcea78544.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE is non-specific and depends on the users of jquery, doesn't
make sense to have this flagged against jquery as there is nothing we can
do about it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1f82843584f6d2843c5bbd2fe5dcbc654a0fbcfb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/jquery/jquery_3.5.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/jquery/jquery_3.5.0.bb b/meta/recipes-devtools/jquery/jquery_3.5.0.bb
index 35ce14e152..efffe05fd2 100644
--- a/meta/recipes-devtools/jquery/jquery_3.5.0.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.5.0.bb
@@ -17,6 +17,11 @@ SRC_URI[map.sha256sum] = "3149351c8cbc3fb230bbf6188617c7ffda77d9e14333f4f5f0aa1a
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
+# https://github.com/jquery/jquery/issues/3927
+# There are ways jquery can expose security issues but any issues are in the apps exposing them
+# and there is little we can directly do
+CVE_CHECK_WHITELIST += "CVE-2007-2379"
+
 inherit allarch
 
 do_install() {
-- 
2.25.1

