Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q26PQ-0001ug-Au
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 19:34:24 +0100
Received: by iyb26 with SMTP id 26so8015654iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2011 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=o0VPjd01e70s6cV2X0SqkZbXeI92oKeJJjsTWKaIBDM=;
	b=H55nJZm8Apm9Yp+NI7kO7kJsqRYSkRTjhD2bWHfZByDUklEot050E/UXLweB5L3kvi
	vSIBDVaMylyrndtPfmhYxLx7JGkN3JosAPJGMh5Gl5CJC3qf0l8oBBSusPx1J4B+ihok
	hO1aDqw127Y0kzFo7fQyLCy8UxNTK83snISjQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=X8lErh7MlRz6j25s4PRChH87b/wPMEP6yQO+HrcKlt3GnhzuSZQDYxpNY5aJ2eoh8b
	JwW7a5pdjO+67vXNIWBTUVC+Ce7zL4Vlha+5vHg+vQJC8CrUNyMr8jg50cZ2+X+hs52T
	R7JWGP7bIeIlxrrCSkqbaKGaAsficDuScKlEs=
Received: by 10.43.131.201 with SMTP id hr9mr9631179icc.53.1300818752213;
	Tue, 22 Mar 2011 11:32:32 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i20sm4542967iby.14.2011.03.22.11.32.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 11:32:31 -0700 (PDT)
Date: Tue, 22 Mar 2011 11:32:45 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110322183245.GC26336@sakrah.homelinux.org>
References: <cover.1300817337.git.tom_rini@mentor.com>
	<3c41c3e7dc35b364f0c16d3694397adea2aa184a.1300817337.git.tom_rini@mentor.com>
MIME-Version: 1.0
In-Reply-To: <3c41c3e7dc35b364f0c16d3694397adea2aa184a.1300817337.git.tom_rini@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/2] coreutils: Switch to disabling gmp support
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
X-List-Received-Date: Tue, 22 Mar 2011 18:34:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/03/11 11:21), Tom Rini wrote:
> Coreutils can optionally build with libgmp support and for our uses
> it's fine to just not build it rather than add the dependency.
> 
To be clear What we lose here is entry for coreutils release notes

* Noteworthy changes in release 7.0 (2008-10-05) [beta] 

   If the GNU MP library is available at configure time, factor and 
   expr support arbitrarily large numbers.  Pollard's rho algorithm is 
   used to factor large numbers. 

and I think we never intended to use it. Its just that now it finds the
library staged due to gcc requiring it.

Acked-by: Khem Raj <raj.khem@gmail.com>

> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  meta/recipes-core/coreutils/coreutils_8.9.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_8.9.bb b/meta/recipes-core/coreutils/coreutils_8.9.bb
> index 4b9a655..d75c080 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.9.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.9.bb
> @@ -7,9 +7,9 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>  LICENSE = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
>                      file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
> -PR = "r0"
> +PR = "r1"
>  DEPENDS = "perl-native gmp"
> -DEPENDS_virtclass-native = "perl-native gmp-native"
> +DEPENDS_virtclass-native = "perl-native"
>  
>  inherit autotools gettext
>  
> @@ -18,6 +18,8 @@ SRC_URI = "http://ftp.gnu.org/gnu/coreutils/${BP}.tar.gz"
>  SRC_URI[md5sum] = "36909ae68840d73a800120cf74af794a"
>  SRC_URI[sha256sum] = "aa991fa4296b22ff929a31a5cb5528bb783c84cdef4503c4ff311cfbeaebf50a"
>  
> +EXTRA_OECONF_virtclass-native = "--without-gmp"
> +
>  # [ gets a special treatment and is not included in this
>  bindir_progs = "base64 basename chcon cksum comm csplit cut dir dircolors dirname du \
>                  env expand expr factor fmt fold groups head hostid id install \
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


