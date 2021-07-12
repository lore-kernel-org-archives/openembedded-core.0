Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5879.1626056248724513209
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7498A38C1276
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.0.2 SUCCEEDED
Message-ID: <MADEUP.1690E98B0AE68C73.22557@lists.openembedded.org>
X-Groupsio-MsgNum: 153745
Content-Type: multipart/mixed; boundary="===============0998210940201147956=="

--===============0998210940201147956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ruby* to *3.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-3.0.1-3.0.2.patch
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

--===============0998210940201147956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ruby/ruby-dev: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, removed "/usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec /usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec", added "/usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/libruby.so.3.0.2 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb"
packages/core2-32-poky-linux/ruby/ruby-doc: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, removed "/usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec /usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec", added "/usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/libruby.so.3.0.2 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb"
packages/core2-32-poky-linux/ruby/ruby-locale: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, removed "/usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec /usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec", added "/usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/libruby.so.3.0.2 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb"
packages/core2-32-poky-linux/ruby/ruby-ptest: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, removed "/usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec /usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec", added "/usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/libruby.so.3.0.2 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb"
packages/core2-32-poky-linux/ruby/ruby-rdoc: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, removed "/usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec /usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec", added "/usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/libruby.so.3.0.2 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb"
packages/core2-32-poky-linux/ruby/ruby-ri-docs: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, removed "/usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec /usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec", added "/usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/libruby.so.3.0.2 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb"
packages/core2-32-poky-linux/ruby/ruby-staticdev: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, removed "/usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec /usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec", added "/usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/libruby.so.3.0.2 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb"
packages/core2-32-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, removed "/usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec /usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec", added "/usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/libruby.so.3.0.2 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb"
Changes to packages/core2-32-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.0 changed symlink target from libruby.so.3.0.1 to libruby.so.3.0.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.0.1 to libruby.so.3.0.2
  /usr/include/ruby-3.0.0/i686-linux-gnu/rb_mjit_min_header-3.0.1.h moved to /usr/include/ruby-3.0.0/i686-linux-gnu/rb_mjit_min_header-3.0.2.h
  /usr/lib/libruby.so.3.0.1 moved to /usr/lib/libruby.so.3.0.2
  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15 moved to /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22
  /usr/lib/ruby/gems/3.0.0/gems/net-ftp-0.1.1 moved to /usr/lib/ruby/gems/3.0.0/gems/net-ftp-0.1.2
  /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0 moved to /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1
  /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec
  /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec
  /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec
  /usr/lib/ruby/3.0.0/bundler/source_map.rb was added
  /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb was added
  /usr/lib/ruby/3.0.0/rdoc/markup/table.rb was added
  /usr/share/ri/3.0.0/system/Complex/hash-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/check_openssl-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/open_cert-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/open_private_key-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/GemcutterUtilities/otp-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/capture_subprocess_io-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/load_yaml_file-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/load_yaml-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/_synchronize-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/without_any_upwards_gemfiles-i.ri was added
  /usr/share/ri/3.0.0/system/Net/FTP/use_pasv_ip-i.ri was added
  /usr/share/ri/3.0.0/system/Net/IMAP/UnknownResponseError was added
  /usr/share/ri/3.0.0/system/Net/IMAP/UnknownResponseError/cdesc-UnknownResponseError.ri was added
  /usr/share/ri/3.0.0/system/Object/stub-i.ri was added
  /usr/share/ri/3.0.0/system/Rational/hash-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/cdesc-Git.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/create_entries-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/parse_entries-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/parse_info-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/parse_date-i.ri was added
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.0 changed symlink target from libruby.so.3.0.1 to libruby.so.3.0.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.0.1 to libruby.so.3.0.2
  /usr/include/ruby-3.0.0/x86_64-linux-gnu/rb_mjit_min_header-3.0.1.h moved to /usr/include/ruby-3.0.0/x86_64-linux-gnu/rb_mjit_min_header-3.0.2.h
  /usr/lib/libruby.so.3.0.1 moved to /usr/lib/libruby.so.3.0.2
  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15 moved to /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22
  /usr/lib/ruby/gems/3.0.0/gems/net-ftp-0.1.1 moved to /usr/lib/ruby/gems/3.0.0/gems/net-ftp-0.1.2
  /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0 moved to /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1
  /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec
  /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec
  /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec
  /usr/lib/ruby/3.0.0/bundler/source_map.rb was added
  /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb was added
  /usr/lib/ruby/3.0.0/rdoc/markup/table.rb was added
  /usr/share/ri/3.0.0/system/Complex/hash-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/check_openssl-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/open_cert-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/open_private_key-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/GemcutterUtilities/otp-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/capture_subprocess_io-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/load_yaml_file-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/load_yaml-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/_synchronize-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/without_any_upwards_gemfiles-i.ri was added
  /usr/share/ri/3.0.0/system/Net/FTP/use_pasv_ip-i.ri was added
  /usr/share/ri/3.0.0/system/Net/IMAP/UnknownResponseError was added
  /usr/share/ri/3.0.0/system/Net/IMAP/UnknownResponseError/cdesc-UnknownResponseError.ri was added
  /usr/share/ri/3.0.0/system/Object/stub-i.ri was added
  /usr/share/ri/3.0.0/system/Rational/hash-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/cdesc-Git.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/create_entries-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/parse_entries-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/parse_info-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/parse_date-i.ri was added

--===============0998210940201147956==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.0.1-3.0.2.patch"

From 6af667b852e279293bbe6804513d2d060e5e2fef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 11 Jul 2021 20:05:52 +0000
Subject: [PATCH] ruby: upgrade 3.0.1 -> 3.0.2

---
 meta/recipes-devtools/ruby/{ruby_3.0.1.bb => ruby_3.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.0.1.bb => ruby_3.0.2.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.0.1.bb b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.0.1.bb
rename to meta/recipes-devtools/ruby/ruby_3.0.2.bb
index 944cb81c1d..f88e874c7b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
@@ -8,7 +8,7 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[sha256sum] = "369825db2199f6aeef16b408df6a04ebaddb664fb9af0ec8c686b0ce7ab77727"
+SRC_URI[sha256sum] = "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.20.1


--===============0998210940201147956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ruby: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://remove_has_include_macros.patch file://run-ptest file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch" to "http://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.2.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://remove_has_include_macros.patch file://run-ptest file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch"
packages/core2-32-poky-linux/ruby/ruby-dbg: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby/ruby-dbg: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby/ruby-dbg: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, removed "/usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec", added "/usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb /usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/libruby.so.3.0.2"
packages/core2-32-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 9842072 to 9846768 (+0%)
packages/core2-32-poky-linux/ruby/ruby-dev: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby/ruby-dev: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby/ruby-dev: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, removed "/usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec", added "/usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb /usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/libruby.so.3.0.2"
packages/core2-32-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1832515 to 1832718 (+0%)
packages/core2-32-poky-linux/ruby/ruby-doc: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby/ruby-doc: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby/ruby-doc: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, removed "/usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec", added "/usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb /usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/libruby.so.3.0.2"
packages/core2-32-poky-linux/ruby/ruby-locale: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby/ruby-locale: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby/ruby-locale: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, removed "/usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec", added "/usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb /usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/libruby.so.3.0.2"
packages/core2-32-poky-linux/ruby/ruby-ptest: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby/ruby-ptest: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby/ruby-ptest: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, removed "/usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec", added "/usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb /usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/libruby.so.3.0.2"
packages/core2-32-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 13976338 to 14282013 (+2%)
packages/core2-32-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby/ruby-rdoc: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby/ruby-rdoc: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, removed "/usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec", added "/usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb /usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/libruby.so.3.0.2"
packages/core2-32-poky-linux/ruby/ruby-rdoc: PKGSIZE changed from 1702052 to 1721893 (+1%)
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby/ruby-ri-docs: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, removed "/usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec", added "/usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb /usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/libruby.so.3.0.2"
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PKGSIZE changed from 9040176 to 9047940 (+0%)
packages/core2-32-poky-linux/ruby/ruby-src: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby/ruby-src: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, removed "/usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec", added "/usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb /usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/libruby.so.3.0.2"
packages/core2-32-poky-linux/ruby/ruby-src: PKGSIZE changed from 30908365 to 30915564 (+0%)
packages/core2-32-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby/ruby-staticdev: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby/ruby-staticdev: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, removed "/usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec", added "/usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb /usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/libruby.so.3.0.2"
packages/core2-32-poky-linux/ruby/ruby: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/ruby/ruby: PV changed from "3.0.1" to "3.0.2"
packages/core2-32-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0/exe -> /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1/exe, directory renamed /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15/libexec -> /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22/libexec, removed "/usr/lib/libruby.so.3.0.1 /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec", added "/usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb /usr/lib/ruby/3.0.0/bundler/source_map.rb /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec /usr/lib/libruby.so.3.0.2"
packages/core2-32-poky-linux/ruby/ruby: PKGSIZE changed from 21492885 to 21502247 (+0%)
Changes to packages/core2-32-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.0 changed symlink target from libruby.so.3.0.1 to libruby.so.3.0.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.0.1 to libruby.so.3.0.2
  /usr/include/ruby-3.0.0/i686-linux-gnu/rb_mjit_min_header-3.0.1.h moved to /usr/include/ruby-3.0.0/i686-linux-gnu/rb_mjit_min_header-3.0.2.h
  /usr/lib/libruby.so.3.0.1 moved to /usr/lib/libruby.so.3.0.2
  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15 moved to /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22
  /usr/lib/ruby/gems/3.0.0/gems/net-ftp-0.1.1 moved to /usr/lib/ruby/gems/3.0.0/gems/net-ftp-0.1.2
  /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0 moved to /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1
  /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec
  /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec
  /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec
  /usr/lib/ruby/3.0.0/bundler/source_map.rb was added
  /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb was added
  /usr/lib/ruby/3.0.0/rdoc/markup/table.rb was added
  /usr/share/ri/3.0.0/system/Complex/hash-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/check_openssl-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/open_cert-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/open_private_key-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/GemcutterUtilities/otp-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/capture_subprocess_io-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/load_yaml_file-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/load_yaml-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/_synchronize-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/without_any_upwards_gemfiles-i.ri was added
  /usr/share/ri/3.0.0/system/Net/FTP/use_pasv_ip-i.ri was added
  /usr/share/ri/3.0.0/system/Net/IMAP/UnknownResponseError was added
  /usr/share/ri/3.0.0/system/Net/IMAP/UnknownResponseError/cdesc-UnknownResponseError.ri was added
  /usr/share/ri/3.0.0/system/Object/stub-i.ri was added
  /usr/share/ri/3.0.0/system/Rational/hash-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/cdesc-Git.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/create_entries-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/parse_entries-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/parse_info-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/parse_date-i.ri was added
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.0 changed symlink target from libruby.so.3.0.1 to libruby.so.3.0.2
  /usr/lib/libruby.so changed symlink target from libruby.so.3.0.1 to libruby.so.3.0.2
  /usr/include/ruby-3.0.0/x86_64-linux-gnu/rb_mjit_min_header-3.0.1.h moved to /usr/include/ruby-3.0.0/x86_64-linux-gnu/rb_mjit_min_header-3.0.2.h
  /usr/lib/libruby.so.3.0.1 moved to /usr/lib/libruby.so.3.0.2
  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.15 moved to /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.22
  /usr/lib/ruby/gems/3.0.0/gems/net-ftp-0.1.1 moved to /usr/lib/ruby/gems/3.0.0/gems/net-ftp-0.1.2
  /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.0 moved to /usr/lib/ruby/gems/3.0.0/gems/rdoc-6.3.1
  /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.15.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/bundler-2.2.22.gemspec
  /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.1.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/net-ftp-0.1.2.gemspec
  /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.0.gemspec moved to /usr/lib/ruby/gems/3.0.0/specifications/default/rdoc-6.3.1.gemspec
  /usr/lib/ruby/3.0.0/bundler/source_map.rb was added
  /usr/lib/ruby/3.0.0/bundler/source/rubygems_aggregate.rb was added
  /usr/lib/ruby/3.0.0/rdoc/markup/table.rb was added
  /usr/share/ri/3.0.0/system/Complex/hash-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/check_openssl-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/open_cert-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/Commands/CertCommand/open_private_key-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/GemcutterUtilities/otp-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/capture_subprocess_io-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/load_yaml_file-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/load_yaml-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/_synchronize-i.ri was added
  /usr/share/ri/3.0.0/system/Gem/TestCase/without_any_upwards_gemfiles-i.ri was added
  /usr/share/ri/3.0.0/system/Net/FTP/use_pasv_ip-i.ri was added
  /usr/share/ri/3.0.0/system/Net/IMAP/UnknownResponseError was added
  /usr/share/ri/3.0.0/system/Net/IMAP/UnknownResponseError/cdesc-UnknownResponseError.ri was added
  /usr/share/ri/3.0.0/system/Object/stub-i.ri was added
  /usr/share/ri/3.0.0/system/Rational/hash-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/cdesc-Git.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/create_entries-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/parse_entries-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/Git/parse_info-i.ri was added
  /usr/share/ri/3.0.0/system/RDoc/Parser/ChangeLog/parse_date-i.ri was added

--===============0998210940201147956==--
