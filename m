Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 203D26006E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 01:54:08 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id q11-v6so9655068otk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 18:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YtersAqNcdknYV2/HY2L4zODEppjqaRSGrG1AAblWaE=;
	b=C4iBVoIPC3ULMyK2Mth2Lg4tB0xw/oagCRg8C9kG7qQRPrX/LwObEH80nI9JMYkFxV
	M63GDAnbVY2oHax9xwQUKh8Zb+rEWCdUebmYPmr1M8X0JJ7A55QB7EZcYdoyOS/6x6UV
	CPcfXxuoYt4T0YcwUEBLhkQqGfPRyod/UZ9Yaxrw8Kph1XkoZRFLLgfMAy1fR7lV/Jm2
	H8ng3lGJFXBQ47dR94eIxwiNmgkVqcMeAbfIgkbdUCfKMcGyk6DqI2nMdbzQ2DB/5l2+
	9FLCDHnHD367gw6XNePkHZqspixQKtB6Iu1OtD+bT91Lnm/6x+Ihp4F0EOKkCoiq7DN1
	ShEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YtersAqNcdknYV2/HY2L4zODEppjqaRSGrG1AAblWaE=;
	b=RPJdjYMa7o0GR4svLFb4FwBCu9nmLu1iQnQbV3S1SWbCR3XAHAoFXPgDOQTe0qft5n
	EOTCxkLIELQ9JdF3dFt23ee/eUEUcDSj9orLRoV2ZO5zdeWXB6UfulEtjeROzWXuXfsy
	cYZfnCVQPnohoiBK/toRQ7bbt3V/gmiKAZjaeWVF4NeMTPFDFmUp6tqo3qg5qRxw2ww6
	mboCfEUy2VPqMzPvJkfAISPymJE13vhJ1jHh3NxhfFamtdHSR7rkjuQwmbryBZa7RnLt
	HDP2BLKrbPktuoc/T9ojl2vZr4XPHMzl5I5t4EPhzDL5cPkLnNdsgccx7hZhttiX8Ad6
	GWiQ==
X-Gm-Message-State: APt69E2U4BYi/McoX9sYpVdzdERJiI+05qHZ+Xr9hqbaHsnAFUHhW5eC
	66JXErC8K3k8Ei+ypIc6SKJVGSQfd3/0dgZtLdM=
X-Google-Smtp-Source: AAOMgpdUVg/vZKp61KhQREcTKPvBqbG6sCa3ya4mBBQs+qleDvHTIqOBUtYgW7phKxcLN49fS/eqjiXOTWz85wTrEaw=
X-Received: by 2002:a9d:30c2:: with SMTP id
	r2-v6mr10474675otg.25.1530323649919; 
	Fri, 29 Jun 2018 18:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <1529865828-13206-1-git-send-email-akuster808@gmail.com>
	<CABcZANkEA37r6a3wsBsTLirvT5dZ2o+AOpWXONPiXPgRf=5=Cw@mail.gmail.com>
	<fa121093-4696-356f-8f27-96a6573a6bab@gmail.com>
In-Reply-To: <fa121093-4696-356f-8f27-96a6573a6bab@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 29 Jun 2018 18:53:56 -0700
Message-ID: <CABcZANkCbhzH-_Q-djjJa6-W4JVE3yMogenCf+w97C+7oNwVdQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
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
X-List-Received-Date: Sat, 30 Jun 2018 01:54:09 -0000
Content-Type: multipart/alternative; boundary="0000000000008b8014056fd23d09"

--0000000000008b8014056fd23d09
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 29, 2018 at 1:40 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 06/29/2018 08:13 AM, Christopher Larson wrote:
>
>
>
> On Sun, Jun 24, 2018 at 11:43 AM Armin Kuster <akuster808@gmail.com>
> wrote:
>
>> include several CVE fixes.
>> CVE: CVE-2018-5733
>> CVE: CVE-2018-5732
>>
>> LIC_CHKSUM_FILE updated to SPFX format
>>
>> https://kb.isc.org/article/AA-01571
>>
>> remove several patches now included in update.
>> Shared libarary support is now enabled in configure+lt, use it
>> and revert to autotools-brokensep
>> Refresh patches
>>
>> alings support with bind 9.11.x
>>
>> add libxml2 support to configure.ac+lt
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-connectivity/dhcp/dhcp.inc            |  19 +-
>>  ...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  13 +-
>>  .../dhcp/dhcp/0003-link-with-lcrypto.patch         |  13 +-
>>  .../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch    | 109 +++++------
>>  .../dhcp/0006-site.h-enable-gentle-shutdown.patch  |  13 +-
>>  ...re-argument-to-make-the-libxml2-dependenc.patch |  40 +++-
>>  .../dhcp/dhcp/0010-build-shared-libs.patch         | 208
>> ---------------------
>>  ...all-to-isc_app_ctxstart-to-not-get-signal.patch |  81 --------
>>  ...correct-the-intention-for-xml2-lib-search.patch |  13 +-
>>  .../dhcp/dhcp/CVE-2017-3144.patch                  |  74 --------
>>  .../dhcp/{dhcp_4.3.6.bb => dhcp_4.4.1.bb}          |  12 +-
>>  11 files changed, 120 insertions(+), 475 deletions(-)
>>  delete mode 100644
>> meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
>>  delete mode 100644
>> meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
>>  delete mode 100644
>> meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch
>>  rename meta/recipes-connectivity/dhcp/{dhcp_4.3.6.bb => dhcp_4.4.1.bb}
>> (65%)
>>
>> diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc
>> b/meta/recipes-connectivity/dhcp/dhcp.inc
>> index e943707..2eb3513 100644
>> --- a/meta/recipes-connectivity/dhcp/dhcp.inc
>> +++ b/meta/recipes-connectivity/dhcp/dhcp.inc
>> @@ -8,7 +8,7 @@ easier to administer devices."
>>  HOMEPAGE = "http://www.isc.org/"
>>
>>  LICENSE = "ISC"
>> -LIC_FILES_CHKSUM =
>> "file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1753"
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
>>
>>  DEPENDS = "openssl bind"
>>
>> @@ -24,7 +24,7 @@ SRC_URI = "
>> http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
>>  UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
>>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
>>
>> -inherit autotools systemd useradd update-rc.d
>> +inherit autotools-brokensep systemd useradd update-rc.d
>>
>>  USERADD_PACKAGES = "${PN}-server"
>>  USERADD_PARAM_${PN}-server = "--system --no-create-home --home-dir
>> /var/run/${BPN} --shell /bin/false --user-group ${BPN}"
>> @@ -48,11 +48,21 @@ EXTRA_OECONF =
>> "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
>>
>>  --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
>>
>>  --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases \
>>
>>  --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
>> -                --with-libbind=${STAGING_LIBDIR}/ \
>>                  --enable-paranoia --disable-static \
>>                  --with-randomdev=/dev/random \
>> +                --with-libbind=${STAGING_DIR_HOST}/usr \
>> +               --enable-libtool \
>>                 "
>>
>> +#Enable shared libs per dhcp README
>> +do_configure () {
>> +       cd ${S}
>> +       cp configure.ac+lt configure.ac
>> +        autoreconf -i
>> +       ./configure  ${CONFIGUREOPTS} ${EXTRA_OECONF}
>> +       automake
>>
>
> 1. Why run automake when autoreconf already runs automake?
>
> it caused errors when I did not included.
>
> 2. Why override do_configure and reproduce what's already in
> autotools-brokensep rather than doing the cp in a do_configure_prepend?
>
> I did that first and it did not work. The README regarding *+lt says it
> needs "autoreconf -i". I am only doing this as the current version of dhcp
> has a patch to create shared libs. The isc dhcp solution to this is their
> configure.ac+lt.  I would rather no do this but someone needed shared
> libs.
>

We already run autoreconf -i in the default do_configure, I see no reason
to be duplicating half of its logic when all you need to do is replace the
default configure.ac with the +lt version before that.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000008b8014056fd23d09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, Jun 29, 2018 at 1:40 PM akuster808 &lt;<a href=3D"mailto:akuster808@gmail=
.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF" class=3D"">
    <p><br>
    </p>
    <br>
    <div class=3D"m_1440340043775474453moz-cite-prefix">On 06/29/2018 08:13=
 AM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr">On Sun, Jun 24, 2018 at 11:43 AM Armin Kuster
            &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">a=
kuster808@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">include
            several CVE fixes.<br>
            CVE: CVE-2018-5733<br>
            CVE: CVE-2018-5732<br>
            <br>
            LIC_CHKSUM_FILE updated to SPFX format<br>
            <br>
            <a href=3D"https://kb.isc.org/article/AA-01571" rel=3D"noreferr=
er" target=3D"_blank">https://kb.isc.org/article/AA-01571</a><br>
            <br>
            remove several patches now included in update.<br>
            Shared libarary support is now enabled in configure+lt, use
            it<br>
            and revert to autotools-brokensep<br>
            Refresh patches<br>
            <br>
            alings support with bind 9.11.x<br>
            <br>
            add libxml2 support to <a href=3D"http://configure.ac" rel=3D"n=
oreferrer" target=3D"_blank">configure.ac</a>+lt<br>
            <br>
            Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gm=
ail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
            ---<br>
            =C2=A0meta/recipes-connectivity/dhcp/dhcp.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +-<br>
            =C2=A0...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |=C2=
=A0 13 +-<br>
            =C2=A0.../dhcp/dhcp/0003-link-with-lcrypto.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +-<br>
            =C2=A0.../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch=C2=A0 =C2=
=A0 | 109
            +++++------<br>
            =C2=A0.../dhcp/0006-site.h-enable-gentle-shutdown.patch=C2=A0 |=
=C2=A0 13 +-<br>
            =C2=A0...re-argument-to-make-the-libxml2-dependenc.patch |=C2=
=A0 40
            +++-<br>
            =C2=A0.../dhcp/dhcp/0010-build-shared-libs.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 208
            ---------------------<br>
            =C2=A0...all-to-isc_app_ctxstart-to-not-get-signal.patch |=C2=
=A0 81
            --------<br>
            =C2=A0...correct-the-intention-for-xml2-lib-search.patch |=C2=
=A0 13 +-<br>
            =C2=A0.../dhcp/dhcp/CVE-2017-3144.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 74
            --------<br>
            =C2=A0.../dhcp/{<a href=3D"http://dhcp_4.3.6.bb" rel=3D"norefer=
rer" target=3D"_blank">dhcp_4.3.6.bb</a>
            =3D&gt; <a href=3D"http://dhcp_4.4.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">dhcp_4.4.1.bb</a>}=C2=A0
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
            =C2=A011 files changed, 120 insertions(+), 475 deletions(-)<br>
            =C2=A0delete mode 100644
            meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patc=
h<br>
            =C2=A0delete mode 100644
meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart=
-to-not-get-signal.patch<br>
            =C2=A0delete mode 100644
            meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch<br>
            =C2=A0rename meta/recipes-connectivity/dhcp/{<a href=3D"http://=
dhcp_4.3.6.bb" rel=3D"noreferrer" target=3D"_blank">dhcp_4.3.6.bb</a>
            =3D&gt; <a href=3D"http://dhcp_4.4.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">dhcp_4.4.1.bb</a>}
            (65%)<br>
            <br>
            diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc
            b/meta/recipes-connectivity/dhcp/dhcp.inc<br>
            index e943707..2eb3513 100644<br>
            --- a/meta/recipes-connectivity/dhcp/dhcp.inc<br>
            +++ b/meta/recipes-connectivity/dhcp/dhcp.inc<br>
            @@ -8,7 +8,7 @@ easier to administer devices.&quot;<br>
            =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.isc.org/" rel=3D=
"noreferrer" target=3D"_blank">http://www.isc.org/</a>&quot;<br>
            <br>
            =C2=A0LICENSE =3D &quot;ISC&quot;<br>
            -LIC_FILES_CHKSUM =3D
            <a class=3D"m_1440340043775474453moz-txt-link-rfc2396E">&quot;f=
ile://LICENSE;beginline=3D4;md5=3Dc5c64d696107f84b56fe337d14da1753&quot;</a=
><br>
            +LIC_FILES_CHKSUM =3D
            <a class=3D"m_1440340043775474453moz-txt-link-rfc2396E">&quot;f=
ile://LICENSE;beginline=3D4;md5=3D004a4db50a1e20972e924a8618747c01&quot;</a=
><br>
            <br>
            =C2=A0DEPENDS =3D &quot;openssl bind&quot;<br>
            <br>
            @@ -24,7 +24,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.isc.o=
rg/isc/dhcp/$%7BPV%7D/dhcp-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_=
blank">http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz</a>
            \<br>
            =C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"ftp://ftp.isc.org=
/isc/dhcp/" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.isc.org/isc/dhcp=
/</a>&quot;<br>
            =C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+\.\d+\.(=
\d+?))/&quot;<br>
            <br>
            -inherit autotools systemd useradd update-rc.d<br>
            +inherit autotools-brokensep systemd useradd update-rc.d<br>
            <br>
            =C2=A0USERADD_PACKAGES =3D &quot;${PN}-server&quot;<br>
            =C2=A0USERADD_PARAM_${PN}-server =3D &quot;--system --no-create=
-home
            --home-dir /var/run/${BPN} --shell /bin/false --user-group
            ${BPN}&quot;<br>
            @@ -48,11 +48,21 @@ EXTRA_OECONF =3D
            &quot;--with-srv-lease-file=3D${localstatedir}/lib/dhcp/dhcpd.l=
eases
            \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A0--with-srv6-lease-file=3D${localstatedir}/lib/dhcp/dhcpd6=
.leases
            \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A0--with-cli-lease-file=3D${localstatedir}/lib/dhcp/dhclien=
t.leases
            \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A0--with-cli6-lease-file=3D${localstatedir}/lib/dhcp/dhclie=
nt6.leases
            \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with=
-libbind=3D${STAGING_LIBDIR}/ \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
-enable-paranoia --disable-static \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
-with-randomdev=3D/dev/random \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with=
-libbind=3D${STAGING_DIR_HOST}/usr \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enabl=
e-libtool \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<=
br>
            <br>
            +#Enable shared libs per dhcp README<br>
            +do_configure () {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp <a href=3D"http://configure.ac" =
rel=3D"noreferrer" target=3D"_blank">configure.ac</a>+lt
            <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 autoreconf -i<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0./configure=C2=A0 ${CONFIGUREOPTS} =
${EXTRA_OECONF}=C2=A0 =C2=A0<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0automake<br>
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
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>2. Why override do_configure and reproduce what&#39;s alread=
y
            in autotools-brokensep rather than doing the cp in a
            do_configure_prepend?<br clear=3D"all">
          </div>
        </div>
      </div>
    </blockquote>
    I did that first and it did not work. The README regarding *+lt says
    it needs &quot;autoreconf -i&quot;. I am only doing this as the current
    version of dhcp has a patch to create shared libs. The isc dhcp
    solution to this is their <a href=3D"http://configure.ac" target=3D"_bl=
ank">configure.ac</a>+lt.=C2=A0 I would rather no do
    this but someone needed shared libs.<br></div></blockquote><div><br></d=
iv><div>We already run autoreconf -i in the default do_configure, I see no =
reason to be duplicating half of its logic when all you need to do is repla=
ce the default <a href=3D"http://configure.ac">configure.ac</a> with the=C2=
=A0+lt version before that.<br></div></div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>=
<div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder =
- BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Gra=
phics</div></div></div></div></div>

--0000000000008b8014056fd23d09--
