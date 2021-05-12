Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.5544.1620860425493699320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 16:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FUxjhmfV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id v12so25177930wrq.6
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 16:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L+lnJXJNYwv5hGPzhocPG3NT7KYt0RCJl/0K7pLhofQ=;
        b=FUxjhmfVbj024uaDv2OTseX3pWCUKrrO4WXRlhVV/WUdC8F70lrx2vbe+Nr2vQ6f4L
         JySolWvUf6rI3TFLqhCFcROMV3Li82xMEQy5EiaFmJn6hPmF+XVYB5s++R2pOZZ2g1Vt
         5QwFkOjMHVGUnKEaPTEtlmVvBrxNgRqXyjg3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L+lnJXJNYwv5hGPzhocPG3NT7KYt0RCJl/0K7pLhofQ=;
        b=OCNtazP1PiBFrVvg1zur19qGf3FRK2wsWH1tkqbfIg5wTcX9FKSc4YwTFdnWuZ1Vl5
         KJmYhQaR0oRk55Ta9vbHWq8wN1OjUxoo2gPm529YZWnDEEPN3xCzIDGLcaW8lA3/HFc2
         cKjO7OGhJlMUf7TpV6h9+nMHfHdT659IFcGU/vvlzT1BWhZQoxHNULoU1JI62ks3CmSC
         EURRIDA+Y5c8H1sjcJCSY6icMnowdi41DiJoFKvhunHtn3vQnxoygQNWQ9np7a1QLh+v
         NQ1JjZWiRh9USZAx5HbYS52HA6omB/zxO2buOcIyYxtptEAOssFrZf7CmBlQUUUKMown
         AMKw==
X-Gm-Message-State: AOAM533YpIjKQafVyQ/vVHDwg9Y+qRbjs+6dvHW7k9D+gUFjoDnvRmrW
	diZ8haZEtVYcDAKp50AJGa+6yqt6162T4A==
X-Google-Smtp-Source: ABdhPJz8ta6L+ZWwI3fex8+lZ1LME74nE4tsue6CEMfF1LI6Kn3TsybSCULR1K1nzfaUqcjViCOe+A==
X-Received: by 2002:adf:ea82:: with SMTP id s2mr10924725wrm.397.1620860423918;
        Wed, 12 May 2021 16:00:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id v12sm1156273wrv.76.2021.05.12.16.00.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 16:00:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] avahi: Exclude CVE-2021-26720 from cve-check
Date: Thu, 13 May 2021 00:00:23 +0100
Message-Id: <20210512230023.2287497-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
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

