Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF805E7E0C6
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 10:53:37 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44957.1770634409907397788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 02:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhXcZ1E8;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48336a6e932so8104355e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 02:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770634408; x=1771239208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=84hGBoVwPQWGMndb8PSVKBzTNcPZFxa7kck0E9NBr3M=;
        b=HhXcZ1E88Rcz8REuM6OB1HY8XjHQNtzwhKDuksnzxbzMVAD4OaNDHWWNr9BWSpHEgo
         rclxPvsU9dn5on/B72reB8769egUcqVLCiGWquQqj1DCHRGpyd2gPX1UV0DzE7yroUy1
         aecjG8u5vqkqaxYCvmAFpizmtnHaJQuo4Lc8iWCQapGQmF9dAdfjKXL6xKKq4TKBdZpG
         e3w/9Hd6v8uCsszNCyBVf4KdkgdkR8Hrmm0/gVhUJj6L3aWpFahlzemqIB67iv34Hb1t
         yRwxQIwb/YVBnpsWzvDUvJs3TjqLJJGyh7iGRN7FQ9V2fGVlloL2iUJILz/e52Fe0Uvk
         Ccqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634408; x=1771239208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84hGBoVwPQWGMndb8PSVKBzTNcPZFxa7kck0E9NBr3M=;
        b=I7bjelHIgFrGZzq3oMVOwzXGiJflnvwFcdvpScpy4msrQd0wZ5UVOkOn/u3ba+5Kgr
         NbjMP+w3QG70FTaKDeKStez1Mbs/It01Lo1OB3sRq1lLmlKM9r3CfaKbQcnTAF/w0yhn
         YJ5025dPfS0Y5Gggv7vgsuVF+oOYjqiIyqanxjrlikUcqLYzYZZGG/QODuCya1siLRDv
         UOKQ2DNTbciO4X5YbawqrlY1fev9RQLtRu1nR8Hk4oLVnPkx2dZ8g1bHfpArVo0S4OZY
         lHap3ECNx6GI31Ikrc0XXflUw8JEL4Admii/Bjz40f+IgDa1rr7hhJYY5ntUe50Bhija
         nWCg==
X-Gm-Message-State: AOJu0YzzJaClY2II89yIwF5c27UDCG9UWDWJDv12wfqy+0kRb1OLFdo6
	1S8668Z2aFIKTf8I0WFH8rBsYybRJbxTABdnPzOQNipIH4QhJPV/jjP4zBcKANDxna0=
X-Gm-Gg: AZuq6aJvcX+5gMPP77JcNZ+77QnPRIwxkmp0XWVTgjmLZVOlGevbPJH8BR+dBd9gJUw
	Rb+r1t3B01dPj+XVUWgKuumSIj0HSxmGMF/J+4PILFuhqA1f6OofoEm3NvVyL8YHr7gqqrEEoJy
	mTiWEOaWHz3lh3UZjdFh6kU7P+vI7p7y3jnpWhuSOZI/LSnK8ghEL61C+KYn5lEIlTuM+rMjVtP
	QJ+kSM21m/PuDvLNtdTBvJhgn+0EWOdpL5VAofFNi0C6u+2ytLavSm++fPFJHAfh6eOF7xAtSBP
	WOXHGPuClRacfZ33rA46PsmpbUV7IAH3Z4HZ7VqTizj723pA2JSBQwd3oHnBSCG7a/aYERlgbCX
	w8wkXrcRBn257YxLEwtVYVJ+q8Q5Rtr5fR/vY9FLJ6Me7w5W4LrDDHZAabHNm2V4OnYnrWgMshT
	MoaM3/2gSC
X-Received: by 2002:a05:600c:4fc8:b0:47b:de05:aa28 with SMTP id 5b1f17b1804b1-483201db08cmr164692075e9.2.1770634407372;
        Mon, 09 Feb 2026 02:53:27 -0800 (PST)
Received: from CTW01359.. ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483203e5b63sm146547835e9.1.2026.02.09.02.53.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:53:26 -0800 (PST)
From: Fabio Berton <fbberton@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/buildhistory: Do not sign buildhistory commits
Date: Mon,  9 Feb 2026 10:53:25 +0000
Message-ID: <20260209105325.97177-1-fbberton@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 10:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230781

From: Fabio Berton <fabio.berton@ctw.bmwgroup.com>

This change adds the --no-gpg-sign option to prevent buildhistory
commits from failing due to GPG signing issues. Depending on the setup,
buildhistory may fail to create a commit if the user has the
commit.gpgsign option enabled.

For example, if the user creates a signing key that requires a password,
the commit won't be created and will fail with the following error:

/
|error: Enter passphrase: Load key "/home/<user>/.ssh/id_ed25519":
|incorrect passphrase supplied to decrypt private key?
|fatal: failed to write commit object
\

The bitbake command won't fail, but buildhistory won't have a commit.
Also, the commit may silently fail when building inside a container due
to missing packages or issues with accessing the GPG agent.

This is similar to [1], and signing the buildhistory commit
should be avoided to prevent such issues.

1 - https://git.openembedded.org/openembedded-core/commit/?id=7595a0a63a933af9dd9d1e458dc34a4ba80d9eae

Signed-off-by: Fabio Berton <fabio.berton@ctw.bmwgroup.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 78037a6462..8f605a720e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -794,7 +794,7 @@ result: $result
 metadata revisions:
 END
 	cat ${BUILDHISTORY_DIR}/metadata-revs >> $commitmsgfile
-	git commit $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+	git commit --no-gpg-sign $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 	rm $commitmsgfile
 }
 
-- 
2.43.0


