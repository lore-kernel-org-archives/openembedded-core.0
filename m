Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.18704.1586969403880542920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 09:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QDWT8v2Z;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id h11so200870plr.11
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJy3Wq0NIQqTOYALjG4Ix5S82nimh0fXIaUamIUaYjA=;
        b=QDWT8v2Zzrdo6tMfzltMW5koEWpES5Y4uMxL1kke4GXIac/MLHpd8uTopLCxoIjtV5
         Ps/5cvcym/zm1yZZenpLigpbbtPSzmOXsTOsAiz5Hq+8X1+vu0+wPXlUzxn/vE6ocPfr
         EgB0N4SrmXcb20eZIQkOtJHHy6Yx0Cy/6mckeTDBVad6fFwAmlRXCilr0vt2rNjpAZjw
         OS04EBigH43esuTdEtiJZqxZ+daZ8oFFdKygRdPmFqDxFtItROeOKgTjptnl+Fh79GaT
         EaCvRK6/xH6prLS+Gsfq1Yx4oSQucCE8Jjhp8lx/rnJwyfG3yz4Nxn5GqLnjGF3c6xvz
         DXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJy3Wq0NIQqTOYALjG4Ix5S82nimh0fXIaUamIUaYjA=;
        b=mF+5srg0HJuuXQTcO77hEmNVsGdsk6vdl8e3C5PLz3riaPrGIdVT+W+sZd6ya37OFQ
         /t78FL+sKV76O7QwOAEowoRJLiFbAww44GdS9We3wtAajcVDEa9niFauSqEXVnvVghQb
         1RvCWkJeSHjz7uSSbfeeUkmsZslpFo+jpQ1PlfAsSLPMw5zsjzqXAhnsLB1IqQ3GESDF
         ta6LP1BmAt7+5IbaFfDxLtHCrQcWXlJkWvcbxyRA5lRn/L+IKvwYPkQo7r/AS2LKJgXU
         OrO6H/hjTaqHO5unSxbWfovjH0w0vtCUcpnQmPVGvoRMcwFIjxxwP8zM9+NtKqtpU4jE
         HUgw==
X-Gm-Message-State: AGi0PuauecYPksDObDZhysFOMrqp6HYVN/Y7bALjCXDVXB0AuM+YLJmV
	iIIOF7QQIzdr6dt8nHVAeCq07/RlahU=
X-Google-Smtp-Source: APiQypKH+qMOe0aS+/DaM/g2We6j5EsgzY7OTlFA/XAB1Kx9/RLPQw/00jyCjXoQc/C4IP8pDGIxIQ==
X-Received: by 2002:a17:902:b187:: with SMTP id s7mr6110412plr.0.1586969402929;
        Wed, 15 Apr 2020 09:50:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id y14sm5856958pff.205.2020.04.15.09.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:50:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [master,dunfell][PATCH] packagegroup-go-sdk-target: Enable on rv64
Date: Wed, 15 Apr 2020 09:49:59 -0700
Message-Id: <20200415164959.1475020-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISCV64 now supports golang (starting dunfell), therefore limit
disabling to rv32 only.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
index 5afb490aac..86c71900ec 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
@@ -8,4 +8,4 @@ RDEPENDS_${PN} = " \
     go-runtime-staticdev \
 "
 
-COMPATIBLE_HOST = "^(?!riscv64).*"
+COMPATIBLE_HOST = "^(?!riscv32).*"
-- 
2.26.1

