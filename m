Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.497.1621543759861064693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gJESID1h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so5988035wmh.4
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L+lnJXJNYwv5hGPzhocPG3NT7KYt0RCJl/0K7pLhofQ=;
        b=gJESID1hDDSHn9/pvKF74kBNrXNpaKg/d4TIlvmLEUywS8ptvd3T0TL0N9/5Xpk46k
         zDmzo8ltyUYUoEH6yEXe8KsO+Luu7HjVk/LgTIuhm/xIHYM274ZL0TFzYpoQ6vRtvI/Z
         lNKk8wKhvnEQ5UAsbpLpZVdPCJa7YhK4d6+8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L+lnJXJNYwv5hGPzhocPG3NT7KYt0RCJl/0K7pLhofQ=;
        b=aq1Js9BFkufupzaKGGQKR32FjNkuuVpfzyb9SaMPy62flHUZugVeXqibbyhDhRiLcn
         Fr0zPF24+5S1oaBeqho9sk7GPlEYsf6Xy9iHGEXxRzsdfC46F3zUnQt6mlcAM+Iy0FIq
         hw88xciBl/b2MgE6D5SdNmt1+wS/upncNeaqg77ZwnvmJPTmiY5EXtrx+hB139m+8GAt
         lQ/eH9IfGubD56dWGoxKYSiBlKkmTzHy+ccCkPDB1aW4M63UVd0rxpigveMniC/JQgzi
         m3z+zVfBCj2uuEsld1pLrmJRCd614zsxcEvWdHZDB/E+EWJYoFgPc8ZaBZoSKag2I6lX
         4+kA==
X-Gm-Message-State: AOAM532ts5HOj2s1JXtWXDgeOFkbAomMIzlk4XAEZThUcobKWMobLID7
	8hLeSqq/lhZisGx7cMCQFm8DB8MI5TMhqw==
X-Google-Smtp-Source: ABdhPJxa9glLu/cZivd8vJFlGruLp1BfirCEQjYMZoVD1atJVRldSTFfvr7LskVDjsUWWffqRO3Gog==
X-Received: by 2002:a1c:114:: with SMTP id 20mr5824080wmb.124.1621543758370;
        Thu, 20 May 2021 13:49:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 26/28] avahi: Exclude CVE-2021-26720 from cve-check
Date: Thu, 20 May 2021 21:49:00 +0100
Message-Id: <20210520204902.2527687-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue only affects Debian and SUSE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index c8a3f876aa9..23c0e8d8239 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -30,6 +30,9 @@ UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
 SRC_URI[md5sum] = "229c6aa30674fc43c202b22c5f8c2be7"
 SRC_URI[sha256sum] = "060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda"
 
+# Issue only affects Debian/SUSE, not us
+CVE_CHECK_WHITELIST += "CVE-2021-26720"
+
 DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
 
 # For gtk related PACKAGECONFIGs: gtk, gtk3
-- 
2.30.2

