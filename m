Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.11626.1621204375987074516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YdR86dEH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id v12so4456280wrq.6
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D/oPkaySFdkOqszVQP6vhZQ18J/3B06dHejDn13IdAg=;
        b=YdR86dEHGXaojfVRnNo5/czqvoJAh5QBFfzQDXAG+t1/BuikK12Se785OAt3/ImHqE
         ZculAjf/bSKEnEiKx3ZQnLJ5ByoOHXcue60o6BNp2OVPqvVbiY6JBXnuiF/dSDVhg607
         pVq96o5+A8RbVFd6jmj/fbG2DsFRbjXX9sELA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D/oPkaySFdkOqszVQP6vhZQ18J/3B06dHejDn13IdAg=;
        b=BNYBHq1bhawSSqF2xpozcgE5r5t3SaPW59MvqFxdlfJrcwfdryZM9Qy15y/AUn0F0L
         xKengmxDbaPhQ5oFqgAZQITUfO9Y1HWTODSFxm2Pz8Hd4BkbrX9DzSOtqSy2GQFtbIzX
         wWI9H16/ekDPxmMLmDPamZMA3dXVuiWX+ahw9bEZwWeQcJaHtZI3jA8yc3ipEkOU7MJg
         c9DG+g+6Qy6DhwvCfb2xf3oEMwFWBfZoXkicsEtm6QtcTzRgVIL+d4WY+K1y7Rqb9ZqK
         I642jI4obc/39mAzu0PhyKgcyCwRFa0dxsRN0OwwBcWoCsarVgjJUpcU147zNucK0pcz
         kuiQ==
X-Gm-Message-State: AOAM530zysryPgwZXFpytX+TghLPWrScNDvGUIWhdyuHiJAn3vqQAGS0
	0qSiEuO2Ycv3Jngf2GaauVO+iKJdWjar4w==
X-Google-Smtp-Source: ABdhPJyhI745NrOvM09mZWjQ0V6nOHsey2hR2mz5/ooDn5Bo1exVwQNSBZwMg6KFmbabOLYKdDtTzQ==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr70479240wro.3.1621204374576;
        Sun, 16 May 2021 15:32:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:54 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/27] python3-numpy: upgrade 1.20.2 -> 1.20.3
Date: Sun, 16 May 2021 23:32:30 +0100
Message-Id: <20210516223247.2401235-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-numpy_1.20.2.bb => python3-numpy_1.20.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.20.2.bb => python3-numpy_1.20.3.bb} (96%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.3.bb
similarity index 96%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.20.3.bb
index 0a60ca74673..d160fd655b6 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "c049f410c78e76ffb0af830a8afbdf8baac09897b4152b97b1a3b8345ee338ff"
+SRC_URI[sha256sum] = "b7340f0628ce1823c151e3d2a2a8cba2a3ff1357fba4475a24b1816e75c21f90"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.30.2

