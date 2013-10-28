Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A61766D13A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 11:27:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 28 Oct 2013 04:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,585,1378882800"; d="scan'208";a="418436131"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 04:27:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: maxin.john@enea.com
Date: Mon, 28 Oct 2013 11:27:01 +0000
Message-ID: <1405308.mNCRLJTTTz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1382369802-10200-1-git-send-email-maxin.john@enea.com>
References: <1382369802-10200-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dropbear: update to 2013.60 version
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
X-List-Received-Date: Mon, 28 Oct 2013 11:27:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Maxin,

On Monday 21 October 2013 17:36:42 maxin.john@enea.com wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
> 
> update to latest version 2013.60
> Update 0006-dropbear-configuration-file.patch for 2013.60
> 
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  .../0001-urandom-xauth-changes-to-options.h.patch  |    0
>  .../0002-static_build_fix.patch                    |    0
>  .../0003-configure.patch                           |    0
>  .../0004-fix-2kb-keys.patch                        |    0
>  .../0005-dropbear-enable-pam.patch                 |    0
>  .../0006-dropbear-configuration-file.patch         |   22
> +++++++------------- .../0007-dropbear-fix-for-x32-abi.patch            |  
>  0
>  meta/recipes-core/dropbear/dropbear.inc            |    4 ++--
>  meta/recipes-core/dropbear/dropbear_2013.58.bb     |    6 ------
>  meta/recipes-core/dropbear/dropbear_2013.60.bb     |    6 ++++++
>  10 files changed, 16 insertions(+), 22 deletions(-)
>  rename meta/recipes-core/dropbear/{dropbear-2013.58 =>
> dropbear-2013.60}/0001-urandom-xauth-changes-to-options.h.patch (100%)
> rename meta/recipes-core/dropbear/{dropbear-2013.58 =>
> dropbear-2013.60}/0002-static_build_fix.patch (100%) rename
> meta/recipes-core/dropbear/{dropbear-2013.58 =>
> dropbear-2013.60}/0003-configure.patch (100%) rename
> meta/recipes-core/dropbear/{dropbear-2013.58 =>
> dropbear-2013.60}/0004-fix-2kb-keys.patch (100%) rename
> meta/recipes-core/dropbear/{dropbear-2013.58 =>
> dropbear-2013.60}/0005-dropbear-enable-pam.patch (100%) rename
> meta/recipes-core/dropbear/{dropbear-2013.58 =>
> dropbear-2013.60}/0006-dropbear-configuration-file.patch (56%) rename
> meta/recipes-core/dropbear/{dropbear-2013.58 =>
> dropbear-2013.60}/0007-dropbear-fix-for-x32-abi.patch (100%) delete mode
> 100644 meta/recipes-core/dropbear/dropbear_2013.58.bb create mode 100644
> meta/recipes-core/dropbear/dropbear_2013.60.bb
> 
> diff --git
> a/meta/recipes-core/dropbear/dropbear-2013.58/0001-urandom-xauth-changes-to
> -options.h.patch
> b/meta/recipes-core/dropbear/dropbear-2013.60/0001-urandom-xauth-changes-to
> -options.h.patch similarity index 100%
> rename from
> meta/recipes-core/dropbear/dropbear-2013.58/0001-urandom-xauth-changes-to-o
> ptions.h.patch rename to
> meta/recipes-core/dropbear/dropbear-2013.60/0001-urandom-xauth-changes-to-o
> ptions.h.patch diff --git
> a/meta/recipes-core/dropbear/dropbear-2013.58/0002-static_build_fix.patch
> b/meta/recipes-core/dropbear/dropbear-2013.60/0002-static_build_fix.patch
> similarity index 100%
> rename from
> meta/recipes-core/dropbear/dropbear-2013.58/0002-static_build_fix.patch
> rename to
> meta/recipes-core/dropbear/dropbear-2013.60/0002-static_build_fix.patch
> diff --git
> a/meta/recipes-core/dropbear/dropbear-2013.58/0003-configure.patch
> b/meta/recipes-core/dropbear/dropbear-2013.60/0003-configure.patch
> similarity index 100%
> rename from meta/recipes-core/dropbear/dropbear-2013.58/0003-configure.patch
> rename to meta/recipes-core/dropbear/dropbear-2013.60/0003-configure.patch
> diff --git
> a/meta/recipes-core/dropbear/dropbear-2013.58/0004-fix-2kb-keys.patch
> b/meta/recipes-core/dropbear/dropbear-2013.60/0004-fix-2kb-keys.patch
> similarity index 100%
> rename from
> meta/recipes-core/dropbear/dropbear-2013.58/0004-fix-2kb-keys.patch rename
> to meta/recipes-core/dropbear/dropbear-2013.60/0004-fix-2kb-keys.patch diff
> --git
> a/meta/recipes-core/dropbear/dropbear-2013.58/0005-dropbear-enable-pam.patc
> h
> b/meta/recipes-core/dropbear/dropbear-2013.60/0005-dropbear-enable-pam.patc
> h similarity index 100%
> rename from
> meta/recipes-core/dropbear/dropbear-2013.58/0005-dropbear-enable-pam.patch
> rename to
> meta/recipes-core/dropbear/dropbear-2013.60/0005-dropbear-enable-pam.patch
> diff --git
> a/meta/recipes-core/dropbear/dropbear-2013.58/0006-dropbear-configuration-f
> ile.patch
> b/meta/recipes-core/dropbear/dropbear-2013.60/0006-dropbear-configuration-f
> ile.patch similarity index 56%
> rename from
> meta/recipes-core/dropbear/dropbear-2013.58/0006-dropbear-configuration-fil
> e.patch rename to
> meta/recipes-core/dropbear/dropbear-2013.60/0006-dropbear-configuration-fil
> e.patch index 7e38663..fa4c8d0 100644
> ---
> a/meta/recipes-core/dropbear/dropbear-2013.58/0006-dropbear-configuration-f
> ile.patch +++
> b/meta/recipes-core/dropbear/dropbear-2013.60/0006-dropbear-configuration-f
> ile.patch @@ -1,28 +1,22 @@
>  Subject: [PATCH 6/6] dropbear configuration file
> 
>  dropbear: Change the path ("/etc/pam.d/sshd" as default) to find a pam
> configuration file \ -to "/etc/pam.d/dropbear for dropbear when enabling
> pam supporting" +to "/etc/pam.d/dropbear for dropbear when enabling pam
> supporting"
> 
> -Upstream-Status: Inappropriate [configuration]
> +Upstream-Status: Inappropriate [configuration]
> 
> +Signed-off-by: Maxin B. John <maxin.john@enea.com>
>  Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>  ---
> - svr-authpam.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/svr-authpam.c b/svr-authpam.c
> -index e84f076..e28be7d 100644
> ---- a/svr-authpam.c
> -+++ b/svr-authpam.c
> -@@ -195,7 +195,7 @@ void svr_auth_pam() {
> +diff -Naur dropbear-2013.60-orig/svr-authpam.c
> dropbear-2013.60/svr-authpam.c +---
> dropbear-2013.60-orig/svr-authpam.c	2013-10-16 16:34:53.000000000 +0200
> ++++ dropbear-2013.60/svr-authpam.c	2013-10-21 17:04:04.969416055 +0200 +@@
> -211,7 +211,7 @@
>   	userData.passwd = password;
> 
>   	/* Init pam */
>  -	if ((rc = pam_start("sshd", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS)
> { +	if ((rc = pam_start("dropbear", NULL, &pamConv, &pamHandlep)) !=
> PAM_SUCCESS) { - 		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d,
> %s\n",
> + 		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s",
>   				rc, pam_strerror(pamHandlep, rc));
>   		goto cleanup;
> ---
> -1.7.11.7
> -
> diff --git
> a/meta/recipes-core/dropbear/dropbear-2013.58/0007-dropbear-fix-for-x32-abi
> .patch
> b/meta/recipes-core/dropbear/dropbear-2013.60/0007-dropbear-fix-for-x32-abi
> .patch similarity index 100%
> rename from
> meta/recipes-core/dropbear/dropbear-2013.58/0007-dropbear-fix-for-x32-abi.p
> atch rename to
> meta/recipes-core/dropbear/dropbear-2013.60/0007-dropbear-fix-for-x32-abi.p
> atch diff --git a/meta/recipes-core/dropbear/dropbear.inc
> b/meta/recipes-core/dropbear/dropbear.inc index 9498bf8..f71f190 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -2,12 +2,12 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP
> implementation" HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
>  SECTION = "console/network"
> 
> -INC_PR = "r1"
> +INC_PR = "r0"
> 
>  # some files are from other projects and have others license terms:
>  #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5b0c2f0d0c49dfde9558ae2036683c"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=de74413ba7e05b7a37c4722e75f436cd"
> 
>  DEPENDS = "zlib"
>  RPROVIDES_${PN} = "ssh sshd"
> diff --git a/meta/recipes-core/dropbear/dropbear_2013.58.bb
> b/meta/recipes-core/dropbear/dropbear_2013.58.bb deleted file mode 100644
> index 99a24a7..0000000
> --- a/meta/recipes-core/dropbear/dropbear_2013.58.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require dropbear.inc
> -
> -SRC_URI[md5sum] = "8d3579bbbfcea48404a3219643076450"
> -SRC_URI[sha256sum] =
> "d866189b1d14e15353aeb4feb616f6132a63ea7c25ca8aa12b63a3a397822e55" -
> -PR = "${INC_PR}.0"
> diff --git a/meta/recipes-core/dropbear/dropbear_2013.60.bb
> b/meta/recipes-core/dropbear/dropbear_2013.60.bb new file mode 100644
> index 0000000..f95c3b5
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear_2013.60.bb
> @@ -0,0 +1,6 @@
> +require dropbear.inc
> +
> +SRC_URI[md5sum] = "fffa2fec0c887201bed3a3cc6df7fa35"
> +SRC_URI[sha256sum] =
> "4c0c52453b4dd96ef79e5968ed3676de008ee0cf133632acae12bbad588681bb" +
> +PR = "${INC_PR}.0"

LIC_FILES_CHKSUM has been changed by this patch and yet no comment was made in 
the commit message mentioning why. In this instance it was simply the 
copyright year changing and in any case it seems the patch has already been 
merged; however in future could you please mention exactly what prompted the 
LIC_FILES_CHKSUM change in the commit message?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

