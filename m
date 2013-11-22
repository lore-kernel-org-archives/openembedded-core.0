Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1126AE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 18:49:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2013 10:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,753,1378882800"; d="scan'208";a="438184565"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2013 10:49:48 -0800
Message-ID: <528FA74C.1030500@linux.intel.com>
Date: Fri, 22 Nov 2013 10:49:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1385018903-24196-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1385018903-24196-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [dora][PATCH] openssl: Fix pod2man des.pod error
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
X-List-Received-Date: Fri, 22 Nov 2013 18:49:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/2013 11:28 PM, Mark Hatle wrote:
> From: Baogen Shang <baogen.shang@windriver.com>
>
> formatting fix, =back is required before =head1 on Ubuntu 12.04.
>
> Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> ---
>   .../openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch   | 12 ++++++++++++
>   meta/recipes-connectivity/openssl/openssl_1.0.1e.bb          |  3 ++-
>   2 files changed, 14 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
> new file mode 100644
> index 0000000..512cde4
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
> @@ -0,0 +1,12 @@
> +diff -urpN a_origin/des.pod b_modify/des.pod
> +--- a_origin/crypto/des/des.pod	2013-08-15 15:02:56.211674589 +0800
> ++++ b_modify/crypto/des/des.pod	2013-08-15 15:04:14.439674580 +0800
> +@@ -181,6 +181,8 @@ the uuencoded file to embed in the begin
> + output.  If there is no name specified after the B<-u>, the name text.des
> + will be embedded in the header.
> +
> ++=back
> ++
> + =head1 SEE ALSO
> +
> + ps(1),
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> index ac27dba..64ec426 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> @@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
>
>   CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>

No PR bump please

Sau!

>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
>
> @@ -34,6 +34,7 @@ SRC_URI += "file://configure-targets.patch \
>               file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
>               file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch \
>               file://find.pl \
> +            file://openssl-fix-des.pod-error.patch \
>              "
>
>   SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
>

