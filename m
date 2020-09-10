Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.20775.1599740700912068368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F7S3CWnT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id c18so6464918wrm.9
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lxvveG6wEYPWxBCJcJfGhQi/Il+naLtM2eld24xq7r4=;
        b=F7S3CWnTCAqfUNC2wzGcf5smDxPqdCBDMi6X1xkiRNf+BaNst67h3IzDF5KSn4AIsG
         gGzzGOSvFSdtZSpeo3EpTNUUXf7MC3gFanhOYnmj5ZJg3a12Ni0A2tDmSH9YF7oipeQc
         3Jcox1CF66z/YHFDdKophqiT5YJe0PlDE9Tq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lxvveG6wEYPWxBCJcJfGhQi/Il+naLtM2eld24xq7r4=;
        b=jyMg/qJz+Ei/l8tlUvqufOJqUgCe/x1ezvRJSJg6wDgPxLNyIDd+EXAth3D4M3hkBM
         bbbt9G5ZjSXTSkQkphH5f0yHYH4YSkWmW98F/nRZMx5eR8/y6v2k6T1vK4KE6ntX/i9i
         mYITpapcT8/6sB+4ZRyqHO3nCyoMvoDiZhdVG4WjC2AtskIVJ+HBS0mjoPX5kQVsIrCW
         j9TEUM18Y6Wqq4A9FnK+46hn/rSP+6/KeI7tIdb7xcsPuTPWQykfcj8Xs7EQus8qyNZB
         EvkMLKKpbzWNXKRONIY/EdlVZuACdn11db1RrxFgWiiTD5WHYphZ/3WZlWdlEy+/veVn
         KnDw==
X-Gm-Message-State: AOAM5330UO4ubxKFRTbl6N21QNTjV7XOJa11GJq9ri17oIrbYfu2iwHu
	RidowYrnr9e+D8Nnnu1z2hzCyf/i0oUS9Q==
X-Google-Smtp-Source: ABdhPJyafDFcd3+sWgNinE6NEJHOtUG4Q2XOe+h3eJO0j8UdmgPwEXgSrrWxLcyzPHT3/bADPSfSuA==
X-Received: by 2002:a5d:60cc:: with SMTP id x12mr8683581wrt.84.1599740699177;
        Thu, 10 Sep 2020 05:24:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>
Subject: [PATCH][thud 24/29] maintainers: Add entry for buildtools-extended-tarball
Date: Thu, 10 Sep 2020 13:24:28 +0100
Message-Id: <20200910122433.2040293-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(From OE-Core rev: 4281342a04078990bb0a110760ff2dc053eccc93)

(From OE-Core rev: 665ef4274e0261bb8351c8d4fd2c8496a2dc27e7)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61d4d3d5a9f27e0fbf1d7ed6db818a779643b8f3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c027901fdf0..8eb5e7a864c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -81,6 +81,7 @@ RECIPE_MAINTAINER_pn-build-appliance-image = "Richard Purdie <richard.purdie@lin
 RECIPE_MAINTAINER_pn-build-compare = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
 RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
-- 
2.25.1

