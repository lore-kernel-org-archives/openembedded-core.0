Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.12355.1599889519260182889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 22:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DTda0L74;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id m15so1894639pls.8
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 22:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=V/gtF3h/hM+MQC7DV31+NPsOLWQVwg1F65ocs0rGoBQ=;
        b=DTda0L74lrh7VSKT19oKZRtP2UA6+jwSh36fwC5w1OVZ5ajqKv/jV9GzdX470qugFw
         xNhc+uHKcBtLKRPrIDrEBMUSJIsh5pd9rbQAxtZ9zhIGiNtoHQixSB6i+leJorggPp4H
         /8S4GknWXM3NOWN7NQitSCjwaKW5Pp0DM3v9OySXUXK2XkZ7VO9BzDAsbaO9/PoOSdyg
         4j/Xg5wjFVTX/8yX6CEZSP5s6H1wm+58GHZYHootepaNw3I3OXrlX1AmNhved6nt7COW
         e9YI70iokCwrmNsVaaYqQy0/KiPxDAjnh+cVVvwA7Oqg3IBMV4ANQPfyzJfALb7W/LUI
         0oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=V/gtF3h/hM+MQC7DV31+NPsOLWQVwg1F65ocs0rGoBQ=;
        b=OvpkMBMgLZrnKS788oeZjJm1RsK2t3xFs4bGjJR+xi6PPO4onqym2JwASBQ8l790m2
         zn5cnTKLwNFT8kDudwge8zzfqM92gdCDdkZx6GoCATwaWNuQVgEZi3500ZRy1ei/OQSb
         0HXXGmWbpt9odA1vriei/0jCvseoqqQd8v4tB4FAsiozJLnkqlwr27EMjxNeg1ve5YT6
         0RocdL4QzYD0mnnNdNydqgJGko8MaF33+dTYh68GtC+Y3Xz6pRpYeVmnbfnwE65fR+ZC
         E9ocCBeoxOaYb5V2sKXUmv/AZ1V4fE+0HuhQUqg4ACCp3LzoUPOCr+ua88TluQazOm83
         Yw+Q==
X-Gm-Message-State: AOAM531LBTa4UEQomMbqjZ1h+gYMJPHvgMPNJZloT6O75065JYZZmapF
	tpn9+lJ1Cp4p+MwAF4rqfQV4fjakjcsrKA==
X-Google-Smtp-Source: ABdhPJxuuDa6u3/2pzJ5ob6CE+dax+feGOOcuXoquqFrgot7JRVhDC7C+ogRI4uw0UlSptL9LObGSA==
X-Received: by 2002:a17:902:9685:: with SMTP id n5mr5115001plp.73.1599889518235;
        Fri, 11 Sep 2020 22:45:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2dcb? ([2601:646:9200:4e0::2dcb])
        by smtp.gmail.com with ESMTPSA id v69sm3131463pgd.61.2020.09.11.22.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 22:45:17 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] cve-check: use SAFELIST
To: akuster <akuster808@gmail.com>, Lee Chee Yang <chee.yang.lee@intel.com>,
 openembedded-core@lists.openembedded.org
References: <20200911073712.25524-1-chee.yang.lee@intel.com>
 <214da994-90e8-4879-3e52-fddd74577782@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <a2462451-ec7b-1e73-1a5f-1bba3093cf62@gmail.com>
Date: Fri, 11 Sep 2020 22:45:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <214da994-90e8-4879-3e52-fddd74577782@gmail.com>
X-Groupsio-MsgNum: 142451
Content-Type: multipart/mixed;
 boundary="------------E82E28D6A3A6574500E0FF41"
Content-Language: en-US

--------------E82E28D6A3A6574500E0FF41
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 9/11/20 3:20 PM, akuster wrote:
>=20
>=20
> On 9/11/20 12:37 AM, Lee Chee Yang wrote:
>> From: Lee Chee Yang <chee.yang.lee@intel.com>
>>
>> use safelist instead of whitelist.
> Thanks for sending the patch. There is some unfinished conclusions for
> renaming various variables to be more inclusive. I am personally fine
> with this word choice.
>=20
> Is this what other open source projects are rename to ?=C2=A0
>=20
> So would "blacklist" become "unsafelist"

I think, BLOCKLIST/ALLOWLIST would be better here.

>=20
> Do you have an idea if other layers would be affected by this change?
>=20
> -armin
>=20
>=20
>> Replace CVE_CHECK_PN_WHITELIST with CVE_CHECK_PN_SAFELIST.
>> Replace CVE_CHECK_WHITELIST with CVE_CHECK_SAFELIST.
>>
>> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
>> ---
>>  meta/classes/cve-check.bbclass                | 47 ++++++++++---------
>>  .../openssl/openssl_1.1.1g.bb                 |  2 +-
>>  meta/recipes-core/glibc/glibc_2.32.bb         |  2 +-
>>  meta/recipes-devtools/cmake/cmake.inc         |  2 +-
>>  meta/recipes-devtools/python/python3_3.8.5.bb |  2 +-
>>  meta/recipes-devtools/rsync/rsync_3.2.3.bb    |  2 +-
>>  .../iputils/iputils_s20200821.bb              |  2 +-
>>  meta/recipes-extended/procps/procps_3.3.16.bb |  2 +-
>>  .../libpng/libpng_1.6.37.bb                   |  2 +-
>>  .../libsndfile/libsndfile1_1.0.28.bb          |  2 +-
>>  meta/recipes-support/lz4/lz4_1.9.2.bb         |  2 +-
>>  meta/recipes-support/sqlite/sqlite3_3.33.0.bb |  2 +-
>>  12 files changed, 35 insertions(+), 34 deletions(-)
>>
>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bb=
class
>> index 17f64a8a9c..82b2b40da0 100644
>> --- a/meta/classes/cve-check.bbclass
>> +++ b/meta/classes/cve-check.bbclass
>> @@ -40,15 +40,15 @@ CVE_CHECK_MANIFEST ?=3D "${DEPLOY_DIR_IMAGE}/${IMAG=
E_NAME}${IMAGE_NAME_SUFFIX}.cve
>>  CVE_CHECK_COPY_FILES ??=3D "1"
>>  CVE_CHECK_CREATE_MANIFEST ??=3D "1"
>>  
>> -# Whitelist for packages (PN)
>> -CVE_CHECK_PN_WHITELIST ?=3D ""
>> +# Safelist for packages (PN)
>> +CVE_CHECK_PN_SAFELIST ?=3D ""
>>  
>> -# Whitelist for CVE. If a CVE is found, then it is considered patched.
>> +# Safelist for CVE. If a CVE is found, then it is considered patched.
>>  # The value is a string containing space separated CVE values:
>> -#=20
>> -# CVE_CHECK_WHITELIST =3D 'CVE-2014-2524 CVE-2018-1234'
>> -#=20
>> -CVE_CHECK_WHITELIST ?=3D ""
>> +#
>> +# CVE_CHECK_SAFELIST =3D 'CVE-2014-2524 CVE-2018-1234'
>> +#
>> +CVE_CHECK_SAFELIST ?=3D ""
>>  
>>  python cve_save_summary_handler () {
>>      import shutil
>> @@ -87,10 +87,10 @@ python do_cve_check () {
>>              patched_cves =3D get_patches_cves(d)
>>          except FileNotFoundError:
>>              bb.fatal("Failure in searching patches")
>> -        whitelisted, patched, unpatched =3D check_cves(d, patched_cves=
)
>> +        safelisted, patched, unpatched =3D check_cves(d, patched_cves)
>>          if patched or unpatched:
>>              cve_data =3D get_cve_info(d, patched + unpatched)
>> -            cve_write_data(d, patched, unpatched, whitelisted, cve_dat=
a)
>> +            cve_write_data(d, patched, unpatched, safelisted, cve_data=
)
>>      else:
>>          bb.note("No CVE database found, skipping CVE check")
>>  
>> @@ -213,15 +213,16 @@ def check_cves(d, patched_cves):
>>          return ([], [], [])
>>      pv =3D d.getVar("CVE_VERSION").split("+git")[0]
>>  
>> -    # If the recipe has been whitlisted we return empty lists
>> -    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
>> -        bb.note("Recipe has been whitelisted, skipping check")
>> +    if d.getVar("CVE_CHECK_PN_WHITELIST"):
>> +        bb.warn("CVE_CHECK_PN_WHITELIST is deprecated, please use CVE_=
CHECK_PN_SAFELIST.")
>> +    # If the recipe has been safelisted we return empty lists
>> +    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_SAFELIST").split():
>> +        bb.note("Recipe has been safelisted, skipping check")
>>          return ([], [], [])
>>  
>> -    old_cve_whitelist =3D  d.getVar("CVE_CHECK_CVE_WHITELIST")
>> -    if old_cve_whitelist:
>> -        bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use CVE=
_CHECK_WHITELIST.")
>> -    cve_whitelist =3D d.getVar("CVE_CHECK_WHITELIST").split()
>> +    if d.getVar("CVE_CHECK_CVE_WHITELIST") or d.getVar("CVE_CHECK_WHIT=
ELIST"):
>> +        bb.warn("CVE_CHECK_CVE_WHITELIST and CVE_CHECK_WHITELIST is de=
precated, please use CVE_CHECK_SAFELIST.")
>> +    cve_safelist =3D d.getVar("CVE_CHECK_SAFELIST").split()
>>  
>>      import sqlite3
>>      db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
>> @@ -238,9 +239,9 @@ def check_cves(d, patched_cves):
>>          for cverow in conn.execute("SELECT DISTINCT ID FROM PRODUCTS W=
HERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
>>              cve =3D cverow[0]
>>  
>> -            if cve in cve_whitelist:
>> -                bb.note("%s-%s has been whitelisted for %s" % (product=
, pv, cve))
>> -                # TODO: this should be in the report as 'whitelisted'
>> +            if cve in cve_safelist:
>> +                bb.note("%s-%s has been safelisted for %s" % (product,=
 pv, cve))
>> +                # TODO: this should be in the report as 'safelisted'
>>                  patched_cves.add(cve)
>>                  continue
>>              elif cve in patched_cves:
>> @@ -294,7 +295,7 @@ def check_cves(d, patched_cves):
>>  
>>      conn.close()
>>  
>> -    return (list(cve_whitelist), list(patched_cves), cves_unpatched)
>> +    return (list(cve_safelist), list(patched_cves), cves_unpatched)
>>  
>>  def get_cve_info(d, cves):
>>      """
>> @@ -318,7 +319,7 @@ def get_cve_info(d, cves):
>>      conn.close()
>>      return cve_data
>>  
>> -def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
>> +def cve_write_data(d, patched, unpatched, safelisted, cve_data):
>>      """
>>      Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
>>      CVE manifest if enabled.
>> @@ -334,8 +335,8 @@ def cve_write_data(d, patched, unpatched, whitelist=
ed, cve_data):
>>          write_string +=3D "PACKAGE NAME: %s\n" % d.getVar("PN")
>>          write_string +=3D "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTEN=
DPE"), d.getVar("PV"))
>>          write_string +=3D "CVE: %s\n" % cve
>> -        if cve in whitelisted:
>> -            write_string +=3D "CVE STATUS: Whitelisted\n"
>> +        if cve in safelisted:
>> +            write_string +=3D "CVE STATUS: Safelisted\n"
>>          elif cve in patched:
>>              write_string +=3D "CVE STATUS: Patched\n"
>>          else:
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta=
/recipes-connectivity/openssl/openssl_1.1.1g.bb
>> index 815955837b..c74538fa99 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
>> @@ -212,4 +212,4 @@ CVE_PRODUCT =3D "openssl:openssl"
>>  
>>  # Only affects OpenSSL >=3D 1.1.1 in combination with Apache < 2.4.37
>>  # Apache in meta-webserver is already recent enough
>> -CVE_CHECK_WHITELIST +=3D "CVE-2019-0190"
>> +CVE_CHECK_SAFELIST +=3D "CVE-2019-0190"
>> diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/=
glibc/glibc_2.32.bb
>> index 7049e61625..9e29904e85 100644
>> --- a/meta/recipes-core/glibc/glibc_2.32.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.32.bb
>> @@ -1,7 +1,7 @@
>>  require glibc.inc
>>  require glibc-version.inc
>>  
>> -CVE_CHECK_WHITELIST +=3D "CVE-2020-10029"
>> +CVE_CHECK_SAFELIST +=3D "CVE-2020-10029"
>>  
>>  DEPENDS +=3D "gperf-native bison-native make-native"
>>  
>> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devto=
ols/cmake/cmake.inc
>> index fa1b818ae4..418845a597 100644
>> --- a/meta/recipes-devtools/cmake/cmake.inc
>> +++ b/meta/recipes-devtools/cmake/cmake.inc
>> @@ -28,4 +28,4 @@ UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)=
\.tar"
>>  
>>  # This is specific to the npm package that installs cmake, so isn't
>>  # relevant to OpenEmbedded
>> -CVE_CHECK_WHITELIST +=3D "CVE-2016-10642"
>> +CVE_CHECK_SAFELIST +=3D "CVE-2016-10642"
>> diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recip=
es-devtools/python/python3_3.8.5.bb
>> index cabe5dc075..edbfc634ab 100644
>> --- a/meta/recipes-devtools/python/python3_3.8.5.bb
>> +++ b/meta/recipes-devtools/python/python3_3.8.5.bb
>> @@ -49,7 +49,7 @@ UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d=
+)+).tar"
>>  CVE_PRODUCT =3D "python"
>>  
>>  # This is not exploitable when glibc has CVE-2016-10739 fixed.
>> -CVE_CHECK_WHITELIST +=3D "CVE-2019-18348"
>> +CVE_CHECK_SAFELIST +=3D "CVE-2019-18348"
>>  
>>  PYTHON_MAJMIN =3D "3.8"
>>  
>> diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-=
devtools/rsync/rsync_3.2.3.bb
>> index 375efa0dea..1e52c48b5d 100644
>> --- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
>> +++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
>> @@ -17,7 +17,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/sr=
c/${BP}.tar.gz \
>>  SRC_URI[sha256sum] =3D "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad56=
83c179a697146ce50e"
>>  
>>  # -16548 required for v3.1.3pre1. Already in v3.1.3.
>> -CVE_CHECK_WHITELIST +=3D " CVE-2017-16548 "
>> +CVE_CHECK_SAFELIST +=3D " CVE-2017-16548 "
>>  
>>  inherit autotools-brokensep
>>  
>> diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/=
recipes-extended/iputils/iputils_s20200821.bb
>> index 28dd194a12..073af6777c 100644
>> --- a/meta/recipes-extended/iputils/iputils_s20200821.bb
>> +++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
>> @@ -21,7 +21,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>s\d+)"
>>  
>>  # Fixed in 2000-10-10, but the versioning of iputils
>>  # breaks the version order.
>> -CVE_CHECK_WHITELIST +=3D "CVE-2000-1213 CVE-2000-1214"
>> +CVE_CHECK_SAFELIST +=3D "CVE-2000-1213 CVE-2000-1214"
>>  
>>  PACKAGECONFIG ??=3D "libcap rarpd \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ni=
nfod traceroute6', '', d)} \
>> diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recip=
es-extended/procps/procps_3.3.16.bb
>> index 2810ebd285..d0d7195e17 100644
>> --- a/meta/recipes-extended/procps/procps_3.3.16.bb
>> +++ b/meta/recipes-extended/procps/procps_3.3.16.bb
>> @@ -73,4 +73,4 @@ python __anonymous() {
>>  
>>  # 'ps' isn't suitable for use as a security tool so whitelist this CVE=
.
>>  # https://bugzilla.redhat.com/show_bug.cgi?id=3D1575473#c3
>> -CVE_CHECK_WHITELIST +=3D "CVE-2018-1121"
>> +CVE_CHECK_SAFELIST +=3D "CVE-2018-1121"
>> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/rec=
ipes-multimedia/libpng/libpng_1.6.37.bb
>> index 8c53d11642..ac1901f5a4 100644
>> --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
>> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
>> @@ -29,4 +29,4 @@ FILES_${PN}-tools =3D "${bindir}/png-fix-itxt ${bindi=
r}/pngfix ${bindir}/pngcp"
>>  BBCLASSEXTEND =3D "native nativesdk"
>>  
>>  # CVE-2019-17371 is actually a memory leak in gif2png 2.x
>> -CVE_CHECK_WHITELIST +=3D "CVE-2019-17371"
>> +CVE_CHECK_SAFELIST +=3D "CVE-2019-17371"
>> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b=
/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
>> index b100108766..7e32d0e3f6 100644
>> --- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
>> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
>> @@ -40,4 +40,4 @@ do_install_append() {
>>  
>>  # This can't be replicated and is just a memory leak.
>>  # https://github.com/erikd/libsndfile/issues/398
>> -CVE_CHECK_WHITELIST +=3D "CVE-2018-13419"
>> +CVE_CHECK_SAFELIST +=3D "CVE-2018-13419"
>> diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-suppo=
rt/lz4/lz4_1.9.2.bb
>> index 6510156ed0..a9adb174b9 100644
>> --- a/meta/recipes-support/lz4/lz4_1.9.2.bb
>> +++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
>> @@ -19,7 +19,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
>>  S =3D "${WORKDIR}/git"
>>  
>>  # Fixed in r118, which is larger than the current version.
>> -CVE_CHECK_WHITELIST +=3D "CVE-2014-4715"
>> +CVE_CHECK_SAFELIST +=3D "CVE-2014-4715"
>>  
>>  EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' DESTDIR=3D${D} LIBDI=
R=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=3Dno"
>>  
>> diff --git a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb b/meta/recip=
es-support/sqlite/sqlite3_3.33.0.bb
>> index 611a1bd923..097d7ec0d9 100644
>> --- a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
>> +++ b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
>> @@ -7,4 +7,4 @@ SRC_URI =3D "http://www.sqlite.org/2020/sqlite-autoconf=
-${SQLITE_PV}.tar.gz"
>>  SRC_URI[sha256sum] =3D "106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc73=
8b7ca294d6956bbb15"
>>  
>>  # -19242 is only an issue in specific development branch commits
>> -CVE_CHECK_WHITELIST +=3D "CVE-2019-19242"
>> +CVE_CHECK_SAFELIST +=3D "CVE-2019-19242"
>>
>>
>=20
>=20
>=20
>=20
>=20

--------------E82E28D6A3A6574500E0FF41
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------E82E28D6A3A6574500E0FF41--
