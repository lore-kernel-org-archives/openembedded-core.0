Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 936B26025E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 07:11:06 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e22-v6so16304724qto.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 00:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NrmQKux3hNHJ0S6E6BM/F+MGVKNEZGStT8pnSjrq+Mw=;
	b=avNtCZTC97WvBJ16vZpIJv1ngaFaOq+ofj4rmipAcDAmXhsLKkKmpw80SXfxsHdB3r
	LW662+IgD7af1eJ0MrTMgRXC1HQo3KSX6yvRS21rJl+Y5cWpLFC9R7mLlZ8OgF0feyO9
	/Q334IW2tHzDyUin1DJ2IXiB7Gc+0lGQFnUDKDGcksWLBSil2a2QIMWp71fqmukCB61N
	euNL5QZ7X/rIO1fdc29yhnYFmkB0pJ11IJ/QxzELE6gzOV8QnbcilaRsnboVEqNU5GrH
	4alZbS5sS58WHsn4y5bYUbSYUSIvFkryyUeHfaMoub1VNvyQq/dReQIoxdBGL0nngW+V
	gnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NrmQKux3hNHJ0S6E6BM/F+MGVKNEZGStT8pnSjrq+Mw=;
	b=ABD508QRT+PK1In2HamP+BsC68gXVMN5eehwNsXsiMB9En4o9MJ69epDythUFowbBb
	HQYWTu+94l5KmfYfPXjnSrkb+uqVXzXk1RHrBH7++MEH/dwkfvEmPIrBgNQpLCFkAq7o
	G4p1UNTLZn2G0x3Aez8FdXOKRREwQomBtLfY7Y3MGi3BTj7gORONOe3bs1D+YtBSleUs
	uEFXq1mS9nzPG6CxnEEWGQtS+BUBykZqik5THNIMknT9IulviVCPnvidlePOmu1g1FxY
	wVhi0QkJDmlvItm2K6U2QZbuslDR2Y19WSU98Q+BRkds567iJ6aMDObJMRCnR/TQ5MBR
	qXlA==
X-Gm-Message-State: ABuFfoiC5bKnklg2lXJ7rFuvHxNPcO0zLQ0/+AOL/mesmeHvdM0qdZ1B
	i0H5qShG+vVLb/2TgQjfkbmoLT86t3DK6vAj/7k=
X-Google-Smtp-Source: ACcGV60Dx/W7a89qXSgazddzZ73el5uZjUFDxqH8IRGj/d8hF3K8y2EOd1MeCBrulMr1VtP/fHR4qzBOaxSeC3gX5Xc=
X-Received: by 2002:aed:3024:: with SMTP id 33-v6mr4250512qte.29.1539414666992;
	Sat, 13 Oct 2018 00:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20181012115502.14205-1-ross.burton@intel.com>
	<20181012115502.14205-2-ross.burton@intel.com>
In-Reply-To: <20181012115502.14205-2-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Oct 2018 00:10:40 -0700
Message-ID: <CAMKF1spu=DkMXsn9AxkuRP0iQ6cPCyANMZXX6tkKgmkH5K87Kg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] python: remove the PN package entirely
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
X-List-Received-Date: Sat, 13 Oct 2018 07:11:06 -0000
Content-Type: text/plain; charset="UTF-8"

I am seeing core-image-sato-sdk-ptest fail to build with errors like

http://errors.yoctoproject.org/Errors/Build/69750/
http://errors.yoctoproject.org/Errors/Build/69747/

So taking a wild guess, this series might be one causing it.
On Fri, Oct 12, 2018 at 4:55 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Nothing should be in this package, so remove it entirely to be sure nothing does
> end up in there.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/python/python3_3.5.6.bb | 4 ++--
>  meta/recipes-devtools/python/python_2.7.15.bb | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
> index 489baa294fd..95915447ab4 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -214,6 +214,8 @@ py_package_preprocess () {
>         mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
>  }
>
> +PACKAGES_remove = "${PN}"
> +
>  # manual dependency additions
>  RPROVIDES_${PN}-modules = "${PN}"
>  RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
> @@ -244,8 +246,6 @@ FILES_${PN}-man = "${datadir}/man"
>
>  BBCLASSEXTEND = "nativesdk"
>
> -RPROVIDES_${PN} += "${PN}-modules"
> -
>  # We want bytecode precompiled .py files (.pyc's) by default
>  # but the user may set it on their own conf
>  INCLUDE_PYCS ?= "1"
> diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
> index f30d3f4d25c..9bf6959a0c5 100644
> --- a/meta/recipes-devtools/python/python_2.7.15.bb
> +++ b/meta/recipes-devtools/python/python_2.7.15.bb
> @@ -152,6 +152,7 @@ py_package_preprocess () {
>         (cd ${PKGD}; python -m py_compile ./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py)
>  }
>
> +PACKAGES_remove = "${PN}"
>
>  # manual dependency additions
>  RPROVIDES_${PN}-core = "${PN}"
> @@ -199,8 +200,6 @@ RDEPENDS_${PN}-modules_remove = "${@bb.utils.contains('PACKAGECONFIG', 'bdb', ''
>
>  BBCLASSEXTEND = "nativesdk"
>
> -RPROVIDES_${PN} += "${PN}-modules"
> -
>  # We want bytecode precompiled .py files (.pyc's) by default
>  # but the user may set it on their own conf
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

