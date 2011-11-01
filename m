Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLIR4-000885-JX for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 18:47:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1HfbQK004844
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 17:41:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04750-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2011 17:41:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1HY2k3004165
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 17:41:30 GMT
Message-ID: <1320169288.20107.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 Nov 2011 17:41:28 +0000
In-Reply-To: <377fce979410d7c10e766353ea5e95ec62ddbaf7.1319793342.git.xiaofeng.yan@windriver.com>
References: <cover.1319793342.git.xiaofeng.yan@windriver.com>
	<377fce979410d7c10e766353ea5e95ec62ddbaf7.1319793342.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] libarchive update to 2.8.5
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
X-List-Received-Date: Tue, 01 Nov 2011 17:47:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-28 at 17:21 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> Modify md5 sum justly
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  .../libarchive/libarchive_2.8.5.bb                 |   27 ++++++++++++++++++++
>  1 files changed, 27 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive_2.8.5.bb
> 
> diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
> new file mode 100644
> index 0000000..1bc49e2
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "C library and command-line tools for reading and writing tar, cpio, zip, ISO, and other archive formats"
> +HOMEPAGE = "http://code.google.com/p/libarchive/"
> +SECTION = "devel"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4255e2e6f0349a4ac8fbd68459296e46"
> +PR = "r0"
> +
> +DEPENDS = "libxml2"
> +
> +# We need to repack the tarball due undistributable content on the upstream one.
> +# More details at http://code.google.com/p/libarchive/issues/detail?id=162
> +SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
> +           file://0001-Patch-from-upstream-revision-1990.patch \
> +           file://0002-Patch-from-upstream-revision-1991.patch \
> +           file://0004-Patch-from-upstream-rev-2514.patch \
> +           file://0005-Patch-from-upstream-rev-2520.patch \
> +           file://0006-Patch-from-upstream-rev-2521.patch \
> +           file://0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch \
> +           "
> +
> +SRC_URI[md5sum] = "9caf51dcf6213e9c9f5a1c27448b9c90"
> +SRC_URI[sha256sum] = "13993e0ffbd121ccda46ea226b1f8eac218de0fa8da7d8b1f998093d5c32a72d"
> +
> +inherit autotools lib_package
> +
> +BBCLASSEXTEND = "nativesdk"

Why do we still need libarchive 2.8.4 ?

Was the licence issue with the 2.8.4 tarball fixed in 2.8.5?

Cheers,

Richard




