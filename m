Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5790.1586320873532869834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 21:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dn/TyAIE;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: jpuhlman@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id z6so587110plk.10
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 21:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hSOj7gqqL9sF359hBYAuzohuboqY0gEWJANgc0uVtDk=;
        b=Dn/TyAIEZlyf/JyZKu7SDZVzaiiRkw+5iF3eG9FAOXAlCdRuXdgK7hwyhqP4LLrXjS
         NkD7wLef6sFNVDWJp3ejPkNcllSmOKimBquIsY3kRlhSkuAZduieT0eUry4dAuG87TV0
         HEI8kcVLW2xgJ55e56iianX9VTX3KkhWRcOhyX26ndM7Q535TF7GXVUWqamCQEZJoUmg
         iZRMiIYiSYGND+Ic1pm25Pc1XFF6Y3401r7XbXm9nNx1PlsO+Fv/Ne0t/TWojV42ByJi
         zbZQpSlO+Ir9ApNFeK9fanR3/cTY9LPB4tlDvMb44g9G/8LhDDURIOLgRojhg19spNrG
         oNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=hSOj7gqqL9sF359hBYAuzohuboqY0gEWJANgc0uVtDk=;
        b=pD/Im4aL3hbfJCrAn6D4fL4rmKdgAcpZ2jWmyc/ekHsbElPpz7hdOO35ncq8xJHG/o
         vj8tQX3tOSTk9mn2nKsi/8qHZ62NIZAcEdQI6zJzEZa6wXvlcVd9iqLZAOyGIDQhZ05u
         kERWq+Quls6NpT1pI8EQ2fC98JjaqdgVVzPeh5TMpzGzU1vpIxHUkl3Vd3/96QOlgStn
         QJGpAr48MNDqJ/IcujfUwKfE+lJLZ9I+NMIyvfsUsSWqFJ003UEi5v0zvK6x4Et/q2YM
         EGyiaIBreoBSv7B+h5bj97Ww/zuExKsEXf1nkrk1skrnJ90PQPzxqkmiqtzNQhxuEctE
         4twA==
X-Gm-Message-State: AGi0PubgxrOqydK3dmt/o4KiDDxlBzuIAevHIZ321PzKxoozOJCfaFM7
	OzySFNMZTpE8AOB311iCurSUySuJBCw=
X-Google-Smtp-Source: APiQypKYhBSMz6fWb/XxYUGbp2PFFd8B72mU8TkQ5sY31l5jrtlcsHzArFJ+TlaYpjqPt72vMQfhVA==
X-Received: by 2002:a17:902:8bc7:: with SMTP id r7mr5618524plo.12.1586320872667;
        Tue, 07 Apr 2020 21:41:12 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id r140sm2273571pfc.137.2020.04.07.21.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 21:41:11 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 0F73C2A0885; Tue,  7 Apr 2020 21:41:02 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH] qemu-system-native: Fix commented out PACKAGECONFIG
Date: Tue,  7 Apr 2020 21:40:56 -0700
Message-Id: <20200408044056.8220-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f17a046fca..7a1ccf2115 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -180,7 +180,7 @@ PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
 PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
-#PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
+PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.20.1

