Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.19566.1621260873916256856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ay508XOA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id gm21so3741755pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8UJ7HWh1pZSG7lRqBjqNQJLvzVywJArctExOf7sJJhM=;
        b=ay508XOAqwOJpHy0/m1n+4rEFOC0Q+ad4HBPgKjGg5Gp1Uid7V60n9MjDc8LAXphKE
         99vccDJedA+Pi9m7E3USqVx5aHJOX2yVIZ0Ih3IHxafLsmgb/3T2zR2ze7NRBQVYBvVe
         fXVrcwlKPOxEZkBV37IwsOFXMP3AZfsXw8ltpIAGlSZmLf0UnX5p1EHkCg+dIoivzBNj
         fhMK62uXISG2LEqNbbAS/TODVBiUgD9fTpId7KB05sb24/sHQwGKMSvTaeSenrvMqpbV
         kp8fgZnC2Y6/3E3SOSJdGgFLsJe8apUwp55MSOL6p+A9ygb5fY2tRBk9871vVLf197xh
         owWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8UJ7HWh1pZSG7lRqBjqNQJLvzVywJArctExOf7sJJhM=;
        b=FT8PTsDCMZ3rxdjuAOmj8c2ZdFlMF/GXvuR+MYJNR/IQNIXWOOQT7qpwfa9/mpnnEC
         u/LEg/xaAouq1FXgGKfGkImj4wSLOZTlq4v9Pjv9zldCz0uExmWEPWoHL6rJhKxlUdaK
         PYDWG+Ohrr2yxt6hUdchHD8I4WHxHnYzeJ4/qnKJnGowJioYpbLE8hF3S1Z+CK3mg5m6
         08OZfnsD4IpifbW3K0z7LYYvcDhG2EIhIqBfAs0doZ/DdbWsd7yqUkbuT8Czs+ijvn13
         2CX3HS+p9acoYjToeuQ/SO3RDJ4ZmHcHJYTCur198MbiaDBu3FmTBRrzZaOR7NNkUvmL
         vwcA==
X-Gm-Message-State: AOAM530PwMqCnkTUVtMxGuIzMmYI0MxT8qW7+26tnahlQWHAIpOvliW2
	UWt7a26hXui6p+1tbH1GbwJF7h+pp/FH8V8rXdY=
X-Google-Smtp-Source: ABdhPJzmwrvMdk6VkIn14QX3rVI+i3EuIdxsN1ia2ibOmv5naNh9cFcqAlPz1qYobgZtsVDybB+/cA==
X-Received: by 2002:a17:90a:d24d:: with SMTP id o13mr151173pjw.15.1621260872733;
        Mon, 17 May 2021 07:14:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/35] openssh: Exclude CVE-2008-3844 from cve-check
Date: Mon, 17 May 2021 04:13:21 -1000
Message-Id: <44d477b1cadc3e48c0a902123736fdf3bf2b412c.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

CVE only applies to some distributed RHEL binaries so irrelavent to us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5d8b3ddf91050f6745a99a8abb1c3b03c35247af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index b429fbe96d..6ed54a8139 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -35,6 +35,9 @@ CVE_CHECK_WHITELIST += "CVE-2007-2768"
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
 CVE_CHECK_WHITELIST += "CVE-2014-9278"
 
+# CVE only applies to some distributed RHEL binaries
+CVE_CHECK_WHITELIST += "CVE-2008-3844"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.25.1

