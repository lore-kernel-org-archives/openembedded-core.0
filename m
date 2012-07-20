Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ss4hp-0000p7-9S
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 06:20:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2012 21:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="174593270"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2012 21:09:21 -0700
Message-ID: <5008D9F0.8060305@linux.intel.com>
Date: Thu, 19 Jul 2012 21:09:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342629755-23841-1-git-send-email-yao.zhao@windriver.com>
In-Reply-To: <1342629755-23841-1-git-send-email-yao.zhao@windriver.com>
Subject: Re: [PATCH] tcl: fix tcl INCLUDE_SPEC and LIB_SPEC
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
X-List-Received-Date: Fri, 20 Jul 2012 04:20:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2012 09:42 AM, Yao Zhao wrote:
> TCL_INCLUDE_SPEC -I/usr/include will cause problems cross configure/compile
> TCL_LIB_SPEC -L${libdir} will cause problems too when link.
>
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>   meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
> index 1d43371..d5cf6dc 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
> @@ -46,8 +46,9 @@ do_install() {
>   	autotools_do_install
>   	oe_libinstall -so libtcl8.5 ${STAGING_LIBDIR}
>   	ln -sf ./tclsh8.5 ${D}${bindir}/tclsh
> -	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
> -	sed -i "s,-L${libdir},," tclConfig.sh
> +	#sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
> +	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
> +	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
>   	install -d ${STAGING_BINDIR_CROSS}/
>   	install -m 0755 tclConfig.sh ${STAGING_BINDIR_CROSS}
>   	cd ..
>

Merged into OE-Core

Thanks
	Sau!


