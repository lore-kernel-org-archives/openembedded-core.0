Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.60827.1598900241168677710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 11:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OxySsG4z;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id j11so3533052plk.9
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+gi720D0USqU3ZAFRYN5BX2/egurbhuJst+05XDQqFA=;
        b=OxySsG4zffUkr9/2LyUMWQMZNDVO0StXMa+zhJ5NYAtH/EazT5usWMMURkQyETeSDq
         KW9eaEZNp6o08TsBc7fAEwmak7jEF7a16kk5VvjES1qQA6yVa0ygdpbWFxYLGE91juWc
         k2eTqVCDcb9QL9tB0HAbrNfhJMnMJke2tmfiyunOHBHk3bmmLFJkHHvEZSKYQXVRyAn0
         gVnDnzB9l+f+mgveap/+kKU6bSAgQtFZNFosc1vuL0oubcCXfSvFOk1AfDLgYLDWeCfS
         ansS7bGIKXacKj+XPE0nF3kTv7iV0tta1ND1H9Mv/0JKAVB+0Im2NfzD7Ft4dbJWbeLp
         GfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+gi720D0USqU3ZAFRYN5BX2/egurbhuJst+05XDQqFA=;
        b=OOcShVv1YSDHp0JW0WsdVOs89mpu9hTLxWGqrlIt/f2Ir2pzz/XOReVkJAlX7/3HZU
         BL5CLg2nTRx/9iaYJJXZPnKveD0sIxJYkf48O5ybh2xL7PSjGceHbgFARJtsP8lrscO8
         cWWCRN8DIugmYu+D6gDjFypBU50kTeugH2k2UKXMLHOzd0E/JdiBOruNmzI5FwfpBNI9
         jqL9FkXOFLiXWvhOy1/f3yc/U7NLyZT4PmaGOiY26DJcf07EdZ2Rsjgb8hnlnex3Qz22
         k5WZkEdtPP5tRU+zX0R++rI8t0DD8GKIPeYEp13B7k3Bgw4IG32Uo25tknlTb2hGNHR8
         MgRA==
X-Gm-Message-State: AOAM532DXyTS0UXe0wNcEz1pVsttlnXMsDv46zYw8asmCQqXRLdGuZUr
	YmHT173TbcsMbVZBIlu9fWIynv1D7zZgiA==
X-Google-Smtp-Source: ABdhPJwKUii1/mIPN2Z9LFXT275T2Y3p9uGV0UZ0IlL5OyPQvxbUABEYdgh1fp3JH4BlCjBYQ4XCIA==
X-Received: by 2002:a17:90b:18e:: with SMTP id t14mr673691pjs.69.1598900240250;
        Mon, 31 Aug 2020 11:57:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id 1sm8875741pfe.70.2020.08.31.11.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 11:57:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] util-linux: Allow update alternatives for additional apps
Date: Mon, 31 Aug 2020 11:57:17 -0700
Message-Id: <20200831185717.3567273-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mcookie/prlimit/uuidgen are also provided by toybox

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Also create symlink for prlimit
v3: Add uuidgen

 meta/recipes-core/util-linux/util-linux_2.36.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
index 2fac9793a2..2ad00ff0a5 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
@@ -263,12 +263,14 @@ ALTERNATIVE_LINK_NAME[logger] = "${bindir}/logger"
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
 ALTERNATIVE_LINK_NAME[mesg] = "${bindir}/mesg"
 ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
+ALTERNATIVE_LINK_NAME[mcookie] = "${bindir}/mcookie"
 ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
 ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 ALTERNATIVE_LINK_NAME[nsenter] = "${bindir}/nsenter"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
+ALTERNATIVE_LINK_NAME[prlimit] = "${bindir}/prlimit"
 ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
 ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
@@ -285,6 +287,7 @@ ALTERNATIVE_LINK_NAME[taskset] = "${bindir}/taskset"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
+ALTERNATIVE_LINK_NAME[uuidgen] = "${bindir}/uuidgen"
 ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
 
 ALTERNATIVE_${PN}-doc = "\
-- 
2.28.0

