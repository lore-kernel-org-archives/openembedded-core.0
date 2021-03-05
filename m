Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.12919.1614955645582764701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:47:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1HLUJcPw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id o6so2151471pjf.5
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FkrBkl8pL51kZmS3td5W/uCVSwLDcLjuJIKNqu9WCZk=;
        b=1HLUJcPwqLtlLT/q7faCXoVrb+g+C4e1kftHcNt5qeQYzMibw2hIGNspCqjcwfY6su
         ews5vpSEbL9RqtmEHaFdxxPYQyW6sBvHxduK54BvUBMozhK42zsPrhbQP9oJ/8njduxK
         oItkeYo6ia3QqUpw/y1p+qI7DLo5PX8kF6zDLGnU0AnP1J2xgKXuM2SCYafmNZ6JCKmI
         SBaO9bijF9Kq6xJkiOo0X+NQ1X3d0npnimik801/V+cSS0Kotc5zJpPqqEM22Cea4bJh
         0EVhefGcLjV0PiQnzhZ1ZuzIWzwGhvamEr/j6b4NMEaYfnNA6GhcrdIR3B5o2bvF1xY1
         xiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FkrBkl8pL51kZmS3td5W/uCVSwLDcLjuJIKNqu9WCZk=;
        b=VxxPHbW5Fs1rxpCRjDkPxhm3vDneCBgeguGCZ0kEAznegpjbsmQOr8sq4avgrN9YVL
         WejAhA7lFwWSo1DenOQjlpASWNiysUIftCnM+B1kT4waRvPHZogKrgbuMuJFjY5IrUl7
         M3r6NzYnqLgoVoxT4qNTi+thrn5kGh9cPAe8XnD3US1QyD26jM6BU1ZdK1Y+PRxyFX67
         4e+dQOHn6BC5VBDPO0xNSeVPUvZ2IsO+m5KI2TiGuXzetUseE0OA5B+ASQcqUZTz6jbO
         y99AR26YrtAC2OcSPVB3F1t5gmIWyNXcxZTd9ZkCNqvp3Y5CYbb4jvXbuQ+LGQDOh0WQ
         2mTA==
X-Gm-Message-State: AOAM531pVYcqBCx8WlaOfJyiUU00f/3EYLXGWPTI0RXgSf+xSy62CkDd
	75K3uD2q7USvXrW+8lz11oJXnf3GXjUxOx9j
X-Google-Smtp-Source: ABdhPJxwqjzBevVzM55Zgv7+2kJZkB2e3pQ6/a0ExPQB0P94/SxcgZyFPiS0Qu4efDZNUmmPfq+qBg==
X-Received: by 2002:a17:902:6b84:b029:e5:d94f:d317 with SMTP id p4-20020a1709026b84b02900e5d94fd317mr8330263plk.22.1614955644469;
        Fri, 05 Mar 2021 06:47:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.47.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:47:24 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/27] bind: fix CVE-2020-8625
Date: Fri,  5 Mar 2021 04:46:14 -1000
Message-Id: <dcce323a1b651a875da8e51f02f015de442d7d49.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <flowergom@gmail.com>

BIND Operational Notification: Zone journal (.jnl) file incompatibility

Upstream-Status: Backporting [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
CVE: CVE-2020-8625
Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/bind/CVE-2020-8625.patch               | 17 +++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.11.22.bb  |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
new file mode 100644
index 0000000000..9078f2448e
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Backporting [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
+CVE: CVE-2020-8625
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+
+diff --git a/lib/dns/spnego.c b/lib/dns/spnego.c
+index e61d1c600f2..753dc8049fa 100644
+--- a/lib/dns/spnego.c
++++ b/lib/dns/spnego.c
+@@ -848,7 +848,7 @@ der_get_oid(const unsigned char *p, size_t len, oid *data, size_t *size) {
+ 		return (ASN1_OVERRUN);
+ 	}
+ 
+-	data->components = malloc(len * sizeof(*data->components));
++	data->components = malloc((len + 1) * sizeof(*data->components));
+ 	if (data->components == NULL) {
+ 		return (ENOMEM);
+ 	}
diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
index 3b4a299b36..e3b9cacc15 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.22.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2020-8625.patch \
            "
 
 SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
-- 
2.25.1

