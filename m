Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31768C5DF9D
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 07:49:30 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10729.1787471361870356489
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 00:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pr25ISnW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so15564845e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 00:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787471360; x=1788076160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=phOt0J+dxRMqkr6RaAjxcPD+njhlxolSQirgMvmrTfE=;
        b=Pr25ISnW+0UXPnWV28QD2j9MqZ3TOVGbeXS/WjUfyoydnFcRlchLnXMolPwcH87Zl3
         PbqPgEzCc+pb0QpT7U4qFfwSKqulgdBjMA78mSeQ37JRTa8wsr+3BrB9qSWrAJhFLxr8
         yEYWQgsZmzChILqXq2lryaaHmxcHPWBAfiSRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787471360; x=1788076160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=phOt0J+dxRMqkr6RaAjxcPD+njhlxolSQirgMvmrTfE=;
        b=BriUksmv3o/u0G3gs9gongiXiMyAJ9mX3BVREOGLm8TxxvEkeXwHqA+BDNjYiwY+r/
         52n3a70hWkFbQMAcSQAxI+jO6e+QGJQ2yiMhNEnDgwuxyRF4aGAwvLW4hDdzLoHc0kwo
         ynHQDD7EQdPKCyLMkC/ivhpePxAjcsLatITi+Jcv7vMgnzXPyKP72U/Ma2g4t0hza89j
         TwPBT5+MZ2Spn05avaVuq03WlJkPSa3rkZPOSaY7Pu4QTtuayus7Ga9umuhjbEyRDCxw
         k13byy/Ub0Xc7ZeRhcvZ7VAN8EpQ8PcSvwcyA0X/+wUCA7NL3w3tHuN27Cb9kxEnzDcj
         8Haw==
X-Gm-Message-State: AFuF++lRovHdscwmQLpZd9RT2tQapKxvIbvN0e0pJ8DAc0kwOTtFzSfv
	CqKN3G4DGxPWdkQLzVR84Kjj6Hz+IdjdFRqTa3b45U5zBQyfG0jW5rbK+cr2K+ivsgFEQVuJyKF
	+s4qrvx8=
X-Gm-Gg: AR+sD11CVncLv9+6mqXf7d9IK/sLxtrlFf6ItiR8+Q+giXyyfiTJel+v9fQ6G+K5nyj
	Mvu/XQc8ehIyfldjmwnyoWiVs2mGwXA5ZLxKY8stjl430vKcdK0qi3lBRRi18ENpGwBJT9eMuhj
	jbzHkJltAqNwkvxbTrKfsOr/jt/gz1dmB00N2DHUKgrXs/gKyzfFnH+BWTbCpwqD7eV5aERNeqm
	8NJyG/PClC+t8qKrEhzJyH+Vduvb414HeHC9oSsgtuWuFgJUqp9aL3/LSyWw0kVmuz8ZRjdETW4
	2COZ8DiGtnryiRrpAHVdBY7IUZoY/tjqXKZJQLrDFRwx6qdXsU8g4nj96V+nHoPwuGEF9G3qALM
	rDtRLst27KVhYd6nSpxIpSzy1E5YtnIGKduTjXzBVLQP2Rx7ky8qweF6JJzXULvELi9PBy0K9DI
	KXiPuz1Xndobp+3mgsNSfIvdS82YOn9S/bqXQllEuF5oE/9Num5TQ1fb4YYCIxj4KlWjrhtnoju
	J1xPg6m2kCzwJZ5yw==
X-Received: by 2002:a05:600c:c113:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-499bf0e9606mr121393715e9.1.1787471359790;
        Sun, 23 Aug 2026 00:49:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfcc31sm4279602f8f.17.2026.08.23.00.49.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:49:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] python3-idna: upgrade 3.18 -> 3.19
Date: Sun, 23 Aug 2026 08:49:06 +0100
Message-ID: <20260823074911.1711858-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
References: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 07:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244013

Add hypothesis dependency for ptests

- Restore the `std3_rules` option, which had no effect since changes
  to UTS #46 processing in Unicode 16. Note that `uts46_remap()`
  defaults to enabling STD3 rules, so direct callers will see input
  containing non-LDH ASCII characters rejected again.
- Performance improvements to UTS #46 mapping, particularly for
  ASCII-only domains.
- Test on free-threaded CPython with the GIL disabled and document
  thread safety.
- Expose the Unicode version of the generated tables as
  `idna.unicode_version`, and show it in `idna --version`.
- Add `code`, `text`, `codepoint` and `position` attributes to
  `IDNAError` so that the failed rule and the offending character can
  be identified without parsing the exception message.
- The deprecated `transitional` argument to `encode()` and
  `uts46_remap()` is now completely ignored, and gives a deprecation warning
  for the latter.
- Reject A-labels that are not the canonical Punycode encoding of
  their U-label.
- Fix CONTEXTJ violations raising `IDNAError` instead of
  `InvalidCodepointContext`.
- Consistently raise `IDNAError` for empty labels and non-ASCII bytes
  passed to label helper functions and the incremental codec.
- Add property-based tests, extended fuzzing targets, coverage
  measurement, and CI checks that the data tables match the generator
  output.
- Various code quality and tooling improvements.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-idna_3.18.bb => python3-idna_3.19.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-idna_3.18.bb => python3-idna_3.19.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.18.bb b/meta/recipes-devtools/python/python3-idna_3.19.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-idna_3.18.bb
rename to meta/recipes-devtools/python/python3-idna_3.19.bb
index 70405819e7a..6f197e808db 100644
--- a/meta/recipes-devtools/python/python3-idna_3.18.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.19.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause AND Python-2.0 AND Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
-SRC_URI[sha256sum] = "ffb385a7e039654cef1ab9ef32c6fafe283c0c0467bba1d9029738ce4a14a848"
+SRC_URI[sha256sum] = "5e0811a4383b21dc5838069f801c4fb62113b7447663d2530d2bd6e77b49bf15"
 
 inherit pypi python_flit_core ptest-python-pytest
 
 RDEPENDS:${PN} += "python3-codecs"
-RDEPENDS:${PN}-ptest += "python3-unittest-automake-output"
+RDEPENDS:${PN}-ptest += "python3-unittest-automake-output python3-hypothesis"
 
 CVE_PRODUCT = "kjd:idna kjd:internationalized_domain_names_in_applications"
 

