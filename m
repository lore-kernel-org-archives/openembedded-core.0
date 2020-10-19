Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.15661.1603122185188945723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 08:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jZhGgnrm;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id lw21so14557000ejb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rxQNEOitId9s+YQJj5i9vdqiAO47QpxNCGwQcljVz64=;
        b=jZhGgnrmJPR0/hevUF5bniHOJUeOqeixSukcVxyt2+q7unQ/+xhJV0J+bZYEhehrII
         4KnY15xQi+URTc0a+AQcnfQE5hIyAc+CPAmTCvukp766S1lDHxwFBeFSkVqdECxGI923
         6/Y/tSJiUnZyHe+lGsaxSlXLtOyp0t0oxkJimFOeh62kVP47WcBIalBulRTnE08iBbRN
         JJMmzJFsoqkLWt0U87ctA8FkL5UXY2gjJTY4crq6kBHWhjXpB18445Bdn0cuSmTrwHSr
         Bhz3i9zLnH9KxMJN2DeLq07ic8stwZ3TxHGxKgCHLgktwDzsT2fL/USm0L2/ADuMd9Bp
         NPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxQNEOitId9s+YQJj5i9vdqiAO47QpxNCGwQcljVz64=;
        b=PeXtGd0JcIzvViihFFt8jQ6aPTYbXWX9RZHOYdxTWMbwCMjMWkPSEArQBBygByJWd1
         ajD+bSgBvrmrQkB4QMcp0gCEmAqbdoAevod91SYZRRVeIhW5ED74l/X0Ypx6NwhcJE5Z
         stMSOoNRqy33JZXbXd1w6uZngtWU54LJeQYpqS5omTlJJBDEYwdOP7BUQeMmga6axQXp
         +LiSYPFfTbesRaTt+1Js8P6deHMiF8YmLHdMS38P/qUtmgUi6jcPPoXhq/Cy5JjMYBfN
         Fw/UFNJT8VNgrVsblzkCxDomIDBPT/xN3BXL0U0VGaSAClKr5bQlD681b9ntxkcS1C2k
         u8iw==
X-Gm-Message-State: AOAM532uNozyb0LqlKIB5FR0dKV7qAh4JfOQDpHTGpI9AjCes8RpKuge
	dyiqWiHL7Vg7m82lx0gJWsNSs7aQX2w=
X-Google-Smtp-Source: ABdhPJyGdSIW0bUQrn7KBhGN06Qyj3WUDnNImNWgIY1jJFv8NBlFl5vPUj5SdwbMzoStNjedy1u0Bw==
X-Received: by 2002:a17:906:647:: with SMTP id t7mr499428ejb.428.1603122183477;
        Mon, 19 Oct 2020 08:43:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id o11sm497754ejd.60.2020.10.19.08.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 08:43:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/4] python3: fix upstream version check
Date: Mon, 19 Oct 2020 17:42:54 +0200
Message-Id: <20201019154256.9519-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019154256.9519-1-alex.kanavin@gmail.com>
References: <20201019154256.9519-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3_3.8.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipes-devtools/python/python3_3.8.5.bb
index cabe5dc075..2a3c52a116 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.8.5.bb
@@ -45,6 +45,7 @@ SRC_URI[sha256sum] = "e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af6
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
+UPSTREAM_CHECK_URI = "https://www.python.org/downloads/source/"
 
 CVE_PRODUCT = "python"
 
-- 
2.28.0

