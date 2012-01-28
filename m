Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrEtu-00059K-QX
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 21:29:31 +0100
Received: by pbaa13 with SMTP id a13so2191724pba.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2012 12:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HCZ6kghxeQnmUX55Yh1cV7HfgrnM0L/febZQJgBPY8U=;
	b=RsZElM2cw1OadYSuLJME7BJ5uO+VokZ6qLgTgj+5xfz/aCWtQ6CDYiNibz6aZBc0B+
	smPhMQt0WPtTXlqIFpw2nnwMVvdM8ZlqgEDPDC3c7ehyMmuYSkBzesQUlRzILjTPys/R
	w4niZjCngLyMvFs2XcmMUzZukWHqgtLRAcJ5M=
Received: by 10.68.218.5 with SMTP id pc5mr25821226pbc.101.1327782099483;
	Sat, 28 Jan 2012 12:21:39 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id a5sm31627619pbh.15.2012.01.28.12.21.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jan 2012 12:21:38 -0800 (PST)
Date: Sat, 28 Jan 2012 12:21:32 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120128202132.GD22106@sakrah.homelinux.org>
References: <cover.1327684024.git.chris_larson@mentor.com>
	<50e4e429330f8b48ef84eda03deffe87fd6c01b1.1327684024.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <50e4e429330f8b48ef84eda03deffe87fd6c01b1.1327684024.git.chris_larson@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 02/10] eglibc-package.inc: don't include debug files in -pic
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
X-List-Received-Date: Sat, 28 Jan 2012 20:29:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/01/12 11:13), Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index e5a9b9d..870b95d 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -42,7 +42,7 @@ FILES_libcidn${PKGSUFFIX} = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.
>  FILES_libmemusage${PKGSUFFIX} = "${base_libdir}/libmemusage.so"
>  FILES_eglibc-extra-nss${PKGSUFFIX} = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
>  FILES_sln${PKGSUFFIX} = "/sbin/sln"
> -FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
> +FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"

are there just .o in there which are left ? not *.os ?

>  FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
>  FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
>  	${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
> -- 
> 1.7.8.rc4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


