Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 405AD6FEA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 08:29:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8G8Trqi029971
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 01:29:53 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 16 Sep 2014 01:29:52 -0700
Message-ID: <5417F4FE.3040007@windriver.com>
Date: Tue, 16 Sep 2014 16:29:50 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Adrian Calianu <Adrian.Calianu@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <A1661D2DDD942248A02617DE63569A0125D3C72F@SESTOEX04.enea.se>
In-Reply-To: <A1661D2DDD942248A02617DE63569A0125D3C72F@SESTOEX04.enea.se>
X-Originating-IP: [128.224.162.231]
Subject: Re: aarch64: correct path for ld-linux-aarch64.so
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
X-List-Received-Date: Tue, 16 Sep 2014 08:30:08 -0000
X-Groupsio-MsgNum: 57800
Content-Type: multipart/mixed; boundary="------------030706060201000205010803"

--------------030706060201000205010803
Content-Type: multipart/alternative;
	boundary="------------080204090604010106020704"

--------------080204090604010106020704
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014?09?16? 15:51, Adrian Calianu wrote:
> Hello,

Hi Adrian,

Sorry for late answer. I though you will begin work few hours later.

>     Building a core-image-minial with poky distro for a new aarch64 machine I found that the ld-linux-aarch64.so is stored under /lib64 folder into rootfs.
>     Due to this issue the init process doesn't start. I think the correct location is under /lib folder.

That is the toolchain issue. BASELIB has to be set to 'lib64', so 
ld-linux-aarch64.so.1 is installed to /lib instead of /lib64. Please try 
patch attached that I redefined the dynamic linker position.

Regards,
Kai

>
> Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/init.txt for guidance.
>
>     Is there any configuration that need to be done or patch for this issue?
>
> Thank you in advance,
> Adrian
>
>
>
>
>
>
>



-- 
Regards,
Neil | Kai Kang


--------------080204090604010106020704
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2014&#24180;09&#26376;16&#26085; 15:51, Adrian Calianu
      wrote:<br>
    </div>
    <blockquote
      cite="mid:A1661D2DDD942248A02617DE63569A0125D3C72F@SESTOEX04.enea.se"
      type="cite">
      <pre wrap="">Hello,
</pre>
    </blockquote>
    <br>
    Hi Adrian,<br>
    <br>
    Sorry for late answer. I though you will begin work few hours later.<br>
    <br>
    <blockquote
      cite="mid:A1661D2DDD942248A02617DE63569A0125D3C72F@SESTOEX04.enea.se"
      type="cite">
      <pre wrap="">
   Building a core-image-minial with poky distro for a new aarch64 machine I found that the ld-linux-aarch64.so is stored under /lib64 folder into rootfs.
   Due to this issue the init process doesn't start. I think the correct location is under /lib folder.</pre>
    </blockquote>
    <br>
    That is the toolchain issue. BASELIB has to be set to 'lib64', so
    ld-linux-aarch64.so.1 is installed to /lib instead of /lib64. Please
    try patch attached that I redefined the dynamic linker position.<br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
    <blockquote
      cite="mid:A1661D2DDD942248A02617DE63569A0125D3C72F@SESTOEX04.enea.se"
      type="cite">
      <pre wrap="">

Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/init.txt for guidance.

   Is there any configuration that need to be done or patch for this issue?

Thank you in advance,
Adrian





</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------080204090604010106020704--

--------------030706060201000205010803
Content-Type: text/x-patch;
	name="0001-gcc-4.9-redefine-dynamic-linker-for-aarch64.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-gcc-4.9-redefine-dynamic-linker-for-aarch64.patch"

From 35f41fd8ddb5d8e1246fff43b0c4c87f3a73495b Mon Sep 17 00:00:00 2001
From: Kai Kang <kai.kang@windriver.com>
Date: Tue, 16 Sep 2014 16:20:19 +0800
Subject: [PATCH] gcc-4.9: redefine dynamic linker for aarch64

Redefine dynamic linker for aarch64 from /lib to /lib64.

BASELIB of aarch64 has to be defined with 'lib64', then linker file
ld-linux-aarch64.so.1 is installed into /lib64 rather than /lib. So
update it here too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../0056-redefine-dynamic-linker-for-aarch64.patch | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 25778bd..c434a45 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -70,6 +70,7 @@ SRC_URI = "\
     file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
     file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
     file://0055-PR-rtl-optimization-61801.patch \
+    file://0056-redefine-dynamic-linker-for-aarch64.patch \
 "
 SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
 SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch b/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
new file mode 100644
index 0000000..6933e2f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
@@ -0,0 +1,34 @@
+From 8fbb60d89e569b68b13e4fd419e20640eb49cabc Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Tue, 16 Sep 2014 16:01:31 +0800
+Subject: [PATCH] Redefine dynamic linker for aarch64
+
+Redefine dynamic linker for aarch64 from /lib to /lib64.
+
+BASELIB of aarch64 has to be defined with 'lib64', then linker file
+ld-linux-aarch64.so.1 is installed into /lib64 rather than /lib. So
+update it here too.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ gcc/config/aarch64/aarch64-linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index a8f0771..2a6f06d 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -21,7 +21,7 @@
+ #ifndef GCC_AARCH64_LINUX_H
+ #define GCC_AARCH64_LINUX_H
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}.so.1"
++#define GLIBC_DYNAMIC_LINKER "/lib64/ld-linux-aarch64%{mbig-endian:_be}.so.1"
+ 
+ #define CPP_SPEC "%{pthread:-D_REENTRANT}"
+ 
+-- 
+1.9.1
+
-- 
1.9.1


--------------030706060201000205010803--
