Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.25214.1591602503237619504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K+dkx7IV;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id n21so2717044ejg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dwam0R4VaSf7bEZHVU8RmSF98QvLNp2VWwWwHcwoja8=;
        b=K+dkx7IVajfFKPiW3/5mwQD7D1RV3sqZ25GxfKpY1or49XrMESZzMG9N5IToIUmWHn
         ReeUM5s6J0L58qtUQrSAlSWVtHWyLMVz2tPGrl0LmEnnbF0Cp5jopwex9xDWluHssulH
         KUZYS0vqjZzNmLQnP2/0Br4OyuISyiTvz5b4SIByXdYEGGGokGbJzCSnAd8MTZ4J4biW
         vnv+63W+e5CiPH77Lm5Idnl5vclo0qhq5ZbBSxFhft8RQZuDpcBFdAvaU6EEvovmvqWa
         /QPhdXHYR58T8oFOtzJjAF2zRzfq8aZ1GlcejSlXQ2T6Yb1DpobUyVEN6jhwyG0ysW4f
         T4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dwam0R4VaSf7bEZHVU8RmSF98QvLNp2VWwWwHcwoja8=;
        b=EnBDhP8GzCFIMUDoE5+TuQlPR3iHq59LIZb1q+ql1eiE7RYWnsmAKcnBqtsoJCvyJj
         TpHSJiTkzPVCMWhlINH1MsgkXzEDWfBhR+mWmBZC1eMQtmm1F9gzhFdcqCphwS+YyE93
         m6rKt58G/0O7H3Tukj4e30EN1rqVLfkbDjpDv/V7fIXSta6jXjAzlrCYEOG8W9sgt6bx
         BD7LMhSjV/Bfd4iXx/T6JeZCcy9bU1RwprXlgd6rQKi8JI9d0ZEwseGggUiXOycoZNRq
         JfxnxIlj4F64ev7bbaFSdkog8Rf3MMjGFfy5ZhXiGgIrUL1Ohbhs1ZROrLDQfcwZu9WV
         LZ7A==
X-Gm-Message-State: AOAM533nCAv+zZhV/5Oh5nFzIBgi3ux/2TjucO0VzuSGpqmXTB+05WUE
	4/Mg5+ETu6iG77NWCC4yxiLp2hzZdE4=
X-Google-Smtp-Source: ABdhPJyDrrxfB/HrCGWYyIBCHf2sx/MgRsOQAp6G0rDzVnUlZahsxddFvBNdaxjRKQyFLH6l4+RqqQ==
X-Received: by 2002:a17:906:6d4b:: with SMTP id a11mr20664035ejt.108.1591602501572;
        Mon, 08 Jun 2020 00:48:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/42] iptables: upgrade 1.8.4 -> 1.8.5
Date: Mon,  8 Jun 2020 09:46:27 +0200
Message-Id: <20200608074659.7051-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../iptables/{iptables_1.8.4.bb => iptables_1.8.5.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.8.4.bb => iptables_1.8.5.bb} (96%)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.4.bb b/meta/recipes-extended/iptables/iptables_1.8.5.bb
similarity index 96%
rename from meta/recipes-extended/iptables/iptables_1.8.4.bb
rename to meta/recipes-extended/iptables/iptables_1.8.5.bb
index cf1388ce9c..fa1e5c229d 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.4.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.5.bb
@@ -16,8 +16,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://ip6tables.service \
            file://ip6tables.rules \
 "
-SRC_URI[md5sum] = "9b201107957fbf62709c3d8226239b0d"
-SRC_URI[sha256sum] = "993a3a5490a544c2cbf2ef15cf7e7ed21af1845baf228318d5c36ef8827e157c"
+SRC_URI[sha256sum] = "d457d74512e63aa3f50336e0597d4023c0e3c6845594d38532efb6ebcb294309"
 
 SYSTEMD_SERVICE_${PN} = "\
     iptables.service \
-- 
2.26.2

