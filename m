Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2DB78432
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:17 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id i144so4452362ita.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cevAhEhNNpIDufR0Pd33u9kBiD3+hLtTWHQXYiUXKfs=;
	b=skZZ+e9om4IFWpI0Moj/JBvwRaNcEJS+Dyd7fG790XHwwndoD7qkpxbWpnWhw33MCe
	zvhhkfwzjk2SOEq03OFjAM040CcUL37b34FR1Eb08EJtxcpbCkxuQFjQiuewnjGxsrnu
	Dn+6/LE6Pj/V1SQMgnKHuBBYcV0zDkybJg+tizKI/2MG2zp0iDJW5NQDp1lc5Aq8mbkv
	oaToQwuQB/e4cLCXW5U3OG20z+P/s5RA69c/ZHKDQN5LWrShlbfNfP1IKXsR+1DwgGPf
	blAJChw3BMzW2/tsDD3AojJcuIPRRSASFanp6TdFeWJWYnW6WOsQrr2SrRjweusY2nvk
	Gbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cevAhEhNNpIDufR0Pd33u9kBiD3+hLtTWHQXYiUXKfs=;
	b=J3zNNn7uS7S8zAzRFojKA5h24RYzKm2GNoPUNllKpY8AWNHtyqANSVZnf/sAb01PpM
	UMpDdKY5OZMnlGezCwwc4ot2RDoF1BZXdnBwv5GZmjyj7SKmLU8T/MzQvNRmEFqY/dfU
	PFCUJFLeBFHnhjMQH1SDu1XZswWEOHJvaA7ou/5JrEfBH+MqLCiiW2H1+O5/wAU36ggr
	SsAcRI0Ah8BSlPDp5w0d3XVYy7qlTbHn/kZFqjoIN1Fbcnl1Q12rbs2cxgfAB3i1hNX3
	yDEwmmvxQQziexoQtXv5/2qwCctxn91hi/SwkcFY+APb0CDH+e2ZAgAdG/F8/QpFxNj0
	aJJw==
X-Gm-Message-State: APf1xPAfw2KEYl7Z4CeyuOnCXaCkzxhrwh7+xMScErHaExzqPZzSUPQZ
	RDGVGjFFTBEQ5MzB66bA/IHhhwfS
X-Google-Smtp-Source: AH8x225vx3FPbqt9S4X/hV+hSYXhOZMucX35Oer2vEbm3QtyItXMK+UJryhn0+MbtaxLJyL86T01Yg==
X-Received: by 10.36.86.134 with SMTP id o128mr4940128itb.56.1517954598688;
	Tue, 06 Feb 2018 14:03:18 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:17 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:23 -0600
Message-Id: <baed5c67b1396326460b4a519b83a1cf18657d5f.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 04/14] icecc-create-env: Reformat
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:17 -0000

The environment script used an annoying mix of tabs and spaces, and no
mapping of tabs to spaces would produce pleasant indentation. Reformat
to eliminate tab characters and settle on 4 spaces for indentation
(which matches the upstream icecream script from which this is derived)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env              | 208 ++++++++++-----------
 1 file changed, 104 insertions(+), 104 deletions(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 7e4dbc414e7..723f1f9bd90 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -8,63 +8,63 @@ target_files=
 
 is_contained ()
 {
-  case " $target_files " in
-    *" $1 "* ) return 0 ;;
-    *"=$1 "* ) return 0;;
-    * ) return 1 ;;
-  esac
+    case " $target_files " in
+        *" $1 "* ) return 0 ;;
+        *"=$1 "* ) return 0;;
+        * ) return 1 ;;
+    esac
 }
 
 add_file ()
 {
-  local name="$1"
-  local path="$1";
-  if test -n "$2"; then
-    name="$2"
-  fi
-  test -z "$name" && return
-  # ls -H isn't really the same as readlink, but
-  # readlink is not portable enough.
-  path=`ls -H $path`
-  toadd="$name=$path"
-  is_contained "$toadd" && return
-  if test -z "$silent"; then
-  echo "adding file $toadd"
-  fi
-  target_files="$target_files $toadd"
-  if test -x "$path"; then
-    # Only call ldd when it makes sense
-    if file -L "$path" | grep 'ELF' > /dev/null 2>&1; then
-	if ! file -L "$path" | grep 'static' > /dev/null 2>&1; then
-	   # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl based glibc
-		# this regexp parse the outputs like:
-		# ldd /usr/bin/gcc
-		#         linux-gate.so.1 =>  (0xffffe000)
-		#         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
-		#         /lib/ld-linux.so.2 (0xb7fe8000)
-		# covering both situations ( with => and without )
-          for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`; do
-	    test -f "$lib" || continue
-	    # Check wether the same library also exists in the parent directory,
-	    # and prefer that on the assumption that it is a more generic one.
-	    local baselib=`echo "$lib" | sed 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
-	    test -f "$baselib" && lib=$baselib
-	  add_file "$lib"
-        done
-      fi
+    local name="$1"
+    local path="$1";
+    if test -n "$2"; then
+        name="$2"
+    fi
+    test -z "$name" && return
+    # ls -H isn't really the same as readlink, but
+    # readlink is not portable enough.
+    path=`ls -H $path`
+    toadd="$name=$path"
+    is_contained "$toadd" && return
+    if test -z "$silent"; then
+        echo "adding file $toadd"
+    fi
+    target_files="$target_files $toadd"
+    if test -x "$path"; then
+        # Only call ldd when it makes sense
+        if file -L "$path" | grep 'ELF' > /dev/null 2>&1; then
+            if ! file -L "$path" | grep 'static' > /dev/null 2>&1; then
+                # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl based glibc
+                # this regexp parse the outputs like:
+                # ldd /usr/bin/gcc
+                #         linux-gate.so.1 =>  (0xffffe000)
+                #         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
+                #         /lib/ld-linux.so.2 (0xb7fe8000)
+                # covering both situations ( with => and without )
+                for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`; do
+                    test -f "$lib" || continue
+                    # Check wether the same library also exists in the parent directory,
+                    # and prefer that on the assumption that it is a more generic one.
+                    local baselib=`echo "$lib" | sed 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
+                    test -f "$baselib" && lib=$baselib
+                    add_file "$lib"
+                done
+            fi
+        fi
     fi
-  fi
 }
 
 # backward compat
 if test "$1" = "--respect-path"; then
-  shift
+    shift
 fi
 
 #add a --silent switch to avoid "broken pipe" errors when calling this scipt from within OE
 if test "$1" = "--silent"; then
- silent=1
- shift
+    silent=1
+    shift
 fi
 
 
@@ -77,18 +77,18 @@ shift
 archive_name=$1
 
 if test -z "$added_gcc" || test -z "$added_gxx" ; then
-	echo "usage: $0 <gcc_path> <g++_path>"
-	exit 1
+    echo "usage: $0 <gcc_path> <g++_path>"
+    exit 1
 fi
 
 if ! test -x "$added_gcc" ; then
-  echo "'$added_gcc' is no executable."
-  exit 1
+    echo "'$added_gcc' is no executable."
+    exit 1
 fi
 
 if ! test -x "$added_gxx" ; then
-  echo "'$added_gcc' is no executable."
-  exit 1
+    echo "'$added_gcc' is no executable."
+    exit 1
 fi
 
 
@@ -97,51 +97,51 @@ add_file $added_gcc /usr/bin/gcc
 add_file $added_gxx /usr/bin/g++
 
 if test -z "$added_as" ; then
- add_file /usr/bin/as /usr/bin/as
+    add_file /usr/bin/as /usr/bin/as
 else
- if ! test -x "$added_as" ; then
-  echo "'$added_as' is no executable."
-  exit 1
- fi
+    if ! test -x "$added_as" ; then
+        echo "'$added_as' is no executable."
+        exit 1
+    fi
 
- add_file $added_as  /usr/bin/as
+    add_file $added_as  /usr/bin/as
 fi
 
 add_file `$added_gcc -print-prog-name=cc1` /usr/bin/cc1
 add_file `$added_gxx -print-prog-name=cc1plus` /usr/bin/cc1plus
 specfile=`$added_gcc -print-file-name=specs`
 if test -n "$specfile" && test -e "$specfile"; then
-  add_file "$specfile"
+    add_file "$specfile"
 fi
 
 ltofile=`$added_gcc -print-prog-name=lto1`
 pluginfile="${ltofile%lto1}liblto_plugin.so"
 if test -r "$pluginfile"
 then
-  add_file $pluginfile  ${pluginfile#*usr}
-  add_file $pluginfile  /usr${pluginfile#*usr}
+    add_file $pluginfile  ${pluginfile#*usr}
+    add_file $pluginfile  /usr${pluginfile#*usr}
 fi
 
 tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
 new_target_files=
 for i in $target_files; do
- case $i in
-   *=/*)
-    target=`echo $i | cut -d= -f1`
-    path=`echo $i | cut -d= -f2`
-    ;;
-   *)
-    path=$i
-    target=$i
-    ;;
-  esac
-  mkdir -p $tempdir/`dirname $target`
-  cp -p $path $tempdir/$target
-  if test -f $tempdir/$target -a -x $tempdir/$target; then
-    strip -s $tempdir/$target 2>/dev/null
-  fi
-  target=`echo $target | cut -b2-`
-  new_target_files="$new_target_files $target"
+    case $i in
+        *=/*)
+            target=`echo $i | cut -d= -f1`
+            path=`echo $i | cut -d= -f2`
+            ;;
+        *)
+            path=$i
+            target=$i
+            ;;
+    esac
+    mkdir -p $tempdir/`dirname $target`
+    cp -p $path $tempdir/$target
+    if test -f $tempdir/$target -a -x $tempdir/$target; then
+        strip -s $tempdir/$target 2>/dev/null
+    fi
+    target=`echo $target | cut -b2-`
+    new_target_files="$new_target_files $target"
 done
 
 #sort the files
@@ -150,43 +150,43 @@ target_files=`for i in $new_target_files; do echo $i; done | sort`
 #test if an archive name was supplied
 #if not use the md5 of all files as the archive name
 if test -z "$archive_name"; then
-  md5sum=NONE
-  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
-    if test -x $file; then
-      md5sum=$file
-      break
-    fi
-  done
-
-  #calculate md5 and use it as the archive name
-  archive_name=`for i in $target_files; do test -f $tempdir/$i && $md5sum $tempdir/$i; done | sed -e 's/ .*$//' | $md5sum | sed -e 's/ .*$//'`.tar.gz || {
-    if test -z "$silent"; then
-     echo "Couldn't compute MD5 sum."
-    fi
-    exit 2
-  }
-  mydir=`pwd`
+    md5sum=NONE
+    for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
+        if test -x $file; then
+            md5sum=$file
+            break
+        fi
+    done
+
+    #calculate md5 and use it as the archive name
+    archive_name=`for i in $target_files; do test -f $tempdir/$i && $md5sum $tempdir/$i; done | sed -e 's/ .*$//' | $md5sum | sed -e 's/ .*$//'`.tar.gz || {
+        if test -z "$silent"; then
+            echo "Couldn't compute MD5 sum."
+        fi
+        exit 2
+    }
+    mydir=`pwd`
 else
-  mydir="`dirname "$archive_name"`"
+    mydir="`dirname "$archive_name"`"
 
-  #check if we have a full path or only a filename
-  if test "$mydir" = "." ; then
-    mydir=`pwd`
-  else
-    mydir=""
-  fi
+    #check if we have a full path or only a filename
+    if test "$mydir" = "." ; then
+        mydir=`pwd`
+    else
+        mydir=""
+    fi
 fi
 
 if test -z "$silent"; then
-echo "creating $archive_name"
+    echo "creating $archive_name"
 fi
 
 cd $tempdir
 tar -czhf "$mydir/$archive_name" $target_files || {
- if test -z "$silent"; then
-  echo "Couldn't create archive"
- fi
-  exit 3
+    if test -z "$silent"; then
+        echo "Couldn't create archive"
+    fi
+    exit 3
 }
 cd ..
 rm -rf $tempdir
-- 
2.14.3


