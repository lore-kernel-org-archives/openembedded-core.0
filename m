Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB329C742A7
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.10150.1676508396814006896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=f0RSwojq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018657affa72-750c87aa-b9e0-4ac8-bba8-49e9cd2ecf46-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nwPFV9BnDe2iDK5XphyFExxAGbl6q296oxqQJuLsdm8=;
	b=f0RSwojqlcvgseWhM3lB/AB3JEyT5NJUvcCKDk+NgpL9RAmWeYU5eIezRaRISOpm
	BtcnasXSXp8SZIGYNBCXzxkzc4ZGp/6yZT5vIGYmmmuAv+zJmgA4g6MrDIt8iN3GxP/
	hGn7px+Xs/f+68hsJTni2brFdTFMUfGEgBZPCSBI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nwPFV9BnDe2iDK5XphyFExxAGbl6q296oxqQJuLsdm8=;
	b=H4fJl/LLX+0wLIfKgMTz39+oTUpUkw0tjy03qbRPA4IwT6KOPAjp3UPbmYPcB5jI
	+ijqftuQzUJygob6pk+EbqsX5QlKJrP2QeZeLOOPyfw/iyBNRCuhuO+NMWRROEUedIk
	9RTHwaOk481P0042scBim0VFOEOLQdR+ppEwe0Lg=
Content-Type: multipart/mixed; boundary="===============1302660308907677932=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.2.1 SUCCEEDED
Message-ID: <0101018657affa72-750c87aa-b9e0-4ac8-bba8-49e9cd2ecf46-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177241

--===============1302660308907677932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ruby* to *3.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-3.2.0-3.2.1.patch
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
--===============1302660308907677932==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.2.0-3.2.1.patch"

RnJvbSAyMmE2MzEzODI5YmI3NDRhZmEzYzVkNjZhZjNhM2MwZDNjYmJjMDFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTc6MTM6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDMuMi4wIC0+IDMuMi4xCgotLS0KIC4uLi9ydWJ5L3tydWJ5XzMuMi4wLmJi
ID0+IHJ1YnlfMy4yLjEuYmJ9ICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzMuMi4wLmJiID0+IHJ1YnlfMy4yLjEuYmJ9ICg4NCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjIuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy4yLjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjIuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjIuMS5iYgppbmRl
eCAwZTEzMzZmNWIwLi42MGU0NGI2NWRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5XzMuMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnlfMy4yLjEuYmIKQEAgLTEsMyArMSwzOCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExFR0FM
CisjICsrKyBMRUdBTAorIyBAQCAtOTc5LDEyICs5NzksMjAgQEAKKyMgICAgICB7TUlUIExpY2Vu
c2V9W3Jkb2MtbGFiZWw6bGFiZWwtTUlUK0xpY2Vuc2VdCisjICAKKyMgIFtsaWIvcnVieWdlbXMv
cmVzb2x2ZXIvbW9saW5pbGxvXQorIyAtW2xpYi9idW5kbGVyL3ZlbmRvci9tb2xpbmlsbG9dCisj
ICAKKyMgICAgbW9saW5pbGxvIGlzIHVuZGVyIHRoZSBmb2xsb3dpbmcgbGljZW5zZS4KKyMgIAor
IyAgICA+Pj4KKyMgICAgICBDb3B5cmlnaHQgKGMpIDIwMTQgU2FtdWVsIEUuIEdpZGRpbnMgc2Vn
aWRkaW5zQHNlZ2lkZGlucy5tZQorIyArCisjICsgICAge01JVCBMaWNlbnNlfVtyZG9jLWxhYmVs
OmxhYmVsLU1JVCtMaWNlbnNlXQorIyArCisjICtbbGliL2J1bmRsZXIvdmVuZG9yL3B1Yl9ncnVi
XQorIyArCisjICsgIHB1Yl9ncnViIGlzIHVuZGVyIHRoZSBmb2xsb3dpbmcgbGljZW5zZS4KKyMg
KworIyArICA+Pj4KKyMgKyAgICBDb3B5cmlnaHQgKGMpIDIwMTggSm9obiBIYXd0aG9ybgorIyAg
CisjICAgICAge01JVCBMaWNlbnNlfVtyZG9jLWxhYmVsOmxhYmVsLU1JVCtMaWNlbnNlXQorIyAg
CisjIAorIworCiBTVU1NQVJZID0gIkFuIGludGVycHJldGVyIG9mIG9iamVjdC1vcmllbnRlZCBz
Y3JpcHRpbmcgbGFuZ3VhZ2UiCiBERVNDUklQVElPTiA9ICJSdWJ5IGlzIGFuIGludGVycHJldGVk
IHNjcmlwdGluZyBsYW5ndWFnZSBmb3IgcXVpY2sgXAogYW5kIGVhc3kgb2JqZWN0LW9yaWVudGVk
IHByb2dyYW1taW5nLiBJdCBoYXMgbWFueSBmZWF0dXJlcyB0byBwcm9jZXNzIFwKQEAgLTEwLDcg
KzQ1LDcgQEAgTElDRU5TRSA9ICJSdWJ5IHwgQlNELTItQ2xhdXNlIHwgQlNELTMtQ2xhdXNlIHwg
R1BMLTIuMC1vbmx5IHwgSVNDIHwgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9NWI4Yzg3NTU5ODY4Nzk2OTc5ODA2MTAwZGIzZjM4MDUgXAogICAgICAgICAgICAg
ICAgICAgICBmaWxlOi8vQlNETDttZDU9OGI1MGJjNmRlOGY1ODZkYzY2NzkwYmExMWQwNjRkNzUg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vR1BMO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2
YTgwZmRhZjRhNDI2MyBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MRUdBTDttZDU9ZjI2
MDE5MGJjMWU5MmUzNjNmMGVlM2MwNDYzZDRjN2MgXAorICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vTEVHQUw7bWQ1PWJjZDc0YjQ3YmJhZjIwNTFjNWU0OTgxMWE1ZmFhOTdhIFwKICAgICAgICAg
ICAgICAgICAgICAgIgogCiBERVBFTkRTID0gInpsaWIgb3BlbnNzbCBsaWJ5YW1sIGdkYm0gcmVh
ZGxpbmUgbGliZmZpIgpAQCAtNTEsNyArODYsNyBAQCBkb19jb25maWd1cmU6cHJlcGVuZCgpIHsK
IAogREVQRU5EUzphcHBlbmQ6bGliYy1tdXNsID0gIiBsaWJ1Y29udGV4dCIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImRhYWE3OGUxMzYwYjI3ODNmOThkZWVjZWI2NzdhZDkwMGYzYTM2YzBmZmE2
ZTJiNmIxOTA5MGJlNzdhYmMyNzIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTNkNjc5MDE2NjBl
ZTMyMTdkYmQ5ZGQ1NjA1OTM0NmJkNDIxMmNlNjRhNjljMzA2ZWY1MmRmNjQ5MzVmOGRiZCIKIAog
UEFDS0FHRUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUcgKz0gIiR7QGJiLnV0aWxzLmZpbHRl
cignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCi0tIAoyLjM3LjMKCg==

--===============1302660308907677932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ruby: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.2/ruby-3.2.0.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://remove_has_include_macros.patch file://run-ptest file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch file://0002-template-Makefile.in-filter-out-f-prefix-map.patch file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch" to "http://cache.ruby-lang.org/pub/ruby/3.2/ruby-3.2.1.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://remove_
 has_include_macros.patch file://run-ptest file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch file://0002-template-Makefile.in-filter-out-f-prefix-map.patch file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch"
packages/core2-32-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.3.2.0", added "/usr/lib/.debug/libruby.so.3.2.1"
packages/core2-32-poky-linux/ruby/ruby-dbg: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 8864044 to 8865120 (+0%)
packages/core2-32-poky-linux/ruby/ruby-dbg: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/ruby/ruby-dev: FILELIST: removed "/usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.0.h", added "/usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.1.h"
packages/core2-32-poky-linux/ruby/ruby-dev: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby/ruby-dev: PKGSIZE changed from 2820083 to 2820650 (+0%)
packages/core2-32-poky-linux/ruby/ruby-dev: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/ruby/ruby-doc: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby/ruby-doc: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/ruby/ruby-locale: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby/ruby-locale: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/ruby/ruby-ptest: FILELIST: directory renamed /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/src -> /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/ext/custom_name_lib/src, removed "/usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/build.rb /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/rust_ruby_example/build.rb /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/Cargo.toml /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/Cargo.lock", added "/usr/lib/ruby/ptest/test/coverage/main.rb /usr/lib/ruby/ptest/test/rubygems/bundler_test_gem.rb /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/ext/custom_name_lib/Cargo.lock /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/ext/custom_name_lib/Cargo.toml /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/lib/custom_na
 me.rb /usr/lib/ruby/ptest/test/coverage/autostart.rb"
packages/core2-32-poky-linux/ruby/ruby-ptest: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 15946763 to 15951413 (+0%)
packages/core2-32-poky-linux/ruby/ruby-ptest: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/ruby/ruby-rdoc: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/ruby/ruby-src: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby/ruby-src: PKGSIZE changed from 35581142 to 35587283 (+0%)
packages/core2-32-poky-linux/ruby/ruby-src: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/ruby/ruby-staticdev: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.1/libexec -> /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec, removed "/usr/lib/ruby/3.2.0/mjit/instruction.rb /usr/lib/libruby.so.3.2.0 /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.1.gemspec", added "/usr/lib/libruby.so.3.2.1 /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec"
packages/core2-32-poky-linux/ruby/ruby: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/ruby/ruby: PKGSIZE changed from 24016763 to 23954360 (-0%)
packages/core2-32-poky-linux/ruby/ruby: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
Changes to packages/core2-32-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.2 changed symlink target from libruby.so.3.2.0 to libruby.so.3.2.1
  /usr/lib/libruby.so changed symlink target from libruby.so.3.2.0 to libruby.so.3.2.1
  /usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.0.h moved to /usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.1.h
  /usr/lib/libruby.so.3.2.0 moved to /usr/lib/libruby.so.3.2.1
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.1 moved to /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.1.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec
  /usr/lib/ruby/3.2.0/mjit was removed
  /usr/lib/ruby/3.2.0/mjit/instruction.rb was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.2 changed symlink target from libruby.so.3.2.0 to libruby.so.3.2.1
  /usr/lib/libruby.so changed symlink target from libruby.so.3.2.0 to libruby.so.3.2.1
  /usr/include/ruby-3.2.0/x86_64-linux-gnu/rb_mjit_min_header-3.2.0.h moved to /usr/include/ruby-3.2.0/x86_64-linux-gnu/rb_mjit_min_header-3.2.1.h
  /usr/lib/libruby.so.3.2.0 moved to /usr/lib/libruby.so.3.2.1
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.1 moved to /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.1.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec
  /usr/lib/ruby/3.2.0/mjit was removed
  /usr/lib/ruby/3.2.0/mjit/instruction.rb was removed

--===============1302660308907677932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ruby/ruby-dev: FILELIST: removed "/usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.0.h", added "/usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.1.h"
packages/core2-32-poky-linux/ruby/ruby-ptest: FILELIST: directory renamed /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/src -> /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/ext/custom_name_lib/src, removed "/usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/build.rb /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/Cargo.toml /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/Cargo.lock /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/rust_ruby_example/build.rb", added "/usr/lib/ruby/ptest/test/coverage/main.rb /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/ext/custom_name_lib/Cargo.lock /usr/lib/ruby/ptest/test/rubygems/bundler_test_gem.rb /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/ext/custom_name_lib/Cargo.toml /usr/lib/ruby/ptest/test/rubygems/test_gem_ext_cargo_builder/custom_name/lib/custom_na
 me.rb /usr/lib/ruby/ptest/test/coverage/autostart.rb"
packages/core2-32-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.1/libexec -> /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec, removed "/usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.1.gemspec /usr/lib/libruby.so.3.2.0 /usr/lib/ruby/3.2.0/mjit/instruction.rb", added "/usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec /usr/lib/libruby.so.3.2.1"
Changes to packages/core2-32-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.2 changed symlink target from libruby.so.3.2.0 to libruby.so.3.2.1
  /usr/lib/libruby.so changed symlink target from libruby.so.3.2.0 to libruby.so.3.2.1
  /usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.0.h moved to /usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.1.h
  /usr/lib/libruby.so.3.2.0 moved to /usr/lib/libruby.so.3.2.1
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.1 moved to /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.1.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec
  /usr/lib/ruby/3.2.0/mjit was removed
  /usr/lib/ruby/3.2.0/mjit/instruction.rb was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.2 changed symlink target from libruby.so.3.2.0 to libruby.so.3.2.1
  /usr/lib/libruby.so changed symlink target from libruby.so.3.2.0 to libruby.so.3.2.1
  /usr/include/ruby-3.2.0/x86_64-linux-gnu/rb_mjit_min_header-3.2.0.h moved to /usr/include/ruby-3.2.0/x86_64-linux-gnu/rb_mjit_min_header-3.2.1.h
  /usr/lib/libruby.so.3.2.0 moved to /usr/lib/libruby.so.3.2.1
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.1 moved to /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.1.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec
  /usr/lib/ruby/3.2.0/mjit was removed
  /usr/lib/ruby/3.2.0/mjit/instruction.rb was removed

--===============1302660308907677932==--

