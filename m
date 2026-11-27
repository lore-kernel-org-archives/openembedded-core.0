Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6183.1795819797313005525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 14:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tJ/qTw5k;
 spf=pass (domain: konsulko.com, ip: 209.85.215.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb9f760337so4653664a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795819796; x=1796424596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/CfHftdqEgYPx5Mzn3r/lhdPvokIsg2I352gTWWiy0=;
        b=tJ/qTw5kN0ojIc0Xn3Pwih/0S2YsdEjaDO8wW+NLunSLY5qscyDkGgQQLKshp8Mrec
         2Qlehv+EgaMj1q4H6Q8dWfDQP122CWxLOdGIMIB//59AXmV6QSxss7014HuSFGLiAzVy
         QV5EPqe71Ie6Vc4gmZOJ3MviYGZrnbJGeuwfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795819796; x=1796424596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/CfHftdqEgYPx5Mzn3r/lhdPvokIsg2I352gTWWiy0=;
        b=rDvixFWhNbV6codVeLAd//So+Gle3LH2wSzhHeFTUAElwZ2wSyVbgG1EUyXDC7eXLM
         oaj9GYGQOEB5+9UFUeyjZcJgX6bPsCx4Fry4uryjDwaJnP1PlnOmTaHhTdkFqud+bNAF
         71DBmpma5mI4Syuen5M5TteWD1IQYsqFwNaulrmKRY2jkTeQHNY1P8Gsz7pUvv9ZPEmf
         5gzu/yF93P6yVDoIzIeRKBfbQ7CZ108keT1jZpuBjsu4lhW47wgGO5OulTjyuNNG1i7W
         9Ho4VjBL9m46AlY9kLquC3lzelIS4ZYqWp9ReJtpFzR43AIyzhPB7XJ4Yt+MBqB1G4c1
         OzVA==
X-Gm-Message-State: APuU4Z+m9RMYSdM5WnJXkR144Pu1VxVutfdvnyJoUzgta4JybnfL/9BA
	pdVI4v/8HkTzvV3kF5ER9zS4/AfpNi+AR/hSL4iDSSsO/32FDUuvkrBcc+nDmFJVgZ4V1D5Hr0B
	xXT01Y68=
X-Gm-Gg: AZFdTZczXMF9AXGo8mEylah3kliigjjasStud8pw5ZUypbhSx33y+bTTVFcJ7k+cnwJ
	48O4pp3uWoOsOnssQBRLMNg/f9/K9uUmhcBCn/EbRDV4PzC2e9Jw5Sd93P851SMOwvFHdMY2JiA
	3adO2jih+4/FEXvZaPjtAnlAmCG9peIkh8YmN5sgKOlGu5RwvJDrqY+EizP0FYS+9EIpdSy4ZcL
	bXj9l/EGvLdlU3KS4JJ4FKvQTsD4SaAfWwz2kXk/ApN7Hc07oT4+LDNhsht/J73wndejlMSRaWV
	6kWDIHvb7tX6uqJ3nrMadWK3yM0whoJ0lMp6f9W4pP1OVwRoJGtChXcg36tSBngIt8kDGeBq3iD
	WFEPAPYczXauepVpHNbzdrHs6xO5aZr9chxXilqis+aqVkzs6ehogv/Uu1vkq2tjTgtsMh1VXyl
	mwnI0B/teY5MG6tfKWbvU1t7hG4wq9haoIOAJMH2q7RyGu8SkNn7VnZthb0ddIShOjVEGHJy5XJ
	KY9NPMvJXM5r7GRH0Zy51pf73nEfRaLo7iw0VoXljbMTvI1laE4Q18QycUcjFJ6NZ7UTLgB7ggK
	JWlRfAm7PglWB7riuhr68T4vq0aTqifeEZ9V0R9sbRY/75yV1JMR9j/VMO6o88yoCuv14X3GSlC
	u16ZCckdhAQmoGv3L6w4ikXOfuZUKvK5IWgyrN73pbZ4vyzgjGctnLacG5U95lMwX3Uc=
X-Received: by 2002:a17:90b:2f8f:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b41c938926mr16761180a91.25.1795819796499;
        Fri, 27 Nov 2026 14:49:56 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b5210be133sm8724199a91.11.2026.11.27.14.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:49:56 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-babel: add ptest
Date: Fri, 27 Nov 2026 14:49:53 -0800
Message-ID: <20261127224953.51741-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 22:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251466
Content-Type: text/plain; charset="utf-8"

Run the upstream test suite with ptest-python-pytest.

tests/conftest.py imports freezegun, which is only in meta-python, so
patch the tests to skip just the ones that need it. Install the root
conftest.py and pyproject.toml for the pytest configuration, and link
babel/ to the installed package, since some tests read it from the
working directory.

All tests pass on qemux86-64 in about 10 seconds, so add it to
PTESTS_FAST.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../distro/include/ptest-packagelists.inc     |   1 +
 .../0002-tests-make-freezegun-optional.patch  | 129 ++++++++++++++++++
 .../python/python3-babel_2.19.0.bb            |  24 +++-
 3 files changed, 152 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-babel/0002-tests-make-freezegun-optional.patch

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 6c8ff85fd0..82152ec606 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -81,6 +81,7 @@ PTESTS_FAST = "\
     psmisc \
     python3-atomicwrites \
     python3-attrs \
+    python3-babel \
     python3-bcrypt \
     python3-calver \
     python3-certifi \
diff --git a/meta/recipes-devtools/python/python3-babel/0002-tests-make-freezegun-optional.patch b/meta/recipes-devtools/python/python3-babel/0002-tests-make-freezegun-optional.patch
new file mode 100644
index 0000000000..a48a1a66eb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-babel/0002-tests-make-freezegun-optional.patch
@@ -0,0 +1,129 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Fri, 27 Nov 2026 13:35:47 -0800
+Subject: [PATCH] tests: Make freezegun optional
+
+tests/conftest.py imports freezegun at module level, so the whole test
+suite fails at collection when freezegun is not installed, although
+only a few tests freeze the time.
+
+Import freezegun optionally and skip only the tests that need it, as is
+already done for pytz, jinja2 and setuptools: the frozen_time fixture,
+the frozen part of test_format_time, test_parse_date_two_digit_year,
+and the frontend merge and concat modules, whose autouse fixtures
+freeze the time for every test.
+
+This lets downstream builds run the test suite where freezegun is not
+packaged, such as the OpenEmbedded on-target tests.
+
+Upstream-Status: Submitted [https://github.com/python-babel/babel/pull/1509]
+AI-Generated: Uses Claude Code (Claude Opus 5.5)
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ tests/conftest.py                      | 8 +++++++-
+ tests/messages/frontend/test_concat.py | 3 ++-
+ tests/messages/frontend/test_merge.py  | 3 ++-
+ tests/test_dates.py                    | 9 ++++++++-
+ 4 files changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/tests/conftest.py b/tests/conftest.py
+index e1819ff..2146ef5 100644
+--- a/tests/conftest.py
++++ b/tests/conftest.py
+@@ -2,7 +2,11 @@ import datetime
+ import zoneinfo
+ 
+ import pytest
+-from freezegun import freeze_time
++
++try:
++    from freezegun import freeze_time
++except ModuleNotFoundError:
++    freeze_time = None
+ 
+ try:
+     import pytz
+@@ -39,5 +43,7 @@ FROZEN_DATETIME = datetime.datetime(1994, 11, 11, 00, 00)
+ 
+ @pytest.fixture
+ def frozen_time() -> datetime.datetime:
++    if freeze_time is None:
++        pytest.skip("freezegun is not installed")
+     with freeze_time(FROZEN_DATETIME) as frozen:
+         yield frozen.time_to_freeze
+diff --git a/tests/messages/frontend/test_concat.py b/tests/messages/frontend/test_concat.py
+index e55fbc1..4673629 100644
+--- a/tests/messages/frontend/test_concat.py
++++ b/tests/messages/frontend/test_concat.py
+@@ -17,13 +17,14 @@ import pathlib
+ import sys
+ 
+ import pytest
+-from freezegun import freeze_time
+ 
+ from babel.messages import Catalog, frontend, pofile
+ from babel.messages.frontend import OptionError
+ from tests.messages.consts import TEST_PROJECT_DISTRIBUTION_DATA
+ from tests.messages.utils import Distribution, run_command, write_po_file
+ 
++freeze_time = pytest.importorskip("freezegun").freeze_time
++
+ 
+ @pytest.fixture(autouse=True)
+ def frozen_time():
+diff --git a/tests/messages/frontend/test_merge.py b/tests/messages/frontend/test_merge.py
+index 61c98f1..dc490b5 100644
+--- a/tests/messages/frontend/test_merge.py
++++ b/tests/messages/frontend/test_merge.py
+@@ -17,13 +17,14 @@ import shutil
+ import sys
+ 
+ import pytest
+-from freezegun import freeze_time
+ 
+ from babel.messages import Catalog, frontend, pofile
+ from babel.messages.frontend import OptionError
+ from tests.messages.consts import TEST_PROJECT_DISTRIBUTION_DATA
+ from tests.messages.utils import Distribution, run_command, write_po_file
+ 
++freeze_time = pytest.importorskip("freezegun").freeze_time
++
+ 
+ @pytest.fixture(autouse=True)
+ def frozen_time():
+diff --git a/tests/test_dates.py b/tests/test_dates.py
+index d9813b8..60435b4 100644
+--- a/tests/test_dates.py
++++ b/tests/test_dates.py
+@@ -13,9 +13,13 @@
+ import calendar
+ from datetime import date, datetime, time, timedelta
+ 
+-import freezegun
+ import pytest
+ 
++try:
++    import freezegun
++except ModuleNotFoundError:
++    freezegun = None
++
+ from babel import Locale, dates
+ from babel.dates import NO_INHERITANCE_MARKER, UTC, _localize, parse_pattern
+ from babel.util import FixedOffsetTimezone
+@@ -663,6 +667,8 @@ def test_format_time(timezone_getter):
+     custom = dates.format_time(t, "hh 'o''clock' a, zzzz", tzinfo=eastern, locale='en')
+     assert custom == "09 o'clock AM, Eastern Daylight Time"
+ 
++    if freezegun is None:
++        pytest.skip("freezegun is not installed")
+     with freezegun.freeze_time("2023-01-01"):
+         t = time(15, 30)
+         paris = dates.format_time(t, format='full', tzinfo=paris, locale='fr_FR')
+@@ -730,6 +736,7 @@ def test_parse_date():
+     ('2090-06-01', '10', 2110),
+     ('2090-06-01', '11', 2011),
+ ])
++@pytest.mark.skipif(freezegun is None, reason="freezegun is not installed")
+ def test_parse_date_two_digit_year(today, yy, expected):
+     with freezegun.freeze_time(today):
+         assert dates.parse_date(f'1/1/{yy}', locale='en_US').year == expected
diff --git a/meta/recipes-devtools/python/python3-babel_2.19.0.bb b/meta/recipes-devtools/python/python3-babel_2.19.0.bb
index 008c1e1729..0fa2d81fd3 100644
--- a/meta/recipes-devtools/python/python3-babel_2.19.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.19.0.bb
@@ -10,9 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a2b86daab39fdb8ce59d97e9fecc90ee"
 
 SRC_URI[sha256sum] = "fddd2cbbbac7c299af3c2880be23609c331bd94f0912baca6cb0abfe054dfc27"
 
-SRC_URI += "file://0001-Fix-required-hatchling-version-1490.patch"
+SRC_URI += "file://0001-Fix-required-hatchling-version-1490.patch \
+            file://0002-tests-make-freezegun-optional.patch \
+            "
 
-inherit pypi python_hatchling
+inherit pypi python_hatchling ptest-python-pytest
 
 CVE_PRODUCT = "pocoo:babel"
 
@@ -29,4 +31,22 @@ RDEPENDS:${PN} += "\
     python3-zoneinfo \
 "
 
+# The benchmarks are not collected by pytest and need a benchmark plugin.
+# pyproject.toml has the pytest configuration (markers, warning filters),
+# conftest.py keeps pytest out of tests/messages/data and collects the
+# doctests. Some tests read babel/ from the source tree, so link it to the
+# installed package.
+do_install_ptest:append() {
+    rm -rf ${D}${PTEST_PATH}/tests/benchmarks
+    install -m 0644 ${S}/pyproject.toml ${S}/conftest.py ${D}${PTEST_PATH}/
+    ln -sr ${D}${PYTHON_SITEPACKAGES_DIR}/babel ${D}${PTEST_PATH}/babel
+}
+
+# freezegun (meta-python) is optional: the tests that need it are skipped.
+RDEPENDS:${PN}-ptest += "\
+    python3-jinja2 \
+    python3-setuptools \
+    tzdata \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.56.1

