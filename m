Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4324.1794732551041578320
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FDs8/ms+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1631999f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732549; x=1795337349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NYzKplmDQ7p03h+oA8+B/qv5QS0AOejn6iNUKy2oB+M=;
        b=FDs8/ms+O+p6HCbP63btmL6fKNT6+jitI9UFqB43SceZ2sjFqypKByTiq9cwapQs2I
         5n5zuu5nXiOVWri1xqTTkuB6kiySqKNXT6guZbsRBbvgawbyxeImF5DxjdEESJAQAO8M
         mWsGdQlZI5Bt/hEEB02BKnN0XuyEFmLMuDxbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732549; x=1795337349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NYzKplmDQ7p03h+oA8+B/qv5QS0AOejn6iNUKy2oB+M=;
        b=EDXaZB7OibCbInKdkgundajK4b1c8M50uG3rZtnOjYLKHFEDNN9laHgUJGHiRzkodj
         xPxPhidzZaJoCYjUcsbyieGyRg93giNG5OTb0mwFLuqcSTkd9yea96zhQTeVOSrHJeqP
         AY3Tf5dhLBbN1i3zW3yHAjA7ClSPNSFZuP1kuNGZBXjFhx6XWIlBOLQukRsUwVseubPX
         BIwMmTgD4DfgWOXvGAxTPrBkL2jWQ2CM5WJ+bRRtiNQdkq+kstaVLjOHEKGfynKPg6Ki
         KN8aMtuVh7I0TqMdpRrTXwjVHEZkmc0v3hm3XrqIkIb7xyo5TfwzIHUT8AvTr6Zomoo1
         Cdug==
X-Gm-Message-State: APuU4Z/EhVSUwRSzfqiaXbHSCad4wdtQniwMNa54wRXqR6XjK3pMXbnR
	OYGYGwpzuRiy3kTFuLwM0+GuJP9fUH15aEm08NLvYcHL8mVj7LmeE30fomfngrTNdUaf+zmyCXT
	YPLXOYTE=
X-Gm-Gg: AYBFou1TUs+MoilnrOkSTlfiCXTqpk2kzX0XBnCQUpvopjtZSfGwRPnlSSnQ8TSwKJl
	XQsxWf1QT8EuKuKCgLhDdjBtKtvhVNYfw4Q634yGR+GGMn08VhYdNksBlfOsEs86lBbgvOcSN0e
	IG9PzrUC/LAuc7oO4FlJYcjzKcMDguq+nuwAnY9JwKF5ReRx6eJ6gKWmFp1qNN1F5P1qo3x93JX
	MaAkFi5mcuu9VjmmbagXw20Zynfy/yUlK/3TiRiQiTc6gUvzQ+xvwVCkYJlI8eExzpVSB/IPt3L
	EQ6hB6slmQc3fFIQPihrsYZiAngu9YVwwvxlzQFe6Y/+4YKuHH68jb2FUEQzTiW/kaDmD5UpaXm
	wZAjusjS/3+Qf/JfvaAT4nPq1Y9UZEQd9jVi7Cqm3wGzdhPi8IGWGV0hsUGkMH2Lrp/l6WJtSgw
	YYvYUU6VHkbj1dW1GSIeiSQDIiwDe0E/56lgNUJV7ZGQypD84W2FAOiro+yu1aWReGbaiTmMRXH
	4KWQO8vEI8T3BJvR+nTqJLeDp042NvSaS6hVu+e1YeMq2HQDN6wQq31/HL8e1V1flWjoaqy60pa
	I1BBYXvo2eT3rJ1WbLQtnw1Ni4L1f1XIareLuFNJ50OG9FqoZ+HFgHoBBw==
X-Received: by 2002:a05:6000:2f82:b0:48e:3df8:74cb with SMTP id ffacd0b85a97d-49c6d4539edmr16236196f8f.6.1794732549278;
        Sun, 15 Nov 2026 00:49:09 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/41] oeqa: Use bare raise to re-raise exceptions
Date: Sun, 15 Nov 2026 08:48:16 +0000
Message-ID: <20261115084845.701136-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250244
Content-Type: text/plain; charset="utf-8"

A bare raise re-raises the current exception without needing to name it.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py    | 2 +-
 meta/lib/oeqa/selftest/cases/manifest.py   | 2 +-
 meta/lib/oeqa/selftest/cases/recipetool.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c748c8504bb..3400f90a906 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2591,7 +2591,7 @@ class DevtoolUpgradeTests(DevtoolBase):
                     if e.errno == errno.EROFS:
                         return False
                     else:
-                        raise e
+                        raise
                 if p == "lib":
                     # Can race with other tests
                     self.add_command_to_tearDown('rmdir --ignore-fail-on-non-empty %s' % dstdir)
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 08b0ceca05b..73d262bb43b 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -34,7 +34,7 @@ class VerifyManifest(OESelftestTestCase):
         except OSError as e:
             self.logger.debug("{}: checking of {} failed"\
                     .format(self.classname, manifest))
-            raise e
+            raise
 
         return manifest_errors
 
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index e2365141ac5..a7c7ed7ddbc 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -878,7 +878,7 @@ class RecipetoolTests(RecipetoolBase):
                     if e.errno == errno.EROFS:
                         return False
                     else:
-                        raise e
+                        raise
                 if p == "lib":
                     # Can race with other tests
                     self.add_command_to_tearDown('rmdir --ignore-fail-on-non-empty %s' % dstdir)
