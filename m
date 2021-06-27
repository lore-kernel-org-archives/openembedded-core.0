Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.5488.1624803241485279494
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WxwnQhWo;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id q16so3190860qke.10
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S/9XUw/lloVPq3O38FQZi7JJlqrFWX0h/13s8KBtpF8=;
        b=WxwnQhWoMYgHW2uTlyK7TaBjtnKnbZoho1VVpvqy/Anhfa+BQ40UwCEbS8LZTg5Ypd
         PA3NtYJvFYBXu1Ob2I6Pnap6uimtG7zSme4lXrVwS/8toSFm1psUOlI7TMz1c7fELlRl
         tFew3je0dwvUgly57Hl0SK9lxDSq820TybcbCiqQ5lx/g7wQ1DaQPfrwc5BIdYg/A/qS
         iFvQdQ1eKlMxzHZHOi4+7Xo20kVSitXd/ZQUnRcsKKAPQ4LgYu5DVPfZjU4mYPDGEUvO
         0maAjeJcTs6T9wrxmMAt4dOxrbBMlekVXy1pvVsMmkv3X/RJ4808/slrbyNbRnXXt5vM
         MZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/9XUw/lloVPq3O38FQZi7JJlqrFWX0h/13s8KBtpF8=;
        b=n2Av24Uv9k3OKaXqjvVP0uRKa2M6kTg1ioNIvih6xszv0p54K8/2crCAp9778hG1cJ
         mcy9zK5TENo/LsDJ0T0GY2cNPqQZkD8djmCnvFcBSFfbRn3QI17PcGjvuoXLj0shTtrU
         tRS+7MgsKeNvRuN8EsarUakT2+0ptQ/nVGu/FrZOn7TiL1Tg+5BXD2V01gPDqsOcTObc
         5tXh8RnAZ83x6XAhSl8DFWMADSKRkMdMjIbijI6wlHHxVexZd78fBHusBu9k+Jyn5Jpt
         QVzRMZ2PpGav0HWKdmTSyt48Z/gLzBiC/+dPg7teq8UYYieouCLnXUumdR0PD8TEc4DL
         XdNw==
X-Gm-Message-State: AOAM531L3bbWWj8/8bae+gejLA0IHkY6bvs8KGHMIzIIoVWOmQbzpgm2
	inu6zj1atgIxsdAdwiz8SmU=
X-Google-Smtp-Source: ABdhPJw3pHTTtNAvAFGJresPIg8gXwLjS8iPn46/Gn9/9/IPgVR/6iUmVyohBWIvAui//A6oUK8Dbw==
X-Received: by 2002:a37:6f85:: with SMTP id k127mr20820588qkc.178.1624803240666;
        Sun, 27 Jun 2021 07:14:00 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j8sm5496142qti.20.2021.06.27.07.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 07:14:00 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/5.10: update to v5.10.46
Date: Sun, 27 Jun 2021 10:13:54 -0400
Message-Id: <13f5bbe2bbc43c2a339ca06f496c58b87731c5e8.1624803046.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1624803046.git.bruce.ashfield@gmail.com>
References: <cover.1624803046.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_5.10.bbappend        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
index f8362b6635..21a79cb7bd 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -7,10 +7,10 @@ KMACHINE_genericx86 ?= "common-pc"
 KMACHINE_genericx86-64 ?= "common-pc-64"
 KMACHINE_beaglebone-yocto ?= "beaglebone"
 
-SRCREV_machine_genericx86 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_genericx86-64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_edgerouter ?= "274d63799465eebfd201b3e8251f16d29e93a978"
-SRCREV_machine_beaglebone-yocto ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_genericx86 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_genericx86-64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_edgerouter ?= "4f8dfccf5eeb954de45ce7fed1951662d33dd677"
+SRCREV_machine_beaglebone-yocto ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
 
 COMPATIBLE_MACHINE_genericx86 = "genericx86"
 COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
-- 
2.19.1

