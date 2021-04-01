Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.1102.1617290945030534161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mdI6lcKo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so2452947ote.6
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Lp+vES1eL8AlgDefAOI00hliNy0eOeeVKFeCNxPXeE8=;
        b=mdI6lcKoyKKDffsWYVYRmlsbWsL/Nc1FAFWCcu4b+SpzmJTKdgczUodv84hMww1ved
         68AoZ7rQnQX2pLSpDnN51e7+tnQKRG1KhZ146y8yULD29lDGqXmhMkyURrpIPZdugWQ+
         n0/FlpU4zPq2ZCz/W1Z7537c/zU/0f/mRSJaFLjV3CiZKucZKFB+IqVQ92SFAXehgp32
         m/Pr7IKx7Sy5LENUlGSiP92OK7aRGjMB3iWsG/gSTDRiq990tyPoEJ5UfkLVOZkwpPz9
         phj5wuE8w6pPR0lpFkRiy8DWERn52960SRV4SbDO1AQvihH5WcunpzKmkhxs7M2fUtgO
         qmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lp+vES1eL8AlgDefAOI00hliNy0eOeeVKFeCNxPXeE8=;
        b=BVTlEO4aeVY66QPpNv69yBFERxEfgjnhplYGB+v7W9I6GSAMiB8TLZ+cnO8AI58951
         Bth1s/JeZCZU9XJELBaB58D1QmMEh6OJ/fRhBqbXKsQnYexC4+B8FWhP5Xj0/sCectqu
         iQVJyyYWCT7DNx/1r7F8OiisneWByhJ/y/3IgGoJoooyEd7SpHW/tuBlWWRgQsS0o8Li
         qe1HwjDDfoG2f9MEpHRQfTngFTgE1mQ+zLL4mNUru3nTKgGZffG/ZCgaIgt9LS4AGeaX
         pPzUmtsw/BN8V/KaG/LewPPu5TzbIViLDYX1PVxVgrlPbux9wzTsL6RLf2CXflBtUcmf
         qGyg==
X-Gm-Message-State: AOAM531FBUBF5jsh059c9mMVqsaWEW/m8euNm/9sT3ErdcKllxdRuYdg
	/fgli1VyvPsvNZsZ8CCCUIvkH3WVU2YNZPHPQgU=
X-Google-Smtp-Source: ABdhPJzv9R+kwi/h8pj9C51HL2d7vgDnzNfd5rDcmMWOjQtgR6Fzll5A0guDfZKKCIZuPpZt3g6ngg==
X-Received: by 2002:a05:6830:1c6e:: with SMTP id s14mr7415922otg.17.1617290943936;
        Thu, 01 Apr 2021 08:29:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.29.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:29:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/15] documentation-audit.sh: Fix typo in specifying LICENSE_FLAGS_WHITELIST
Date: Thu,  1 Apr 2021 05:27:38 -1000
Message-Id: <ca95497a2d29620f84849a8f92b8bd05aae107f8.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 410a45639d84a3d69a65133593da32062196dd59)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/contrib/documentation-audit.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
index 1191f57a8e..f436f9bae0 100755
--- a/scripts/contrib/documentation-audit.sh
+++ b/scripts/contrib/documentation-audit.sh
@@ -27,7 +27,7 @@ fi
 
 echo "REMINDER: you need to build for MACHINE=qemux86 or you won't get useful results"
 echo "REMINDER: you need to set LICENSE_FLAGS_WHITELIST appropriately in local.conf or "
-echo " you'll get false positives.  For example, LICENSE_FLAGS_WHITELIST = \"Commercial\""
+echo " you'll get false positives.  For example, LICENSE_FLAGS_WHITELIST = \"commercial\""
 
 for pkg in `bitbake -s | awk '{ print \$1 }'`; do
 	if [[ "$pkg" == "Loading" || "$pkg" == "Loaded" ||
-- 
2.25.1

