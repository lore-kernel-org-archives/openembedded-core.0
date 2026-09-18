Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8E0C982D7
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 17:20:42 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16177.1789752036820829583
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 10:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fxhn4wHh;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso7334425e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 10:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789752035; x=1790356835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wS14KbolfukfDEqpnQS8IjDAWxMHD5zGMq0K8hEAsWk=;
        b=fxhn4wHhYO+9Jpe1j6zzHFUE3L2ANn4nnO5msXgnyNlYmb7rsatQ7Pyv2IeBDbHVKE
         CxY2a1bxuekln6T/bs3Vvx+ClCO3DE9jDBXjOdGDgvIweviTrBwW/F93kA3CB+KiPib3
         /dExKG9VDAvtoLrZCGitEzRauEzeHftvGAsj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752035; x=1790356835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wS14KbolfukfDEqpnQS8IjDAWxMHD5zGMq0K8hEAsWk=;
        b=v8RLRu+tTHc1JZp+Z1pNUnrJ0/tJOkrxTzRZXlBcS+LkgnBh4hpMPBX7oL+CKdK29U
         aFkO6RZf5vph0RfhxPF/u/zKtBCCDb5TmUgbpnZrU4wz5w1NV7b5GnEsegTeC96CUXl1
         Sc1DALE8jGBoTvUzjJXjAZqdipobl+pw5W6LyNkYwnct/ifbUdVInyrzril14+pl6Sgw
         ob0NstM25VLvxKbOLlomTGHekSoycazTRu1dsY+JypEydGOSNztwcpDRklanwCD0N4kU
         T93PK6x97hL4MC8qysAPnDRNKYipM9Fse8WjvuLyJv7OpWhzoGREf3LN7tW2NQOaoXmA
         4bmQ==
X-Gm-Message-State: AFuF++lQImEsWj+7a6mYNm9niquGiQKSR8NgJT9VjTOK6vV0AdOABf0S
	d22pEiEOh3EI8W0dhH20S9xlbJZPRkplLOMn6n8V934uj6HltLDOdAfFut1n8MfSXAX+uY09oXs
	b2OaXEdw=
X-Gm-Gg: AYBFou1u9/sH3N5zMKCbviSaLaIIkz1CsEZBq1SnZEmZSvdmopzu2HYbHEpbzfEvfql
	oJz2fp/V6ueu+ZnrHXB5Hge7qWTe7GgUL5JuwYckg04pJ1KJbIfwv1c+iZND25wZ8vpbELHNLHs
	Q35RCnwSSoHFbrtAWNcPPJI2pmwQTI75XkyJz7XLPbZntJ78PW8MyK7SgoTLG5wx9dqONcgdd6R
	W4m4aXFFFiUY8KuWTr9G/5V5DoYyztmJroypJpqHeZG/ihDjdbyqeO2EQlrVkskE7GW3XtdO1nc
	Q9KqxnQr9VQyQsOhKSIjZ2M/aah5FIQM8L/tQmcRrUXoeAYigmDR9WI2+u0bj8VA8Eb2zzFi3up
	ffuqgs0/36UDg9q6fvr5XUV7ECXhY5TJchvxUClR+isa5GtYF7KjXxJdeghzRuqtGCUmbOLvFG6
	KOWasDgewun4DhYY5cMJvm3VHt2b3yfoHzOCr36yNBdlmCjx4sFvVCDis6d3WE2WLlppJL0913a
	mXME2gdTv1mDv3YF8ZJ0J3z0Uu3dy0/d+K5fw==
X-Received: by 2002:a05:600c:4695:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49fc55ac96emr47139315e9.0.1789752034980;
        Fri, 18 Sep 2026 10:20:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:22f8:9184:5b80:7430])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5748e56sm71174935e9.2.2026.09.18.10.20.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:20:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] coreutils: Add missing locale ptest dependencies
Date: Fri, 18 Sep 2026 18:20:30 +0100
Message-ID: <20260918172031.2871246-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918172031.2871246-1-richard.purdie@linuxfoundation.org>
References: <20260918172031.2871246-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 17:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246221

With the site file locale entries fixed, we need these dependencies to
avoid test failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/coreutils/coreutils_9.11.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.11.bb b/meta/recipes-core/coreutils/coreutils_9.11.bb
index bbef3263994..b24a9ac9962 100644
--- a/meta/recipes-core/coreutils/coreutils_9.11.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.11.bb
@@ -230,3 +230,14 @@ RDEPENDS:${PN}-ptest += "xz  \
                          ${@bb.utils.filter('PACKAGECONFIG', 'acl', d)} \
                          ${@bb.utils.contains('PACKAGECONFIG', 'xattr', 'attr', '', d)}"
 FILES:${PN}-ptest += "${bindir}/getlimits"
+
+RDEPENDS:${PN}-ptest:append:libc-glibc = "\
+     locale-base-ja-jp.euc-jp \
+     locale-base-fr-fr \
+     locale-base-fr-fr.iso-8859-1 \
+     locale-base-zh-cn.gb18030 \
+     glibc-gconv-iso8859-1 \
+     glibc-gconv-euc-jp \
+     glibc-gconv-gb18030 \
+"
+

