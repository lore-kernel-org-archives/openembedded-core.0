Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 051B2783AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 07:40:33 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id r1so2171465pgn.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 23:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QeF+/sReiIVpZiB39Jnm392G6ngdZ9nXIzHhDHJG3yI=;
	b=DtBcPiXKfZewAmEzYA8PhKUELiF9ezxBtEG4siPOT5i36/rm6il0f5vthKzxRdW0I3
	DTKaaHMtj3WExrVsGriSZ9bFhjHwD25/4Gqwld8ro8IyOwilUVY3JtvjrRor4USO3j2l
	nuKHDAxNRGT64z3Ha8+CKovf5sW1z5/JaN9BM2erBI0Pyscqqq7ZNpoviAM/pjGnMD1O
	eU9vD4ZtQv4LJ2qSg3vHxZlQl//6pv/sLMXBsoORFno4lFLRoRcBVsq6C4aGQTjsZ+Y1
	KvAcnfaw+dZJymQeipEzY8GytkvV1BQn/CPVSGztxiJDJodHx5aPEFt12N4oPf0VCbmN
	4Vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QeF+/sReiIVpZiB39Jnm392G6ngdZ9nXIzHhDHJG3yI=;
	b=PB6U4TFlvl2EltaDkOQPC+nxuIvXFmxonPF65vldbBMXUqi6ainGEdHHMLFHFu4/Iu
	96YQfZlTrfUMBXuvxQf1KlXGZ7bXy1FcgcYB486zzxLblEQp4r7CLWmwyklf+oRVyCSp
	i2zSBpphsJypUbytgPhhheHhKwcW3qu9P3ymvNjdMHHhmK5UAADRts8PFH/byxJncApI
	teXIYBOfZ4w5hRA4y4w+i1wjK22U4/UwnkaBYiVQxG8VF9nD7ebBOWJAjMoFukmA5Yo0
	Qw4JdZk0mTBplizGRraXsZuSL7bbDrG4bgyzsJF4Cl4hNsayyfv/JUmqsr36ohj7CQtO
	KdNQ==
X-Gm-Message-State: APf1xPDwYSbvBCaVvLipuYWqjXCjHuVoSXHemHnjNolMd5qf3zu7ngDf
	Zf4PztEYPzYXXa3T3MO3cFGYdZHCgzLqiuOwyWQ=
X-Google-Smtp-Source: AH8x225VPu4WERNvB0jM/5GJV+IlNBQ2PM7kg4hjaVEe8p7+3XCEaLWGV828EH6CdacWz5nwdxw4WvVVhGP5AmbfD0Y=
X-Received: by 10.98.69.146 with SMTP id n18mr3886663pfi.29.1517989234974;
	Tue, 06 Feb 2018 23:40:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Tue, 6 Feb 2018 23:40:04 -0800 (PST)
In-Reply-To: <20180206224406.10443-1-Martin.Jansa@gmail.com>
References: <CA+chaQfE8Qtsc5LjNXXqhDaM-MS6tnpwAzi5_dEsHcU3B037Hw@mail.gmail.com>
	<20180206224406.10443-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Feb 2018 23:40:04 -0800
Message-ID: <CAMKF1sqfasCaxgxFV_-f1UhAeS4GnwJxSU1uz61UbOg3Rmecsg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iputils: add libidn dependency
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
X-List-Received-Date: Wed, 07 Feb 2018 07:40:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 6, 2018 at 2:44 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * https://github.com/iputils/iputils/blob/master/RELNOTES.old
>   mentiones that IDN was enabled by default in:
>   [s20160308] and surprisingly the same in [s20150815]
>   but there are no release notes for s20151218 version we were using until
>   now, don't know how it really relates to [s20150815].
>
> * https://github.com/iputils/iputils/commit/f3a461603ef4fb7512ade3bdb73fe1824e294547
>
> * fails with:
>   | In file included from ping_common.c:1:0:
>   | ping.h:39:10: fatal error: idna.h: No such file or directory
>   |  #include <idna.h>
>   |           ^~~~~~~~
>
> * Easiest way to reproduce this failure is to remove libidn from gnutls
>   PACKAGECONFIG or to use gnutls which doesn't have libidn PACKAGECONFIG
>   at all (like the one in meta-gplv2).

I think this should be turned into a PACKAGECONFIG and turned off
by default. It doesnt seem to be working as they have found bug in
libidn which needs to be fixed for it to work here. Prior default was to
disable it so we keep that.

>
> * First it leads to following QA issue:
>   http://errors.yoctoproject.org/Errors/Build/53212/
>   ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-ping rdepends on libidn, but it isn't a build dependency, missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
>   ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-traceroute6 rdepends on libidn, but it isn't a build dependency, missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
>   ERROR: iputils-s20161105-r0 do_package_qa: QA run found fatal errors.
>   Please consider fixing them.
>   ERROR: iputils-s20161105-r0 do_package_qa: Function failed:
>   do_package_qa
>   ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/iputils/s20161105-r0/temp/log.do_package_qa.7627
>   ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-extended/iputils/iputils_s20161105.bb:do_package_qa) failed with exit code '1'
>
> * But if you cleansstate iputils as well (after removing libidn from
>   gnutls PACKAGECONFIG) to empty iputils RSS, then you get the error about
>   missing idna.h:
>   http://errors.yoctoproject.org/Errors/Build/53213/
>
> * Adding the libidn dependency explicitly in iputils recipe fixes the
>   issue.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-extended/iputils/iputils_s20161105.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/iputils/iputils_s20161105.bb b/meta/recipes-extended/iputils/iputils_s20161105.bb
> index ad7dbc4d4a..0acf2be5d3 100644
> --- a/meta/recipes-extended/iputils/iputils_s20161105.bb
> +++ b/meta/recipes-extended/iputils/iputils_s20161105.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
>                      file://arping.c;beginline=1;endline=11;md5=fe84301b5c2655c950f8b92a057fafa6 \
>                      file://tftpd.c;beginline=1;endline=32;md5=28834bf8a91a5b8a92755dbee709ef96 "
>
> -DEPENDS = "gnutls libcap libgcrypt"
> +DEPENDS = "gnutls libcap libgcrypt libidn"
>
>  SRC_URI = "git://github.com/iputils/iputils \
>             file://0001-Fix-build-on-MUSL.patch \
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

