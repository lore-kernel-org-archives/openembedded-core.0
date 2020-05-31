Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.17646.1590940445557734497
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E034fxqY;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id mb16so6879501ejb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=su70UhjL8Vif4ocR7mX/+joTsZky/C/ObnrjO8wqOD0=;
        b=E034fxqYj4NscW3AgqLrBxhxIoW6mxS8d59jL5YAlhm5Nlx1jJKLgEkfCYlSj5bH93
         lHwbsr8pMsvIGkDcdbAEZdsQX04fv9bjEAT0oPGeLPm+CknENk4TuSMHQ8PGSjLC9hMy
         K/nmTE+MKmuSrYwyP5wWXtgTwFOaS7cg80OLAkQ1D9WGIv2AOE1UEJCNbG3ckjR03iX4
         VvmpWpO75lq/hm+9f+aQA0RptvyRlHpPeLnvUM63vOG/k+sTdiUt3Aea3sQcJnH/8E4G
         JZb/eaJwHt6BF0M504Lss/z2Fi6g0hgCkRniCvQ4df9l742OZ+M8BkieyWExAdtwVRLm
         Sl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=su70UhjL8Vif4ocR7mX/+joTsZky/C/ObnrjO8wqOD0=;
        b=PQ360ge50dq4PjokrTAJTFUu14C7a2AdvxlVnNG2fHnY4ImI2IosMbeUHt2dpYzddE
         /8Tya/mgR5eV9/MkF3v/8ynfwcJHVV1T1OGeLEqdlb63qDNooee7tn4flw3xIVkps17h
         077KiBvNHZ8KcfYqk89Lby5K1G9o533w51xiI8u7CFww8wk5AdGmZl17PWdMQeJjcwxD
         K+29m77VTZdMCAcea64hQK1x3U/8zEwqQjNdZsjfyktn+tkFUnOUd9xTlkmZxxcMaGMz
         h4GxUd8aMVVWCFmexXj0KthynB95KKimq3j/5ooJq6ehVUcYP4rHjcFaRQz+9hfOrKR7
         ks1Q==
X-Gm-Message-State: AOAM533TVSZHt0rHYiaTFdiLsaUvSbhUt0po1N+8Q/ggVqu/VhPX3mGn
	m3vhWqEartlIUJATAA2TxySLC2rO
X-Google-Smtp-Source: ABdhPJzw1VxOj9PIrPdAwUR8600cEDEH/y4F373b+QnJ9gZpyA4+5wUFJaJCUxxTYbJyKdTeoKDbYA==
X-Received: by 2002:a17:906:1a47:: with SMTP id j7mr6538721ejf.356.1590940443973;
        Sun, 31 May 2020 08:54:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 42/70] puzzles: upgrade to latest revision
Date: Sun, 31 May 2020 17:52:26 +0200
Message-Id: <20200531155254.10283-42-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 41b78d6fe1..1e530519f3 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "79a5378b5adc46ee33ba34d55738f916fb8adfc9"
+SRCREV = "66b9e8c7de0eecb3d85d9a1766fab1082848448b"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.26.2

