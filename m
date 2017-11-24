Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0F96011A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 16:57:04 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id k7so4720576pln.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 08:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=Bu4cHwa6J6dXnkKdad3ia6l6JYJWz0P63l2s76Dap2Y=;
	b=e0tXtm3Gv3uPVYohGBqSYBV4GFWdrSb+8gxnlWAMfL+ZglKz7zba4n6rq9uJQIYLZe
	LLlZC0Dc/fPCJqjlu6PSKEPKXrFUGyMcm/LfBFjKkuSNkvYqRBbM8wvgCOAh9OvI3Uj3
	J9KFp+8Au7sd93UvIpIkldkAeL56EGnxO12e+WDT6TZmOGf1DfOihlLdqjhD5Oe661Rt
	zhI2dUtFi63UtyobxJ9twGi/xTe3kCnMry5xO8rg4pC0HuqMFWjhtRsPaZh5SdWu0HKh
	1MfLDXHd2LwgqXsO9Kooq+kkAkHF9Ms5MWj5mvdBcSWUzDpXK5RP1vq+Y997QDRQGf6T
	7EAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Bu4cHwa6J6dXnkKdad3ia6l6JYJWz0P63l2s76Dap2Y=;
	b=Tw1hfkn6Ap61XZ/aNONOf/IXYr5CRXv5q+LzN8qT1IPvLPRIly2QeGyo0UYuYiQbrn
	9oBrwEc6G5kAoySG7Ns/kE+JAcpdYOZ7Z93l3VpAyHuvD+xTBJjWmczB/7DGFo1sAdJB
	IhgltN724diKJD4pHpaKTlaFXkMuE3bC9Ybssl1XXe9Q/F+uD6Ncw/bgGkuB89MTsm6s
	fonrvU14e5J0wIR4/U6pwqod4Nd5j/tNjn44Tz/YQy2nLu+qkXDqp/hsBb4h9LnTOEC6
	VUPPW8tJXHpOuXYDUOiJhQfIcFqyDfVSnX8MkJu2PtRwMVcPSZEe2Jwe/S1HCAqmOiya
	azPw==
X-Gm-Message-State: AJaThX4/frQisPkSk44IJzeoX3/mGTSmOIu1Ln/ZJxL5PFV6gVSG360S
	/oN2WSq4ye0Oe+8ehYPBeuYC+A==
X-Google-Smtp-Source: AGs4zMbefI6H8fvrEXzBJ6N2QrYRPuHy6WLBJHiWhhRWC6oNWL8MVJAf8RiqjBxut5VMSx/pI26k3w==
X-Received: by 10.84.229.79 with SMTP id d15mr29260334pln.397.1511542625549;
	Fri, 24 Nov 2017 08:57:05 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:2178:58dc:281c:c010?
	([2601:202:4001:9ea0:2178:58dc:281c:c010])
	by smtp.gmail.com with ESMTPSA id
	a23sm28154378pfa.177.2017.11.24.08.57.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Nov 2017 08:57:05 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>, Armin Kuster <akuster808@gmail.com>
References: <cover.1511294278.git.akuster808@gmail.com>
	<a8779efbc41a18d6f1c0c9d31b3706e3b47c81bc.1511294278.git.akuster808@gmail.com>
	<CAJTo0Lb4CY-MnhSgt5XWvRYqCrYDba2N5CDghpkgeKh+uoq9Uw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <6e486fe6-1f4a-a36d-5885-34cfe9ff1d1c@gmail.com>
Date: Fri, 24 Nov 2017 08:57:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb4CY-MnhSgt5XWvRYqCrYDba2N5CDghpkgeKh+uoq9Uw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] curl: update to 7.56.1
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
X-List-Received-Date: Fri, 24 Nov 2017 16:57:05 -0000
Content-Type: multipart/alternative;
	boundary="------------5A69295331145029F4BE945A"
Content-Language: en-US

--------------5A69295331145029F4BE945A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 11/24/2017 04:49 AM, Burton, Ross wrote:
> Now I remember why this was rejected last time: it breaks dnf in musl
> (https://autobuilder.yocto.io/builders/nightly-musl/builds/616).
is it bugged?

- armin
>
> Ross
>
> On 21 November 2017 at 20:01, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     From: Armin Kuster <akuster@mvista.com <mailto:akuster@mvista.com>>
>
>     v2] - remove inherit
>
>     curlbuild.h removed from sources
>
>     includes:
>     CVE-2017-1000257
>
>     removed patches for the following cve fixs:
>     CVE-2017-1000254
>     CVE-2017-1000101
>     CVE-2017-1000100
>     CVE-2017-1000099
>
>     Signed-off-by: Armin Kuster <akuster@mvista.com
>     <mailto:akuster@mvista.com>>
>     ---
>      .../curl/{curl_7.54.1.bb <http://curl_7.54.1.bb> =>
>     curl_7.56.1.bb <http://curl_7.56.1.bb>}                | 14
>     +++-----------
>      1 file changed, 3 insertions(+), 11 deletions(-)
>      rename meta/recipes-support/curl/{curl_7.54.1.bb
>     <http://curl_7.54.1.bb> => curl_7.56.1.bb <http://curl_7.56.1.bb>}
>     (87%)
>
>     diff --git a/meta/recipes-support/curl/curl_7.54.1.bb
>     <http://curl_7.54.1.bb> b/meta/recipes-support/curl/curl_7.56.1.bb
>     <http://curl_7.56.1.bb>
>     similarity index 87%
>     rename from meta/recipes-support/curl/curl_7.54.1.bb
>     <http://curl_7.54.1.bb>
>     rename to meta/recipes-support/curl/curl_7.56.1.bb
>     <http://curl_7.56.1.bb>
>     index 58f0531..830f350 100644
>     --- a/meta/recipes-support/curl/curl_7.54.1.bb <http://curl_7.54.1.bb>
>     +++ b/meta/recipes-support/curl/curl_7.56.1.bb <http://curl_7.56.1.bb>
>     @@ -7,10 +7,6 @@ LIC_FILES_CHKSUM =
>     "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
>
>      SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2
>     <http://curl.haxx.se/download/curl-$%7BPV%7D.tar.bz2> \
>                 file://0001-replace-krb5-config-with-pkg-config.patch \
>     -           file://CVE-2017-1000099.patch \
>     -           file://CVE-2017-1000100.patch \
>     -           file://CVE-2017-1000101.patch \
>     -           file://CVE-2017-1000254.patch \
>      "
>
>      SRC_URI_append_class-target = " \
>     @@ -22,11 +18,11 @@ SRC_URI_append_class-target = " \
>      #
>      SRC_URI += " file://configure_ac.patch"
>
>     -SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
>     -SRC_URI[sha256sum] =
>     "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
>     +SRC_URI[md5sum] = "428de25834ef8c04076906d6d5c0498e"
>     +SRC_URI[sha256sum] =
>     "2594670367875e7d87b0f129b5e4690150780884d90244ba0fe3e74a778b5f90"
>
>      CVE_PRODUCT = "libcurl"
>     -inherit autotools pkgconfig binconfig multilib_header
>     +inherit autotools pkgconfig binconfig
>
>      PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6',
>     d)} gnutls proxy threaded-resolver zlib"
>      PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver zlib"
>     @@ -64,10 +60,6 @@ EXTRA_OECONF = " \
>          --without-libpsl \
>      "
>
>     -do_install_append() {
>     -       oe_multilib_header curl/curlbuild.h
>     -}
>     -
>      do_install_append_class-target() {
>             # cleanup buildpaths from curl-config
>             sed -i \
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------5A69295331145029F4BE945A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/24/2017 04:49 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0Lb4CY-MnhSgt5XWvRYqCrYDba2N5CDghpkgeKh+uoq9Uw@mail.gmail.com">
      <div dir="ltr">Now I remember why this was rejected last time: it
        breaks dnf in musl (<a
          href="https://autobuilder.yocto.io/builders/nightly-musl/builds/616"
          moz-do-not-send="true">https://autobuilder.yocto.io/builders/nightly-musl/builds/616</a>).</div>
    </blockquote>
    is it bugged?<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CAJTo0Lb4CY-MnhSgt5XWvRYqCrYDba2N5CDghpkgeKh+uoq9Uw@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 21 November 2017 at 20:01, Armin
          Kuster <span dir="ltr">&lt;<a
              href="mailto:akuster808@gmail.com" target="_blank"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
            Armin Kuster &lt;<a href="mailto:akuster@mvista.com"
              moz-do-not-send="true">akuster@mvista.com</a>&gt;<br>
            <br>
            v2] - remove inherit<br>
            <br>
            curlbuild.h removed from sources<br>
            <br>
            includes:<br>
            CVE-2017-1000257<br>
            <br>
            removed patches for the following cve fixs:<br>
            CVE-2017-1000254<br>
            CVE-2017-1000101<br>
            CVE-2017-1000100<br>
            CVE-2017-1000099<br>
            <br>
            Signed-off-by: Armin Kuster &lt;<a
              href="mailto:akuster@mvista.com" moz-do-not-send="true">akuster@mvista.com</a>&gt;<br>
            ---<br>
             .../curl/{<a href="http://curl_7.54.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">curl_7.54.1.bb</a>
            =&gt; <a href="http://curl_7.56.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">curl_7.56.1.bb</a>} 
                          | 14 +++-----------<br>
             1 file changed, 3 insertions(+), 11 deletions(-)<br>
             rename meta/recipes-support/curl/{<a
              href="http://curl_7.54.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cur<wbr>l_7.54.1.bb</a>
            =&gt; <a href="http://curl_7.56.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">curl_7.56.1.bb</a>}
            (87%)<br>
            <br>
            diff --git a/meta/recipes-support/curl/<a
              href="http://curl_7.54.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cu<wbr>rl_7.54.1.bb</a>
            b/meta/recipes-support/curl/<a href="http://curl_7.56.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">cu<wbr>rl_7.56.1.bb</a><br>
            similarity index 87%<br>
            rename from meta/recipes-support/curl/<a
              href="http://curl_7.54.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">curl<wbr>_7.54.1.bb</a><br>
            rename to meta/recipes-support/curl/<a
              href="http://curl_7.56.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">curl<wbr>_7.56.1.bb</a><br>
            index 58f0531..830f350 100644<br>
            --- a/meta/recipes-support/curl/<a
              href="http://curl_7.54.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cu<wbr>rl_7.54.1.bb</a><br>
            +++ b/meta/recipes-support/curl/<a
              href="http://curl_7.56.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cu<wbr>rl_7.56.1.bb</a><br>
            @@ -7,10 +7,6 @@ LIC_FILES_CHKSUM =
            "<a class="moz-txt-link-freetext" href="file://COPYING;beginline=8">file://COPYING;beginline=8</a>;<wbr>md5=<wbr>3a34942f4ae3fbf1a303160714e66<br>
            <br>
             SRC_URI = "<a
              href="http://curl.haxx.se/download/curl-$%7BPV%7D.tar.bz2"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://curl.haxx.se/download/<wbr>curl-${PV}.tar.bz2</a>
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0001-replace-krb5">file://0001-replace-krb5</a>-<wbr>config-with-pkg-config.patch
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://CVE-2017-1000099.patch">file://CVE-2017-1000099.patch</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://CVE-2017-1000100.patch">file://CVE-2017-1000100.patch</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://CVE-2017-1000101.patch">file://CVE-2017-1000101.patch</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://CVE-2017-1000254.patch">file://CVE-2017-1000254.patch</a> \<br>
             "<br>
            <br>
             SRC_URI_append_class-target = " \<br>
            @@ -22,11 +18,11 @@ SRC_URI_append_class-target = " \<br>
             #<br>
             SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://configure_ac.patch">" file://configure_ac.patch"</a><br>
            <br>
            -SRC_URI[md5sum] = "<wbr>6b6eb722f512e7a24855ff084f54fe<wbr>55"<br>
            -SRC_URI[sha256sum] = "<wbr>fdfc4df2d001ee0c44ec071186e770<wbr>046249263c491fcae48df0e1a3ca8f<wbr>25a0"<br>
            +SRC_URI[md5sum] = "<wbr>428de25834ef8c04076906d6d5c049<wbr>8e"<br>
            +SRC_URI[sha256sum] = "<wbr>2594670367875e7d87b0f129b5e469<wbr>0150780884d90244ba0fe3e74a778b<wbr>5f90"<br>
            <br>
             CVE_PRODUCT = "libcurl"<br>
            -inherit autotools pkgconfig binconfig multilib_header<br>
            +inherit autotools pkgconfig binconfig<br>
            <br>
             PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_<wbr>FEATURES',
            'ipv6', d)} gnutls proxy threaded-resolver zlib"<br>
             PACKAGECONFIG_class-native = "ipv6 proxy ssl
            threaded-resolver zlib"<br>
            @@ -64,10 +60,6 @@ EXTRA_OECONF = " \<br>
                 --without-libpsl \<br>
             "<br>
            <br>
            -do_install_append() {<br>
            -       oe_multilib_header curl/curlbuild.h<br>
            -}<br>
            -<br>
             do_install_append_class-<wbr>target() {<br>
                    # cleanup buildpaths from curl-config<br>
                    sed -i \<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.7.4<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------5A69295331145029F4BE945A--
