Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12522.1602843683179347150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id A8FF838C17A5
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 2.7.2 SUCCEEDED
Message-ID: <MADEUP.163E71D6B74CEEBB.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143447
Content-Type: multipart/mixed; boundary="===============3811012685221258654=="

--===============3811012685221258654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ruby* to *2.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-2.7.1-2.7.2.patch
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

--===============3811012685221258654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ruby/ruby-dev: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/libruby.so.2.7.1 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec", added "/usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec"
packages/core2-32-poky-linux/ruby/ruby-doc: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/libruby.so.2.7.1 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec", added "/usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec"
packages/core2-32-poky-linux/ruby/ruby-locale: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/libruby.so.2.7.1 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec", added "/usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec"
packages/core2-32-poky-linux/ruby/ruby-ptest: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/libruby.so.2.7.1 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec", added "/usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec"
packages/core2-32-poky-linux/ruby/ruby-rdoc: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/libruby.so.2.7.1 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec", added "/usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec"
packages/core2-32-poky-linux/ruby/ruby-ri-docs: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/libruby.so.2.7.1 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec", added "/usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec"
packages/core2-32-poky-linux/ruby/ruby-staticdev: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/libruby.so.2.7.1 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec", added "/usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec"
packages/core2-32-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/libruby.so.2.7.1 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec", added "/usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec"
Changes to packages/core2-32-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.2.7 changed symlink target from libruby.so.2.7.1 to libruby.so.2.7.2
  /usr/lib/libruby.so changed symlink target from libruby.so.2.7.1 to libruby.so.2.7.2
  /usr/include/ruby-2.7.0/i686-linux-gnu/rb_mjit_min_header-2.7.1.h moved to /usr/include/ruby-2.7.0/i686-linux-gnu/rb_mjit_min_header-2.7.2.h
  /usr/lib/libruby.so.2.7.1 moved to /usr/lib/libruby.so.2.7.2
  /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3 moved to /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6
  /usr/lib/ruby/gems/2.7.0/gems/reline-0.1.3 moved to /usr/lib/ruby/gems/2.7.0/gems/reline-0.1.5
  /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec moved to /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec
  /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec moved to /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec
  /usr/lib/ruby/2.7.0/irb/cmd/info.rb was added
  /usr/share/ri/2.7.0/system/Gem/source_date_epoch_string-c.ri was added
  /usr/share/ri/2.7.0/system/Gem/Specification/removed_method_calls-i.ri was added
  /usr/share/ri/2.7.0/system/Gem/TestCase/with_clean_path_to_ruby-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/Context/omit_on_assignment%3f-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/Context/omit_on_assignment-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ExtendCommand/Info was added
  /usr/share/ri/2.7.0/system/IRB/ExtendCommand/Info/cdesc-Info.ri was added
  /usr/share/ri/2.7.0/system/IRB/FileInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/InputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/InputMethod/winsize-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReadlineInputMethod/initialize_readline-c.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReadlineInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReidlineInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/StdioInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/Gem/Specification/rubyforge_project-i.ri was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.2.7 changed symlink target from libruby.so.2.7.1 to libruby.so.2.7.2
  /usr/lib/libruby.so changed symlink target from libruby.so.2.7.1 to libruby.so.2.7.2
  /usr/include/ruby-2.7.0/x86_64-linux-gnu/rb_mjit_min_header-2.7.1.h moved to /usr/include/ruby-2.7.0/x86_64-linux-gnu/rb_mjit_min_header-2.7.2.h
  /usr/lib/libruby.so.2.7.1 moved to /usr/lib/libruby.so.2.7.2
  /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3 moved to /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6
  /usr/lib/ruby/gems/2.7.0/gems/reline-0.1.3 moved to /usr/lib/ruby/gems/2.7.0/gems/reline-0.1.5
  /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec moved to /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec
  /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec moved to /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec
  /usr/lib/ruby/2.7.0/irb/cmd/info.rb was added
  /usr/share/ri/2.7.0/system/Gem/source_date_epoch_string-c.ri was added
  /usr/share/ri/2.7.0/system/Gem/Specification/removed_method_calls-i.ri was added
  /usr/share/ri/2.7.0/system/Gem/TestCase/with_clean_path_to_ruby-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/Context/omit_on_assignment%3f-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/Context/omit_on_assignment-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ExtendCommand/Info was added
  /usr/share/ri/2.7.0/system/IRB/ExtendCommand/Info/cdesc-Info.ri was added
  /usr/share/ri/2.7.0/system/IRB/FileInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/InputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/InputMethod/winsize-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReadlineInputMethod/initialize_readline-c.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReadlineInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReidlineInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/StdioInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/Gem/Specification/rubyforge_project-i.ri was removed

--===============3811012685221258654==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-2.7.1-2.7.2.patch"

From 19ad7cc2bd96aadaeef97ee2a7bc52353aa193d7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 05:02:34 +0000
Subject: [PATCH] ruby: upgrade 2.7.1 -> 2.7.2

---
 meta/recipes-devtools/ruby/{ruby_2.7.1.bb => ruby_2.7.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.7.1.bb => ruby_2.7.2.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-devtools/ruby/ruby_2.7.2.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_2.7.1.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.2.bb
index 3dd9fb0a62..306f671861 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.2.bb
@@ -8,8 +8,7 @@ SRC_URI += " \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
            "
 
-SRC_URI[md5sum] = "debb9c325bf65021214451660f46e909"
-SRC_URI[sha256sum] = "d418483bdd0000576c1370571121a6eb24582116db0b7bb2005e90e250eae418"
+SRC_URI[sha256sum] = "6e5706d0d4ee4e1e2f883db9d768586b4d06567debea353c796ec45e8321c3d4"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.18.4


--===============3811012685221258654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ruby: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-32-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 7793552 to 7796144 (+0%)
packages/core2-32-poky-linux/ruby/ruby-dbg: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby/ruby-dbg: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec /usr/lib/libruby.so.2.7.1", added "/usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb"
packages/core2-32-poky-linux/ruby/ruby-dbg: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-32-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1352964 to 1352941 (-0%)
packages/core2-32-poky-linux/ruby/ruby-dev: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby/ruby-dev: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec /usr/lib/libruby.so.2.7.1", added "/usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb"
packages/core2-32-poky-linux/ruby/ruby-dev: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-32-poky-linux/ruby/ruby-doc: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby/ruby-doc: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec /usr/lib/libruby.so.2.7.1", added "/usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb"
packages/core2-32-poky-linux/ruby/ruby-doc: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-32-poky-linux/ruby/ruby-locale: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby/ruby-locale: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec /usr/lib/libruby.so.2.7.1", added "/usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb"
packages/core2-32-poky-linux/ruby/ruby-locale: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-32-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 15201483 to 15246079 (+0%)
packages/core2-32-poky-linux/ruby/ruby-ptest: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby/ruby-ptest: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec /usr/lib/libruby.so.2.7.1", added "/usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb"
packages/core2-32-poky-linux/ruby/ruby-ptest: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-32-poky-linux/ruby/ruby-rdoc: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby/ruby-rdoc: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec /usr/lib/libruby.so.2.7.1", added "/usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb"
packages/core2-32-poky-linux/ruby/ruby-rdoc: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PKGSIZE changed from 10872335 to 10878519 (+0%)
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby/ruby-ri-docs: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec /usr/lib/libruby.so.2.7.1", added "/usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb"
packages/core2-32-poky-linux/ruby/ruby-ri-docs: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-32-poky-linux/ruby/ruby-src: PKGSIZE changed from 29890905 to 29894888 (+0%)
packages/core2-32-poky-linux/ruby/ruby-src: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec /usr/lib/libruby.so.2.7.1", added "/usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb"
packages/core2-32-poky-linux/ruby/ruby-src: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-32-poky-linux/ruby/ruby-staticdev: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby/ruby-staticdev: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec /usr/lib/libruby.so.2.7.1", added "/usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb"
packages/core2-32-poky-linux/ruby/ruby-staticdev: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-32-poky-linux/ruby/ruby: PKGSIZE changed from 16996954 to 17016235 (+0%)
packages/core2-32-poky-linux/ruby/ruby: PV changed from "2.7.1" to "2.7.2"
packages/core2-32-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe -> /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe, removed "/usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec /usr/lib/libruby.so.2.7.1", added "/usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec /usr/lib/libruby.so.2.7.2 /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec /usr/lib/ruby/2.7.0/irb/cmd/info.rb"
packages/core2-32-poky-linux/ruby/ruby: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
Changes to packages/core2-32-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.2.7 changed symlink target from libruby.so.2.7.1 to libruby.so.2.7.2
  /usr/lib/libruby.so changed symlink target from libruby.so.2.7.1 to libruby.so.2.7.2
  /usr/include/ruby-2.7.0/i686-linux-gnu/rb_mjit_min_header-2.7.1.h moved to /usr/include/ruby-2.7.0/i686-linux-gnu/rb_mjit_min_header-2.7.2.h
  /usr/lib/libruby.so.2.7.1 moved to /usr/lib/libruby.so.2.7.2
  /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3 moved to /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6
  /usr/lib/ruby/gems/2.7.0/gems/reline-0.1.3 moved to /usr/lib/ruby/gems/2.7.0/gems/reline-0.1.5
  /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec moved to /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec
  /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec moved to /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec
  /usr/lib/ruby/2.7.0/irb/cmd/info.rb was added
  /usr/share/ri/2.7.0/system/Gem/source_date_epoch_string-c.ri was added
  /usr/share/ri/2.7.0/system/Gem/Specification/removed_method_calls-i.ri was added
  /usr/share/ri/2.7.0/system/Gem/TestCase/with_clean_path_to_ruby-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/Context/omit_on_assignment%3f-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/Context/omit_on_assignment-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ExtendCommand/Info was added
  /usr/share/ri/2.7.0/system/IRB/ExtendCommand/Info/cdesc-Info.ri was added
  /usr/share/ri/2.7.0/system/IRB/FileInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/InputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/InputMethod/winsize-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReadlineInputMethod/initialize_readline-c.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReadlineInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReidlineInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/StdioInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/Gem/Specification/rubyforge_project-i.ri was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.2.7 changed symlink target from libruby.so.2.7.1 to libruby.so.2.7.2
  /usr/lib/libruby.so changed symlink target from libruby.so.2.7.1 to libruby.so.2.7.2
  /usr/include/ruby-2.7.0/x86_64-linux-gnu/rb_mjit_min_header-2.7.1.h moved to /usr/include/ruby-2.7.0/x86_64-linux-gnu/rb_mjit_min_header-2.7.2.h
  /usr/lib/libruby.so.2.7.1 moved to /usr/lib/libruby.so.2.7.2
  /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.3 moved to /usr/lib/ruby/gems/2.7.0/gems/irb-1.2.6
  /usr/lib/ruby/gems/2.7.0/gems/reline-0.1.3 moved to /usr/lib/ruby/gems/2.7.0/gems/reline-0.1.5
  /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.3.gemspec moved to /usr/lib/ruby/gems/2.7.0/specifications/default/irb-1.2.6.gemspec
  /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.3.gemspec moved to /usr/lib/ruby/gems/2.7.0/specifications/default/reline-0.1.5.gemspec
  /usr/lib/ruby/2.7.0/irb/cmd/info.rb was added
  /usr/share/ri/2.7.0/system/Gem/source_date_epoch_string-c.ri was added
  /usr/share/ri/2.7.0/system/Gem/Specification/removed_method_calls-i.ri was added
  /usr/share/ri/2.7.0/system/Gem/TestCase/with_clean_path_to_ruby-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/Context/omit_on_assignment%3f-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/Context/omit_on_assignment-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ExtendCommand/Info was added
  /usr/share/ri/2.7.0/system/IRB/ExtendCommand/Info/cdesc-Info.ri was added
  /usr/share/ri/2.7.0/system/IRB/FileInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/InputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/InputMethod/winsize-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReadlineInputMethod/initialize_readline-c.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReadlineInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/ReidlineInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/IRB/StdioInputMethod/inspect-i.ri was added
  /usr/share/ri/2.7.0/system/Gem/Specification/rubyforge_project-i.ri was removed

--===============3811012685221258654==--
