Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnDUU-0007mq-0c
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 19:38:22 +0200
Received: by iyj12 with SMTP id 12so5711775iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 10:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=5yNPBPdK2xklEOxVoZFcCsj77MM3Rdz/f9OjkTWUc7k=;
	b=AAs553PVQ7XXxk6aGNODinOVZnPWD/IAoNjOvN9lnzMOXBK6Kv+CjxO51Y4uQudFsX
	hMSxBp2g5DtvqsvoddYzUDw34gSfE7GGLw2ogiIvWiq4i2DDOu22II3+HMG6azPk30t+
	QnKoRrFA4VjvJTDjLHDyNAc8nXGLK698irLgg=
Received: by 10.142.229.18 with SMTP id b18mr1638193wfh.201.1312047242996;
	Sat, 30 Jul 2011 10:34:02 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v17sm1941733wfd.17.2011.07.30.10.34.01
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 10:34:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 10:33:57 -0700
Message-ID: <7954213.WCcvt5c9xE@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <d8f714075dcbe37ef21b17639f91a8faeb868bf1.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
	<d8f714075dcbe37ef21b17639f91a8faeb868bf1.1311807353.git.tom_rini@mentor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/9] tcl: Add tcl_cv_api_serial to siteinfo
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
X-List-Received-Date: Sat, 30 Jul 2011 17:38:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, July 27, 2011 03:56:46 PM Tom Rini wrote:
> This comes from oe.dev which had this set for arm-linux only.  Bump PR
> since this changes how builds happen.

if you are clubbing them in right site files then this variable is for
deciding what serial API(termios or termio or sgtty) to use its not dependent 
on libc imo.

> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  meta/recipes-devtools/tcltk/tcl_8.5.9.bb |    2 +-
>  meta/site/common-glibc                   |    2 ++
>  meta/site/common-uclibc                  |    3 +++
>  3 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb index 12e2bd0..7dcaeb3 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =
> "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
> file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \ "
> 
> -PR = "r0"
> +PR = "r1"
> 
>  BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
>                  file://tcl-add-soname.patch"
> diff --git a/meta/site/common-glibc b/meta/site/common-glibc
> index 8cfa695..baca5f8 100644
> --- a/meta/site/common-glibc
> +++ b/meta/site/common-glibc
> @@ -69,3 +69,5 @@
> gl_cv_func_mbrtowc_null_arg=${gl_cv_func_mbrtowc_null_arg=yes}
> gl_cv_func_mbrtowc_retval=${gl_cv_func_mbrtowc_retval=yes}
>  gl_cv_func_mbrtowc_nul_retval=${gl_cv_func_mbrtowc_nul_retval=yes}
> 
> +# TCL
> +tcl_cv_api_serial=${tcl_cv_api_serial=termios}
> diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
> index 093f60e..002a559 100644
> --- a/meta/site/common-uclibc
> +++ b/meta/site/common-uclibc
> @@ -26,3 +26,6 @@
> ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes} # bash
>  bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
>  bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
> +
> +# TCL
> +tcl_cv_api_serial=${tcl_cv_api_serial=termios}
-- 
Khem Raj


