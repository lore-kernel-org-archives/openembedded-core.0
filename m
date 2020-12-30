Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.6794.1609336839996519162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 06:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P7XXmhhq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id d13so17491115wrc.13
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Dec 2020 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZM2I7JseL1kI4o5lTxC5MjrTs1TTBksTq8YYea4PU7U=;
        b=P7XXmhhqSM8AHtQsVQTl8Y20uDBogekSsJW8th/oj5/w43QpE0qzrmlJIdoaQr4cEq
         1Z6uN+ZdXesfYOmlGP8RUDP6t3me1DNQeDQFX6xhzVjE0C68SwyTlolK93Ee4f9q90NL
         5FBq9AwQJXDWe09ds0GhF2q3/FNbpvW3HE6mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZM2I7JseL1kI4o5lTxC5MjrTs1TTBksTq8YYea4PU7U=;
        b=Se6zLynEYmW3T5x5KO/7eMzovFdOrkBzCmDwt92uyiwaEa8rFUCcRKGkgS5Vkq+BtO
         JUBAiRNdEJzXv3J8sEeClUrvuE13eMYsEKGv1dMtZP50yNeWBnBeYCCkGf7h+gsERJ7J
         YNKG3/J+ksjaxp2ZMnPmqV0kAf7dyjfVGsMMjm7EoYhAB9B99ynt4sKzHRgsDbs0txDo
         kP7l1epF9WvMVK8ZVPOSXC7WhlV6vUdwmDdB5I9QCIZPbLrD/0a0Rm17awN8nKXa3UeR
         QN9hK1O0srhmNeGJnl3FnDBLsgTbDtz5Sf6fFOHCQmyv7+leoWqxG7hKAeNVzn8DayjP
         u0Yw==
X-Gm-Message-State: AOAM531wlVsaeQnm/kcJua0w+utNx1E+5C9QUuO/hTXWCRpUjbotF7S6
	MbZm09BhCsb6nr35PNNn4YMg5YNBUWvGnw==
X-Google-Smtp-Source: ABdhPJyEc8AzVIgKgM2txQpqkzUWy8FAZ4sJzDplOrswGUMut2yHmn5MngZkc5OG4JP6yOM0WLYARQ==
X-Received: by 2002:adf:f605:: with SMTP id t5mr59349950wrp.39.1609336838178;
        Wed, 30 Dec 2020 06:00:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:3ddb:d68f:119e:d01f])
        by smtp.gmail.com with ESMTPSA id z13sm8383926wmz.3.2020.12.30.06.00.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 06:00:37 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta-selftest/staticids: Add ids for other recipes
Date: Wed, 30 Dec 2020 14:00:37 +0000
Message-Id: <20201230140037.214208-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dhcpc's uid/gid to the static configs used by meta-selftest for
testing since dhcpc was added to OE-Core.

Also realised many other ids were missing for other OE-Core recipes
so also add those.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/files/static-group  | 9 ++++++++-
 meta-selftest/files/static-passwd | 6 ++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 9213b8e9bc0..892231b6e03 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -11,4 +11,11 @@ avahi:x:509:
 avahi-autoipd:x:510:
 rpc:x:511:
 rpcuser:x:513:
-
+dhcpcd:x:514:
+sshd:x:516:
+lpadmin:x:517:
+crontab:x:518:
+tracing:x:519:
+pulse:x:520:
+bind:x:521:
+builder:x:522:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index 412f85d469f..babbfbc9de1 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -9,3 +9,9 @@ avahi-autoipd:x:510:510::/:/bin/nologin
 rpc:x:511:511::/:/bin/nologin
 distcc:x:512:nogroup::/:/bin/nologin
 rpcuser:x:513:513::/var/lib/nfs:/bin/nologin
+dhcpcd:x:514:514::/:/bin/nologin
+tester:x:515:515::/:/bin/nologin
+sshd:x:516:516::/:/bin/nologin
+pulse:x:520:520::/:/bin/nologin
+bind:x:521:521::/:/bin/nologin
+builder:x:522:522::/:/bin/nologin
-- 
2.27.0

