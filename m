Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.18956.1603023026813763900
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OX16df7m;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id n18so8334196wrs.5
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PjtLTP568QJcgvtIYetX/fyAe91zerrfy/zOvK4MVBw=;
        b=OX16df7mghapgMqmdGdfZ5Dt9n24wXwJ39meZQhBJoGp0rUb+e/+O5K05N/NwN3UA5
         NIacXUr+yjMS6/moEFb+PEix7YLJY3ipy2J+34g3crOYHG+0pb6d03ep8dvwolE7DIvN
         QY6xOsZmq+ecaqRqFLjck+mDekKN6befQcll2jf4K8tdCmRpdOHY4bv3ARtFl62P0uUk
         41CwSBTI8jrT9NDqxgSQsfI7mOKH5fMPR8Q3QTprLRj5UGNkgE3FuL3OBC7mOFFhqVnP
         pHDGD6LSt7+YlcACbnHfaymG9X+aJSKQYsBhWdCQ91nJLzW+j2Otuiw+a92OPrq0oF2j
         IkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PjtLTP568QJcgvtIYetX/fyAe91zerrfy/zOvK4MVBw=;
        b=pouv6okFQavO61ynjBX1Qv7ixeSc5YkJGmo99ANKG3nb6jurSZOMA1KYTGxzxLtTMt
         E4az4kTId1U3s2y10kmNJZVahrOCrvJZri+hBVqgcwitgHZlzh0AkuuaiWrIMYAxYvPr
         jQmyAXmnXXarQaXVESooJj5Z9Fsh/8j2KJVfS4W2aoCcBzB8KR+0u3luhE06EiWYGQnq
         g9fykzyPILhU1JKBDq3FrdbNgsm+7hynt3bu+BK/20IlCUPaiINp4vv0PMIb9RGN3+9/
         H7OJf0EZQehYsqv6jYpU6yBYqJIw5ku14ZuDPTlfaphFDVhAhH3uWNNk3h/OYpafK2ld
         +5BA==
X-Gm-Message-State: AOAM533WDrMbvE5fooC0dWR7XJRHZfMqUrUVZueCRQQ7lGCI3WAdMc2d
	zW/wQLW4lbX1A32C0FdIaNzdBZNuFCj7lA==
X-Google-Smtp-Source: ABdhPJwUkFnJBE3w+73P4mugW+5fV9qvuvvC+O4y+q47NXRcCXqBS8hmskpd2KmyMZ0IczUlZGJ98w==
X-Received: by 2002:adf:f210:: with SMTP id p16mr9801491wro.40.1603023025209;
        Sun, 18 Oct 2020 05:10:25 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:24 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 06/20] gstreamer1.0-plugins-good: disable new meson options
Date: Sun, 18 Oct 2020 13:09:48 +0100
Message-Id: <20201018121002.1417335-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.18.0.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
index c112f336b2..ad3eabd0be 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
@@ -60,6 +60,7 @@ EXTRA_OEMESON += " \
     -Doss4=disabled \
     -Dosxaudio=disabled \
     -Dosxvideo=disabled \
+    -Drpicamsrc=disabled \
     -Dshout2=disabled \
     -Dtwolame=disabled \
     -Dwaveform=disabled \
-- 
2.28.0

