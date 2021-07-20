Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.1085.1626805584497796477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 11:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BV0nRNWS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id u1so27077923wrs.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 11:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uY6JCOyf8Ba3I/of71IgHVeUL+JCfFdYGm+xCowi3Gw=;
        b=BV0nRNWSaPlCWW2G2xXlGK7c/dtzayNJahlxv7i4RtbDE2Jya21LeqACN7EJXTk8X3
         eYO9DlbAPL9ZlGccpJ4ZOgB1junHsKMP3YwePDx9zy6w6d0JN2G1mDLS/c/9UGRbkM23
         FQbuXNiN3o081fNgiN6ToaVT8mk2Ih/K/TeFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uY6JCOyf8Ba3I/of71IgHVeUL+JCfFdYGm+xCowi3Gw=;
        b=CDaXh3eCgvnaWdEQ/2R8WdAP3tof7w4aMnOWxGL7lKhVLgrHLa7vLcMQgT4H3mJCsb
         CTCveIWpOieOIANepN83j/7lK/vhBRsabxUSJzJyHYvasMjOX8KUEciC7DNxY0uldoso
         JRPIq6YAsomgztCljtlBdskncD+sCIZBvs50BBvoBUhU9v9xW1cr4dtHM/oldRJ0OIKK
         GPE+V9lO/m4i2seGQgHHq6jvJM5EZ5T3fadgPfVRXXocHW6g9YPLxJYL2VsBlnLzv26x
         vihglP3gWvizbN8LQyHaEYrocYOt6XsvKFqcPw6d8T2iqdtPCxSF0N9/yKA3sQW+m6Qn
         YpCw==
X-Gm-Message-State: AOAM53173aUPLgB/pxaGM+zXQ24WWzx3gRMwg1qO9Y+sijBx90tm3Dnv
	pBjJNjYOGlEdYGghtnvYkjuKCDb64OCx4w==
X-Google-Smtp-Source: ABdhPJzzqJ0B7AIZRoIM4i7z1UlRUTjY6AC8NPJNhFddPHoToWqHOFbvGzrVPK2TFTu5Nq+kMpicGw==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr38345191wrn.248.1626805582735;
        Tue, 20 Jul 2021 11:26:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2cd8:e78f:29a5:f753])
        by smtp.gmail.com with ESMTPSA id l24sm2968572wmi.30.2021.07.20.11.26.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 11:26:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Add MAINTAINERS.md file
Date: Tue, 20 Jul 2021 19:26:21 +0100
Message-Id: <20210720182621.3048972-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have a long history with maintainers files and good and bad experiences. There
are people who'd like to see a kernel style machine readable file which defines
exactly which people should be reviewing which areas. In practise, the files we
do have struggle to stay up to date (e.g. the recipe maintainers file) and such
a file would also cause conflicts of expectations where person X would want to be
cc'd on patches touching file Y and want a revert if they hadn't acked it. We also
don't have clearly defined boundaries in some areas, e.g. toolchain.

We have a wide peer review system and nobody gets to make changes without that
review, even myself as the lead for OE-Core/Bitbake.

I do want to recognise that some people are key experts on particular areas and
hightlight that their views on those areas do carry weight. With that also comes
repsonsibility to help try and figure out bugs, help with review and so on.

I've tried to strike a balance with this file to detail who some of the experts
for particular areas are and to also highlight where we don't have coverage and
that there are opportunities.

I've tried to put the file in the wider context of the project, not just OE-Core.
It is in a repo rather than a wiki so we have visibility to changes through the
change control process.

I'm sure I will miss people, sorry, it is inevitable when you try and make a
list. There may be people who want to step down and don't want to be in this
role, I'm also hoping there are going to be some new volunteers to help in some
areas. Please do send follow up updates, this patch is really meant to help get
us started.

Volunteers to maintainer specific areas of the project are very welcome and
feel free to reach out to ask about areas or getting started and working towards
an official maintainer role (e.g. help with bug fixing).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 MAINTAINERS.md | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 MAINTAINERS.md

diff --git a/MAINTAINERS.md b/MAINTAINERS.md
new file mode 100644
index 00000000000..604d800f634
--- /dev/null
+++ b/MAINTAINERS.md
@@ -0,0 +1,71 @@
+OpenEmbedded-Core and Yocto Project Maintainer Information
+==========================================================
+
+OpenEmbedded and Yocto Project work jointly together to maintain the metadata,
+layers, tools and sub-projects that make up their ecosystems.
+
+The projects operate through collaborative development. This currently takes
+place on mailing lists for many components as the "pull request on github"
+workflow works well for single or small numbers of maintainers but we have
+a large number, all with different specialisms and benefit from the mailing
+list review process. Changes therefore undergo peer review through mailing
+lists in many cases.
+
+This file aims to acknowledge people with specific skills/knowledge/interest
+both to recognise their contributions but also empower them to help lead and
+curate those components. Where we have people with specialist knowledge in
+particular areas, during review patches/feedback from these people in these
+areas would generally carry weight.
+
+This file is maintained in OE-Core but may refer to components that are separate
+to it if that makes sense in the context of maintainership. The README of specific
+layers and components should ultimately be definitive about the patch process and
+maintainership for the component.
+
+Recipe Maintainers
+------------------
+
+See meta/conf/distro/include/maintainers.inc
+
+Component/Subsystem Maintainers
+-------------------------------
+
+* Kernel (inc. linux-yocto, perf): Bruce Ashfield
+* Reproducible Builds: Joshua Watt
+* Toaster: David Reyna
+* Hash-Equivalence: Joshua Watt
+* Recipe upgrade infrastructure: Alex Kanavin
+* Toolchain: Khem Raj
+* ptest-runner: Aníbal Limón
+* opkg: Alex Stewart
+
+Maintainers needed
+------------------
+
+* Pseudo
+* Layer Index
+* recipetool
+* QA framework/automated testing
+* error reporting system/web UI
+* wic
+* Patchwork
+* Patchtest
+* Prelink-cross
+* Matchbox
+* Sato
+* devtool
+* eSDK
+* Autobuilder
+
+Layer Maintainers needed
+------------------------
+
+* meta-gplv2 (ideally new strategy but active maintainer welcome)
+
+Shadow maintainers/development needed
+--------------------------------------
+
+* toaster
+* bitbake
+
+
-- 
2.30.2

