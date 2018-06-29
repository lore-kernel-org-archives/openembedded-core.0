Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A94D8751BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 20:40:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id l65-v6so4462825pgl.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=+vsasNvINw9q9cARfeMBZjY2jcYKEBtuy1Aw4DjU0z4=;
	b=mwpCPs03aQjSM0nU92u/f74Ar6M4cEnpgNJbXOEnjICMf6wCcAYbeY2AIf7IaMdsLB
	E8CHYD0J/9x58Z/CX3YwQr00wzbgxWSAEs6pjOV4ik0ndvwGqVTdQaqwvRlXRxyz9doc
	YdB/kpSVP+aZPScl/ime8op7gxGtssgprW7lIGnR6+i+1IN/eVL5T/KzdJ3CiaBlm26a
	ZP6vaeE8038diYwe9u2rco2DoRqxprLep+Th9AroWDEUJHp3cAB4ci5St0pVje1stEPb
	f/kMoDgNLQxbYMhFS70BDjmab9HcGdNJcmyEojt7VFTwaSFZNBslmWGWgs6e2ik+ZhQD
	QteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=+vsasNvINw9q9cARfeMBZjY2jcYKEBtuy1Aw4DjU0z4=;
	b=NP6ZcR/1EmT0HX4UyBi+Dzqd5Els+fXXYMhP49FzpeH/GXcyNYNl4jjK9yzWIy1LSF
	uVlPb2NgHcz1N1BQkL9cTflLqFEHUw2V1ODKh/viKjFsrzBlfsRjJfJI+ZMP90qyNCJz
	YaPWkG63HSkTJu4HXq8gNQm8khqh2YbDxSztabNOF2MVJMv4numn2Avbt5rzX8zL84Iw
	KbnoEmCpqgHrkZ44nBUpxnTr4kPeUmdd416WosRjLZFLz98O5JqX8RN7oe0+tmXcWISw
	HzRqztmELU29SXRtHsBxyT8xdUwGQGhmFphYFn+czQGDn6l4XkPKFdQCrNeXTA6WSEQW
	A9hw==
X-Gm-Message-State: APt69E1vom6bp+rX5846F9KWxwkwWUYSMIDncjy69lqhUL/8gGaj7v7O
	UJyOK3PzP5eFrnpwZxcHUand0w==
X-Google-Smtp-Source: ADUXVKKPTgisljBaaFYqrJes9jP3BBhIcqdpEOc1yiEeyp4/0RrtFGgrF4XE0WVCqAYiwW18YqAVqg==
X-Received: by 2002:a63:24f:: with SMTP id
	76-v6mr14135518pgc.252.1530304826592; 
	Fri, 29 Jun 2018 13:40:26 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:993d:73fb:9148:cade?
	([2601:202:4000:1184:993d:73fb:9148:cade])
	by smtp.gmail.com with ESMTPSA id
	i188-v6sm6651261pfc.3.2018.06.29.13.40.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 13:40:26 -0700 (PDT)
To: Christopher Larson <kergoth@gmail.com>
References: <1529865828-13206-1-git-send-email-akuster808@gmail.com>
	<CABcZANkEA37r6a3wsBsTLirvT5dZ2o+AOpWXONPiXPgRf=5=Cw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fa121093-4696-356f-8f27-96a6573a6bab@gmail.com>
Date: Fri, 29 Jun 2018 13:40:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CABcZANkEA37r6a3wsBsTLirvT5dZ2o+AOpWXONPiXPgRf=5=Cw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: update 4.4.1
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
X-List-Received-Date: Fri, 29 Jun 2018 20:40:25 -0000
Content-Type: multipart/alternative;
	boundary="------------0E2B9204DB51C56DE14E27A2"
Content-Language: en-US

--------------0E2B9204DB51C56DE14E27A2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 06/29/2018 08:13 AM, Christopher Larson wrote:
>
>
> On Sun, Jun 24, 2018 at 11:43 AM Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     include several CVE fixes.
>     CVE: CVE-2018-5733
>     CVE: CVE-2018-5732
>
>     LIC_CHKSUM_FILE updated to SPFX format
>
>     https://kb.isc.org/article/AA-01571
>
>     remove several patches now included in update.
>     Shared libarary support is now enabled in configure+lt, use it
>     and revert to autotools-brokensep
>     Refresh patches
>
>     alings support with bind 9.11.x
>
>     add libxml2 support to configure.ac <http://configure.ac>+lt
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>     =C2=A0meta/recipes-connectivity/dhcp/dhcp.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 19 +-
>     =C2=A0...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |=C2=A0 13=
 +-
>     =C2=A0.../dhcp/dhcp/0003-link-with-lcrypto.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 13 +-
>     =C2=A0.../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch=C2=A0 =C2=A0 =
| 109 +++++------
>     =C2=A0.../dhcp/0006-site.h-enable-gentle-shutdown.patch=C2=A0 |=C2=A0=
 13 +-
>     =C2=A0...re-argument-to-make-the-libxml2-dependenc.patch |=C2=A0 40=
 +++-
>     =C2=A0.../dhcp/dhcp/0010-build-shared-libs.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 208
>     ---------------------
>     =C2=A0...all-to-isc_app_ctxstart-to-not-get-signal.patch |=C2=A0 81=
 --------
>     =C2=A0...correct-the-intention-for-xml2-lib-search.patch |=C2=A0 13=
 +-
>     =C2=A0.../dhcp/dhcp/CVE-2017-3144.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 74 --------
>     =C2=A0.../dhcp/{dhcp_4.3.6.bb <http://dhcp_4.3.6.bb> =3D> dhcp_4.4.=
1.bb
>     <http://dhcp_4.4.1.bb>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1=
2 +-
>     =C2=A011 files changed, 120 insertions(+), 475 deletions(-)
>     =C2=A0delete mode 100644
>     meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
>     =C2=A0delete mode 100644
>     meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_=
ctxstart-to-not-get-signal.patch
>     =C2=A0delete mode 100644
>     meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch
>     =C2=A0rename meta/recipes-connectivity/dhcp/{dhcp_4.3.6.bb
>     <http://dhcp_4.3.6.bb> =3D> dhcp_4.4.1.bb <http://dhcp_4.4.1.bb>} (=
65%)
>
>     diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc
>     b/meta/recipes-connectivity/dhcp/dhcp.inc
>     index e943707..2eb3513 100644
>     --- a/meta/recipes-connectivity/dhcp/dhcp.inc
>     +++ b/meta/recipes-connectivity/dhcp/dhcp.inc
>     @@ -8,7 +8,7 @@ easier to administer devices."
>     =C2=A0HOMEPAGE =3D "http://www.isc.org/"
>
>     =C2=A0LICENSE =3D "ISC"
>     -LIC_FILES_CHKSUM =3D
>     "file://LICENSE;beginline=3D4;md5=3Dc5c64d696107f84b56fe337d14da175=
3"
>     +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;beginline=3D4;md5=3D004a4db50a1e20972e924a8618747c0=
1"
>
>     =C2=A0DEPENDS =3D "openssl bind"
>
>     @@ -24,7 +24,7 @@ SRC_URI =3D
>     "http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz
>     <http://ftp.isc.org/isc/dhcp/$%7BPV%7D/dhcp-$%7BPV%7D.tar.gz> \
>     =C2=A0UPSTREAM_CHECK_URI =3D "ftp://ftp.isc.org/isc/dhcp/"
>     =C2=A0UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+\.\d+\.(\d+?))/"
>
>     -inherit autotools systemd useradd update-rc.d
>     +inherit autotools-brokensep systemd useradd update-rc.d
>
>     =C2=A0USERADD_PACKAGES =3D "${PN}-server"
>     =C2=A0USERADD_PARAM_${PN}-server =3D "--system --no-create-home
>     --home-dir /var/run/${BPN} --shell /bin/false --user-group ${BPN}"
>     @@ -48,11 +48,21 @@ EXTRA_OECONF =3D
>     "--with-srv-lease-file=3D${localstatedir}/lib/dhcp/dhcpd.leases \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>     =C2=A0--with-srv6-lease-file=3D${localstatedir}/lib/dhcp/dhcpd6.lea=
ses \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>     =C2=A0--with-cli-lease-file=3D${localstatedir}/lib/dhcp/dhclient.le=
ases \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>     =C2=A0--with-cli6-lease-file=3D${localstatedir}/lib/dhcp/dhclient6.=
leases \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-lib=
bind=3D${STAGING_LIBDIR}/ \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--ena=
ble-paranoia --disable-static \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--wit=
h-randomdev=3D/dev/random \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-lib=
bind=3D${STAGING_DIR_HOST}/usr \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-li=
btool \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
>     +#Enable shared libs per dhcp README
>     +do_configure () {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp configure.ac <http://configure.ac>+l=
t configure.ac
>     <http://configure.ac>
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 autoreconf -i
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0./configure=C2=A0 ${CONFIGUREOPTS} ${EX=
TRA_OECONF}=C2=A0 =C2=A0
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0automake
>
>
> 1. Why run automake when autoreconf already runs automake?
it caused errors when I did not included.

> 2. Why override do_configure and reproduce what's already in
> autotools-brokensep rather than doing the cp in a do_configure_prepend?=

I did that first and it did not work. The README regarding *+lt says it
needs "autoreconf -i". I am only doing this as the current version of
dhcp has a patch to create shared libs. The isc dhcp solution to this is
their configure.ac+lt.=C2=A0 I would rather no do this but someone needed=

shared libs.

- armin


> --=20
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics


--------------0E2B9204DB51C56DE14E27A2
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
    <div class="moz-cite-prefix">On 06/29/2018 08:13 AM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABcZANkEA37r6a3wsBsTLirvT5dZ2o+AOpWXONPiXPgRf=5=Cw@mail.gmail.com">
      <div dir="ltr"><br>
        <br>
        <div class="gmail_quote">
          <div dir="ltr">On Sun, Jun 24, 2018 at 11:43 AM Armin Kuster
            &lt;<a href="mailto:akuster808@gmail.com"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">include
            several CVE fixes.<br>
            CVE: CVE-2018-5733<br>
            CVE: CVE-2018-5732<br>
            <br>
            LIC_CHKSUM_FILE updated to SPFX format<br>
            <br>
            <a href="https://kb.isc.org/article/AA-01571"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://kb.isc.org/article/AA-01571</a><br>
            <br>
            remove several patches now included in update.<br>
            Shared libarary support is now enabled in configure+lt, use
            it<br>
            and revert to autotools-brokensep<br>
            Refresh patches<br>
            <br>
            alings support with bind 9.11.x<br>
            <br>
            add libxml2 support to <a href="http://configure.ac"
              rel="noreferrer" target="_blank" moz-do-not-send="true">configure.ac</a>+lt<br>
            <br>
            Signed-off-by: Armin Kuster &lt;<a
              href="mailto:akuster808@gmail.com" target="_blank"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt;<br>
            ---<br>
             meta/recipes-connectivity/dhcp/dhcp.inc            |  19 +-<br>
             ...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  13 +-<br>
             .../dhcp/dhcp/0003-link-with-lcrypto.patch         |  13 +-<br>
             .../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch    | 109
            +++++------<br>
             .../dhcp/0006-site.h-enable-gentle-shutdown.patch  |  13 +-<br>
             ...re-argument-to-make-the-libxml2-dependenc.patch |  40
            +++-<br>
             .../dhcp/dhcp/0010-build-shared-libs.patch         | 208
            ---------------------<br>
             ...all-to-isc_app_ctxstart-to-not-get-signal.patch |  81
            --------<br>
             ...correct-the-intention-for-xml2-lib-search.patch |  13 +-<br>
             .../dhcp/dhcp/CVE-2017-3144.patch                  |  74
            --------<br>
             .../dhcp/{<a href="http://dhcp_4.3.6.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">dhcp_4.3.6.bb</a>
            =&gt; <a href="http://dhcp_4.4.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">dhcp_4.4.1.bb</a>} 
                    |  12 +-<br>
             11 files changed, 120 insertions(+), 475 deletions(-)<br>
             delete mode 100644
            meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch<br>
             delete mode 100644
meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch<br>
             delete mode 100644
            meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch<br>
             rename meta/recipes-connectivity/dhcp/{<a
              href="http://dhcp_4.3.6.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">dhcp_4.3.6.bb</a>
            =&gt; <a href="http://dhcp_4.4.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">dhcp_4.4.1.bb</a>}
            (65%)<br>
            <br>
            diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc
            b/meta/recipes-connectivity/dhcp/dhcp.inc<br>
            index e943707..2eb3513 100644<br>
            --- a/meta/recipes-connectivity/dhcp/dhcp.inc<br>
            +++ b/meta/recipes-connectivity/dhcp/dhcp.inc<br>
            @@ -8,7 +8,7 @@ easier to administer devices."<br>
             HOMEPAGE = "<a href="http://www.isc.org/" rel="noreferrer"
              target="_blank" moz-do-not-send="true">http://www.isc.org/</a>"<br>
            <br>
             LICENSE = "ISC"<br>
            -LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1753">"file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1753"</a><br>
            +LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01">"file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"</a><br>
            <br>
             DEPENDS = "openssl bind"<br>
            <br>
            @@ -24,7 +24,7 @@ SRC_URI = "<a
              href="http://ftp.isc.org/isc/dhcp/$%7BPV%7D/dhcp-$%7BPV%7D.tar.gz"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz</a>
            \<br>
             UPSTREAM_CHECK_URI = "<a href="ftp://ftp.isc.org/isc/dhcp/"
              rel="noreferrer" target="_blank" moz-do-not-send="true">ftp://ftp.isc.org/isc/dhcp/</a>"<br>
             UPSTREAM_CHECK_REGEX = "(?P&lt;pver&gt;\d+\.\d+\.(\d+?))/"<br>
            <br>
            -inherit autotools systemd useradd update-rc.d<br>
            +inherit autotools-brokensep systemd useradd update-rc.d<br>
            <br>
             USERADD_PACKAGES = "${PN}-server"<br>
             USERADD_PARAM_${PN}-server = "--system --no-create-home
            --home-dir /var/run/${BPN} --shell /bin/false --user-group
            ${BPN}"<br>
            @@ -48,11 +48,21 @@ EXTRA_OECONF =
            "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases
            \<br>
                           
             --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases
            \<br>
                           
             --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases
            \<br>
                           
             --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases
            \<br>
            -                --with-libbind=${STAGING_LIBDIR}/ \<br>
                             --enable-paranoia --disable-static \<br>
                             --with-randomdev=/dev/random \<br>
            +                --with-libbind=${STAGING_DIR_HOST}/usr \<br>
            +               --enable-libtool \<br>
                            "<br>
            <br>
            +#Enable shared libs per dhcp README<br>
            +do_configure () {<br>
            +       cd ${S}<br>
            +       cp <a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a>+lt
            <a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a><br>
            +        autoreconf -i<br>
            +       ./configure  ${CONFIGUREOPTS} ${EXTRA_OECONF}   <br>
            +       automake<br>
          </blockquote>
          <div><br>
          </div>
          <div>1. Why run automake when autoreconf already runs
            automake?</div>
        </div>
      </div>
    </blockquote>
    it caused errors when I did not included. <br>
    <br>
    <blockquote type="cite"
cite="mid:CABcZANkEA37r6a3wsBsTLirvT5dZ2o+AOpWXONPiXPgRf=5=Cw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>2. Why override do_configure and reproduce what's already
            in autotools-brokensep rather than doing the cp in a
            do_configure_prepend?<br clear="all">
          </div>
        </div>
      </div>
    </blockquote>
    I did that first and it did not work. The README regarding *+lt says
    it needs "autoreconf -i". I am only doing this as the current
    version of dhcp has a patch to create shared libs. The isc dhcp
    solution to this is their configure.ac+lt.  I would rather no do
    this but someone needed shared libs.<br>
    <br>
    - armin<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CABcZANkEA37r6a3wsBsTLirvT5dZ2o+AOpWXONPiXPgRf=5=Cw@mail.gmail.com">
      <div dir="ltr">-- <br>
        <div dir="ltr" class="gmail_signature"
          data-smartmail="gmail_signature">
          <div dir="ltr">
            <div>
              <div dir="ltr">Christopher Larson<br>
                kergoth at gmail dot com<br>
                Founder - BitBake, OpenEmbedded, OpenZaurus<br>
                Senior Software Engineer, Mentor Graphics</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------0E2B9204DB51C56DE14E27A2--
