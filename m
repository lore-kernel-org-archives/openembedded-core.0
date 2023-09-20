Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C433FCD4928
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:23 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.3139.1695249077285480845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FcEsKQAs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-690bfd4f3ebso230386b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249076; x=1695853876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtqIbmVebZ5aPV56o4QD+yhAHZCqwESD27hmnRiorx8=;
        b=FcEsKQAsR8X37/UQKPKpfcFYP2YZ6u5/j0qjsH1pF6RsenCG1cj1W1CtFsaZP/FZOr
         waDkqyO7u47cgHHdo6iFTwHP6ZMtRz9lbdEmQwV15HrjhUpu8RgwAXc+fmxVoVU40eT+
         6Dr5TyqX7Qm0xFAMxOPORlCtg1d2wH6yktwRxZBPKhMVJReqc1xBHgC5OGry1XJQylrO
         tAQ1DZYbBrlhTJKiHXwUXlTjH0RwAKGiwOSBJoL1KAur+xuSx4Uske2uIUhqa+2sAyb9
         HUouM+MCewsQo9LC9Son6trc0bJodKosudwIMtFHa4mM6coy7u6DOWE1uVBQdampZtvB
         CIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249076; x=1695853876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtqIbmVebZ5aPV56o4QD+yhAHZCqwESD27hmnRiorx8=;
        b=S4fmd60Tq4o3ny055FTs4Zmy9XRwwHQ/ex8PUe2asAb37yTb0hGkl5PulErJTc0iby
         xHIViJiLA7SucOqxU4Uj/M90ZwkOXQWvsiaJTuqKPtlcVwLHB4KZXxiiginEZ4I1H8Zg
         2FTKm7n37c04ul+6LxbQGdjQDfBZJW/SlTn6UIMqphuKUrVhDaYldF0CfmkuLnm27fGW
         ZYAkzXGrVCfh1LdNmHaqdVlEZbmNpKHKNAf4MsnNLWn4jb6S+ROJHFTq9ErSt5FmQnnR
         YNdp6RY7WnYyE+YYYE95L8a4QtbkH+Q8dqBAEwQWKp3WRCVkgZRd2fmpQqcAEjJMwSwD
         cdUw==
X-Gm-Message-State: AOJu0Yx99xrFkX7UZmyqAay4QUH51FJdjQUKK9Tk/g1fE7IkPq9/rC12
	NGaymY+WcXd//ey5MX0wVKF8/IDRad8kHfHtzPc=
X-Google-Smtp-Source: AGHT+IEppW1sDzZAKbvuP/VhuZqDeLIwya6G+l+Sv/BsOukbiaKJLHkL5wr/m7of1v2zJe1Iw9XEUA==
X-Received: by 2002:a05:6a20:442a:b0:159:beec:79d4 with SMTP id ce42-20020a056a20442a00b00159beec79d4mr4937457pzb.0.1695249076427;
        Wed, 20 Sep 2023 15:31:16 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/20] vim: update obsolete comment
Date: Wed, 20 Sep 2023 12:30:45 -1000
Message-Id: <72af322b6b8afd64a59b30a4f0fc3f8c6dfaa06a.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187956

From: Etienne Cordonnier <ecordonnier@snap.com>

vim 8.3 has been out for a long time, so this comment is obsolete.
However we still need UPSTREAM_VERSION_UNKNOWN, since we ignore
the last digit of the upstream version number.

Test result:
$ devtool check-upgrade-status vim
  ...
  INFO: vim                       9.0.1592        UNKNOWN         Tom Rini <trini@konsulko.com> c0370529c027abc5b1698d53fcfb8c02a0c515da

(From OE-Core rev: 65f5de85c3f488136d1ec2b1f7fe8d8426d6c5b3)

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 868a19357841470eb55fb7f1c4ab1af09dea99ed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 33ae0d8079..83ab9ea5de 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -22,11 +22,10 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
 PV .= ".1592"
 SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
 
-# Remove when 8.3 is out
-UPSTREAM_VERSION_UNKNOWN = "1"
-
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
+# Ignore that the upstream version .z in x.y.z is always newer
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


