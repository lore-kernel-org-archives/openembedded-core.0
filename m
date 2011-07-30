Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnDM7-0007dj-0Y
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 19:29:43 +0200
Received: by iyj12 with SMTP id 12so5705876iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 10:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=p1qp2pPOccI6vHl4KY46L89fBvuGvz3Fb7++gkY0MG4=;
	b=ahnuETrEepZEo5WYT2lmklMmBX3stb7rH8bK8KBA9GESdIV/uktDnniqR9YaBHUh2t
	Cd6NlHiBqGZ09yzG7nlic3U5FM9odWx1BNHVnF2iMBhivmgpcw847Tok+9JYnG2u2emu
	yBOXPnmNMGPDVG8pNRvzQibeuXPfRlc3OL0lg=
Received: by 10.142.225.10 with SMTP id x10mr1689645wfg.209.1312046724319;
	Sat, 30 Jul 2011 10:25:24 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z6sm3433111pbc.78.2011.07.30.10.25.21
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 10:25:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 10:25:18 -0700
Message-ID: <9242177.qDpCW2S6UF@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <13ae8210a401f000beaf5ab54523e07c5b113831.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
	<13ae8210a401f000beaf5ab54523e07c5b113831.1311807353.git.tom_rini@mentor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] sudo: Drop sudo_cv_uid_t_len from site files
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
X-List-Received-Date: Sat, 30 Jul 2011 17:29:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, July 27, 2011 03:56:45 PM Tom Rini wrote:
> We were just setting this to the assumed default.  If anything, this
> belongs in the libc files if we must set it.

uid_t is not a libc controlled define. Its kernel controlled (though kernel-
headers)

> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  meta/site/arm-common        |    3 ---
>  meta/site/ix86-common       |    3 ---
>  meta/site/mips-linux        |    3 ---
>  meta/site/mips-linux-uclibc |    3 ---
>  meta/site/mipsel-linux      |    5 +----
>  meta/site/powerpc32-linux   |    3 ---
>  meta/site/sh-common         |    3 ---
>  meta/site/x86_64-linux      |    1 -
>  8 files changed, 1 insertions(+), 23 deletions(-)
> 
> diff --git a/meta/site/arm-common b/meta/site/arm-common
> index 04d1164..2129298 100644
> --- a/meta/site/arm-common
> +++ b/meta/site/arm-common
> @@ -191,9 +191,6 @@
> ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=yes} #
> startup-notification
>  lf_cv_sane_realloc=yes
> 
> -# sudo
> -sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
> -
>  # xffm
>  jm_cv_func_working_readdir=yes
> 
> diff --git a/meta/site/ix86-common b/meta/site/ix86-common
> index 7a7e253..122eb14 100644
> --- a/meta/site/ix86-common
> +++ b/meta/site/ix86-common
> @@ -211,9 +211,6 @@
> ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=yes} #
> startup-notification
>  lf_cv_sane_realloc=yes
> 
> -# sudo
> -sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
> -
>  # xffm
>  jm_cv_func_working_readdir=yes
> 
> diff --git a/meta/site/mips-linux b/meta/site/mips-linux
> index 807e552..212c3ad 100644
> --- a/meta/site/mips-linux
> +++ b/meta/site/mips-linux
> @@ -76,9 +76,6 @@
> samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes} # vim
>  ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
> 
> -# sudo
> -sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
> -
>  # intercom
>  ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
> 
> diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
> index 807e552..212c3ad 100644
> --- a/meta/site/mips-linux-uclibc
> +++ b/meta/site/mips-linux-uclibc
> @@ -76,9 +76,6 @@
> samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes} # vim
>  ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
> 
> -# sudo
> -sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
> -
>  # intercom
>  ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
> 
> diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
> index c59d85f..a9032ac 100644
> --- a/meta/site/mipsel-linux
> +++ b/meta/site/mipsel-linux
> @@ -77,10 +77,7 @@
> samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes} # vim
>  ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
> 
> -# sudo
> -sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
> -
> -#intercom
> +# intercom
>  ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
> 
>  #lmbench
> diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
> index 46b64eb..8a10111 100644
> --- a/meta/site/powerpc32-linux
> +++ b/meta/site/powerpc32-linux
> @@ -280,9 +280,6 @@ ac_cv_sync_with_stdio_2=${ac_cv_sync_with_stdio_2=yes}
>  mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
>  mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
> 
> -# sudo
> -sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
> -
>  # dpkg
>  dpkg_cv_va_copy=${ac_cv_va_copy=yes}
>  dpkg_cv___va_copy=${ac_cv___va_copy=yes}
> diff --git a/meta/site/sh-common b/meta/site/sh-common
> index 26a612a..63abe57 100644
> --- a/meta/site/sh-common
> +++ b/meta/site/sh-common
> @@ -231,9 +231,6 @@
> rsync_cv_HAVE_SECURE_MKSTEMP=${rsync_cv_HAVE_SECURE_MKSTEMP=yes}
> rsync_cv_REPLACE_INET_NTOA=${rsync_cv_REPLACE_INET_NTOA=no}
>  rsync_cv_REPLACE_INET_ATON=${rsync_cv_REPLACE_INET_ATON=no}
> 
> -# sudo
> -sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
> -
>  # ipsec-tools
>  ac_cv_va_copy=${ac_cv_va_copy=no}
>  ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
> diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
> index 968dedc..91965b9 100644
> --- a/meta/site/x86_64-linux
> +++ b/meta/site/x86_64-linux
> @@ -92,7 +92,6 @@ ac_cv_alignof_CORBA_short=2
>  ac_cv_alignof_CORBA_struct=1
>  ac_cv_alignof_CORBA_wchar=2
> 
> -sudo_cv_uid_t=${sudo_cv_uid_t_len=10}
>  lf_cv_sane_realloc=yes
>  as_cv_unaligned_access=${as_cv_unaligned_access=yes}
-- 
Khem Raj


