Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.29861.1620642676181536135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 03:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dSPBr54D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id l14so16050879wrx.5
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qmqJnKUHFBzRbVVZ3Oipep8uye6Ih8wE8j1VviMO69g=;
        b=dSPBr54DcGzPW7ZbSVE3C3MHM3wWnWUj427U9ulS8d59q01NnfdsfhurHkmy9Z57T/
         XkZW5ik73RLU4MUsMW3asS/Fvbt+XeN5IG6hPAdK1Rou2yPOhtLg6ic3Ts+fs66glLn9
         JzbTVctRBUIOTFqkE65Uu8E5ZtRiYHKSXHgBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qmqJnKUHFBzRbVVZ3Oipep8uye6Ih8wE8j1VviMO69g=;
        b=ZXnDa2hUwm/Ft4AxXVHBi0tzFJV7tsigl0QWnSCBqNnqcL23flqpJTIsku32+LoNy3
         +5bAJZ3jqeDdi0E1HpcISbOuSat6fvnRAxi/srAzkgf8hbn8ixRtta2XiPU/B6/fT0Uf
         G3EPYq0JsNQatGFgGrUBVX2DAstPNaUyw7LtBsxhIlCvO7DF+JcDZblWyy3q91Q6u8N0
         tteaLVpB3FlgtMnonR5bxUCl8HITwfnB9DliIAhAMuHNBaBZk29FhDiD6Aipps2exNwb
         /6cDgYuygu8VtDwbnLsyx/N7mwTWjZEXb8Fc10TDcV2gLzD78B52/Z2BUUC4+sXBHm98
         r49A==
X-Gm-Message-State: AOAM531dOrDzAadq6CjRUowu2qi4kPPvLKbiPCSVKc3JNGHBDQ3yo1vH
	6i6k7QBz6SpZC6bdMHJJTz/VhG2WL2S7Hg==
X-Google-Smtp-Source: ABdhPJz6CzNBg5CgALqpDugnlGfK/jHeaUTaiWQRNv23ovL9g2iL9w9FWu55bA8ezcNwVoa5zMzkMA==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr26247725wrn.337.1620642674484;
        Mon, 10 May 2021 03:31:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id o62sm58217798wmo.3.2021.05.10.03.31.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 03:31:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-extra-exclusions: Update/add CVE-2000-0803, CVE-2005-0238, CVE-2019-14865
Date: Mon, 10 May 2021 11:31:13 +0100
Message-Id: <20210510103113.2156587-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update a CVE status with the data sent upstream to the database, document another
as unifxable by us and add the status of another sent upstream for a database
entry change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../distro/include/cve-extra-exclusions.inc   | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 956b3a9a3ca..714db0544eb 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -12,7 +12,24 @@
 CVE_CHECK_WHITELIST += "CVE-2000-0006"
 
 # groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
-# CVE is more than 20 years old with no resolution evident
-# broken links in CVE database references make resolution impractical
-CVE_CHECK_WHITELIST += "CVE-2000-0803"
+# Appears it was fixed in https://git.savannah.gnu.org/cgit/groff.git/commit/?id=07f95f1674217275ed4612f1dcaa95a88435c6a7
+# so from 1.17 onwards. Reported to the database for update by RP 2021/5/9
+#CVE_CHECK_WHITELIST += "CVE-2000-0803"
+
+# epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238
+# The issue here is spoofing of domain names using characters from other character sets.
+# There has been much discussion amongst the epiphany and webkit developers and
+# whilst there are improvements about how domains are handled and displayed to the user
+# there is unlikely ever to be a single fix to webkit or epiphany which addresses this
+# problem. Whitelisted as there isn't any mitigation or fix or way to progress this further
+# we can seem to take.
+CVE_CHECK_WHITELIST += "CVE-2005-0238"
+
+# grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865
+# Looks like grub-set-bootflag is patched in by Fedora/RHEL:
+# https://src.fedoraproject.org/rpms/grub2/blob/498ea7003b4dd8079fc075fad7e19e0b190d0f97/f/0133-Add-grub-set-bootflag-utility.patch
+# Does not exist in upstream grub2:
+# https://git.savannah.gnu.org/cgit/grub.git/tree/util
+# Reported to the database for update by RP 2021/5/9
+#CVE_CHECK_WHITELIST += "CVE-2019-14865"
 
-- 
2.30.2

