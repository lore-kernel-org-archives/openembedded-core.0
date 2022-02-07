Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298C7C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.16551.1644196135917638675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mrqq6xkB;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id c19so7224717wrb.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rw3R50D7OtxZO21YDDYuDbBIV7LSfSGRXAnCtMwy2W8=;
        b=mrqq6xkBqRka8ggF/X/f3sEWZN/tcmR5nFakLB0V5KlClr/MbK6a/d28V05Tlefqbv
         V41j3SJFbibRdBM34rD2EVHuFn9DXjQsbzdQRmDxcjhhhCF0uVH9W+f8C1axe5abap4T
         zKJ5+CD0vqnzJ7Wx/PyVngyjpYszKZbZ7Q5Eo4EJPgBKbhHTk2kdNRg+DhOj38rahjiR
         jxNeE1N6HMCaStbSc+ZueajQnTMPsOIBpZmjiWWj4BqKQ8sz39XgjOGTslRz8tOuRFFM
         KnWZVGW0x2PE1KAybVCRItLVmcx0Cibn+y5FNzte+toRtlkqC0w+Gf5h1Ec4jJ5Ce0iO
         cuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rw3R50D7OtxZO21YDDYuDbBIV7LSfSGRXAnCtMwy2W8=;
        b=ZGcQCjqvzBRgU+eF+SA+ugPqArTvM0QOE5MZfxRid4wyKAlPBiWdo7LLrE5VufeH4k
         m2GbrPpVFIEBX142mXJYXnnwColD9B2Euqctufyca1N3pHLer/Uo0hmNe39GvaoEkLHv
         8Q81uoWg2T1deEZjve1T7Byobi1tmfIv4bf+hICnkdl88yYifL7xdnk8Yxqv6RIDERCX
         R12xo9NL6h1Phku0eEu5QZ2bpJxgLcLfYDNj99yS3K9qIoVOAOZDJk39mX6dECO2/88t
         qVEgMkF8YEcFk2tHEjRy4ewLk3M3Zu+9ocPIPgiUaWLkT70HRSgYRYzICSZtnbwLw4Ex
         sPkw==
X-Gm-Message-State: AOAM530K/Ca+1xzFuzVjRkpTBpCrQmOoPQTliMccZ1q4AML4gTt+RPTL
	hb0nqh5zNdmC8gs8wrsJ2ObFCgNAyfA=
X-Google-Smtp-Source: 
 ABdhPJyWMKyfNnunxtDPdSJgCHtfp/YtXntn2jk3LcGrIeUyE+TlLGbAxV5SzQySUuaSDqIFIFXgoQ==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr7804547wrn.452.1644196134315;
        Sun, 06 Feb 2022 17:08:54 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:53 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 16/17] gstreamer1.0-python: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:22 +0000
Message-Id: <20220207010823.143664-16-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161436

- Add new meson options

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...1.0-python_1.18.5.bb => gstreamer1.0-python_1.20.0.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb => gstreamer1.0-python_1.20.0.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
index 1dd7d0d09a..3399b6f9d7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "533685871305959d6db89507f3b3aa6c765c2f2b0dacdc32c5a6543e72e5bc52"
+SRC_URI[sha256sum] = "8f67bdc5606ba33606c6bc896e89de7dcd8cf4fca459f71389b1b6fe075b5e54"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
@@ -17,7 +17,11 @@ PNREAL = "gst-python"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
+EXTRA_OEMESON += "\
+    -Dtests=disabled \
+    -Dplugin=enabled \
+    -Dlibpython-dir=${libdir} \
+"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.35.1


