Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9YSk-0007CH-DL
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 11:33:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Sep 2012 02:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,379,1344236400"; d="scan'208";a="218787730"
Received: from unknown (HELO helios.localnet) ([10.252.121.173])
	by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2012 02:20:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Matthew McClintock <msm@freescale.com>
Date: Thu, 06 Sep 2012 10:20:50 +0100
Message-ID: <2905564.VViGOl5k8s@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1346785794-18278-1-git-send-email-msm@freescale.com>
References: <1346785794-18278-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qmake: add linux-qnuspe to the list of supported targets
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
X-List-Received-Date: Thu, 06 Sep 2012 09:33:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 04 September 2012 14:09:54 Matthew McClintock wrote:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/classes/qmake_base.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/qmake_base.bbclass
> b/meta/classes/qmake_base.bbclass index d1008b6..f972b27 100644
> --- a/meta/classes/qmake_base.bbclass
> +++ b/meta/classes/qmake_base.bbclass
> @@ -48,7 +48,7 @@ addtask generate_qt_config_file after do_patch before
> do_configure
> 
>  qmake_base_do_configure() {
>  	case ${QMAKESPEC} in
> -	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi
> -oe-g++)
> +	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceab
> i-oe-g++|*linux-gnuspe-oe-g++) ;;
>  	*-oe-g++)
>  		die Unsupported target ${TARGET_OS} for oe-g++ qmake spec

Oops, I missed this and created my own equivalent fix based on the file from OE-
Classic. The good news is it has been merged now though, and should support 
uClibc builds as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


