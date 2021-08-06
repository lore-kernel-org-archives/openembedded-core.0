Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.3767.1628251611776950411
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 05:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s1vWuhRL;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id n11so5457643wmd.2
        for <Openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 05:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FIAy+YKj/LxATTUVTQLj1bzHaPd2wXIcZodejctvdvw=;
        b=s1vWuhRLnpYk6SuZZQPKkXmTIuNVRL59z+FGs7Ximx4Co5gFXF2ToLD6+6WhNw4eQI
         Zzz8aC8arKHPAM3/osCp2pMh+Dkp0E09lEnRwvIDNEKW0UoTrFi6znAFtGTiVgE1YRXF
         Bc9zeVKlUH6Xs/5ELgdTMmv2eBLct4VYQnMwAthKbCZPacvf2ksVZegara4x14Er/yCe
         mQl3gvEnhdLy6XlcbDEtyqDCXlqLxmgMhFMRUm5zQKb+1QV23rfq/oujc7wCN8lDXQ3p
         2Qx0Af0nVs+KigwNYzMCtFj7oio9m1ag4ZQNwnCn96nRjaNnDOCewtcpLfKHzFVct+ax
         Uhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FIAy+YKj/LxATTUVTQLj1bzHaPd2wXIcZodejctvdvw=;
        b=U3E5G8Qgn8Eh6O/tx2Tq+JEBJEZ/pXvOGhBCdju3LMWUwZR1LIC6plFKFyzbuPzPdH
         cc5I4Xt0HyX5fgLdfYqRWjPfWBOzip8HMlZRgREH9dgYq6wLVmRbeTSWaaqTZLkYBmEO
         aAh4cvw+5RdY0aoHThwITTSOa0nScMmP9cg5uo9uUT6pFptPczzN2Kd67HTqpSoJWZks
         C3HfXURur332VMqyfRpA+SXbvbRStapMVwShx61TX6Xjckbmdrv9bvHMiWh89YigEpfz
         IJ5vSVNJ7GxDTQ1/hrz2ZSFzHCXs6zhnBkhPEYUld9JLpOo54xSBuRpWx3GptLQ2SPCV
         U4/Q==
X-Gm-Message-State: AOAM533UWEexpBNykfy6FhCZamQzrsOCyA29A6Dwv1TzNnnwQV/3CMWU
	xjT2AhXUszT2LPLpnAvTr8SJy+LzIBzf3NPo
X-Google-Smtp-Source: ABdhPJzQmnViw53XrJucjdOwDJEf9gfqI2bztSGtPI3zc2uRPb1/eSDFLgq2i5yayT7lSnCb8c1XNQ==
X-Received: by 2002:a1c:a98a:: with SMTP id s132mr2838654wme.131.1628251609925;
        Fri, 06 Aug 2021 05:06:49 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.70])
        by smtp.gmail.com with ESMTPSA id n11sm11093049wrs.81.2021.08.06.05.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 05:06:49 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v4 4/7] systemd-machine-units: add bbappend for meta-selftest
Date: Fri,  6 Aug 2021 14:06:08 +0200
Message-Id: <20210806120611.124246-4-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210806120611.124246-1-uvv.mail@gmail.com>
References: <20210806120611.124246-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../systemd-machine-units/systemd-machine-units_%.bbappend      | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend

diff --git a/meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend b/meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend
new file mode 100644
index 0000000000..205720982c
--- /dev/null
+++ b/meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
-- 
2.28.0

