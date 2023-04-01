Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF7DC88CB0
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.32126.1680384534763546611
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ASl7abXM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101873eb926da-13ca854b-366d-4b38-af53-a319a92a15ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L/1LdqZ6CdFFrayE/VeEOo2quaTgMxAh0Ly08IA44YI=;
	b=ASl7abXMrvAt9T5dbUxqoYloQyWiMprZ5Gp3sUyEi9XizvKMcnV8oJwQ3xjWHkqB
	z8JHXO7GIJrOa1xzGSGfRc93f9iLwCm/avMA8xt+/BgjSEIqu/yFvJVM3BBNzh2QtM/
	eyeDZl8P+DMIM9Wsi4OJ7uqMDi+6PcjHYeCdij7w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L/1LdqZ6CdFFrayE/VeEOo2quaTgMxAh0Ly08IA44YI=;
	b=oS0TFNB5cbiF7tkox5Wos9AYM+E/D3KcR3aNWjNtAeILpfOi3ZxvgriyD5wFn4Mg
	nEUKWKPfmhqirKAEZLCwZaeRPYmd9HGtQ4g5BhX1gplcqVxYT/6wdT1xMdNgXwVji+e
	VINX8dxGO0RgkoCNNi3R/HIqpXk6xW7UbTOLhZuw=
Content-Type: multipart/mixed; boundary="===============0139689405757527398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.2.2 SUCCEEDED
Message-ID: <010101873eb926da-13ca854b-366d-4b38-af53-a319a92a15ba-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179504

--===============0139689405757527398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ruby* to *3.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-3.2.1-3.2.2.patch
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
--===============0139689405757527398==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.2.1-3.2.2.patch"

RnJvbSA0NjBjYTBhMDIxM2MyZmM3OWM5Njc1ZDk5OWJiMTM2YmQxYTczYTExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxMDoyNjo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ1
Ynk6IHVwZ3JhZGUgMy4yLjEgLT4gMy4yLjIKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
Ynkve3J1YnlfMy4yLjEuYmIgPT4gcnVieV8zLjIuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS97cnVieV8zLjIuMS5iYiA9PiBydWJ5XzMuMi4yLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy4yLjEuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy4yLjEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy4yLjIuYmIKaW5kZXggM2YxYmJj
MjYyYi4uNDgxZmU3YzIzZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieV8zLjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMi4y
LmJiCkBAIC01MSw3ICs1MSw3IEBAIGRvX2NvbmZpZ3VyZTpwcmVwZW5kKCkgewogCiBERVBFTkRT
OmFwcGVuZDpsaWJjLW11c2wgPSAiIGxpYnVjb250ZXh0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMTNkNjc5MDE2NjBlZTMyMTdkYmQ5ZGQ1NjA1OTM0NmJkNDIxMmNlNjRhNjljMzA2ZWY1MmRm
NjQ5MzVmOGRiZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NmM1NzU1ODg3MWE2NzQ4ZGU1YmM5
ZjI3NGU5M2Y0YjVhYWQwNmNkOGYzN2JlZmEwZThkOTRlN2I4YTQyM2JjIgogCiBQQUNLQUdFQ09O
RklHID8/PSAiIgogUEFDS0FHRUNPTkZJRyArPSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9f
RkVBVFVSRVMnLCAnaXB2NicsIGQpfSIKLS0gCjIuMzkuMgoK

--===============0139689405757527398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ruby: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.2/ruby-3.2.1.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://remove_has_include_macros.patch file://run-ptest file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch file://0002-template-Makefile.in-filter-out-f-prefix-map.patch file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch" to "http://cache.ruby-lang.org/pub/ruby/3.2/ruby-3.2.2.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://remove_
 has_include_macros.patch file://run-ptest file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch file://0002-template-Makefile.in-filter-out-f-prefix-map.patch file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch"
packages/core2-32-poky-linux/ruby: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/ruby/ruby-dbg: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.3.2.1", added "/usr/lib/.debug/libruby.so.3.2.2"
packages/core2-32-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 8865140 to 8865992 (+0%)
packages/core2-32-poky-linux/ruby/ruby-dbg: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/ruby/ruby-dev: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby/ruby-dev: FILELIST: removed "/usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.1.h", added "/usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.2.h"
packages/core2-32-poky-linux/ruby/ruby-dev: PKGSIZE changed from 2820650 to 2820708 (+0%)
packages/core2-32-poky-linux/ruby/ruby-dev: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/ruby/ruby-doc: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby/ruby-doc: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/ruby/ruby-locale: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby/ruby-locale: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/ruby/ruby-ptest: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/rubygems/test_gem_commands_exec_command.rb"
packages/core2-32-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 15951413 to 15990457 (+0%)
packages/core2-32-poky-linux/ruby/ruby-ptest: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby/ruby-rdoc: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/ruby/ruby-src: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby/ruby-src: PKGSIZE changed from 35587283 to 35588748 (+0%)
packages/core2-32-poky-linux/ruby/ruby-src: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby/ruby-staticdev: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/ruby/ruby: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec -> /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec, removed "/usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.0.gemspec /usr/lib/ruby/3.2.0/bundler/templates/gems.rb /usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.1.gemspec /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec /usr/lib/libruby.so.3.2.1", added "/usr/lib/ruby/3.2.0/rubygems/commands/exec_command.rb /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.1.gemspec /usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.2.gemspec /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.10.gemspec /usr/lib/ruby/3.2.0/bundler/uri_normalizer.rb /usr/lib/libruby.so.3.2.2"
packages/core2-32-poky-linux/ruby/ruby: PKGSIZE changed from 23954360 to 23967094 (+0%)
packages/core2-32-poky-linux/ruby/ruby: PV changed from "3.2.1" to "3.2.2"
Changes to packages/core2-32-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.2 changed symlink target from libruby.so.3.2.1 to libruby.so.3.2.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.2.1 to libruby.so.3.2.2
  /usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.1.h moved to /usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.2.h
  /usr/lib/libruby.so.3.2.1 moved to /usr/lib/libruby.so.3.2.2
  /usr/lib/ruby/gems/3.2.0/gems/time-0.2.1 moved to /usr/lib/ruby/gems/3.2.0/gems/time-0.2.2
  /usr/lib/ruby/gems/3.2.0/gems/uri-0.12.0 moved to /usr/lib/ruby/gems/3.2.0/gems/uri-0.12.1
  /usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.1.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.2.gemspec
  /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.0.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.1.gemspec
  /usr/lib/ruby/3.2.0/bundler/uri_normalizer.rb was added
  /usr/lib/ruby/3.2.0/rubygems/commands/exec_command.rb was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10 was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec/bundle was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec/bundler was added
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.10.gemspec was added
  /usr/lib/ruby/3.2.0/bundler/templates/gems.rb was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6 was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec/bundle was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec/bundler was removed
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.2 changed symlink target from libruby.so.3.2.1 to libruby.so.3.2.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.2.1 to libruby.so.3.2.2
  /usr/include/ruby-3.2.0/x86_64-linux-gnu/rb_mjit_min_header-3.2.1.h moved to /usr/include/ruby-3.2.0/x86_64-linux-gnu/rb_mjit_min_header-3.2.2.h
  /usr/lib/libruby.so.3.2.1 moved to /usr/lib/libruby.so.3.2.2
  /usr/lib/ruby/gems/3.2.0/gems/time-0.2.1 moved to /usr/lib/ruby/gems/3.2.0/gems/time-0.2.2
  /usr/lib/ruby/gems/3.2.0/gems/uri-0.12.0 moved to /usr/lib/ruby/gems/3.2.0/gems/uri-0.12.1
  /usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.1.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.2.gemspec
  /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.0.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.1.gemspec
  /usr/lib/ruby/3.2.0/bundler/uri_normalizer.rb was added
  /usr/lib/ruby/3.2.0/rubygems/commands/exec_command.rb was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10 was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec/bundle was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec/bundler was added
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.10.gemspec was added
  /usr/lib/ruby/3.2.0/bundler/templates/gems.rb was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6 was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec/bundle was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec/bundler was removed
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec was removed

--===============0139689405757527398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ruby/ruby-dev: FILELIST: removed "/usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.1.h", added "/usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.2.h"
packages/core2-32-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/rubygems/test_gem_commands_exec_command.rb"
packages/core2-32-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec -> /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec, removed "/usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.1.gemspec /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec /usr/lib/libruby.so.3.2.1 /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.0.gemspec /usr/lib/ruby/3.2.0/bundler/templates/gems.rb", added "/usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.2.gemspec /usr/lib/ruby/3.2.0/rubygems/commands/exec_command.rb /usr/lib/ruby/3.2.0/bundler/uri_normalizer.rb /usr/lib/libruby.so.3.2.2 /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.1.gemspec /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.10.gemspec"
Changes to packages/core2-32-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.2 changed symlink target from libruby.so.3.2.1 to libruby.so.3.2.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.2.1 to libruby.so.3.2.2
  /usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.1.h moved to /usr/include/ruby-3.2.0/i686-linux-gnu/rb_mjit_min_header-3.2.2.h
  /usr/lib/libruby.so.3.2.1 moved to /usr/lib/libruby.so.3.2.2
  /usr/lib/ruby/gems/3.2.0/gems/time-0.2.1 moved to /usr/lib/ruby/gems/3.2.0/gems/time-0.2.2
  /usr/lib/ruby/gems/3.2.0/gems/uri-0.12.0 moved to /usr/lib/ruby/gems/3.2.0/gems/uri-0.12.1
  /usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.1.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.2.gemspec
  /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.0.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.1.gemspec
  /usr/lib/ruby/3.2.0/bundler/uri_normalizer.rb was added
  /usr/lib/ruby/3.2.0/rubygems/commands/exec_command.rb was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10 was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec/bundle was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec/bundler was added
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.10.gemspec was added
  /usr/lib/ruby/3.2.0/bundler/templates/gems.rb was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6 was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec/bundle was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec/bundler was removed
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.2 changed symlink target from libruby.so.3.2.1 to libruby.so.3.2.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.2.1 to libruby.so.3.2.2
  /usr/include/ruby-3.2.0/x86_64-linux-gnu/rb_mjit_min_header-3.2.1.h moved to /usr/include/ruby-3.2.0/x86_64-linux-gnu/rb_mjit_min_header-3.2.2.h
  /usr/lib/libruby.so.3.2.1 moved to /usr/lib/libruby.so.3.2.2
  /usr/lib/ruby/gems/3.2.0/gems/time-0.2.1 moved to /usr/lib/ruby/gems/3.2.0/gems/time-0.2.2
  /usr/lib/ruby/gems/3.2.0/gems/uri-0.12.0 moved to /usr/lib/ruby/gems/3.2.0/gems/uri-0.12.1
  /usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.1.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/time-0.2.2.gemspec
  /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.0.gemspec moved to /usr/lib/ruby/gems/3.2.0/specifications/default/uri-0.12.1.gemspec
  /usr/lib/ruby/3.2.0/bundler/uri_normalizer.rb was added
  /usr/lib/ruby/3.2.0/rubygems/commands/exec_command.rb was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10 was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec/bundle was added
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.10/libexec/bundler was added
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.10.gemspec was added
  /usr/lib/ruby/3.2.0/bundler/templates/gems.rb was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6 was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec/bundle was removed
  /usr/lib/ruby/gems/3.2.0/gems/bundler-2.4.6/libexec/bundler was removed
  /usr/lib/ruby/gems/3.2.0/specifications/default/bundler-2.4.6.gemspec was removed

--===============0139689405757527398==--

