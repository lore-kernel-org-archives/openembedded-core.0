Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.6617.1599862834431486869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 15:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PxTd4apw;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id md22so3167892pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 15:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=P1nsKv2S45BM9mgsqfKJnXw77K/Z5tVekJumgpy3xbI=;
        b=PxTd4apwB4sF9RgugAxm/MY9o+9pIdoMn6MUYjdJJWfVVZnNu1VJ7GSMPSRyatq+IN
         N4k3jLV9VL1NVqZaTq0fXiZEUYPSe4IeCjMyKonTwAAGfphrfUWSTJXtYtwhLUn2fnO0
         wd45rTZ1IP8Qa0hGXJwR3cr0895lOHFwZG9fu1ISmhV3TXxcRhmG92PiYXbLD/cUbX7a
         fNmT8QJgHR/dkpAnHuTjNxjnPOdG4n4v41dSi2glYYLSEqDJQw7Af08kZMzFfXRvDdOh
         bf0otjajBINJDgyfmfg0ltW5B+I+2XBosK65/DhAAfqbpcBU3+SCZA5xPBnR2PlAwvA1
         kwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=P1nsKv2S45BM9mgsqfKJnXw77K/Z5tVekJumgpy3xbI=;
        b=fzP7lJJRV7rBVf/B64Lj2YrcFCK5kI2ft0HlN7DfWdrVmgN1m51aHOMJ3jkAv9Xe3r
         LMZcq3qmwJc8RhYKTf7b7RzJ8FNwMgBSfy9hh2TElyuhE3jvlycVvDG62qvRje4hT9qx
         BATXe+kiwhifPjVykt4qvyISGqssXQdjlQ+X2ln2t76tg8iTNMXjsHCvFTjLmDeUXqRF
         BOBe9bIkNtMZc8WSLMafUHWkfDGEQlY5GoNdZhoQziXwa1SxFsxW+7wOjrrNsFxd6u4f
         p/RnU1MRNlDA1aZ/KiKxqlKMStsTQmfIief2n4hMLDbMTdQMj7eOXbT6EOk1XST8uotE
         aWEg==
X-Gm-Message-State: AOAM533eMUC+rfAgIs5baATaHzZ/DYF999oBHD08re5QdwDBjtlkq1jc
	jdecW/fymy02u7zTiQu23hDF4vkI0Hg=
X-Google-Smtp-Source: ABdhPJziLwWG+Et9mAzDDwy/oXiv19XE+vnKQ66arELFZqdCqWznmRZlFlcqtz2DQfiEGMgGImClgg==
X-Received: by 2002:a17:90a:ae12:: with SMTP id t18mr4213174pjq.147.1599862833446;
        Fri, 11 Sep 2020 15:20:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9d9a:aa32:31fc:b6f0? ([2601:202:4180:a5c0:9d9a:aa32:31fc:b6f0])
        by smtp.gmail.com with ESMTPSA id l14sm2679364pjy.1.2020.09.11.15.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 15:20:32 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] cve-check: use SAFELIST
To: Lee Chee Yang <chee.yang.lee@intel.com>,
 openembedded-core@lists.openembedded.org
References: <20200911073712.25524-1-chee.yang.lee@intel.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <214da994-90e8-4879-3e52-fddd74577782@gmail.com>
Date: Fri, 11 Sep 2020 15:20:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911073712.25524-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 9/11/20 12:37 AM, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> use safelist instead of whitelist.
Thanks for sending the patch. There is some unfinished conclusions for
renaming various variables to be more inclusive. I am personally fine
with this word choice.

Is this what other open source projects are rename to ?=C2=A0

So would "blacklist" become "unsafelist"

Do you have an idea if other layers would be affected by this change?

-armin


> Replace CVE_CHECK_PN_WHITELIST with CVE_CHECK_PN_SAFELIST.
> Replace CVE_CHECK_WHITELIST with CVE_CHECK_SAFELIST.
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  meta/classes/cve-check.bbclass                | 47 ++++++++++---------
>  .../openssl/openssl_1.1.1g.bb                 |  2 +-
>  meta/recipes-core/glibc/glibc_2.32.bb         |  2 +-
>  meta/recipes-devtools/cmake/cmake.inc         |  2 +-
>  meta/recipes-devtools/python/python3_3.8.5.bb |  2 +-
>  meta/recipes-devtools/rsync/rsync_3.2.3.bb    |  2 +-
>  .../iputils/iputils_s20200821.bb              |  2 +-
>  meta/recipes-extended/procps/procps_3.3.16.bb |  2 +-
>  .../libpng/libpng_1.6.37.bb                   |  2 +-
>  .../libsndfile/libsndfile1_1.0.28.bb          |  2 +-
>  meta/recipes-support/lz4/lz4_1.9.2.bb         |  2 +-
>  meta/recipes-support/sqlite/sqlite3_3.33.0.bb |  2 +-
>  12 files changed, 35 insertions(+), 34 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbc=
lass
> index 17f64a8a9c..82b2b40da0 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -40,15 +40,15 @@ CVE_CHECK_MANIFEST ?=3D "${DEPLOY_DIR_IMAGE}/${IMAGE=
_NAME}${IMAGE_NAME_SUFFIX}.cve
>  CVE_CHECK_COPY_FILES ??=3D "1"
>  CVE_CHECK_CREATE_MANIFEST ??=3D "1"
>  
> -# Whitelist for packages (PN)
> -CVE_CHECK_PN_WHITELIST ?=3D ""
> +# Safelist for packages (PN)
> +CVE_CHECK_PN_SAFELIST ?=3D ""
>  
> -# Whitelist for CVE. If a CVE is found, then it is considered patched.
> +# Safelist for CVE. If a CVE is found, then it is considered patched.
>  # The value is a string containing space separated CVE values:
> -#=20
> -# CVE_CHECK_WHITELIST =3D 'CVE-2014-2524 CVE-2018-1234'
> -#=20
> -CVE_CHECK_WHITELIST ?=3D ""
> +#
> +# CVE_CHECK_SAFELIST =3D 'CVE-2014-2524 CVE-2018-1234'
> +#
> +CVE_CHECK_SAFELIST ?=3D ""
>  
>  python cve_save_summary_handler () {
>      import shutil
> @@ -87,10 +87,10 @@ python do_cve_check () {
>              patched_cves =3D get_patches_cves(d)
>          except FileNotFoundError:
>              bb.fatal("Failure in searching patches")
> -        whitelisted, patched, unpatched =3D check_cves(d, patched_cves)
> +        safelisted, patched, unpatched =3D check_cves(d, patched_cves)
>          if patched or unpatched:
>              cve_data =3D get_cve_info(d, patched + unpatched)
> -            cve_write_data(d, patched, unpatched, whitelisted, cve_data=
)
> +            cve_write_data(d, patched, unpatched, safelisted, cve_data)
>      else:
>          bb.note("No CVE database found, skipping CVE check")
>  
> @@ -213,15 +213,16 @@ def check_cves(d, patched_cves):
>          return ([], [], [])
>      pv =3D d.getVar("CVE_VERSION").split("+git")[0]
>  
> -    # If the recipe has been whitlisted we return empty lists
> -    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
> -        bb.note("Recipe has been whitelisted, skipping check")
> +    if d.getVar("CVE_CHECK_PN_WHITELIST"):
> +        bb.warn("CVE_CHECK_PN_WHITELIST is deprecated, please use CVE_C=
HECK_PN_SAFELIST.")
> +    # If the recipe has been safelisted we return empty lists
> +    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_SAFELIST").split():
> +        bb.note("Recipe has been safelisted, skipping check")
>          return ([], [], [])
>  
> -    old_cve_whitelist =3D  d.getVar("CVE_CHECK_CVE_WHITELIST")
> -    if old_cve_whitelist:
> -        bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use CVE_=
CHECK_WHITELIST.")
> -    cve_whitelist =3D d.getVar("CVE_CHECK_WHITELIST").split()
> +    if d.getVar("CVE_CHECK_CVE_WHITELIST") or d.getVar("CVE_CHECK_WHITE=
LIST"):
> +        bb.warn("CVE_CHECK_CVE_WHITELIST and CVE_CHECK_WHITELIST is dep=
recated, please use CVE_CHECK_SAFELIST.")
> +    cve_safelist =3D d.getVar("CVE_CHECK_SAFELIST").split()
>  
>      import sqlite3
>      db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
> @@ -238,9 +239,9 @@ def check_cves(d, patched_cves):
>          for cverow in conn.execute("SELECT DISTINCT ID FROM PRODUCTS WH=
ERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
>              cve =3D cverow[0]
>  
> -            if cve in cve_whitelist:
> -                bb.note("%s-%s has been whitelisted for %s" % (product,=
 pv, cve))
> -                # TODO: this should be in the report as 'whitelisted'
> +            if cve in cve_safelist:
> +                bb.note("%s-%s has been safelisted for %s" % (product, =
pv, cve))
> +                # TODO: this should be in the report as 'safelisted'
>                  patched_cves.add(cve)
>                  continue
>              elif cve in patched_cves:
> @@ -294,7 +295,7 @@ def check_cves(d, patched_cves):
>  
>      conn.close()
>  
> -    return (list(cve_whitelist), list(patched_cves), cves_unpatched)
> +    return (list(cve_safelist), list(patched_cves), cves_unpatched)
>  
>  def get_cve_info(d, cves):
>      """
> @@ -318,7 +319,7 @@ def get_cve_info(d, cves):
>      conn.close()
>      return cve_data
>  
> -def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
> +def cve_write_data(d, patched, unpatched, safelisted, cve_data):
>      """
>      Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
>      CVE manifest if enabled.
> @@ -334,8 +335,8 @@ def cve_write_data(d, patched, unpatched, whiteliste=
d, cve_data):
>          write_string +=3D "PACKAGE NAME: %s\n" % d.getVar("PN")
>          write_string +=3D "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTEND=
PE"), d.getVar("PV"))
>          write_string +=3D "CVE: %s\n" % cve
> -        if cve in whitelisted:
> -            write_string +=3D "CVE STATUS: Whitelisted\n"
> +        if cve in safelisted:
> +            write_string +=3D "CVE STATUS: Safelisted\n"
>          elif cve in patched:
>              write_string +=3D "CVE STATUS: Patched\n"
>          else:
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/=
recipes-connectivity/openssl/openssl_1.1.1g.bb
> index 815955837b..c74538fa99 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> @@ -212,4 +212,4 @@ CVE_PRODUCT =3D "openssl:openssl"
>  
>  # Only affects OpenSSL >=3D 1.1.1 in combination with Apache < 2.4.37
>  # Apache in meta-webserver is already recent enough
> -CVE_CHECK_WHITELIST +=3D "CVE-2019-0190"
> +CVE_CHECK_SAFELIST +=3D "CVE-2019-0190"
> diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/g=
libc/glibc_2.32.bb
> index 7049e61625..9e29904e85 100644
> --- a/meta/recipes-core/glibc/glibc_2.32.bb
> +++ b/meta/recipes-core/glibc/glibc_2.32.bb
> @@ -1,7 +1,7 @@
>  require glibc.inc
>  require glibc-version.inc
>  
> -CVE_CHECK_WHITELIST +=3D "CVE-2020-10029"
> +CVE_CHECK_SAFELIST +=3D "CVE-2020-10029"
>  
>  DEPENDS +=3D "gperf-native bison-native make-native"
>  
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtoo=
ls/cmake/cmake.inc
> index fa1b818ae4..418845a597 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -28,4 +28,4 @@ UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\=
.tar"
>  
>  # This is specific to the npm package that installs cmake, so isn't
>  # relevant to OpenEmbedded
> -CVE_CHECK_WHITELIST +=3D "CVE-2016-10642"
> +CVE_CHECK_SAFELIST +=3D "CVE-2016-10642"
> diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipe=
s-devtools/python/python3_3.8.5.bb
> index cabe5dc075..edbfc634ab 100644
> --- a/meta/recipes-devtools/python/python3_3.8.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.5.bb
> @@ -49,7 +49,7 @@ UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+=
)+).tar"
>  CVE_PRODUCT =3D "python"
>  
>  # This is not exploitable when glibc has CVE-2016-10739 fixed.
> -CVE_CHECK_WHITELIST +=3D "CVE-2019-18348"
> +CVE_CHECK_SAFELIST +=3D "CVE-2019-18348"
>  
>  PYTHON_MAJMIN =3D "3.8"
>  
> diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-d=
evtools/rsync/rsync_3.2.3.bb
> index 375efa0dea..1e52c48b5d 100644
> --- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
> +++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src=
/${BP}.tar.gz \
>  SRC_URI[sha256sum] =3D "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad568=
3c179a697146ce50e"
>  
>  # -16548 required for v3.1.3pre1. Already in v3.1.3.
> -CVE_CHECK_WHITELIST +=3D " CVE-2017-16548 "
> +CVE_CHECK_SAFELIST +=3D " CVE-2017-16548 "
>  
>  inherit autotools-brokensep
>  
> diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/r=
ecipes-extended/iputils/iputils_s20200821.bb
> index 28dd194a12..073af6777c 100644
> --- a/meta/recipes-extended/iputils/iputils_s20200821.bb
> +++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
> @@ -21,7 +21,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>s\d+)"
>  
>  # Fixed in 2000-10-10, but the versioning of iputils
>  # breaks the version order.
> -CVE_CHECK_WHITELIST +=3D "CVE-2000-1213 CVE-2000-1214"
> +CVE_CHECK_SAFELIST +=3D "CVE-2000-1213 CVE-2000-1214"
>  
>  PACKAGECONFIG ??=3D "libcap rarpd \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'nin=
fod traceroute6', '', d)} \
> diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipe=
s-extended/procps/procps_3.3.16.bb
> index 2810ebd285..d0d7195e17 100644
> --- a/meta/recipes-extended/procps/procps_3.3.16.bb
> +++ b/meta/recipes-extended/procps/procps_3.3.16.bb
> @@ -73,4 +73,4 @@ python __anonymous() {
>  
>  # 'ps' isn't suitable for use as a security tool so whitelist this CVE.
>  # https://bugzilla.redhat.com/show_bug.cgi?id=3D1575473#c3
> -CVE_CHECK_WHITELIST +=3D "CVE-2018-1121"
> +CVE_CHECK_SAFELIST +=3D "CVE-2018-1121"
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/reci=
pes-multimedia/libpng/libpng_1.6.37.bb
> index 8c53d11642..ac1901f5a4 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> @@ -29,4 +29,4 @@ FILES_${PN}-tools =3D "${bindir}/png-fix-itxt ${bindir=
}/pngfix ${bindir}/pngcp"
>  BBCLASSEXTEND =3D "native nativesdk"
>  
>  # CVE-2019-17371 is actually a memory leak in gif2png 2.x
> -CVE_CHECK_WHITELIST +=3D "CVE-2019-17371"
> +CVE_CHECK_SAFELIST +=3D "CVE-2019-17371"
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/=
meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> index b100108766..7e32d0e3f6 100644
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> @@ -40,4 +40,4 @@ do_install_append() {
>  
>  # This can't be replicated and is just a memory leak.
>  # https://github.com/erikd/libsndfile/issues/398
> -CVE_CHECK_WHITELIST +=3D "CVE-2018-13419"
> +CVE_CHECK_SAFELIST +=3D "CVE-2018-13419"
> diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-suppor=
t/lz4/lz4_1.9.2.bb
> index 6510156ed0..a9adb174b9 100644
> --- a/meta/recipes-support/lz4/lz4_1.9.2.bb
> +++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
> @@ -19,7 +19,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
>  S =3D "${WORKDIR}/git"
>  
>  # Fixed in r118, which is larger than the current version.
> -CVE_CHECK_WHITELIST +=3D "CVE-2014-4715"
> +CVE_CHECK_SAFELIST +=3D "CVE-2014-4715"
>  
>  EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' DESTDIR=3D${D} LIBDIR=
=
=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=3Dno"
>  
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb b/meta/recipe=
s-support/sqlite/sqlite3_3.33.0.bb
> index 611a1bd923..097d7ec0d9 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
> @@ -7,4 +7,4 @@ SRC_URI =3D "http://www.sqlite.org/2020/sqlite-autoconf-=
${SQLITE_PV}.tar.gz"
>  SRC_URI[sha256sum] =3D "106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc738=
b7ca294d6956bbb15"
>  
>  # -19242 is only an issue in specific development branch commits
> -CVE_CHECK_WHITELIST +=3D "CVE-2019-19242"
> +CVE_CHECK_SAFELIST +=3D "CVE-2019-19242"
>
>=20


