Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E091BE9A05A
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1416.1771440097377364361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Jy8oQ9rk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rFjlLtTE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c720edbdf-8b775dee-95ce-4959-b25d-0036f159e806-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440102;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tX6IoAUQq4NRR0OEOtbxGdIIFDcI/gNiPBhuU/Bn0AI=;
	b=Jy8oQ9rkj7dqx5bU0vu4ZkoYnLtaZNw+TMUM2PrLOUHyZ1MaYuqTj8fR34NIdvrD
	1IL2gNWBzloKH4wvIvCWA0QXnnVToLmmMfIk33lBE0n2c4Kxb7etDQkWjh44/7nkH06
	KZeZ5asAe9e9NG/YWeL+vzVjL6+KVpnp4LmvZmHc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440102;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tX6IoAUQq4NRR0OEOtbxGdIIFDcI/gNiPBhuU/Bn0AI=;
	b=rFjlLtTEUQMDmwHdDADvQWaV0osW0j5rrh27xE41pwjIlfiG7jbEIqzYjYHuRTBx
	BP/ELzMqG4v28DJ07/zg5B6NOoyhIKgIJctkIiobCSbe7vlo8LGFADUgwl9ql/d60jq
	GDpQ1SyjboisXTZMZRGhts5oykaoIqXYtLLFFHpg=
Content-Type: multipart/mixed; boundary="===============7872103682707823446=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 26.0.1 SUCCEEDED
Message-ID: <0101019c720edbdf-8b775dee-95ce-4959-b25d-0036f159e806-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231354

--===============7872103682707823446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *26.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-26.0-26.0.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 1c3a56c59012f1ecbef4d065c43985f52edae977 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 13:34:25 +0000
Subject: [PATCH] python3-pip: upgrade 26.0 -> 26.0.1

---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_26.0.bb => python3-pip_26.0.1.bb}       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.0.bb => python3-pip_26.0.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index c71b46bca4..b057852b7e 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 48fa8ab5e68b0e349d988ea45bb6a8e2f9bf8fd3 Mon Sep 17 00:00:00 2001
+From 60093e823780d9a3483844cc3faaed18dc1c351b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_26.0.bb b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_26.0.bb
rename to meta/recipes-devtools/python/python3-pip_26.0.1.bb
index 0a284a1f6b..af0084c43a 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "3ce220a0a17915972fbf1ab451baae1521c4539e778b28127efa79b974aff0fa"
+SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.47.1


--===============7872103682707823446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/dependency_groups -> /usr/lib/python3.
 14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.0
 .1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pi
 p-26.0.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packa
 ges/pip-26.0.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/AUTHORS.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3 was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/AUTHORS.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/cachecontrol was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/certifi was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/dependency_groups was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/dependency_groups/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distlib was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distro was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distro/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/idna was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/msgpack was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/platformdirs was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pygments was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pyproject_hooks was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/requests was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/requests/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/resolvelib was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/rich was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/rich/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli_w was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/truststore was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/urllib3 was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/WHEEL was removed

--===============7872103682707823446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pip: PV changed from "26.0" to "26.0.1"
packages/x86-64-v3-poky-linux/python3-pip: PKGV changed from 26.0 [default] to 26.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-26.0.tar.gz;downloadfilename=pip-26.0.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-26.0.1.tar.gz;downloadfilename=pip-26.0.1.tar.gz file://no_shebang_mangling.patch"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PV changed from "26.0" to "26.0.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 26.0 [default] to 26.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PV changed from "26.0" to "26.0.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 26.0 [default] to 26.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PV changed from "26.0" to "26.0.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 26.0 [default] to 26.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PV changed from "26.0" to "26.0.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 26.0 [default] to 26.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PV changed from "26.0" to "26.0.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PKGV changed from 26.0 [default] to 26.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "26.0" to "26.0.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 26.0 [default] to 26.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PV changed from "26.0" to "26.0.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/
 _vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygment
 s, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_ve
 ndor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/dependency_groups -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.dist-info -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info, directory renamed /usr/lib/python3.14/site-p
 ackages/pip-26.0.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGV changed from 26.0 [default] to 26.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 11080603 to 11080889 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/AUTHORS.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3 was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/AUTHORS.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/cachecontrol was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/certifi was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/dependency_groups was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/dependency_groups/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distlib was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distro was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distro/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/idna was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/msgpack was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/platformdirs was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pygments was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pyproject_hooks was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/requests was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/requests/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/resolvelib was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/rich was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/rich/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli_w was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/truststore was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/urllib3 was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pip-26.0.dist-info/WHEEL was removed

--===============7872103682707823446==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-26.0-26.0.1.patch"

RnJvbSAxYzNhNTZjNTkwMTJmMWVjYmVmNGQwNjVjNDM5ODVmNTJlZGFlOTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6MzQ6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBpcDogdXBncmFkZSAyNi4wIC0+IDI2LjAuMQoKLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2ggICAgICAgICAgICAgICAgfCAyICstCiAu
Li4vcHl0aG9uL3tweXRob24zLXBpcF8yNi4wLmJiID0+IHB5dGhvbjMtcGlwXzI2LjAuMS5iYn0g
ICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBpcF8y
Ni4wLmJiID0+IHB5dGhvbjMtcGlwXzI2LjAuMS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJh
bmdfbWFuZ2xpbmcucGF0Y2gKaW5kZXggYzcxYjQ2YmNhNC4uYjA1Nzg1MmI3ZSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9ub19zaGViYW5nX21h
bmdsaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
aXAvbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDhmYThh
YjVlNjhiMGUzNDlkOTg4ZWE0NWJiNmE4ZTJmOWJmOGZkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNjAwOTNlODIzNzgwZDlhMzQ4Mzg0NGNjM2ZhYWVkMThkYzFjMzUxYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCAyMyBGZWIgMjAyMiAxMjoyNzowNiArMDAw
MAogU3ViamVjdDogW1BBVENIXSBweXRob24zLXBpcDogRG9uJ3QgY2hhbmdlIHNoZWJhbmcKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMC4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1waXBfMjYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXBpcF8yNi4wLjEuYmIKaW5kZXggMGEyODRhMWY2Yi4uYWYwMDg0YzQzYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNi4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMC4x
LmJiCkBAIC0yNiw3ICsyNiw3IEBAIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWls
ZF9tZXRhCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2NlMjIwYTBhMTc5MTU5NzJmYmYxYWI0NTFiYWFlMTUy
MWM0NTM5ZTc3OGIyODEyN2VmYTc5Yjk3NGFmZjBmYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJj
NDAzN2Q4YTI3N2M4OWIzMjBhYmU2MzZkNTlmOTFlNmQwOTIyZDA4YTA1YjYwZTg1ZTUzYjI5NjYx
MzM0NmQ4IgogCiBSREVQRU5EUzoke1BOfSA9ICJcCiAgIHB5dGhvbjMtY29tcGlsZSBcCi0tIAoy
LjQ3LjEKCg==

--===============7872103682707823446==--

