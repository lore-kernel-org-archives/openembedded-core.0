Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.6781.1611307815117083601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 01:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=riOiApKH;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id a9so4390314wrt.5
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 01:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zCWUVf3pn9lkaCGkGDI2Y4sPqggzXnyzYTjq3Yeaq+o=;
        b=riOiApKHS2LWM8WqRgvjpoWmhkeRWP04DxoBC2UXHYIYUP0ndH9SQhz3GZsqUlobUJ
         VtqsD04hZWbX3ZVo5sM7G1YDzLfZNPJyS/NnEGkLcn68wL8sGKrv0EuZhtVkzLTbZBWE
         SGOSqGQs0aXHP9GdLouquRHxDFGx2h3sxjulSQepnVxwPZKRDUne1soT4VqDkRzgpufU
         MNOZGv6I3W4Q3mMkmHdfL4RiHPsRncK8UpayiDqW023Q8Nzfn2xQ4vyf36FHTlZkTMM6
         r4zMtjV770+xUuhTqx+opFs5DsRwwAOt4HJopTJKuQFqywsR1CExNV5uPdgyQtvdKnlS
         d2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zCWUVf3pn9lkaCGkGDI2Y4sPqggzXnyzYTjq3Yeaq+o=;
        b=MvxlFzpwWCoR525XwMfl5UjoOAgVLookJziG5zNeY0hVXIo8zNjIDdE7XLbLYisKrf
         E6blV2+vgNcGTSd0jSGrEtvXHsNbt320NIKaob/MtofqrtVemsI8N8nuwvmWrg1MCPWm
         k4jsrgHY5R96quuW7OZHdMmyyqwH0iKe1ecE/NOG6j5XBUAHSwTUtgSPS5s/D+MzJeRG
         tzXel48rxZ92tclKXkyYhc7r9eBsdQD+XKRy9OVgWZT35G5UYKPENz1yQEsU7CFjLpxw
         5U4mQ2l8gyPBaat3tDZUUbYHKxXuYiNdwIZrMwnc5hzkTz/dtOvn56JZ5w347Pcs0rQY
         khpw==
X-Gm-Message-State: AOAM531/+2EYS8HfX3S2dz/vKxUOXL9TnB3ed5Mj1EgrJMW8FzOpL1hg
	kJq44BC7oHhoV6jojrcdLkipf91oFhugdA==
X-Google-Smtp-Source: ABdhPJwdyt5CrAhjEGDVpp/52K96iqeSARBUu0vSVHXgx+GyjyXiIna+A1yXp/K5+7XlMqCPzGkIIg==
X-Received: by 2002:adf:dd05:: with SMTP id a5mr315483wrm.402.1611307813599;
        Fri, 22 Jan 2021 01:30:13 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id o14sm11184399wri.48.2021.01.22.01.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 01:30:13 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 1/2] common-licenses: Add GPL-3.0-with-bison-exception
Date: Fri, 22 Jan 2021 09:30:12 +0000
Message-Id: <20210122093013.642421-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/files/common-licenses/GPL-3-with-bison-exception | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta/files/common-licenses/GPL-3-with-bison-exception

diff --git a/meta/files/common-licenses/GPL-3-with-bison-exception b/meta/files/common-licenses/GPL-3-with-bison-exception
new file mode 100644
index 0000000000..d48c6241ac
--- /dev/null
+++ b/meta/files/common-licenses/GPL-3-with-bison-exception
@@ -0,0 +1,7 @@
+
+insert GPL v3 text here
+
+Bison Exception
+As a special exception, you may create a larger work that contains part or all of the Bison parser skeleton and distribute that work under terms of your choice, so long as that work isn`t itself a parser generator using the skeleton or a modified version thereof as a parser skeleton. Alternatively, if you modify or redistribute the parser skeleton itself, you may (at your option) remove this special exception, which will cause the skeleton and the resulting Bison output files to be licensed under the GNU General Public License without this special exception.
+This special exception was added by the Free Software Foundation in version 2.2 of Bison.
+
-- 
2.30.0

