Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1018.1607474169067711400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 16:36:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cnSveQcb;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id t7so296889pfh.7
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 16:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U39akEI1Ogo9bLo1L3qLosd/bhk26QH+7co+vLqjPJU=;
        b=cnSveQcbRHRjoFh6h6jZ5+6MoZKEUe1tgwU3qnu+I7QAxSWDZUulAnKOJ/7+jQYwRX
         vvQUlLBEt1KqHxQuOFKbHyR5Z+MQTLo4Nqpdh7/y5yTmN1u78CghyP7RZ2ES+dk3Cl7t
         3pb+UDzLO+s0D6DSfQxKoLq04WlAH7QwfHBnEtb+O3wtmArJjjNhBhbdxsknKIV8coHG
         6XV2xgoE68Ui/Zs758/Rov+gDWyPLs28AN+YyrK4q7OiTEqRrypJ5S021xuNVXIZuua3
         rzcbOarmjEJBZfUSrRntrGMDlWSw3iRckOLfI4SDigEkmgN2SdXuymj7PVzb8D8Z9Oe1
         ejVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U39akEI1Ogo9bLo1L3qLosd/bhk26QH+7co+vLqjPJU=;
        b=g/BTUhd8DnrqjojhvlH8KVQxcr281jYNhEJMRj/+0bCswK6ihIYLafXBE+pu0VTbPr
         Jt/0sqJRkdYQEafQaHCh2V0SFlj8U2dBQ9v8HEJNTUnn5MsR8jBkPwjHFqZc+WGR3Xd9
         GiPMMc3LE23crFfBbpvEv4kooyAHUdhy/zKPVXZqUH75W6Ky7wOS+7GnYG/dUIG620Zo
         SWS51tLxkXzgbI/do/Im47Mg08LY6gcQi1+ei7jbvKOXoG4A5JeZhPXtnX8+sFI1+DcE
         NmyacffMFqzJJtyM2e+L93CCnTSmJt6iYLXOzmlsx5jO3qfuMEt+ErVL0zRydU6hUlOq
         16SA==
X-Gm-Message-State: AOAM530QDuF7k33O0hEri4+KCc83iXdbN4m4ricYWvYWTFKdmjdVemLU
	hy3shQizCxEUqzRRbQpLgvRjLwJQ7ojjug==
X-Google-Smtp-Source: ABdhPJz+vOiFwkyOj35egq6WiaF08KfQIhY6m7RMNccsw8S2y7kfj0XOVojBeZNp86oY2hewbusIxA==
X-Received: by 2002:a17:90a:a595:: with SMTP id b21mr118267pjq.206.1607474168445;
        Tue, 08 Dec 2020 16:36:08 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:183:c5f6:e3c0:185c])
        by smtp.gmail.com with ESMTPSA id v1sm58181pjs.16.2020.12.08.16.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 16:36:07 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 4/5] python3-setuptools: upgrade 50.3.2 -> 51.0.0
Date: Tue,  8 Dec 2020 16:35:46 -0800
Message-Id: <015023483b7025a95ed395899f620fc7fceff72c.1607473952.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
References: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

No upstream release notes.

Upstream commits since 50.3.2:

b6bbe236 Bump version: 50.3.2 → 51.0.0
7f477c52 Merge pull request #2472 from pypa/bugfix/2471-remove-deps
2a0463cb Update changelog.
99bc2c11 Remove tests guaranteeing that (vendored) dependencies can be installed without setuptools.
65441834 Remove conditional skip, no longer relevant.
9365c7ed Merge pull request #2468 from wimglenn/patch-1
43b0b81e Merge pull request #2461 from webknjaz/testing/gha-fix-set-env-usage
43f76003 Merge pull request #2460 from HaraldKorneliussen/master
2065f85d Merge pull request #2444 from zegor/patch-1
e9617599 Merge pull request #2439 from mgedmin/patch-1
475fb309 Update docs/pkg_resources.rst
b4de397a fix broken link to entry-points details
4a4d50af Fix all deprecated set-env and add-path uses @ GHA
b20d12e1 Fixes syntax issues in quickstart (#2448)
5cf3865f Merge pull request #2457 from webknjaz/testing/gha-broken-setup-python
de48cfdb Temporarily allow `set-env` GHA commands
ec944a40 Upgrade GHA actions using deprecated env mechanism
d7170a28 Update quickstart.rst
0e1fc1c6 s/517/PEP 517/
544687c3 Merge pull request #2437 from pypa/feature/rtd-2
3ca9e461 Merge pull request #2436 from webknjaz/maintenance/changelog-reconstruction
8ad16115 Merge pull request #2435 from pypa/debt/drop-py35
6597dcb6 Switch to RTD v2 config
7cf674e1 Reconstruct changelog with categories from history
97ee6624 Remove Python 3.5 from Appveyor tests
3dd7313d Bump PPC runs
d490709b Merge pull request #2431 from webknjaz/bugfixes/pr-template-docs-links
66ca4205 Use 'virtualenv.python'. Fixes #2434.
419087c4 Merge branch 'master' into debt/drop-py35
38de858e Update changelog
6d33d5dd 📝 Update devguide links in the PR template
898ae046 Merge pull request #2430 from webknjaz/bugfixes/sphinx-failures
a94c2c3d 📝 Add change notes
e711cb07 🐛📝 Fix "Title level inconsistent" in changelog
9ab7bc54 Clean up syntax on entry_points.console_scripts. Fixes #2429.
2ff24f67 🐛📝 Fix the TOC link to the relocated dev guide
a5dbf964 Drop support for Python 3.5.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...ython3-setuptools_50.3.2.bb => python3-setuptools_51.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_50.3.2.bb => python3-setuptools_51.0.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_50.3.2.bb b/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_50.3.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
index 4480d56775b..6ee935f8f79 100644
--- a/meta/recipes-devtools/python/python3-setuptools_50.3.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
@@ -12,7 +12,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "ed0519d27a243843b05d82a5e9d01b0b083d9934eaa3d02779a23da18077bd3c"
+SRC_URI[sha256sum] = "029c49fd713e9230f6a41c0298e6e1f5839f2cde7104c0ad5e053a37777e7688"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.0

