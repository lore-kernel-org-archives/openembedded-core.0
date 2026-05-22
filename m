Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3799BCD5BB3
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 06:53:23 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11829.1779432800878407868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 23:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lRCjKze8;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8026aa4d53so5249701a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 23:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779432800; x=1780037600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLOLJJzYhoU+22NAtYIpdryhk/W+tnqzz3dwxf5bcCQ=;
        b=lRCjKze84wX58lSYeT8Fu9QLZ2IgCUIKehyZDdiAl8zGSOZvzCkSKfCa9n9VImi9rw
         P5R2wgDB9RXBZ4cP6jpBz2TPq4vU6/ObsoNd5zsLtDE4IHNImSuPGNnJ+Y5P0/9+ezvX
         x4Uiu1LjegGKBkVN9rUXWVaS5BZV8StHFIkbapkfqHomyT24wi5ACpM03CVZwtP2z5kS
         ywzFlRP0AIbWySgnNHIfVxr2aqiaY6AhFWcrSPH7C6VsRZAGfk2bngYVHr1KjbWmOp03
         9R9GkdyrfwKCCVtYRL6gl3LHwNqFVMBUaVtX6kjmxQqCfcMJ+RRPzH1sr4GhcXdTKyvc
         qtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779432800; x=1780037600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FLOLJJzYhoU+22NAtYIpdryhk/W+tnqzz3dwxf5bcCQ=;
        b=hYM3vV9beLRVzPfEyfdjXQUnsDu7esEO9tgqF2NaY85aHQdkycz+Or16NMGL6H70tq
         xmZfmsDKvbfSxZB79xtbomqLbZuaEim/7Hb+vOYnXlkW23mrCLhDgrdKtRAw2vBRUq8+
         J5TzFmwFeaoIxUTkW0ePBK7BksiVafSa6n9umnuVzsdPC+J4cZ+3FZjpfTL+hIZQ8Xm5
         5VnNlyPwALATC+yQdnpbckCrWHYiqUtfp//+4iVn6mhKLnTvZI2grjWoIB2GtwslED0m
         M+R7R7PaZq4F/BATw1YeRrnIDL379zDXWombGwFsC6ugMHFWY8UjRf50FvQ8X0Y8ycRl
         0LaQ==
X-Gm-Message-State: AOJu0YzIjsPKjxg4RfUv52YmLUhvX0VSWRmU4UxeHuvgEDCy3F3NmBgK
	a7Ef+Whymj+6424DmKyZ4Ihdm0lOrVh7o0YiCAKu5XtkGbZDN4ihiN4qp2JQQA==
X-Gm-Gg: Acq92OFy5mjF/c8cyyD0KuE3dlSw8hQNZF0SmDhGbtN2giyd6AagQCSZPckXAv+pX90
	1nrH7Zaqn167LDiwruhdyf/kb/nyaYJi3Z0Wj7u1nDMJknRUmbSKPbDUG8WMeS9MCWA84Z9PeKz
	QGDuoah8rLATdZPF7ThmcFtMTJ0mQlqY/+Ht9SJm7mWtXpJjHGK6+xZK/MH5upy+E6ql+tVeKZu
	VTfdQltG061SohcDJj/P5+KuW0Zgp1m9zuAWe1vVON8KBzoMwUrYUfjnB7M4qnhLIq6U/e6QJIB
	e/CJ28vySIPES8UVljGft7AlTVrrcnHi+LXC9e11PAo6mTfyi9rm0I3g/0b6Zvaf+eQ5a1Tep3h
	ounrqXy63VEUVZg/XDfEgz6J2h3b/yB6ZzzkebIDcNDRITc8RVNPIO+ZcHZkmpoTi2JlnV5TgU+
	03ToouuPZE5zJvtgSU0m9lCl6Dz+bEJg==
X-Received: by 2002:a05:6a20:2584:b0:39c:39d1:dbf4 with SMTP id adf61e73a8af0-3b328fb3ce5mr2478713637.46.1779432800152;
        Thu, 21 May 2026 23:53:20 -0700 (PDT)
Received: from L-12443L.kpit.com ([106.51.46.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fc6e8esm914957b3a.47.2026.05.21.23.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:53:19 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Bhabu Bindu <bhabu.bindu@kpit.com>,
	Sana Kazi <Sana.Kazi@bmwtechworks.in>
Subject: [poky][scarthgap][PATCH 2/2] libarchive: Ignore CVE-2026-5745
Date: Fri, 22 May 2026 12:20:23 +0530
Message-Id: <20260522065023.1084981-2-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522065023.1084981-1-bhabu.bindu@kpit.com>
References: <20260522065023.1084981-1-bhabu.bindu@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 06:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237526

Ignore CVE-2026-5745 as libarcihive maintainer rejected CVE-2026-5745.
This is reproducible only with UBSAN, using with
'-fsanitize=pointer-overflow -fsanitize-trap=pointer-overflow'.
The root cause remains a UBSAN violation, not a NULL pointer dereference

https://github.com/libarchive/libarchive/issues/2904#issuecomment-4257068822

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
 meta/recipes-extended/libarchive/libarchive_3.7.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 6b31256960..e402a485b3 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -80,4 +80,9 @@ ALTERNATIVE:bsdcpio = "cpio"
 ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
 ALTERNATIVE_TARGET[cpio] = "${bindir}/bsdcpio"
 
+python() {
+    if not bb.utils.filter('CFLAGS', '-fsanitize=pointer-overflow -fsanitize-trap=pointer-overflow', d):
+        d.setVarFlag("CVE_STATUS", "CVE-2026-5745", "not-applicable-config: sanitize is disabled")
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


