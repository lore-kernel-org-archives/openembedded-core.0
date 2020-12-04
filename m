Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.20281.1607112478171072876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZSw0aoRM;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id ce23so6670452ejb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r5LBydtLIrNRvQiLTT+Wi1JMEKArOB+R2pQskNjuNkI=;
        b=ZSw0aoRMLvZbSSnMCJ3QZohwaslueAWHLi09ViYQ3J/t/rWLY0iqOZt7Jvdu8KUxSF
         QNvRYzyOGjOze+WSbXluYPmq2NZKP3+rDZwlNAh3y5USyTmYkous4tNwI+NoC0tCcc6U
         KX7bzd5FHejMNrH9aGACV7e+6RsvDSu+XmUjb6Sqf7GBZnpBtccSwFZv6soPmV0sepV7
         pvnkTypQuYKwaBOKT/MIwB+34zrc7JRaFsIFlvUapNaPgu1l28lElUyBLHH7SVREtlJL
         J4W+LLWqb5Zwu4Sci1Kxd/v2/w2n7jlJMU0u6mi83HNRuQAH+TfIlystw5lC4ZWbkg3e
         l7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r5LBydtLIrNRvQiLTT+Wi1JMEKArOB+R2pQskNjuNkI=;
        b=OP6/+DLhlqeqib7+FBOkVurLOBCKbjYi2X0L+OeqsHjUYgfY5LzaUBTbi7WjzNSbup
         t56y/PyJqsyQaBLbqTg1sHQ9hWqRu7OSLt1O9myW+U53qzYkDTTZFxaiDQs69VCIZMUK
         3D0W2XzobvVSDuUgBgiTnsYWK8qOehkwm9+5VG9/PrE20WhMDt5PShenapjACTRiq9UT
         rM/M9e0a+U0vKAJgz8sMcL1gr3WmoCfFJQ65H2vhHCfS7TcqMq/Tqxkajjnro3LzXpnT
         RvRtU3YF9P3uD664Ep6jUlOfePpiifNoAQynpjOjgsTim2rFkTfrWD/cX6uQAztGKm8T
         Y9eQ==
X-Gm-Message-State: AOAM533JTZiX6bltrEXa3hJRxqWbDe+2MxqHzO48XDTTBKO6kjEPBeua
	ekIfeTI0mxeqcsfuBL4Mt8IqiCp9n/3/lg==
X-Google-Smtp-Source: ABdhPJwZfS6t9L4KN/9ovn1YqGzTOGW1KaoFXmhYDhgQb9B6mYgdWQF4WWzHrXJBqd+Q9e9WQMO1lw==
X-Received: by 2002:a17:906:5912:: with SMTP id h18mr8573892ejq.261.1607112476585;
        Fri, 04 Dec 2020 12:07:56 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:56 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/23] grep: upgrade 3.5 -> 3.6
Date: Fri,  4 Dec 2020 21:07:26 +0100
Message-Id: <20201204200737.7072-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/grep/{grep_3.5.bb => grep_3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/grep/{grep_3.5.bb => grep_3.6.bb} (93%)

diff --git a/meta/recipes-extended/grep/grep_3.5.bb b/meta/recipes-extended/grep/grep_3.6.bb
similarity index 93%
rename from meta/recipes-extended/grep/grep_3.5.bb
rename to meta/recipes-extended/grep/grep_3.6.bb
index 22ef70bc5b..edf9b29c8f 100644
--- a/meta/recipes-extended/grep/grep_3.5.bb
+++ b/meta/recipes-extended/grep/grep_3.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b82ac77707c2ab945520c8404c9fa9f890f7791a62cf2103cf6238acad87a44a"
+SRC_URI[sha256sum] = "667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.29.2

