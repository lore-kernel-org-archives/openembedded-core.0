Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2773377E57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 17:14:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 10:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="110067158"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga002.jf.intel.com with ESMTP; 11 Jul 2017 10:14:00 -0700
Message-ID: <1499793820.5349.32.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Lev Iserovich <lev.iserovich@deshawresearch.com>
Date: Tue, 11 Jul 2017 12:23:40 -0500
In-Reply-To: <1499788671-20890-1-git-send-email-lev.iserovich@deshawresearch.com>
References: <1499788671-20890-1-git-send-email-lev.iserovich@deshawresearch.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Lev Iserovich <iserovil@deshawresearch.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gettext: Enable generation of libasprintf in gettext 0.19
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
X-List-Received-Date: Tue, 11 Jul 2017 17:14:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-07-11 at 11:57 -0400, Lev Iserovich wrote:
> From: Lev Iserovich <iserovil@deshawresearch.com>
> 

next type, in case you need to send a second (or third..) revision,
include the 'v2' label after the '[PATCH ' string the subject line.

BTW, this time patchtest did not complain :)

Leo


> Libasprintf was included in gettext 0.16 recipe, but omitted for some reason
> in 0.19. This turns it back on.
> 
> Signed-off-by: Lev Iserovich <lev.iserovich@deshawresearch.com>
> ---
>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> index c2059e6..c7c81ee 100644
> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> @@ -28,7 +28,6 @@ inherit autotools texinfo
>  
>  EXTRA_OECONF += "--without-lispdir \
>                   --disable-csharp \
> -                 --disable-libasprintf \
>                   --disable-java \
>                   --disable-native-java \
>                   --disable-openmp \
> @@ -81,7 +80,7 @@ FILES_gettext-runtime = "${bindir}/gettext \
>                           ${bindir}/ngettext \
>                           ${bindir}/envsubst \
>                           ${bindir}/gettext.sh \
> -                         ${libdir}/libasprintf.so* \
> +                         ${libdir}/libasprintf${SODEV} \
>                           ${libdir}/GNU.Gettext.dll \
>                          "
>  FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
> -- 
> 2.7.1
> 



