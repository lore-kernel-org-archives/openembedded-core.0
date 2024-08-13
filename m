Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BADC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 16:02:04 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.75908.1723564917619791024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 09:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kn2oFEHK;
 spf=pass (domain: konsulko.com, ip: 209.85.210.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-710e39961f4so2261544b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723564916; x=1724169716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jNXBqCVwOzqhaHTfrWieYeZ1dQIPvMTE/PUAlCj8/g=;
        b=kn2oFEHKMeyksBGl3d2nd8ozjbJoxGW/O2HYNX22IqdUO9oRgB9hvaciol4rcivYS/
         ze0idBKW0rc6X29Tpp4ZtX7BAhiT/F2bkQw8rhtA81T8ZRFncjqSA5H+fI9Iw9rRnng0
         ykBFkAVzcWezE17Eu+Dc156MX9PtHmW4p6jjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723564916; x=1724169716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jNXBqCVwOzqhaHTfrWieYeZ1dQIPvMTE/PUAlCj8/g=;
        b=T2kBEvyctk5mXX8wU1dsa59CzGM6z/9nlapUo21CrHNRO3lWYJIFlg6kcSwjn3Xats
         mNMqmlTsIIqLIucwyvbF0soXkgWdehvEOyBoqNlJflRI9qTyAWmzRiwFBwzLdp65IEDy
         ljU4eHZ2YqfYBDpS/Vd8fKSkgWBcfs56MXet89TZ/KybiYnh4UvZCMFTpXSOi0pjTV4L
         YwaDUu0j1nGhqSruAYF/fdtlqo03mS4GUrxPJGu+phtHXb0DDvB6XBsrDmwNoxaVrunS
         gedNS8OJjN6BFMwy8ZlSAalgVsz+rrM5s8lz0uPU4s3WFueEuxwIngTaw3903yMUq/Yz
         cziw==
X-Gm-Message-State: AOJu0YwCTS/EhTPdb6rrXLEDmrA4Y+H2UFD0qHoS925bihLWKWxcXZ4Y
	QuEZRLO+RIkgGM2048MBXR6Jr6P2yXt3duayJsV+gPAY+2gyAo0bu5J4f3XAG0ZNFd1JS2OHP6c
	8XCw=
X-Google-Smtp-Source: AGHT+IFX9zBt6gLqPcT6QbHxWSm2iwnTPaTsi4IC7nASxyKwe20VQx6mL9u2tsfJMWxnjpWUBI1hUQ==
X-Received: by 2002:a05:6a20:9f0a:b0:1c8:9749:a4c1 with SMTP id adf61e73a8af0-1c8eaf96890mr174556637.49.1723564916251;
        Tue, 13 Aug 2024 09:01:56 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a43769sm6033036b3a.97.2024.08.13.09.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:01:55 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-attrs: upgrade 23.2.0 -> 24.2.0
Date: Tue, 13 Aug 2024 09:01:44 -0700
Message-ID: <20240813160144.1366862-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 16:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203285

From: Tim Orling <tim.orling@konsulko.com>

* Drop 0001-test_funcs-skip-test_unknown-for-pytest-8.patch
  fixed upstream in https://github.com/python-attrs/attrs/pull/1249
* Drop 0001-conftest.py-disable-deadline.patch upstream wanted to try
  doubling the deadline time https://github.com/python-attrs/attrs/pull/1252
  from 200 ms default to 400 ms (we saw some times a bit greater than 200 ms)

https://www.attrs.org/en/stable/changelog.html

24.2.0 - 2024-08-06
  * Deprecations
    - Given the amount of warnings raised in the broader ecosystem, we’ve
	  decided to only soft-deprecate the hash argument to @define / @attr.s.
	  Please don’t use it in new code, but we don’t intend to remove it
	  anymore. #1330

  * Changes
    - attrs.converters.pipe() (and its syntactic sugar of passing a list
	  for attrs.field()’s / attr.ib()’s converter argument) works again when
	  passing attrs.setters.convert to on_setattr (which is default for
	  attrs.define). #1328
    - Restored support for PEP 649 / 749-implementing Pythons – currently
	  3.14-dev. #1329

24.1.0 - 2024-08-03
  * Backwards-incompatible Changes
    - attrs.evolve() doesn’t accept the inst argument as a keyword argument
	  anymore. Pass it as the first positional argument instead. #1264
    - attrs.validators.provides() has been removed. The removed code is
	  available as a gist for convenient copy and pasting. #1265
    - All packaging metadata except from __version__ and __version_info__
	  has been removed from the attr and attrs modules (for example,
	  attrs.__url__).
    - Please use importlib.metadata or importlib-metadata instead. #1268
    - The generated __eq__ methods have been sped up significantly by
	  generating a chain of attribute comparisons instead of constructing and
	  comparing tuples. This change arguably makes the behavior more correct,
	  but changes it if an attribute compares equal by identity but not value,
	  like float('nan'). #1310

  * Deprecations
    - The repr_ns argument to attr.s is now deprecated. It was a workaround
	  for nested classes in Python 2 and is pointless in Python 3. #1263
    - The hash argument to @attr.s, @attrs.define, and make_class() is now
	  deprecated in favor of unsafe_hash, as defined by PEP 681. #1323

  * Changes
    - Allow original slotted functools.cached_property classes to be cleaned
	  by garbage collection. Allow super() calls in slotted cached properties.
	  #1221
    - Our type stubs now use modern type notation and are organized such that
	  VS Code’s quick-fix prefers the attrs namespace. #1234
    - Preserve AttributeError raised by properties of slotted classes with
	  functools.cached_properties. #1253
    - It is now possible to wrap a converter into an attrs.Converter and get
	  the current instance and/or the current field definition passed into the
	  converter callable.
    - Note that this is not supported by any type checker, yet. #1267
    - attrs.make_class() now populates the __annotations__ dict of the
	  generated class, so that attrs.resolve_types() can resolve them. #1285
    - Added the attrs.validators.or_() validator. #1303
    - The combination of a __attrs_pre_init__ that takes arguments, a kw-only
	  field, and a default on that field does not crash anymore. #1319
    - attrs.validators.in_() now transforms certain unhashable options to
	  tuples to keep the field hashable.
    - This allows fields that use this validator to be used with, for example,
	  attrs.filters.include(). #1320
    - If a class has an inherited method called __attrs_init_subclass__, it
	  is now called once the class is done assembling.
    - This is a replacement for Python’s __init_subclass__ and useful for
	  registering classes, and similar. #1321

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../0001-conftest.py-disable-deadline.patch   | 45 -------------------
 ...funcs-skip-test_unknown-for-pytest-8.patch | 30 -------------
 ...ttrs_23.2.0.bb => python3-attrs_24.2.0.bb} |  4 +-
 3 files changed, 1 insertion(+), 78 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch
 delete mode 100644 meta/recipes-devtools/python/python3-attrs/0001-test_funcs-skip-test_unknown-for-pytest-8.patch
 rename meta/recipes-devtools/python/{python3-attrs_23.2.0.bb => python3-attrs_24.2.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch b/meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch
deleted file mode 100644
index b1e6d999168..00000000000
--- a/meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 41103f017f6a233ebb477dd1712fe82ea8f1c84c Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Thu, 29 Feb 2024 08:45:54 -0800
-Subject: [PATCH] conftest.py: disable deadline
-
-The deadline is by default 200ms, but this is intended to be useful to
-the developer and not necessarily recommended for heavily loaded CI
-systems. Avoid warnings by disabling the deadline completely.
-
-https://github.com/HypothesisWorks/hypothesis/issues/3713
-https://hypothesis.readthedocs.io/en/latest/settings.html#hypothesis.settings.deadline
-https://lists.openembedded.org/g/openembedded-core/topic/104640034#196437
-
-Fixes:
-"""
-Unreliable test timings! On an initial run, this test took 268.29ms,
-which exceeded the deadline of 200.00ms, but on a subsequent run it
-took 2.63 ms, which did not. If you expect this sort of variability in
-your test timings, consider turning deadlines off for this test by
-setting deadline=None.
-"""
-
-Upstream-Status: Submitted [https://github.com/python-attrs/attrs/pull/1252]
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- conftest.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/conftest.py b/conftest.py
-index 144e5f3..fdead3d 100644
---- a/conftest.py
-+++ b/conftest.py
-@@ -20,7 +20,7 @@ def _frozen(request):
- def pytest_configure(config):
-     # HealthCheck.too_slow causes more trouble than good -- especially in CIs.
-     settings.register_profile(
--        "patience", settings(suppress_health_check=[HealthCheck.too_slow])
-+        "patience", settings(suppress_health_check=[HealthCheck.too_slow], deadline=None)
-     )
-     settings.load_profile("patience")
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-attrs/0001-test_funcs-skip-test_unknown-for-pytest-8.patch b/meta/recipes-devtools/python/python3-attrs/0001-test_funcs-skip-test_unknown-for-pytest-8.patch
deleted file mode 100644
index bb69c0f1573..00000000000
--- a/meta/recipes-devtools/python/python3-attrs/0001-test_funcs-skip-test_unknown-for-pytest-8.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From cbe95e1aa6d95195dce13406a6f0522b2964babc Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Fri, 16 Feb 2024 07:17:19 -0800
-Subject: [PATCH] test_funcs: skip test_unknown for pytest 8
-
-https://github.com/python-attrs/attrs/issues/1233
-
-Upstream-Status: Inappropriate [Test case needs to be properly fixed upstream]
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- tests/test_funcs.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/test_funcs.py b/tests/test_funcs.py
-index 044aaab..0872c31 100644
---- a/tests/test_funcs.py
-+++ b/tests/test_funcs.py
-@@ -593,7 +593,7 @@ class TestAssoc:
-         for k, v in change_dict.items():
-             assert getattr(changed, k) == v
- 
--    @given(simple_classes())
-+    @pytest.mark.skip('Broken with pytest 8. See https://github.com/python-attrs/attrs/issues/1233')
-     def test_unknown(self, C):
-         """
-         Wanting to change an unknown attribute raises an
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb b/meta/recipes-devtools/python/python3-attrs_24.2.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-attrs_23.2.0.bb
rename to meta/recipes-devtools/python/python3-attrs_24.2.0.bb
index e39b64306c2..a6cb60a8c82 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_24.2.0.bb
@@ -3,13 +3,11 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30"
+SRC_URI[sha256sum] = "5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346"
 
 inherit pypi ptest python_hatchling
 
 SRC_URI += " \
-	file://0001-test_funcs-skip-test_unknown-for-pytest-8.patch \
-	file://0001-conftest.py-disable-deadline.patch \
 	file://run-ptest \
 "
 
-- 
2.46.0


