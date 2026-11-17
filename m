Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2093.1794939646794118003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=LWaf71bW;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso61275f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939645; x=1795544445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y1yDOAiXpz8XVvwgHq+mKvFs7LYIGf5N0TLD6TMo5Ok=;
        b=LWaf71bWM4CnB4hz3OkqQry91IsTN9qkwVGQPhoiAAvg6dzPaPaMlIbB4jxZBJHY3S
         vn1w8GOBevjVC3LofJkzR6vMEC3HJFrhN6QGtHXtrXzK/GuUpsJe5PSW6Cp2dy8uGUrX
         1OTU7Pf1RdX0sBP59q+QNIp1rklcsp65DlEC/CzkXTEzeNbg3IwWOCEvgTRs/dzrZ7zU
         8FhlCbv3af1UBl1mI7KCyoQu1m11CGPK4MIaQQrQUxFtlPZLUZs0Elxtm4sBxfyZdcEH
         CWS6RW778oj0tNq+cIB4jt292VGuvOHpyzXxZPVFimLl6/srnPxCauiB1MjUry81P7qF
         Ihrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939645; x=1795544445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y1yDOAiXpz8XVvwgHq+mKvFs7LYIGf5N0TLD6TMo5Ok=;
        b=sqYK3CfJ1YOaxX+PZ3ozQVLZ20Y+/4nOrkPdlSjMHB2zAX+2zQpjTu1PcJOUSV1jiH
         oKSCuPNCS7gsZr+r1+QAeP0au875akLTf5/kE/dYZy+Cto9glCJHK+KDktWBOvzyiYkg
         S7eX5mLRhkzupV08fqlr/sYyo1XTfQU4XcfmIh1Sn1ewYiwd2swdgacTs77CNs7EdlEv
         MaRbNVmhri3Ko/6vwsdwgwquH0OhB+70ZTIAFSJWiBLwN7/ApUr1oRbALGnsulqHAaZt
         AxErFgrLHcXi9NSMtPGA9J5+IuMoMogu7KJXukMSjLgYOsFaTzRFdqaxx0E6O/79wJHO
         24YQ==
X-Gm-Message-State: APuU4Z/6TE/Sfbgs7DfQbrxADdlz9QRKgkSPrX/Wo1UxoJr8FxzuLDox
	29NzeP9lvdZaRJScOE2gKVJYvwfe125dVY4ZXFWeWXxn5wf1EhzUSMTG0Ttouv5S+L3owH4lCBu
	uSjauUkQ=
X-Gm-Gg: AZFdTZfSE5ih2ZLx7MasK/5AATSrYTD3hAPa1xsoXzoAmUNMDYOKOiFI9GIyH/lZGtM
	dO/YSS9tFJGMXvFQPunw6bbshKLsqPJTABouNUoIIPgxmuk9+jL/Ni1bAlMCfAAP4Kp9Ie4b0WI
	BK7hlwx8QZEg4rMox63HMK/c5nFHwdmC7et75pB1EpzijfjONX2q5ol/zFtgn8qZa8xpkrfb4NM
	ewulXO9EEvDFFQvKWxmgaZ/Vor/TfSRE7m7iCFlXDcxNGy0h1CLPf5zwttGoArxwKL6HRAREOZP
	bNjYFeF7ZFvyMuGhxg5Xzvkky4ZO7J7LuMbexBjCAf6s+slAloIVB9Qki7pIoMkeYUsrAMrY+eJ
	MxpmeE5JX/djTE/us+bLo2coxo4wLy/V/uhz32M0XaR9REgC1Y57h9uVslX9xl4jbZEDoyNe0O6
	mrmjv8DYK5kN9bL53bZr4lgZKEFCD4Ga6uYS5hbAH5YkNBaxuC71+YaOy3x+pxaFLeb7R7eGkSw
	96oRMv8ON5F6vby0zOEh2iQZMDQRN/Jo32r++y2R61bbolR/EJB5UZF4dhKprMVDswgvxOudCwa
	QeGIXs5p22JGmTapuw+fZ0iXEgjMoGllcEKFLh9flb07w5pbb74btUrQgcwfc96RpXAExIrblkj
	XzgZk1gZ5KvL7t8GBMe+rhus4cePgTw+pI8pgkpct2je+xLh3n4k=
X-Received: by 2002:a05:6000:184b:b0:48b:a4b:5a2c with SMTP id ffacd0b85a97d-4a6334a76f6mr711385f8f.3.1794939644595;
        Tue, 17 Nov 2026 10:20:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/17] perl: upgrade 5.42.0 -> 5.42.3
Date: Tue, 17 Nov 2026 19:20:17 +0100
Message-ID: <dcc87a051b64f2643b94bdb1a703aa50e8dccb26.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250484
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

ReleaseInfo: https://perldoc.perl.org/5.42.3/perl5423delta

- CVE-2026-8376: buffer overflow in Perl_study_chunk (regcomp_study.c)
  from checking substring buffer size in characters instead of bytes
- CVE-2026-57432: buffer overflow in S_measure_struct via pack/unpack
  on an oversized structure
- CVE-2026-13221: regex trie 16-bit field overflow with >~65k
  alternation branches
- CVE-2026-57433: Storable.xs signed int overflow unpacking hook data
- Archive::Tar bumped 3.04 -> 3.12, including symlink/hardlink path
  traversal fix (CVE-2026-42496)

All of the above are fixed upstream in 5.42.3, so the local CVE backport
patches are dropped.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../perl/files/CVE-2026-13221.patch           | 75 --------------
 .../perl/files/CVE-2026-42496.patch           | 99 -------------------
 .../perl/files/CVE-2026-57432-01.patch        | 52 ----------
 .../perl/files/CVE-2026-57432-02.patch        | 34 -------
 .../perl/files/CVE-2026-57433.patch           | 32 ------
 .../perl/files/CVE-2026-8376-01.patch         | 62 ------------
 .../perl/files/CVE-2026-8376-02.patch         | 49 ---------
 .../perl/{perl_5.42.0.bb => perl_5.42.3.bb}   |  9 +-
 8 files changed, 1 insertion(+), 411 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57433.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 rename meta/recipes-devtools/perl/{perl_5.42.0.bb => perl_5.42.3.bb} (98%)

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-13221.patch b/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
deleted file mode 100644
index 03396f3e434..00000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 03f74bbbd3a68350d926ee93d56ee4808c28c4c7 Mon Sep 17 00:00:00 2001
-From: Karl Williamson <khw@cpan.org>
-Date: Thu, 26 Mar 2026 10:13:49 -0600
-Subject: [PATCH] regcomp_study: Don't create a trie that would overflow
-
-This addresses GH #23388
-
-The design of the trie compiling code is to batch extra long tries into
-smaller chunks that fit into whatever limitations there are.  However,
-this ticket shows that that isn't always being done.
-
-In this case, a bunch of branches that have TAIL operands can be
-combined together, and the final TAIL is used.  And the code requires
-that the delta between the first branch and this final TAIL fit into a
-16-bit field.  That is the root cause of this bug.
-
-I'm not familiar enough with the trie construction code to easily
-understand why the final tail needs to be used here.  So this patch
-simply doesn't optimize a sequence of branches into a trie that would
-overflow.
-
-This could be revisited by someone who knows more about this than I, or
-earlier in the development cycle.
-
-CVE: CVE-2026-13221
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee4808c28c4c7]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- regcomp_study.c     | 10 ++++++++++
- t/re/pat_advanced.t |  9 +++++++++
- 2 files changed, 19 insertions(+)
-
-diff --git a/regcomp_study.c b/regcomp_study.c
-index db7ab3a409..a1b2c3d4e5 100644
---- a/regcomp_study.c
-+++ b/regcomp_study.c
-@@ -1933,6 +1933,16 @@ Perl_study_chunk(pTHX_
-                             tail = regnext( tail );
-                         }
- 
-+                        /* The code below currently saves the difference from
-+                         * start to finish in a 16-bit field, causing
-+                         * GH #23388.  This defeats the design of batching
-+                         * tries into chunks that each fit.  khw thinks it is
-+                         * too late in the 5.44 cycle to relook at the design,
-+                         * so for now anyway, don't make a trie that would
-+                         * overflow */
-+                        if (tail - startbranch >= U16_MAX) {
-+                            continue;
-+                        }
- 
-                         DEBUG_TRIE_COMPILE_r({
-                             regprop(RExC_rx, RExC_mysv, tail, NULL, pRExC_state);
-diff --git a/t/re/pat_advanced.t b/t/re/pat_advanced.t
-index 398680838d..c9e389ecb3 100644
---- a/t/re/pat_advanced.t
-+++ b/t/re/pat_advanced.t
-@@ -4898,6 +4898,15 @@ EOF_DEBUG_OUT
-         $x =~ s/^[\x{0301}\x{030C}]+//;
-     }
- 
-+    { # GH #23388
-+        fresh_perl_is(<<~'PROG', , "", {}, "Avoid trie overflow");
-+            my $x = join "|", "aaa".."mzz";
-+            my $y = join "|", "naa".."zzz";
-+            use re 'Debug';
-+            "fnord" =~ m/(?:$x)|(?:$y)/;
-+            PROG
-+    }
-+
- 
-     # !!! NOTE that tests that aren't at all likely to crash perl should go
-     # a ways above, above these last ones.  There's a comment there that, like
--- 
-2.43.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-42496.patch b/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
deleted file mode 100644
index ae370340cf5..00000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From edde2083c6e93e42b979068af5529710b5e2a7ab Mon Sep 17 00:00:00 2001
-From: Stig Palmquist <stig@stig.io>
-Date: Thu, 21 May 2026 19:59:21 +0100
-Subject: [PATCH] Validate symlink and hardlink linkname in SECURE MODE
-
-Archive::Tar before 3.08 passes the tar header's linkname directly to
-symlink()/link() in _make_special_file() without validating absolute
-paths or '..' segments. This allows a crafted tar archive to create
-symlinks or hardlinks targeting paths outside the extraction directory,
-leading to arbitrary file read/write.
-
-Add validation in SECURE EXTRACT MODE (the default) to reject:
-- Symlink/hardlink targets with absolute paths
-- Symlink/hardlink targets containing '..' path traversal
-
-Adjusted patch paths from upstream Archive::Tar standalone repository
-(lib/Archive/Tar.pm) to match perl5 source tree layout
-(cpan/Archive-Tar/lib/Archive/Tar.pm).
-
-Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18c1485e0b2cccd5a9158]
-
-CVE: CVE-2026-42496
-CVE: CVE-2026-42497
-
-Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
----
- cpan/Archive-Tar/lib/Archive/Tar.pm     | 30 +++++++++++++++++++++++++
- cpan/Archive-Tar/t/04_resolved_issues.t |  2 ++
- 2 files changed, 32 insertions(+)
-
-diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Archive/Tar.pm
-index 2df0931..733feef 100644
---- a/cpan/Archive-Tar/lib/Archive/Tar.pm
-+++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
-@@ -954,6 +954,19 @@ sub _make_special_file {
-     my $err;
- 
-     if( $entry->is_symlink ) {
-+        if( !$INSECURE_EXTRACT_MODE ) {
-+            my $linkname = $entry->linkname;
-+            if( File::Spec->file_name_is_absolute($linkname) ) {
-+                $self->_error( qq[Symlink '] . $entry->full_path .
-+                    qq[' has absolute target. Not extracting under SECURE EXTRACT MODE] );
-+                return;
-+            }
-+            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
-+                $self->_error( qq[Symlink '] . $entry->full_path .
-+                    qq[' target attempts traversal. Not extracting under SECURE EXTRACT MODE] );
-+                return;
-+            }
-+        }
-         my $fail;
-         if( ON_UNIX ) {
-             symlink( $entry->linkname, $file ) or $fail++;
-@@ -967,6 +980,23 @@ sub _make_special_file {
-                 $entry->linkname .q[' failed] if $fail;
- 
-     } elsif ( $entry->is_hardlink ) {
-+        if( !$INSECURE_EXTRACT_MODE ) {
-+            my $linkname = $entry->linkname;
-+            if( File::Spec->file_name_is_absolute($linkname) ) {
-+                $self->_error( qq[Hardlink '] . $entry->full_path .
-+                    qq[' has absolute target '$linkname'. Not extracting ] .
-+                    qq[under SECURE EXTRACT MODE: extraction itself chmods ] .
-+                    qq[the shared inode.] );
-+                return;
-+            }
-+            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
-+                $self->_error( qq[Hardlink '] . $entry->full_path .
-+                    qq[' target '$linkname' attempts traversal. Not ] .
-+                    qq[extracting under SECURE EXTRACT MODE: extraction ] .
-+                    qq[itself chmods the shared inode.] );
-+                return;
-+            }
-+        }
-         my $fail;
-         if( ON_UNIX ) {
-             link( $entry->linkname, $file ) or $fail++;
-diff --git a/cpan/Archive-Tar/t/04_resolved_issues.t b/cpan/Archive-Tar/t/04_resolved_issues.t
-index b3566a1..08d339a 100644
---- a/cpan/Archive-Tar/t/04_resolved_issues.t
-+++ b/cpan/Archive-Tar/t/04_resolved_issues.t
-@@ -220,6 +220,7 @@ if ($^O ne 'msys') # symlink tests fail on Windows/msys2
- 		}
- 
-     { #use case 1 - in memory extraction
-+      local $Archive::Tar::INSECURE_EXTRACT_MODE=1;
- 			my $t=Archive::Tar->new;
- 			$t->read( $archname );
- 			my $r = eval{ $t->extract };
-@@ -231,6 +232,7 @@ if ($^O ne 'msys') # symlink tests fail on Windows/msys2
- 
- 		{ #use case 2 - iter extraction
- 		  #$DB::single = 2;
-+      local $Archive::Tar::INSECURE_EXTRACT_MODE=1;
- 			my $next=Archive::Tar->iter( $archname, 1 );
- 			my $failed = 0;
- 			#use Data::Dumper;
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch b/meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
deleted file mode 100644
index ef92b0d7b21..00000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 5f7eb6bbbe0510964e3fb1d6bb691e5445913e55 Mon Sep 17 00:00:00 2001
-From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
-Date: Sat, 9 May 2026 17:18:43 +0100
-Subject: [PATCH] pp_pack.c: Avoid ssize_t overflow when calculating the size
- of a structure
-
-If the user has requested a size that would overflow a SSize_t, then the
-only sensible thing to do is throw an exception, because the structure
-this implies couldn't possibly fit into memory anyway.
-
-CVE: CVE-2026-57432
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5f7eb6bbbe0510964e3fb1d6bb691e5445913e55]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- pod/perldiag.pod | 6 ++++++
- pp_pack.c        | 4 ++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/pod/perldiag.pod b/pod/perldiag.pod
-index 841e22d580..d9231077363d 100644
---- a/pod/perldiag.pod
-+++ b/pod/perldiag.pod
-@@ -4880,6 +4880,12 @@ mixed-case attribute name, instead.  See L<attributes>.
- (F) You can't specify a repeat count so large that it overflows your
- signed integers.  See L<perlfunc/pack>.
- 
-+=item Pack template structure size is too large
-+
-+(F) You called C<pack> or C<unpack> to operate on a structure, whose
-+computed size is too large to fit in memory.  This usually happens as a
-+result of embedding a large number as the repeat count for an item.
-+
- =item page overflow
- 
- (W io) A single call to write() produced more lines than can fit on a
-diff --git a/pp_pack.c b/pp_pack.c
-index b5c0b261ef..6075e83aac 100644
---- a/pp_pack.c
-+++ b/pp_pack.c
-@@ -528,6 +528,10 @@ S_measure_struct(pTHX_ tempsym_t* symptr)
-                 break;
-             }
-         }
-+        if ((size > 0) &&
-+                ((len > SSize_t_MAX / size) ||         /* detect overflow of len * size */
-+                 (len * size > SSize_t_MAX - total)))  /* detect overflow of total + len * size */
-+            croak("Pack template structure size is too large");
-         total += len * size;
-     }
-     return total;
--- 
-2.43.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch b/meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
deleted file mode 100644
index 273a247a88f..00000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 40754edc72dd3e513d758153c0e2f0215897740e Mon Sep 17 00:00:00 2001
-From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
-Date: Mon, 11 May 2026 12:25:33 +0100
-Subject: [PATCH] pp_pack.c: Avoid some other potential overflows when
- calculating sizes
-
-CVE: CVE-2026-57432
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/40754edc72dd3e513d758153c0e2f0215897740e]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- pp_pack.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pp_pack.c b/pp_pack.c
-index 6075e83aac..b2019902203a 100644
---- a/pp_pack.c
-+++ b/pp_pack.c
-@@ -515,12 +515,12 @@ S_measure_struct(pTHX_ tempsym_t* symptr)
-                 break;
-             case 'B':
-             case 'b':
--                len = (len + 7)/8;
-+                len = (len / 8) + !!(len % 8);
-                 size = 1;
-                 break;
-             case 'H':
-             case 'h':
--                len = (len + 1)/2;
-+                len = (len / 2) + !!(len % 2);
-                 size = 1;
-                 break;
- 
--- 
-2.43.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57433.patch b/meta/recipes-devtools/perl/files/CVE-2026-57433.patch
deleted file mode 100644
index f0ea08b1fe0..00000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-57433.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e4f681784bcdeaa91ff02a2fa4cdcae5c46779d7 Mon Sep 17 00:00:00 2001
-From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
-Date: Sat, 9 May 2026 16:47:14 +0100
-Subject: [PATCH] Storable.xs: Avoid signed int overflow when unpacking a list
- of hook data items
-
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e4f681784bcdeaa91ff02a2fa4cdcae5c46779d7]
-CVE: CVE-2026-57433
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- dist/Storable/Storable.xs | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/dist/Storable/Storable.xs b/dist/Storable/Storable.xs
-index 3930db6..62a1a6d 100644
---- a/dist/Storable/Storable.xs
-+++ b/dist/Storable/Storable.xs
-@@ -5035,7 +5035,10 @@ static SV *retrieve_hook_common(pTHX_ stcxt_t *cxt, const char *cname, int large
-         }
-         else
-             GETMARK(len3);
--        if (len3) {
-+        if (len3 == I32_MAX)
-+            /* If len3 is exactly I32_MAX it will upset av_extend below */
-+            CROAK(("Invalid count of hook data items"));
-+        else if (len3) {
-             av = newAV();
-             av_extend(av, len3 + 1);    /* Leave room for [0] */
-             AvFILLp(av) = len3;         /* About to be filled anyway */
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
deleted file mode 100644
index af94eec29cf..00000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fd23f4370d24d00352d1cc09b16687f16da6ae5b Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 12 May 2026 14:47:31 +1000
-Subject: [PATCH 1/2] perl/perl-security#147: test cases
-
-The suggested case from the ticket and an alternative.
-
-(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
-
-CVE: CVE-2026-8376
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efdafe7c51a687a4907e4887988fe6a025ef]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
----
- t/re/pat_psycho.t | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
-index 336039521d..73a7992372 100644
---- a/t/re/pat_psycho.t
-+++ b/t/re/pat_psycho.t
-@@ -10,7 +10,7 @@
- use strict;
- use warnings;
- use 5.010;
--
-+use Config;
- 
- sub run_tests;
- 
-@@ -31,7 +31,7 @@ BEGIN {
- 
- skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
- 
--plan tests => 15;  # Update this when adding/deleting tests.
-+plan tests => 17;  # Update this when adding/deleting tests.
- 
- run_tests() unless caller;
- 
-@@ -211,6 +211,20 @@ EOF
- 
- 
-     }
-+
-+  SKIP:
-+    { # sec #147
-+        $Config{ptrsize} == 4
-+          or skip "these only fail on x32 and use too much memory on x64", 2;
-+        local $::TODO = "This crashes";
-+        # original case
-+        fresh_perl_like('/\x{10000}{1073741824}/',
-+                        qr/Regexp out of space/, {}, "ssize_t overflow");
-+
-+        # synthesized but similar case
-+        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
-+                        qr/Regexp out of space/, {}, "ssize_t overflow again");
-+    }
- } # End of sub run_tests
- 
- 1;
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
deleted file mode 100644
index 39b3d510fe4..00000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 49c18d4c91d5b49e0a7cbb8277f3149198004c36 Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 12 May 2026 14:51:00 +1000
-Subject: [PATCH 2/2] perl/perl-security#147: test against the actual character
- lengths
-
-(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
-
-CVE: CVE-2026-8376
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119eb2bb1181be908701f22bf7068e722f1c]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
----
- regcomp_study.c   | 7 +++++++
- t/re/pat_psycho.t | 1 -
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/regcomp_study.c b/regcomp_study.c
-index 9106452dd5..05f1b017b1 100644
---- a/regcomp_study.c
-+++ b/regcomp_study.c
-@@ -2770,6 +2770,13 @@ Perl_study_chunk(pTHX_
-                                                (U8 *) SvEND(data->last_found))
-                                 - (U8*)s;
-                         l -= old;
-+
-+                        if (l > 0 &&
-+                            (mincount >= SSize_t_MAX / (SSize_t)l
-+                             || old > SSize_t_MAX - mincount * (SSize_t)l)) {
-+                            FAIL("Regexp out of space");
-+                        }
-+
-                         /* Get the added string: */
-                         last_str = newSVpvn_utf8(s  + old, l, UTF);
-                         last_chrs = UTF ? utf8_length((U8*)(s + old),
-diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
-index 73a7992372..9fd764fd5e 100644
---- a/t/re/pat_psycho.t
-+++ b/t/re/pat_psycho.t
-@@ -216,7 +216,6 @@ EOF
-     { # sec #147
-         $Config{ptrsize} == 4
-           or skip "these only fail on x32 and use too much memory on x64", 2;
--        local $::TODO = "This crashes";
-         # original case
-         fresh_perl_like('/\x{10000}{1073741824}/',
-                         qr/Regexp out of space/, {}, "ssize_t overflow");
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.3.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.42.0.bb
rename to meta/recipes-devtools/perl/perl_5.42.3.bb
index 886eaaaa379..1a8b0e11ee4 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.3.bb
@@ -16,13 +16,6 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
-           file://CVE-2026-8376-01.patch \
-           file://CVE-2026-8376-02.patch \
-           file://CVE-2026-13221.patch \
-           file://CVE-2026-57432-01.patch \
-           file://CVE-2026-57432-02.patch \
-           file://CVE-2026-42496.patch \
-           file://CVE-2026-57433.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
@@ -31,7 +24,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc"
+SRC_URI[perl.sha256sum] = "1137740985837b5cdf15f0cfab932279dcb4352f912fed6fc144e8b4f0823627"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
