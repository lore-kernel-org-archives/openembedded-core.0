Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 28033782C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:31:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2017 14:31:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,410,1498546800"; 
	d="diff'?scan'208";a="1186643112"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2017 14:31:19 -0700
To: openembedded-core@lists.openembedded.org
References: <20170821213116.26081-1-anibal.limon@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <a334bad6-70b2-199f-4b11-ef9be061f39d@linux.intel.com>
Date: Mon, 21 Aug 2017 16:32:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170821213116.26081-1-anibal.limon@linux.intel.com>
Cc: jagadeesh.krishnanjanappa@caviumnetworks.com
Subject: Re: [PATCH 1/2] apt: Upgrade to 1.2.24
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
X-List-Received-Date: Mon, 21 Aug 2017 21:31:31 -0000
X-Groupsio-MsgNum: 101771
Content-Type: multipart/mixed; boundary="------------182FC88C16AE11052377144F"
Content-Language: en-US

--------------182FC88C16AE11052377144F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Here is the diff of the GPL license,

Cheers,
Anibal

On 08/21/2017 04:31 PM, Aníbal Limón wrote:
> The LIC_FILES_CHKSUM changed because the license file now has
> style changes in the text remains GPLv2+.
> 
> The patch Revert-always-run-dpkg-configure-a-at-the-end-of-our
> was updated because now the precision fields use floating
> point numbers.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  .../{apt-native_1.2.12.bb => apt-native_1.2.24.bb} |  0
>  meta/recipes-devtools/apt/apt.inc                  |  8 ++++----
>  ...ys-run-dpkg-configure-a-at-the-end-of-our.patch | 24 +++++++++++-----------
>  .../apt/{apt_1.2.12.bb => apt_1.2.24.bb}           |  0
>  4 files changed, 16 insertions(+), 16 deletions(-)
>  rename meta/recipes-devtools/apt/{apt-native_1.2.12.bb => apt-native_1.2.24.bb} (100%)
>  rename meta/recipes-devtools/apt/{apt_1.2.12.bb => apt_1.2.24.bb} (100%)
> 
> diff --git a/meta/recipes-devtools/apt/apt-native_1.2.12.bb b/meta/recipes-devtools/apt/apt-native_1.2.24.bb
> similarity index 100%
> rename from meta/recipes-devtools/apt/apt-native_1.2.12.bb
> rename to meta/recipes-devtools/apt/apt-native_1.2.24.bb
> diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
> index 30263708444..f1cde3068da 100644
> --- a/meta/recipes-devtools/apt/apt.inc
> +++ b/meta/recipes-devtools/apt/apt.inc
> @@ -2,7 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
>  LICENSE = "GPLv2.0+"
>  SECTION = "base"
>  
> -SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
> +SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
>             file://use-host.patch \
>             file://makerace.patch \
>             file://no-nls-dpkg.patch \
> @@ -14,9 +14,9 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/
>             file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
>             file://0001-apt-1.2.12-Fix-musl-build.patch \
>             "
> -SRC_URI[md5sum] = "80f6f0ef110a45a7e5af8a9d233fb0e7"
> -SRC_URI[sha256sum] = "e820d27cba73476df4abcff27dadd1b5847474bfe85f7e9202a9a07526973ea6"
> -LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
> +SRC_URI[md5sum] = "ce8f9ab11f4fd0a08ec73eaffd75c8f0"
> +SRC_URI[sha256sum] = "fa1311a9ce00e72379a0a3bc6d240ba30c0968cfbbb3472859e50b99e24e9598"
> +LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  # the package is taken from snapshots.debian.org; that source is static and goes stale
>  # so we check the latest upstream from a directory that does get updated
> diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
> index b3a883bae88..734ba00d4f2 100644
> --- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
> +++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
> @@ -22,10 +22,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
>   3 files changed, 11 insertions(+), 18 deletions(-)
>  
>  diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
> -index 834cb0e..84ded3a 100644
> +index 533d9b367..6ce81bbd9 100644
>  --- a/apt-pkg/deb/dpkgpm.cc
>  +++ b/apt-pkg/deb/dpkgpm.cc
> -@@ -1037,12 +1037,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
> +@@ -1041,12 +1041,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
>   	 PackagesTotal++;
>         }
>      }
> @@ -38,7 +38,7 @@ index 834cb0e..84ded3a 100644
>   }
>                                                                           /*}}}*/
>   bool pkgDPkgPM::Go(int StatusFd)
> -@@ -1250,8 +1244,9 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
> +@@ -1268,8 +1262,9 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
>   
>      // support subpressing of triggers processing for special
>      // cases like d-i that runs the triggers handling manually
> @@ -50,7 +50,7 @@ index 834cb0e..84ded3a 100644
>   
>      // for the progress
>  diff --git a/test/integration/test-apt-progress-fd-deb822 b/test/integration/test-apt-progress-fd-deb822
> -index 58fd732..3359762 100755
> +index a8d59608d..0c6a9bbbf 100755
>  --- a/test/integration/test-apt-progress-fd-deb822
>  +++ b/test/integration/test-apt-progress-fd-deb822
>  @@ -27,36 +27,36 @@ Message: Installing testing (amd64)
> @@ -69,19 +69,19 @@ index 58fd732..3359762 100755
>   
>   Status: progress
>   Package: testing:amd64
> --Percent: 50
> -+Percent: 60
> +-Percent: 50.0000
> ++Percent: 60.0000
>   Message: Preparing to configure testing (amd64)
>   
>   Status: progress
> --Percent: 50
> -+Percent: 60
> +-Percent: 50.0000
> ++Percent: 60.0000
>   Message: Running dpkg
>   
>   Status: progress
>   Package: testing:amd64
> --Percent: 50
> -+Percent: 60
> +-Percent: 50.0000
> ++Percent: 60.0000
>   Message: Configuring testing (amd64)
>   
>   Status: progress
> @@ -98,7 +98,7 @@ index 58fd732..3359762 100755
>   
>   Status: progress
>  diff --git a/test/integration/test-no-fds-leaked-to-maintainer-scripts b/test/integration/test-no-fds-leaked-to-maintainer-scripts
> -index d86e638..ef6d23b 100755
> +index d86e638cd..ef6d23be2 100755
>  --- a/test/integration/test-no-fds-leaked-to-maintainer-scripts
>  +++ b/test/integration/test-no-fds-leaked-to-maintainer-scripts
>  @@ -59,8 +59,7 @@ startup packages configure
> @@ -122,5 +122,5 @@ index d86e638..ef6d23b 100755
>   checkpurge
>   
>  -- 
> -2.1.4
> +2.11.0
>  
> diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.24.bb
> similarity index 100%
> rename from meta/recipes-devtools/apt/apt_1.2.12.bb
> rename to meta/recipes-devtools/apt/apt_1.2.24.bb
> 

--------------182FC88C16AE11052377144F
Content-Type: text/x-diff;
 name="GPL.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="GPL.diff"

--- COPYING.GPL	2017-08-21 14:30:28.498600594 -0500
+++ /home/alimon/repos/poky/build/tmp/work/x86_64-linux/apt-native/1.2.24-r0/apt-1.2.24/COPYING.GPL	2017-06-19 07:02:43.000000000 -0500
@@ -1,8 +1,8 @@
 		    GNU GENERAL PUBLIC LICENSE
 		       Version 2, June 1991
 
- Copyright (C) 1989, 1991 Free Software Foundation, Inc.
-                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.
 
@@ -15,7 +15,7 @@
 General Public License applies to most of the Free Software
 Foundation's software and to any other program whose authors commit to
 using it.  (Some other Free Software Foundation software is covered by
-the GNU Library General Public License instead.)  You can apply it to
+the GNU Lesser General Public License instead.)  You can apply it to
 your programs, too.
 
   When we speak of free software, we are referring to freedom, not
@@ -291,7 +291,7 @@
 the "copyright" line and a pointer to where the full notice is found.
 
     <one line to give the program's name and a brief idea of what it does.>
-    Copyright (C) 19yy  <name of author>
+    Copyright (C) <year>  <name of author>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
@@ -303,17 +303,16 @@
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
 
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-
+    You should have received a copy of the GNU General Public License along
+    with this program; if not, write to the Free Software Foundation, Inc.,
+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 Also add information on how to contact you by electronic and paper mail.
 
 If the program is interactive, make it output a short notice like this
 when it starts in an interactive mode:
 
-    Gnomovision version 69, Copyright (C) 19yy name of author
+    Gnomovision version 69, Copyright (C) year name of author
     Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
     This is free software, and you are welcome to redistribute it
     under certain conditions; type `show c' for details.
@@ -336,5 +335,5 @@
 This General Public License does not permit incorporating your program into
 proprietary programs.  If your program is a subroutine library, you may
 consider it more useful to permit linking proprietary applications with the
-library.  If this is what you want to do, use the GNU Library General
+library.  If this is what you want to do, use the GNU Lesser General
 Public License instead of this License.

--------------182FC88C16AE11052377144F--
