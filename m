Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UASea-00043I-2U
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 23:05:42 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2013 13:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,743,1355126400"; d="scan'208";a="290885670"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.55])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2013 13:49:19 -0800
Message-ID: <512D2DDF.5070002@linux.intel.com>
Date: Tue, 26 Feb 2013 13:49:19 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
	<15dffc97a79d24f6f7b60c986dfe1e9e708990f4.1361862860.git.liezhi.yang@windriver.com>
In-Reply-To: <15dffc97a79d24f6f7b60c986dfe1e9e708990f4.1361862860.git.liezhi.yang@windriver.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] e2fsprogs: ship mkfsdebug.sh
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
X-List-Received-Date: Tue, 26 Feb 2013 22:05:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This can be merged with 3/7 right?

On 02/26/2013 01:24 AM, Robert Yang wrote:
> Ship mkfsdebug.sh, it will be installed to /usr/bin/mkfsdebug.sh and
> used for replacing the genext2fs in image_types.bbclass.
> 
> [YOCTO #3848]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> index 70255ce..1609d42 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> @@ -4,6 +4,7 @@ PR = "r0"
>  
>  SRC_URI += "file://acinclude.m4 \
>              file://remove.ldconfig.call.patch \
> +            file://mkdebugfs.sh \
>  "
>  
>  SRCREV = "fca8b1b2416c384b91b4fe00d6d37cfccb8fb3d5"
> @@ -41,6 +42,7 @@ do_install_append () {
>  		mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
>  		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
>  	fi
> +	install -m 0755 ${WORKDIR}/mkdebugfs.sh ${D}${bindir}
>  }
>  
>  RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


