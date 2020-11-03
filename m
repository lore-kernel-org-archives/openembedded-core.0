Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.4223.1604410959096762401
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 05:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bjj7436I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id a9so18584627wrg.12
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 05:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YOVTGKZDPw2ZzrWefWUDx0YdgKLNMWlk6XJ1W9kF/uQ=;
        b=bjj7436IO6x0Db6wTPi6Le+5dAgWggnHoAfPLOU0Tf60QZb2m351LBAFXVl+SAD5qD
         4Lw0HpFb9FHGAC2QOH+4FyAg3CCdQSAtV6xxWxZDpXeFCo9NNfLXWBkS0z2BmUw1i1fa
         atLNInGYEhs/GESRyGYACPc/h18pvhTfkNoys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YOVTGKZDPw2ZzrWefWUDx0YdgKLNMWlk6XJ1W9kF/uQ=;
        b=nAtNwgfEnCW4NNQryffYD+YafpCD4AUKGmuwIi0YBAUpYVKCaZtDlkdnyb7OCQy5sB
         MQZSfhQzqIA0V3o/n9FM9Np5DNAVwEUiTw4aN5ozBuQQTKothhJVJ3vV4QubqEwInWqC
         9vwiNtXqAFM2p/LVKJeZnTTfQ1tWNDD9NNAeGefciYi7a9CVkRUGvQvExVr4xQyR2H2q
         6oLTXilxbHcgWyB+kqokp6pin00iQ/WqFH5ZdBewxocBbW1BjsRXl8i3U/DNz/JdGNAg
         cDrqYMtRZE+4pBBUMCuZi1+BtXpb+TtUFOVNz3RWB1+2cifEgIgLTDgqqgz6FaSM3wdu
         m18Q==
X-Gm-Message-State: AOAM533OVZZGm++x+uQpCksaXW5VepLifhavQRfaq2V4m9bCJi/fSJFb
	ytIVFx+eT5W8XHhCo25Pl82awulPrrq27A==
X-Google-Smtp-Source: ABdhPJyreHlIaILvKpfYPEShO+9b8cVkz9J3F+E1/zHys32Rux6aGvjD9yCov17CSwzVgsBpCvAoIQ==
X-Received: by 2002:adf:f810:: with SMTP id s16mr25455731wrp.424.1604410957182;
        Tue, 03 Nov 2020 05:42:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id e3sm26426089wrn.32.2020.11.03.05.42.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 05:42:36 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libdnf: Fix license as it contains 'or later' clause
Date: Tue,  3 Nov 2020 13:42:34 +0000
Message-Id: <20201103134235.423940-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103134235.423940-1-richard.purdie@linuxfoundation.org>
References: <20201103134235.423940-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The license headers are clear that the code is "or later", fix LICENSE
to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libdnf/libdnf_0.54.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.54.2.bb b/meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
index 2a05b9f5342..39d80a08215 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Library providing simplified C and Python API to libsolv"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
-- 
2.25.1

