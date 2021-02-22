Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.29559.1613958441201221673
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 17:47:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X0aKGaU6;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: joel.stan@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id b15so2905015pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 17:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aGGmwvNT8VWHwTrL4h1mfu9MyHAXiZ1CdEbs5EyhuA=;
        b=X0aKGaU6RqSm5wFRlxd6Zn+06QC3G890SfHe7WJpEyvEenGDcTkVwJS24ywi7fCF6K
         DdYOqEmdyUGKJXpPkWoDn9k/3BKAzLUTJPoMJbbOKmNb5U5c4opcbvvw9hl8+6dSZWW2
         5h8naJU+Yr1p4qXVQ3CXdfI7+fQ+FFFH/+TPVz5J4IkBGLB9E3LQLs8z3a/wLwaHz5JX
         LOpMZ3B77ZBT2pA3Yy4uEhr9MAkHNvSXGKpP7C9Th/vbYuQjDBDd68bI3tr68btCmuig
         QP4Jya6hBmsm7Zj+HGbhetM+EAusDVvMzMyV9XUeMRSh+WiyIERrZVSFGAJ3JuMk0PPe
         sJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=0aGGmwvNT8VWHwTrL4h1mfu9MyHAXiZ1CdEbs5EyhuA=;
        b=JqAwXa9M3fs0BJCiWka4c3cZitHji2Obb+6gMlJwfmDMwr93DrJY/P8Qwknnle16bl
         HRweehu7kSFG5bBbbRtDsR9EmSUOWYluOJHzud7L4ovB8aWpZyuPnhc1Y6C8T0wnPGss
         C87pFnYn7OL8n7jN2M4V45aBInqAzJBPv7QiDX1S5ptmhJHVR3IPI8SnizyhZufZyMHR
         BWL3mXKBEgwKmGlpAArzAhheP7/Cb1iaVEtp4ppeMUIOZTu6vlX1FXgicnuTgONZODmA
         D5L/c0Fe2ZnUiuxUc+oUW137jJS7tkRM2K8MatLsKZMfQRjzOaSvVC8xHndJ+AY1pKNF
         ZZcg==
X-Gm-Message-State: AOAM532XOuJB7YavCTVl2V6RmTIa+XuqzdHqvJa3Lr2HyBc7tymyp0EE
	KnIgRIiARDtvzzbJ6hqKOW+N8VoAuJ4=
X-Google-Smtp-Source: ABdhPJwvqqq0Vmy1NWqqXVu/LxLVMxPe1D91wGcW1zL77tDQD6aZkPszMdo2uv113EHwVecSZebCkQ==
X-Received: by 2002:a17:90a:ad97:: with SMTP id s23mr21003792pjq.212.1613958440202;
        Sun, 21 Feb 2021 17:47:20 -0800 (PST)
Return-Path: <joel.stan@gmail.com>
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id ga17sm1220189pjb.7.2021.02.21.17.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 17:47:19 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: "Joel Stanley" <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
	Andrew Geissler <geissonator@yahoo.com>
Subject: [PATCH] conf/machine-sdk: Add ppc64le SDK machine
Date: Mon, 22 Feb 2021 12:17:10 +1030
Message-Id: <20210222014710.102061-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously SDKMACHINE would default to x86_64. Commit 539cd4a5fbb9
("bitbake.conf: default SDKMACHINE to the build host architecture")
changed it to default to the build machine, causing the build to
fail on a ppc64le host.

Reported-by: Andrew Geissler <geissonator@yahoo.com>
Link: https://www.mail-archive.com/yocto@lists.yoctoproject.org/msg04364.html
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta/conf/machine-sdk/ppc64le.conf | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta/conf/machine-sdk/ppc64le.conf

diff --git a/meta/conf/machine-sdk/ppc64le.conf b/meta/conf/machine-sdk/ppc64le.conf
new file mode 100644
index 000000000000..0eebc5853c13
--- /dev/null
+++ b/meta/conf/machine-sdk/ppc64le.conf
@@ -0,0 +1,2 @@
+SDK_ARCH = "ppc64le"
+ABIEXTENSION_class-nativesdk = ""
-- 
2.30.1

