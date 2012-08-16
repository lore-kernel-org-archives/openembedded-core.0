Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T250W-0000GP-TW
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:41:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2012 11:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="187349423"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2012 11:29:25 -0700
Message-ID: <502D3C05.8030902@linux.intel.com>
Date: Thu, 16 Aug 2012 11:29:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344598197-3592-1-git-send-email-xin.ouyang@windriver.com>
In-Reply-To: <1344598197-3592-1-git-send-email-xin.ouyang@windriver.com>
Subject: Re: [PATCH] gettext-0.18: explicitly disable acl.
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
X-List-Received-Date: Thu, 16 Aug 2012 18:41:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2012 04:29 AM, xin.ouyang@windriver.com wrote:
> From: Xin Ouyang <Xin.Ouyang@windriver.com>
>
> gettext-0.18 gets a new option for acl, but we do not place acl
> into DEPENDS.
> So, explicitly disable acl for deterministic builds.
>
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> ---
>   meta/recipes-core/gettext/gettext_0.18.1.1.bb |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> index 09a9465..ae3e28b 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -5,7 +5,7 @@ SECTION = "libs"
>   LICENSE = "GPLv3+ & LGPL-2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -PR = "r15"
> +PR = "r16"
>   DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
>   DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
>   PROVIDES = "virtual/libintl virtual/gettext"
> @@ -32,6 +32,7 @@ EXTRA_OECONF += "--without-lispdir \
>                    --disable-java \
>                    --disable-native-java \
>                    --disable-openmp \
> +                 --disable-acl \
>                    --with-included-glib \
>                    --with-libncurses-prefix=${STAGING_LIBDIR}/.. \
>                    --without-emacs \
>
Merged into OE-Core

Thanks
	Sau!



