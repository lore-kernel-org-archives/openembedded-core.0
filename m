Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1SrDIp-0006Fg-MR
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 21:19:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6HGd6t5025660
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:39:06 -0700 (PDT)
Received: from [128.224.147.212] (128.224.147.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 17 Jul 2012 09:39:06 -0700
Message-ID: <500594C1.2080304@windriver.com>
Date: Tue, 17 Jul 2012 12:37:21 -0400
From: Aws Ismail <aws.ismail@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.147.212]
Subject: [PATCH] Fix for psplash segmentation fault
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: aws.ismail@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 19:19:24 -0000
Content-Type: multipart/alternative;
	boundary="------------050907010300060805090702"

--------------050907010300060805090702
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Fix psplash segmentation fault

This fixes the segmentation fault when calling:
psplash -a

The -a option requires a rotation angle to be given
and if it is missing then the user is shown the correct usage.

Signed-off-by: Aws Ismail <aws.ismail@windriver.com>

diff --git 
a/meta/recipes-core/psplash/files/psplash-fix-angle-argv-segfault.patch 
b/meta/recipes-core/psplash/files/psplash-fix-angle-argv-s
new file mode 100644
index 0000000..797fe48
--- /dev/null
+++ b/meta/recipes-core/psplash/files/psplash-fix-angle-argv-segfault.patch
@@ -0,0 +1,27 @@
+Fix psplash segmentation fault
+
+This fixes the segmentation fault when calling:
+psplash -a
+
+The -a option requires a rotation angle to be given
+and if it is missing then the user is shown the correct usage.
+
+From: git://git.yoctoproject.org/psplash
+
+Upstream-Status: Submitted
+
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/psplash.c b/psplash.c
+index 0158628..09cf0d0 100644
+--- a/psplash.c
++++ b/psplash.c
+@@ -219,7 +219,7 @@ main (int argc, char** argv)
+
+       if (!strcmp(argv[i],"-a") || !strcmp(argv[i],"--angle"))
+         {
+-        if (++i > argc) goto fail;
++        if (++i >= argc) goto fail;
+         angle = atoi(argv[i]);
+         continue;
+       }
diff --git a/meta/recipes-core/psplash/psplash_git.bb 
b/meta/recipes-core/psplash/psplash_git.bb
index 0d88a60..06f8a9c 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -11,6 +11,7 @@ PR = "r2"

  SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
file://psplash-init \
+ file://psplash-fix-angle-argv-segfault.patch \
             ${SPLASH_IMAGES}"

  SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"


--------------050907010300060805090702
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-text-flowed" style="font-family: -moz-fixed;
      font-size: 13px;" lang="x-western">Fix psplash segmentation fault
      <br>
      <br>
      This fixes the segmentation fault when calling:
      <br>
      psplash -a
      <br>
      <br>
      The -a option requires a rotation angle to be given
      <br>
      and if it is missing then the user is shown the correct usage.
      <br>
      <br>
      Signed-off-by: Aws Ismail <a class="moz-txt-link-rfc2396E"
        href="mailto:aws.ismail@windriver.com">&lt;aws.ismail@windriver.com&gt;</a>
      <br>
      <br>
      diff --git
      a/meta/recipes-core/psplash/files/psplash-fix-angle-argv-segfault.patch
      b/meta/recipes-core/psplash/files/psplash-fix-angle-argv-s
      <br>
      new file mode 100644
      <br>
      index 0000000..797fe48
      <br>
      --- /dev/null
      <br>
      +++
      b/meta/recipes-core/psplash/files/psplash-fix-angle-argv-segfault.patch
      <br>
      @@ -0,0 +1,27 @@
      <br>
      +Fix psplash segmentation fault
      <br>
      +
      <br>
      +This fixes the segmentation fault when calling:
      <br>
      +psplash -a
      <br>
      +
      <br>
      +The -a option requires a rotation angle to be given
      <br>
      +and if it is missing then the user is shown the correct usage.
      <br>
      +
      <br>
      +From: git://git.yoctoproject.org/psplash
      <br>
      +
      <br>
      +Upstream-Status: Submitted
      <br>
      +
      <br>
      +Signed-off-by: Aws Ismail <a class="moz-txt-link-rfc2396E"
        href="mailto:aws.ismail@windriver.com">&lt;aws.ismail@windriver.com&gt;</a>
      <br>
      +
      <br>
      +diff --git a/psplash.c b/psplash.c
      <br>
      +index 0158628..09cf0d0 100644
      <br>
      +--- a/psplash.c
      <br>
      ++++ b/psplash.c
      <br>
      +@@ -219,7 +219,7 @@ main (int argc, char** argv)
      <br>
      +
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!strcmp(argv[i],"-a") || !strcmp(argv[i],"--angle"))
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
      <br>
      +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (++i &gt; argc) goto fail;
      <br>
      ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (++i &gt;= argc) goto fail;
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; angle = atoi(argv[i]);
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
      <br>
      diff --git a/meta/recipes-core/psplash/psplash_git.bb
      b/meta/recipes-core/psplash/psplash_git.bb
      <br>
      index 0d88a60..06f8a9c 100644
      <br>
      --- a/meta/recipes-core/psplash/psplash_git.bb
      <br>
      +++ b/meta/recipes-core/psplash/psplash_git.bb
      <br>
      @@ -11,6 +11,7 @@ PR = "r2"
      <br>
      <br>
      &nbsp;SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext"
        href="file://psplash-init">file://psplash-init</a> \
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext"
        href="file://psplash-fix-angle-argv-segfault.patch">file://psplash-fix-angle-argv-segfault.patch</a>
      \
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${SPLASH_IMAGES}"
      <br>
      <br>
      &nbsp;SPLASH_IMAGES = <a class="moz-txt-link-rfc2396E"
        href="file://psplash-poky-img.h;outsuffix=default">"file://psplash-poky-img.h;outsuffix=default"</a>
      <br>
      <br>
    </div>
  </body>
</html>

--------------050907010300060805090702--
