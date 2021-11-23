Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7026C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:07 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.878.1637704686800209275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kYG0EonC;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id a11so626968qkh.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KsYyjFuYi+3MXknarhS6G6OJtWq9QOmgdnREfpv7snE=;
        b=kYG0EonCuVmi0tl2DiLaS5l+KWk/BooY5DgzFMTvI+mg0WkTEaykPPjYO/Jp9QWdr8
         X5hYX5Il4V5YiD7voOVDC+zxsACIJrAl/jUeu00u+LYjOQSYr+ApQhNhU9//WupLmZnf
         JHS2PWOhYr95TmOPl8cyHNVptsvjL/qthcWD6j3r8oQFl6G4fIbqyVtZx2/8/Gv3ib/P
         CgrbSNB+vzkMmfAOWVBFwBYqY4xDzajj0iyeuKsSFpUVcUs8IC45g6Fy2vdoX8TcIprP
         I5ZPsC3yujvbR4UipoSK2Bh7Fd2+dzLkuR3/avjEo7HPWM2rhFhJpOv7d0tvwbscToIh
         1OiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KsYyjFuYi+3MXknarhS6G6OJtWq9QOmgdnREfpv7snE=;
        b=jNehZVKK4nJmN3ik2F6mEvSINTZUctb8TO9YL96NkHX83hN4dInp5YeQil4qqNEShQ
         EOd0uDtjTW1AWhKlvYffyyDlwNmTVcN66qB9iIw6g1MQdu4DVemBzDvlwLBGRaTX9Eqm
         hFAwOsyK+QiuuARWHbTO1XJskKpdtBg3FhKkqXS9nDzIdpoRQr4UxtRZVVld2+PNYfUY
         uTe2U09jmwmhE6qAXHvqSCqHBbHt+hQGxjhN3eNQ1kXUqx13MQSkVPeawAnIDOiD3vdd
         7lw6x9tgzylBIWt4rziCEwYoOerfb6hvxybwAb0CA/SVPH7NUlN6qVAhaeC9bSWSQWMz
         ZjGg==
X-Gm-Message-State: AOAM533/+Ag1E66dHEJtgfxCf/lOKDy62Iyti7vHeGFswh78G6+Clonr
	FeGp2Lnhvwtu5RO3GIAZ4CA=
X-Google-Smtp-Source: 
 ABdhPJxb0giUwjJYEGWsd+Pl5IgWJ6CllSgAjA/PmNdo3+cmP1G2rXtuMc3PG0JSfMAMehmbdTV1UA==
X-Received: by 2002:a05:620a:22d7:: with SMTP id
 o23mr729651qki.222.1637704685957;
        Tue, 23 Nov 2021 13:58:05 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:05 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 15/20] maintainers: update for kernel dtschema checking
 dependencies
Date: Tue, 23 Nov 2021 16:57:42 -0500
Message-Id: 
 <ddafe125ff243fb761306f30b9828014755415ab.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158636

From: Bruce Ashfield <bruce.ashfield@gmail.com>

These packages are required for dtschema checking in the
kernel build. Adding myself as the maintainer.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5423358e77..3919c5ede6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -597,16 +597,20 @@ RECIPE_MAINTAINER:pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr
 RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-dtschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-hypothesis = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-importlib-metadata = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-python3-python3-jsonpointer = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-python3-jsonschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -628,6 +632,9 @@ RECIPE_MAINTAINER:pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksan
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-rfc3339-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-rfc3986-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-scons-native = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -642,6 +649,7 @@ RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-webcolors = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-zipp = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.19.1


