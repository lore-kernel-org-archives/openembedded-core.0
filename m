Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.9677.1625830372577947470
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 04:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fPnl1uDM;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: uvv.mail@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id o10so9973632ils.6
        for <Openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 04:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0LfittAv+mDnlrSt5mMSi+uAPucHhfiQsry20rRHXeI=;
        b=fPnl1uDMpAGoGNNoxuxwCy0EhaMbprJn1nQZIpH6T9EHMkNCkku9/SwmI1Kmj/J8v5
         JIXwe7dqQhae9Mk5KlI0Unf9iCj/GGX+TN17CQbKQUfBm13Siy4aXqvxiki5xAX+i/yS
         3AgekfoE1AxgHwAjs/tHgipEv12fmS9xLAFBYQ7ZNrijOtKDACff3nzUTiQPE4iw+1lA
         oQ7aqZi/uu90TFEtg+dRTK1l8OXE0n/CY0W/niN6sV/DZi5TIiM0VReIpst2GYIo8xjH
         9cr1+wM9UYlJDlMBenMCYqEG3ldgzMdjw1oh+xWf9T6jIgMxrKhxJu7+89DEfXDQEcEG
         rL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0LfittAv+mDnlrSt5mMSi+uAPucHhfiQsry20rRHXeI=;
        b=guSN6dq27WvGEqg5Qfca+qr9pVzxPpaA5L54zrX2DZ6L7r3lKTq0MuxFjBNA2J0RX1
         8pxZwh1Xm33vHc5evEii/wqUBAVS05TyfZAwTbWzMd+kGtODHnBhBpB59eEmctOQqy9o
         lZIqZtA5hxQ6M+Vt+zaW1UdMvtuaKi6zdNAnTTQlbopNRwWCgfmHMX/t3Rht2xKf+RPf
         kwHT+TkJTSL0s/07bZo61l2EqTMUD+9jz7ptjcMbbNKI+KbpAGJ1ckJ2HMBJ4QBmiyRU
         d82Vl39pPISlasbxOUPYwNf5dLdprcUWoJ6d1JMki0Wec4jnr4HpUgTe2hiqRfl2KASy
         k03w==
X-Gm-Message-State: AOAM5339+ii7eL25yhvYFVYpAWdEoSQGs97bIQVaCR1Npt7EJ85nz4vG
	PSsX0F2ZxOxMTgZluXNux1+VxDB6IPTQPA==
X-Google-Smtp-Source: ABdhPJxlb1suBJhI6unWVsSwPgBK8TYwjcWZeIrAIs63YYU09/10uH+cxldV/sQ0d5d6GRXXNt7qgw==
X-Received: by 2002:a92:d351:: with SMTP id a17mr25951564ilh.52.1625830371898;
        Fri, 09 Jul 2021 04:32:51 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([37.120.205.173])
        by smtp.gmail.com with ESMTPSA id q7sm2570463ilv.17.2021.07.09.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 04:32:51 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 6/8] overlayfs: meta-selftest recipe
Date: Fri,  9 Jul 2021 13:31:44 +0200
Message-Id: <20210709113146.69020-6-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210709113146.69020-1-uvv.mail@gmail.com>
References: <20210709113146.69020-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recipe demonstrates example usage of overlayfs bbclass

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../recipes-test/overlayfs/overlayfs-user.bb     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-selftest/recipes-test/overlayfs/overlayfs-user.bb

diff --git a/meta-selftest/recipes-test/overlayfs/overlayfs-user.bb b/meta-selftest/recipes-test/overlayfs/overlayfs-user.bb
new file mode 100644
index 0000000000..5b0d9a2f3e
--- /dev/null
+++ b/meta-selftest/recipes-test/overlayfs/overlayfs-user.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Overlayfs class unit test"
+DESCRIPTION = "Contains an overlayfs configuration"
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+inherit overlayfs
+
+OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/my-application"
+
+do_install() {
+    install -d ${D}/usr/share/my-application
+}
+
+FILES_${PN} += "/usr"
-- 
2.28.0

