Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T90zw-0003bw-Vx
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 23:49:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2012 14:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,369,1344236400"; d="scan'208";a="217777619"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2012 14:36:42 -0700
Message-ID: <5046746A.60004@linux.intel.com>
Date: Tue, 04 Sep 2012 14:36:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: ml@communistcode.co.uk
References: <ml@communistcode.co.uk>
	<1346775175-3963-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1346775175-3963-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/cleanup-workdir: change autoconf-nativesdk to nativesdk-autoconf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 21:49:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2012 09:12 AM, ml@communistcode.co.uk wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> the autoconf-nativesdk package name was recently changed to nativesdk-autoconf which in turn broke the cleanup-workdir script. Changed the package to the correct name.
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>   scripts/cleanup-workdir | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
> index c748846..9d161c2 100755
> --- a/scripts/cleanup-workdir
> +++ b/scripts/cleanup-workdir
> @@ -51,7 +51,7 @@ def get_cur_arch_dirs(workdir, arch_dirs):
>       pattern = workdir + '/(.*?)/'
>
>       # select thest 5 packages to get the dirs of current arch
> -    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk', 'autoconf-nativesdk']
> +    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk', 'nativesdk-autoconf']
>
>       for pkg in pkgs:
>           cmd = "bitbake -e " + pkg + " | grep ^IMAGE_ROOTFS="
>

Merged into OE-Core

Thanks
	Sau!



