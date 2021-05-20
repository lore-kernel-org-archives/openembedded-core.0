Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.533.1621532676255052488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 10:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NR2psTxA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id a4so18561149wrr.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 10:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gzOpG6N4FguhIGeChPu/vq5g+9vdzEh85gwE6Wn63u4=;
        b=NR2psTxAj2vGGppfjde9dpoUSgn6Xjb2rcF5I5Vf8xq5pfoMWtcKSkuawFH0rO3RRI
         KPrWNRbmsaJZHJZP4bKvGNYpooDfgK4ASEcxgFzx6HhZiCe8ixd7hzLGSedlPm4zvtpL
         WW+TXwG53IKYczzjWum1V7ut7omyHQFZfu00Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gzOpG6N4FguhIGeChPu/vq5g+9vdzEh85gwE6Wn63u4=;
        b=M7BCl1w3djRzZ/kGv2LiVjHLFnhxvPWbgLRQVZhdX9+EaOaAYRpYLdR6XwGD0bxz07
         T3bcT1gV6UFDgDPKLOK74BBWqZKHW17tOCjxufe0wfrZuGpcrirMGF/MkNNzhRUML2K0
         agfsI5T60gN7yfGyJk/x2esyjQXLaHSkC/2wFQSmTNgm4ekmyGzpWKA19OYXfkf5V3ga
         bPWmcLTf1TvNLXmTj6upKoO22aJhqC/nBXDB7DxSeYVJQRBTPp8G/0p+9oc0TnyDfA5u
         SbMOB6kdiOWLFZOS8JOqvyq6+lqZzYloIkjeqBAK/TDa3nm0Sdsm+Mo9yLOtspXafS/o
         EshA==
X-Gm-Message-State: AOAM530Ve5FzC5fQIQ/APAEKCdp22RqXFnYZQqyFEiR1dpkMQ9L4T3uN
	YJhG/F6nfw3snpbP1nuMoONyutAqM5T7Vg==
X-Google-Smtp-Source: ABdhPJyo4QizKiRPO+dNvM7tQ/vTH7iISGThd1T7MbdgzAIkcG0yXB7FlFVr0SWnRIeTFyr0Xqplew==
X-Received: by 2002:adf:fb87:: with SMTP id a7mr5535360wrr.58.1621532674736;
        Thu, 20 May 2021 10:44:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:56da:83e7:85fe:8f81])
        by smtp.gmail.com with ESMTPSA id f6sm4574991wru.72.2021.05.20.10.44.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 10:44:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] cve-extra-exclusions.inc: Clean up merged CPE updates
Date: Thu, 20 May 2021 18:44:33 +0100
Message-Id: <20210520174433.2523177-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520174433.2523177-1-richard.purdie@linuxfoundation.org>
References: <20210520174433.2523177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index b2816c3dd52..cf07acce1db 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -53,21 +53,6 @@ CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
 # so from 1.17 onwards. Reported to the database for update by RP 2021/5/9. Update accepted 2021/5/10.
 #CVE_CHECK_WHITELIST += "CVE-2000-0803"
 
-# grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865
-# Looks like grub-set-bootflag is patched in by Fedora/RHEL:
-# https://src.fedoraproject.org/rpms/grub2/blob/498ea7003b4dd8079fc075fad7e19e0b190d0f97/f/0133-Add-grub-set-bootflag-utility.patch
-# Does not exist in upstream grub2:
-# https://git.savannah.gnu.org/cgit/grub.git/tree/util
-# Reported to the database for update by RP 2021/5/9 Update accepted 2021/5/12
-#CVE_CHECK_WHITELIST += "CVE-2019-14865"
-
-# tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
-# https://bugzilla.redhat.com/show_bug.cgi?id=280961 - issue affects paxutils included in tar
-# http://cvs.savannah.gnu.org/viewvc/paxutils/paxutils/paxlib/names.c?r1=1.2&r2=1.4 was the fix
-# included in tar 1.19 and later
-# CPE update sent, may or may not exclude for us
-#CVE_CHECK_WHITELIST += "CVE-2007-4476"
-
 
 
 #### Upstream still working on ####
-- 
2.30.2

