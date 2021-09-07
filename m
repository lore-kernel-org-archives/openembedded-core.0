Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.4567.1631057553521185058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 16:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qna4k2Fk;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id n18so504449pgm.12
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 16:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=goS867BeD6R7uP/7gKduZAr1Qhe9ycQScJUTmwuBAxo=;
        b=Qna4k2FkmMZ2aRLgcyGbq8Y2AXSZp2onDKdNOKCk2xxgo0jQiLXDeL6Pvco/YIBVuL
         u+k7ZXxC5bOaoGna4atiGQFYRJnuZyu41Zuqu/gbdOpbQEgKEziPUUGBrum+0crPk5Hr
         depqcJVSswXtIZRqIDzATRNOa73WPryF2EFWu5RaXAPKwkJOFpIfyepROdYZ4cJ3B+U5
         2kPAVkEH+uYOdDu6ee90x0iyAu/zm3/IFQbdRW9wTMtJ71Q6F1dT5a7lt2klshi2p4ZU
         dPiRjjjeU7EffNsyopInXk5hv16/bUQELq/2gICcB9mAnBbD4vmZXfKDyhr/q7Ev4/ZO
         8EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=goS867BeD6R7uP/7gKduZAr1Qhe9ycQScJUTmwuBAxo=;
        b=SHiTH3v2MtGQeP/OUhIKQoF6iTf/VjIDKQgZWXhctGaPfyY6j9acUA/Nv+dfglXynO
         /hBSGE6hB22leWMBMW0+MLYwLss+36zZHnsBQlThAeRuP5/kn5HTKWmPcAiLbhJ6DCNe
         HL/Zs3AJBmlmP3T7cXps23c4aM4OhA5GIDivF/8kFFrEG8GzXaX1DIMz6zC7GuNnaBdV
         e9K7eC2HslCYwNU/4L3ewfQs8n8nizA/13M8FMkwCEI3u01CaHmo3CZfxQcf7+le9YXH
         1N0gFbGlsRNYo6rtW3mlTP82hW7Z0XeiEMla27t3E06f8YGe440pXfE1YhM/cKXy7aoO
         8ctQ==
X-Gm-Message-State: AOAM532CErqG63ydoYOZN0iDlXNYaP0anSZxNiK89dsXjrSZCOc8dzGF
	0GqR0Du+2Zal7KtGrEcfIFATpDBIKVA=
X-Google-Smtp-Source: ABdhPJyUrb371IAZyFE6A/xW1m/5OPD8Mlsr7EY5j4VnusHPs6DGvHanvam7yYqPecCLIbT2/gKGxA==
X-Received: by 2002:aa7:86cb:0:b0:412:448c:89c8 with SMTP id h11-20020aa786cb000000b00412448c89c8mr752999pfo.84.1631057552988;
        Tue, 07 Sep 2021 16:32:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ece:8e2f:f07e:736f])
        by smtp.gmail.com with ESMTPSA id d200sm157186pfd.127.2021.09.07.16.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 16:32:32 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH 5/5] dbus: upgrade 1.12.18 -> 1.12.20
Date: Tue,  7 Sep 2021 16:32:27 -0700
Message-Id: <20210907233227.3265977-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907233227.3265977-1-akuster808@gmail.com>
References: <20210907233227.3265977-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Source: https://git.openembedded.org/openembedded-core
MR: 108825
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/dbus?id=bfaef91e77cd54e4f642e966903aac3f3291c325
ChangeID: bfaef91e77cd54e4f642e966903aac3f3291c325
Description:

Bugz only update
Includes fix for CVE-2020-35512

ab88811768 (HEAD, tag: dbus-1.12.20) v1.12.20
5757fd5480 Update NEWS
f3b2574f0c userdb: Reference-count DBusUserInfo, DBusGroupInfo <- cve fix
37b36d49a6 userdb: Make lookups return a const pointer
732284d530 Solaris and derivatives do not adjust cmsg_len on MSG_CTRUNC
1f8c42c7cd Start 1.12.20 development

(From OE-Core rev: bfaef91e77cd54e4f642e966903aac3f3291c325)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bfaef91e77cd54e4f642e966903aac3f3291c325)
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../dbus/{dbus-test_1.12.18.bb => dbus-test_1.12.20.bb}       | 0
 meta/recipes-core/dbus/dbus.inc                               | 4 ++--
 meta/recipes-core/dbus/{dbus_1.12.18.bb => dbus_1.12.20.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.18.bb => dbus-test_1.12.20.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.18.bb => dbus_1.12.20.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.18.bb b/meta/recipes-core/dbus/dbus-test_1.12.20.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-test_1.12.18.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.20.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 3bdb7ea4ff..dcbcc0a9d6 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,8 +10,8 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
-SRC_URI[sha256sum] = "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
+SRC_URI[md5sum] = "dfe8a71f412e0b53be26ed4fbfdc91c4"
+SRC_URI[sha256sum] = "f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
diff --git a/meta/recipes-core/dbus/dbus_1.12.18.bb b/meta/recipes-core/dbus/dbus_1.12.20.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus_1.12.18.bb
rename to meta/recipes-core/dbus/dbus_1.12.20.bb
-- 
2.25.1

