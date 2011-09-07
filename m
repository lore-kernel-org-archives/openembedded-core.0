Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1R1CZX-0000Xh-MK
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 09:29:25 +0200
Received: by wyf19 with SMTP id 19so5300624wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Sep 2011 00:24:14 -0700 (PDT)
Received: by 10.216.209.11 with SMTP id r11mr33735weo.3.1315380254464;
	Wed, 07 Sep 2011 00:24:14 -0700 (PDT)
Received: from powerbook-wlan.dominion.void (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id fq9sm2693046wbb.15.2011.09.07.00.24.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 00:24:13 -0700 (PDT)
Message-Id: <4FFF6451-404D-4DC3-AB4A-4890C8CA166C@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <82477f26f43776abf9e74c026cf8f8984160a172.1315371674.git.sgw@linux.intel.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 7 Sep 2011 09:24:11 +0200
References: <cover.1315371674.git.sgw@linux.intel.com>
	<82477f26f43776abf9e74c026cf8f8984160a172.1315371674.git.sgw@linux.intel.com>
X-Mailer: Apple Mail (2.936)
Subject: Re: [PATCH 1/1] gcc: add patch for ice 50099, which caused lttng-ust not to build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 07 Sep 2011 07:29:26 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 7 sep 2011, om 07:03 heeft Saul Wold het volgende geschreven:

> [YOCTO #1381]
>
> This patch came from from GCC Bugzilla via Khem
>
> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
> .../gcc/gcc-4.6/fix-for-ice-50099.patch            |   38 +++++++++++ 
> +++++++++
> 2 files changed, 40 insertions(+), 1 deletions(-)
> create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fix-for- 
> ice-50099.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes- 
> devtools/gcc/gcc-4.6.inc
> index 380f9f7..f7bcf30 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
> require gcc-common.inc
>
> -PR = "r9"
> +PR = "r10"
>
> # Third digit in PV should be incremented after a minor release
> # happens from this branch on gcc e.g. currently its 4.6.0
> @@ -67,6 +67,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/ 
> branches;module=${BRANCH};proto=http \
>            file://volatile_access_backport.patch \
>            file://use-defaults.h-and-t-oe-in-B.patch \
> 	   file://powerpc-e5500.patch \
> +           file://fix-for-ice-50099.patch \
> 	  "
>
> SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/fix-for- 
> ice-50099.patch b/meta/recipes-devtools/gcc/gcc-4.6/fix-for- 
> ice-50099.patch
> new file mode 100644
> index 0000000..4b9f70d
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch
> @@ -0,0 +1,38 @@
> +Index: gcc/config/arm/arm.md
> +===================================================================
> +--- gcc-4.6.0/gcc/config/arm/arm.md	(revision 178135)
> ++++ gcc-4.6.0/gcc/config/arm/arm.md	(working copy)

Where's the patch header for this patch with e.g. upstream status?


