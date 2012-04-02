Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SEdJ7-00006e-9e
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 11:12:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Apr 2012 02:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="127715302"
Received: from unknown (HELO helios.localnet) ([10.252.123.252])
	by orsmga002.jf.intel.com with ESMTP; 02 Apr 2012 02:03:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 02 Apr 2012 10:02:57 +0100
Message-ID: <1536285.gssKeMVGyU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <1333338343.647.8.camel@ted>
References: <1333202821.18082.225.camel@ted> <1333212913.18082.247.camel@ted>
	<1333338343.647.8.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, Steve Sakoman <steve@sakoman.com>
Subject: Re: Re-execution of tasks - test report and results
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
X-List-Received-Date: Mon, 02 Apr 2012 09:12:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 02 April 2012 04:45:43 Richard Purdie wrote:
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> b/meta/recipes-core/gettext/gettext_0.18.1.1.bb index 4144d2b..0ed5dd9
> 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> 
>  PR = "r10"
>  DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
> -DEPENDS_virtclass-native = "libxml2-native"
> +DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
>  PROVIDES = "virtual/libintl virtual/gettext"
>  PROVIDES_virtclass-native = "virtual/gettext-native"
>  CONFLICTS_${PN} = "proxy-libintl"
> @@ -95,4 +95,8 @@ do_install_append() {
>      rm -f ${D}${libdir}/preloadable_libintl.so
>  }
> 
> +do_install_append_virtclass-native () {
> +	rm ${D}${datadir}/aclocal/*
> +}
> +
>  BBCLASSEXTEND = "native nativesdk"
> 
> although I'm travelling at the moment and have not tested this yet.

I've tested this just now and it does fix the problem. The only thing missing 
is a PR bump.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


