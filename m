Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 65B00745D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 02:22:11 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id t192-v6so16514921itc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FuuZsPkCp6dYu8VcIyd5qbdWu3GjEn9d0GZ8JZj4a4E=;
	b=nlMmmtqy/tcKlma1bz1jBwZRQaZDp0+m6ngMnGtINePP5vTf4lTQlgjJvyFDEw65yP
	WqNlShSBM1aysFLnJ9a+TqXS6H410YDnBEkoT/+lIf3e1w86J2hOzgHG8cwQTbE+klyh
	5SlMr+727xlBJaTO1znbW5hFdK/TkomrYwDh9vBthjhoIfCCs5H5uA6sqGQ1WCG4Ud3b
	/CJabSxpeNCz+Ac/Mr2hRvZ0c9VmSSRGK0MKz213TbvJ1dmZSg6K2WSZFHV5bGfaoKF6
	jtk4a0BbwuAjzniJDIZWVbTXnJCam6UHuZlpOWzYY15nm4VDOsb4UVOw3jdbg6H38K/N
	q4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FuuZsPkCp6dYu8VcIyd5qbdWu3GjEn9d0GZ8JZj4a4E=;
	b=aIvm0BZg0Nh5uVF8J7fKSR9WiXNb3jhMBFmo+i2OXkfQ9ivEZDZykKJ+IgIFBcOguA
	Y8xDo492Z4eBctpNbn/clmt+H4fw2/avDouXGcIN6cfqyKHKkHvpteMVnvu4oAVNVGRq
	RDVsh2Waa0poTizZdY3PHK2Nbab7QaUIcEPNuSZ5cSjpWtCN3vvwCGSZ5ZzfzDdseglf
	VnJWFMsqdrnnyvrR1gLmN6Kj0d2pz9JT6dk2b3dpRW/Hl/uD4+TEUTDTMN7MFpIF39YM
	YbwS7C+6tx08QNoJwM1Ucio/knikodOmVPvzbZdPNEEdVHU2jibtRRkyWHqIFPgG4grp
	znug==
X-Gm-Message-State: ALQs6tBv0PM1ehQ75KerlMaOHSRTBO/k992FcZq6cJOqm+MOoqD2Ihvi
	HbUbItcM14LwstoFjf7pwnACYBCa
X-Google-Smtp-Source: AIpwx49kSVVuQ2eojPcEV8WpnK+hZJgliA+MuR1y5oNC4Cf1rjdleLIJh6ROR9JX00wxle3Mskpm6Q==
X-Received: by 2002:a24:ef46:: with SMTP id
	i67-v6mr2067732ith.51.1523413332014; 
	Tue, 10 Apr 2018 19:22:12 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w71sm34498iow.87.2018.04.10.19.22.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Apr 2018 19:22:11 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 21:21:54 -0500
Message-Id: <20180411022200.22277-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180411022200.22277-1-JPEWhacker@gmail.com>
References: <20180411022200.22277-1-JPEWhacker@gmail.com>
Subject: [sumo][PATCH 1/7] icecc-create-env: Allow logging to a file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2018 02:22:11 -0000

Modifies the icecc-create-env script so that it can log output to a log
file. In addition, a --debug flag is added that allows verbose logging.
Finally, the silent flag was removed since it was never used in
icecc.bbclass

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env              | 74 ++++++++++++++--------
 1 file changed, 49 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 537e38a9ba0..074c7675c0b 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -7,6 +7,24 @@
 target_paths=
 target_aliases=
 
+# Always prints, optionally to a log file
+print_output ()
+{
+    if test -n "$log_path"; then
+        echo "$@" | tee -a "$log_path"
+    else
+        echo "$@"
+    fi
+}
+
+# Only prints if the debug flag is specified
+print_debug ()
+{
+    if test -n "$debug"; then
+        print_output "$@"
+    fi
+}
+
 is_dynamic_elf ()
 {
     # Is the file an dynamically linked ELF executable?
@@ -54,6 +72,7 @@ add_alias ()
             *" $alias "*)
                 ;;
             *)
+                print_debug "Adding alias '$2' -> '$1'"
                 target_aliases="$target_aliases $alias"
                 ;;
         esac
@@ -123,17 +142,23 @@ add_file ()
     fi
 }
 
-# backward compat
-if test "$1" = "--respect-path"; then
-    shift
-fi
-
-#add a --silent switch to avoid "broken pipe" errors when calling this scipt from within OE
-if test "$1" = "--silent"; then
-    silent=1
+while test -n "$1"; do
+    case "$1" in
+        --respect-path)
+            # Ignore for backward compatability
+            ;;
+        --debug)
+            debug=1
+            ;;
+        --log)
+            do_log=1
+            ;;
+        *)
+            break
+            ;;
+    esac
     shift
-fi
-
+done
 
 added_gcc=$1
 shift
@@ -143,6 +168,11 @@ added_as=$1
 shift
 archive_name=$1
 
+if test -n "$do_log"; then
+    log_path="$archive_name.log"
+    rm -f "$log_path"
+fi
+
 if test -z "$PATCHELF"; then
     PATCHELF=`which patchelf 2> /dev/null`
 fi
@@ -150,22 +180,22 @@ if test -z "$PATCHELF"; then
     PATCHELF=`which patchelf-uninative 2> /dev/null`
 fi
 if test -z "$PATCHELF"; then
-    echo "patchelf is required"
+    print_output "patchelf is required"
     exit 1
 fi
 
 if test -z "$added_gcc" || test -z "$added_gxx" ; then
-    echo "usage: $0 <gcc_path> <g++_path>"
+    print_output "usage: $0 <gcc_path> <g++_path>"
     exit 1
 fi
 
 if ! test -x "$added_gcc" ; then
-    echo "'$added_gcc' is no executable."
+    print_output "'$added_gcc' is not executable."
     exit 1
 fi
 
 if ! test -x "$added_gxx" ; then
-    echo "'$added_gcc' is no executable."
+    print_output "'$added_gcc' is not executable."
     exit 1
 fi
 
@@ -178,7 +208,7 @@ if test -z "$added_as" ; then
     add_file /usr/bin/as /usr/bin/as
 else
     if ! test -x "$added_as" ; then
-        echo "'$added_as' is no executable."
+        print_output "'$added_as' is not executable."
         exit 1
     fi
 
@@ -206,7 +236,7 @@ if test -x /bin/true; then
 elif test -x /usr/bin/true; then
     add_file /usr/bin/true /bin/true
 else
-    echo "'true' not found"
+    print_output "'true' not found"
     exit 1
 fi
 
@@ -266,9 +296,7 @@ if test -z "$archive_name"; then
 
     #calculate md5 and use it as the archive name
     archive_name=`for i in $target_files; do test -f $tempdir/$i && $md5sum $tempdir/$i; done | sed -e 's/ .*$//' | $md5sum | sed -e 's/ .*$//'`.tar.gz || {
-        if test -z "$silent"; then
-            echo "Couldn't compute MD5 sum."
-        fi
+        print_output "Couldn't compute MD5 sum."
         exit 2
     }
     mydir=`pwd`
@@ -283,9 +311,7 @@ else
     fi
 fi
 
-if test -z "$silent"; then
-    echo "creating $archive_name"
-fi
+print_output "creating $archive_name"
 
 cd $tempdir
 # Add everything in the temp directory. Tar doesn't like to be given files with
@@ -293,9 +319,7 @@ cd $tempdir
 # the path prefix past the offending "..". This makes the archive generate
 # incorrectly
 tar -czf "$mydir/$archive_name" . || {
-    if test -z "$silent"; then
-        echo "Couldn't create archive"
-    fi
+    print_output "Couldn't create archive"
     exit 3
 }
 cd ..
-- 
2.14.3


