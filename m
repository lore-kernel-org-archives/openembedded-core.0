Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ShXTw-00055u-A1
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 04:50:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jun 2012 19:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="156298029"
Received: from unknown (HELO [10.255.12.124]) ([10.255.12.124])
	by orsmga001.jf.intel.com with ESMTP; 20 Jun 2012 19:40:05 -0700
Message-ID: <4FE28985.1000501@linux.intel.com>
Date: Wed, 20 Jun 2012 19:40:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340091730-5993-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1340091730-5993-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/2] opkg-utils: bump SRCREV
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
X-List-Received-Date: Thu, 21 Jun 2012 02:50:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2012 12:42 AM, Martin Jansa wrote:
> * there are 2 small fixes
>    python-2.6 compatibility
>    missing C option for opkg-build
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../opkg-utils/opkg-utils/shr.patch                |   26 ++++++++++++++++++++
>   meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    2 +-
>   2 files changed, 27 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch
> new file mode 100644
> index 0000000..29de962
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch

Martin,

No Upstream-Status or Signed-off-by

Please fix this

Thanks
	Sau!

> @@ -0,0 +1,26 @@
> +diff --git a/opkg-build b/opkg-build
> +index 012afd3..485897a 100755
> +--- a/opkg-build
> ++++ b/opkg-build
> +@@ -160,7 +160,7 @@ outer=ar
> + noclean=0
> + opkext=0
> + usage="Usage: $0 [-c] [-C] [-O] [-o owner] [-g group]<pkg_directory>  [<destination_directory>]"
> +-while getopts "cg:ho:vO" opt; do
> ++while getopts "cCg:ho:vO" opt; do
> +     case $opt in
> + 	o ) owner=$OPTARG
> + 	    ogargs="--owner=$owner"
> +diff --git a/opkg-make-index b/opkg-make-index
> +index 22393e8..1c3a8e1 100755
> +--- a/opkg-make-index
> ++++ b/opkg-make-index
> +@@ -186,7 +186,7 @@ if packages_filename:
> +      gzip_filename = ("%s.gz" % packages_filename)
> +      tmp_gzip_filename = ("%s.%d" % (gzip_filename, os.getpid()))
> +      gzip_cmd = "gzip -9c<  %s>  %s" % (tmp_packages_filename, tmp_gzip_filename)
> +-     rc = subprocess.check_output(gzip_cmd, shell=True)
> ++     subprocess.call(gzip_cmd, shell=True)
> +      os.rename(tmp_packages_filename, packages_filename)
> +      os.rename(tmp_gzip_filename, gzip_filename)
> +
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 1996c75..b193ba4 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                       file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
>   RDEPENDS_${PN} = "python"
>   RDEPENDS_${PN}_virtclass-native = ""
> -SRCREV = "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
> +SRCREV = "423ecd36b4782327c16f516885d1248249c7724a"
>   PV = "0.1.8+git${SRCPV}"
>   PR = "r1"
>


