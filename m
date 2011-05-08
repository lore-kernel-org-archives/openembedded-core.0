Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIsSz-0005Bz-T0
	for openembedded-core@lists.openembedded.org;
	Sun, 08 May 2011 03:07:26 +0200
Received: by pwj9 with SMTP id 9so2002625pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 18:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=pRPvYjBRrt0E0n9vpEu9lwgkEl2m1RxbUH9e5/9AkXE=;
	b=NMH0t/L5jqQ4NSlXg9iCisYk6JfuckXmxzXLlURw7uAW/eYf5wYzml+ZrxLs1gP/Vs
	0S3Utr7YI0O7m1Cj3kbBRygFRTZMYTD7wbk4bN6uExkjMpd537m3CAO14epGrojULySp
	trr5nusolhtwn6DQ0Y5lf7ksnen8dIr5WEkd0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=OIzIaXnxv2gnUgIaG79geUUD6Oa2np+jUYcVuE18w4mPGSOUKe5rzKYlGSSqsotLon
	WjWAyjrZDAc01DGIwBd0BaOmvypRFV4Unxh2/tvF/bnhO3bgSp83HZus4jm+Ogj8bDSt
	qbFYh7rVWHHnFR/34/jjBH0pwOtaqKXyliUyg=
Received: by 10.68.27.195 with SMTP id v3mr2915467pbg.214.1304816682457;
	Sat, 07 May 2011 18:04:42 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x9sm3125508pbi.12.2011.05.07.18.04.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 18:04:40 -0700 (PDT)
Date: Sat, 7 May 2011 18:04:01 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110508010401.GD20352@sakrah.homelinux.org>
References: <cover.1304607797.git.tom_rini@mentor.com>
	<ebdc7d53636bce0c3faafa4367d2cd1cbaa4c3a0.1304607797.git.tom_rini@mentor.com>
MIME-Version: 1.0
In-Reply-To: <ebdc7d53636bce0c3faafa4367d2cd1cbaa4c3a0.1304607797.git.tom_rini@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/4] gcc-package-target: Switch to TARGET_PREFIX in symlinks
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
X-List-Received-Date: Sun, 08 May 2011 01:07:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/05/11 08:05), Tom Rini wrote:
> When TARGET_PREFIX and TARGET_SYS didn't match up, the symlinks we made
> were invalid.  TARGET_PREFIX is what we use when configuring so it's what we
> should be using here.
> 
> This is 05143e9b5d0a42e32ee0dd3c7fde482ff8d63f63 from OE.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  meta/recipes-devtools/gcc/gcc-package-target.inc |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
> index d61e96b..e7f1b80 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
> @@ -91,13 +91,13 @@ do_install () {
>  	find -name libiberty.h ${D}${exec_prefix}/lib | xargs rm -f
>  
>  	# Symlinks so we can use these trivially on the target
> -	ln -sf ${TARGET_SYS}-g77 g77 || true
> -	ln -sf ${TARGET_SYS}-gfortran gfortran || true
> -	ln -sf ${TARGET_SYS}-g++ g++
> -	ln -sf ${TARGET_SYS}-gcc gcc
> +	ln -sf ${TARGET_PREFIX}g77 g77 || true
> +	ln -sf ${TARGET_PREFIX}gfortran gfortran || true
> +	ln -sf ${TARGET_PREFIX}g++ g++
> +	ln -sf ${TARGET_PREFIX}gcc gcc
>  	ln -sf g77 f77 || true
>  	ln -sf gfortran f95 || true
>  	ln -sf g++ c++
>  	ln -sf gcc cc
> -	ln -sf ${bindir}/${TARGET_SYS}-cpp ${D}${bindir}/cpp
> +	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${bindir}/cpp
>  }
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


