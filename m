Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.6099.1616159860160396006
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 06:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ADuFdm1F;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id l4so9651200ejc.10
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5HTltqNYcJczEbEPLDb5hI7Wzq4lBStCwgHw4ch5JY4=;
        b=ADuFdm1FqyU+xtDQuPigZGQnOTcjefDoTK8V543bLfo/KUPTCpU/NyrIMakeSU0SRK
         EQW/Q2Hj6afImAn1XG9NJmTOhBP9lMBDBhy32UxOr14AFWqqHQNEsGVsFOz3kySHVQhu
         yVsJ2KlZOBj2uKObxlTV1svFwDgCE2rKvcjTt9vV5ytwvaTgUcnryPJtGOkVzoY8XsZp
         En9LCOsgqu5/4jjkucbRzauOhxkg0DdMWemBExxrCz2zbTU8YotWEAdQ8YHIaiOj8Fqv
         zwGcez5MtxDws+xiLJfuHZnZQCg1UwgNbtYmnbd6XwdN+4I5fivK3MWWG2s8BWKzUcgg
         G1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5HTltqNYcJczEbEPLDb5hI7Wzq4lBStCwgHw4ch5JY4=;
        b=NvD173+xkSPm6WrRaH0IdBk4X7lw8Splm4b8BoSkPZLNBLLwl6RR8/Y4ryJBJL9CBv
         r0PIt337fmPECBqIf1RNXLppSrkUeI9zqLB07sOfhMBVuDzPgzrBJVpngI1fcnjz58RL
         MNkDznSInC2skSDgp7Qn2G4EixXNeh6E7wnG11euc1yQoPsM5J1xrTlrvGZZd/MvXaD9
         RNqyMrR4wMBnPGYcQlxD8IUSJUGKpNh/FmQPQeZmA0bffXWAIC12moiln7YmMCXmBds+
         hhsK79mQRBa+Zi3MALGZ5mU93q+JT/SOeEnBIpLWCb37hsnAeWAcz1OVmYidS1fah7wp
         +62A==
X-Gm-Message-State: AOAM531k9uq9YSR0B5ZcwB3b7zWRySbHWacoqOT3241kQS6wJPhHrNR8
	C6kXROUXMJmvLdw3UwZHGmrT7TfJlug=
X-Google-Smtp-Source: ABdhPJwn72KGXnBWPbNVDu9v46V9D1FEFyOaR/RJL1x3Ir755l2S34iqrjHEKmBw3ouS5z3U2qpWGA==
X-Received: by 2002:a17:906:7d7:: with SMTP id m23mr4345270ejc.205.1616159858494;
        Fri, 19 Mar 2021 06:17:38 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id fi11sm3611281ejb.73.2021.03.19.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 06:17:38 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] packagegroup-core-weston.bb: add pam to REQUIRED_DISTRO_FEATURES
Date: Fri, 19 Mar 2021 14:17:36 +0100
Message-Id: <20210319131736.104420-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* weston, weston-init, weston-examples require pam
* fixes:
  ERROR: Nothing RPROVIDES 'weston-init' (but meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
  weston-init was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)
  NOTE: Runtime target 'weston-init' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['weston-init']
  ERROR: Nothing RPROVIDES 'packagegroup-core-weston' (but meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
  No eligible RPROVIDERs exist for 'packagegroup-core-weston'
  NOTE: Runtime target 'packagegroup-core-weston' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['packagegroup-core-weston']
  ERROR: Nothing RPROVIDES 'weston-examples' (but meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
  weston RPROVIDES weston-examples but was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)
  NOTE: Runtime target 'weston-examples' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['weston-examples']
  ERROR: Nothing RPROVIDES 'weston' (but meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
  weston was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)
  NOTE: Runtime target 'weston' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['weston']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
index 340c8e75ed..2614ddf410 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Packages required to set up a basic working Weston session"
 PR = "r1"
 
 inherit packagegroup features_check
-REQUIRED_DISTRO_FEATURES = "wayland"
+REQUIRED_DISTRO_FEATURES = "wayland pam"
 
 RDEPENDS_${PN} = "\
     weston \
-- 
2.30.2

