Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 005A16011A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 16:59:36 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id x63so30093187ioe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 08:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H7dfiHe++4DDZXMCL92mDNsqBwJpr+cWWFz5/4BohZ0=;
	b=hnqjU+XXbeFTtWMav8ttidMWZ4+fifFgW5XcR4UROpkU/h/kufOJ7HRbCEHmVB6DgW
	I3vfrStvA2V+4keHd+MyWYXOrvRSmItgq04gnbA9C667zAGyziymA8AHv2nAlLTT4EGv
	TO2TIlhnGwNTH6r7glLIQSTDzvDpxF6oHXuKKDFviHUkxWQo72bHc14OeAXyn665NDa1
	oSiI5D8R/MTd0gb/ekfqV8McxR57Rst/zxTTnISGTTzxBswaibl8oFO60+FrLoHry+QC
	t8jcSQvY1eZhFLqUr/s3b1lmGNeus5FfIKCMQ8Q5WmmV7se/al8tEd82y3YJSB879vyQ
	+hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H7dfiHe++4DDZXMCL92mDNsqBwJpr+cWWFz5/4BohZ0=;
	b=M4CwB3gYRvZl4HiFgWRATzx3fEcicOrH+PSDZGTXBgSvh3DgPTXblCaJGp66XMTDRW
	Ia362zb+hQtZ2E2jSzgd/SgZNYOdVwTNdS6YXuY9n/8PC2KZEpGRAOxk7Heb7TuC6V75
	kZNdUZy6FZo/dXBxs2l5nxxO9k8Lo+8Lh2kV5LkBCsGqYMmFi90afH/XjRjIHT26ssd7
	a6YAJudp09OwkH91soMxd21rE4fXle2QqZxOTg/E2J7L2YQ7yXKIj0/9xJYjLxl6K6sX
	JgWL8XdcNRZKoywxuaDgvEJ4/vS8vUAi3+fFrIDzbYunMUhsrizDAnh7pv/rHsPlzgmQ
	q2wQ==
X-Gm-Message-State: AJaThX6SBxoyHWtaZ+ROrqmCTDYULdceCOQRvxcB8RREOyuQIsAJlz+y
	iBZMeTlatQ4bX+ZFkk+hwDrNqo3HbvpAFI0sVQtg2Q==
X-Google-Smtp-Source: AGs4zMb1pEDKY4xBHEZSsKXeGoXEEobDIuvmHmwftg4NggymOBuKMibJwB3uVguPu+ybu9swpvIpLW3woA61T+uSW6c=
X-Received: by 10.107.32.18 with SMTP id g18mr31154180iog.227.1511542777986;
	Fri, 24 Nov 2017 08:59:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Fri, 24 Nov 2017 08:59:17 -0800 (PST)
In-Reply-To: <6e486fe6-1f4a-a36d-5885-34cfe9ff1d1c@gmail.com>
References: <cover.1511294278.git.akuster808@gmail.com>
	<a8779efbc41a18d6f1c0c9d31b3706e3b47c81bc.1511294278.git.akuster808@gmail.com>
	<CAJTo0Lb4CY-MnhSgt5XWvRYqCrYDba2N5CDghpkgeKh+uoq9Uw@mail.gmail.com>
	<6e486fe6-1f4a-a36d-5885-34cfe9ff1d1c@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Nov 2017 16:59:17 +0000
Message-ID: <CAJTo0LYaRi1Jnmrrr-NwkufM452VNfroQT9BiW_2aAwQhna1VA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Fri, 24 Nov 2017 16:59:37 -0000
Content-Type: multipart/alternative; boundary="001a1141b498585f26055ebd7a5e"

--001a1141b498585f26055ebd7a5e
Content-Type: text/plain; charset="UTF-8"

I haven't looked into it further than verifying that reverting the curl
upgrade makes it work again.

dnf -> python -> gnutls -> curl.

Ross

On 24 November 2017 at 16:57, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 11/24/2017 04:49 AM, Burton, Ross wrote:
>
> Now I remember why this was rejected last time: it breaks dnf in musl (
> https://autobuilder.yocto.io/builders/nightly-musl/builds/616).
>
> is it bugged?
>
> - armin
>
>
> Ross
>
> On 21 November 2017 at 20:01, Armin Kuster <akuster808@gmail.com> wrote:
>
>> From: Armin Kuster <akuster@mvista.com>
>>
>> v2] - remove inherit
>>
>> curlbuild.h removed from sources
>>
>> includes:
>> CVE-2017-1000257
>>
>> removed patches for the following cve fixs:
>> CVE-2017-1000254
>> CVE-2017-1000101
>> CVE-2017-1000100
>> CVE-2017-1000099
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  .../curl/{curl_7.54.1.bb => curl_7.56.1.bb}                | 14
>> +++-----------
>>  1 file changed, 3 insertions(+), 11 deletions(-)
>>  rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb}
>> (87%)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.54.1.bb
>> b/meta/recipes-support/curl/curl_7.56.1.bb
>> similarity index 87%
>> rename from meta/recipes-support/curl/curl_7.54.1.bb
>> rename to meta/recipes-support/curl/curl_7.56.1.bb
>> index 58f0531..830f350 100644
>> --- a/meta/recipes-support/curl/curl_7.54.1.bb
>> +++ b/meta/recipes-support/curl/curl_7.56.1.bb
>> @@ -7,10 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md
>> 5=3a34942f4ae3fbf1a303160714e66
>>
>>  SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>>             file://0001-replace-krb5-config-with-pkg-config.patch \
>> -           file://CVE-2017-1000099.patch \
>> -           file://CVE-2017-1000100.patch \
>> -           file://CVE-2017-1000101.patch \
>> -           file://CVE-2017-1000254.patch \
>>  "
>>
>>  SRC_URI_append_class-target = " \
>> @@ -22,11 +18,11 @@ SRC_URI_append_class-target = " \
>>  #
>>  SRC_URI += " file://configure_ac.patch"
>>
>> -SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
>> -SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e77
>> 0046249263c491fcae48df0e1a3ca8f25a0"
>> +SRC_URI[md5sum] = "428de25834ef8c04076906d6d5c0498e"
>> +SRC_URI[sha256sum] = "2594670367875e7d87b0f129b5e46
>> 90150780884d90244ba0fe3e74a778b5f90"
>>
>>  CVE_PRODUCT = "libcurl"
>> -inherit autotools pkgconfig binconfig multilib_header
>> +inherit autotools pkgconfig binconfig
>>
>>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}
>> gnutls proxy threaded-resolver zlib"
>>  PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver zlib"
>> @@ -64,10 +60,6 @@ EXTRA_OECONF = " \
>>      --without-libpsl \
>>  "
>>
>> -do_install_append() {
>> -       oe_multilib_header curl/curlbuild.h
>> -}
>> -
>>  do_install_append_class-target() {
>>         # cleanup buildpaths from curl-config
>>         sed -i \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>

--001a1141b498585f26055ebd7a5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I haven&#39;t looked into it further than verifying that r=
everting the curl upgrade makes it work again.<div><br></div><div>dnf -&gt;=
 python -&gt; gnutls -&gt; curl.</div><div><br></div><div>Ross</div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 24 November 201=
7 at 16:57, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@g=
mail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <p><br>
    </p>
    <br>
    <div class=3D"m_5508455879794370387moz-cite-prefix">On 11/24/2017 04:49=
 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">Now I remember why this was rejected last time: it
        breaks dnf in musl (<a href=3D"https://autobuilder.yocto.io/builder=
s/nightly-musl/builds/616" target=3D"_blank">https://autobuilder.yocto.io/<=
wbr>builders/nightly-musl/builds/<wbr>616</a>).</div>
    </blockquote></span>
    is it bugged?<span class=3D"HOEnZb"><font color=3D"#888888"><br>
    <br>
    - armin</font></span><div><div class=3D"h5"><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On 21 November 2017 at 20:01, Armin
          Kuster <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.c=
om" target=3D"_blank">akuster808@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">From:
            Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" target=
=3D"_blank">akuster@mvista.com</a>&gt;<br>
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
            Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvist=
a.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
            ---<br>
            =C2=A0.../curl/{<a href=3D"http://curl_7.54.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">curl_7.54.1.bb</a>
            =3D&gt; <a href=3D"http://curl_7.56.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">curl_7.56.1.bb</a>}=C2=A0
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++------=
-----<br>
            =C2=A01 file changed, 3 insertions(+), 11 deletions(-)<br>
            =C2=A0rename meta/recipes-support/curl/{<a href=3D"http://curl_=
7.54.1.bb" rel=3D"noreferrer" target=3D"_blank">cur<wbr>l_7.54.1.bb</a>
            =3D&gt; <a href=3D"http://curl_7.56.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">curl_7.56.1.bb</a>}
            (87%)<br>
            <br>
            diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7=
.54.1.bb" rel=3D"noreferrer" target=3D"_blank">cu<wbr>rl_7.54.1.bb</a>
            b/meta/recipes-support/curl/<a href=3D"http://curl_7.56.1.bb" r=
el=3D"noreferrer" target=3D"_blank">cu<wbr>rl_7.56.1.bb</a><br>
            similarity index 87%<br>
            rename from meta/recipes-support/curl/<a href=3D"http://curl_7.=
54.1.bb" rel=3D"noreferrer" target=3D"_blank">curl<wbr>_7.54.1.bb</a><br>
            rename to meta/recipes-support/curl/<a href=3D"http://curl_7.56=
.1.bb" rel=3D"noreferrer" target=3D"_blank">curl<wbr>_7.56.1.bb</a><br>
            index 58f0531..830f350 100644<br>
            --- a/meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.b=
b" rel=3D"noreferrer" target=3D"_blank">cu<wbr>rl_7.54.1.bb</a><br>
            +++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.56.1.b=
b" rel=3D"noreferrer" target=3D"_blank">cu<wbr>rl_7.56.1.bb</a><br>
            @@ -7,10 +7,6 @@ LIC_FILES_CHKSUM =3D
            &quot;<a class=3D"m_5508455879794370387moz-txt-link-freetext">f=
ile://COPYING;beginline=3D8</a>;md<wbr>5=3D3a34942f4ae3fbf1a303160714e6<wbr=
>6<br>
            <br>
            =C2=A0SRC_URI =3D &quot;<a href=3D"http://curl.haxx.se/download=
/curl-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://curl.h=
axx.se/download/<wbr>curl-${PV}.tar.bz2</a>
            \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a class=3D"m_5508455=
879794370387moz-txt-link-freetext">file://0001-replace-krb5</a>-confi<wbr>g=
-with-pkg-config.patch
            \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"m_5508455=
879794370387moz-txt-link-freetext">file://CVE-2017-1000099.patch</a> \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"m_5508455=
879794370387moz-txt-link-freetext">file://CVE-2017-1000100.patch</a> \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"m_5508455=
879794370387moz-txt-link-freetext">file://CVE-2017-1000101.patch</a> \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"m_5508455=
879794370387moz-txt-link-freetext">file://CVE-2017-1000254.patch</a> \<br>
            =C2=A0&quot;<br>
            <br>
            =C2=A0SRC_URI_append_class-target =3D &quot; \<br>
            @@ -22,11 +18,11 @@ SRC_URI_append_class-target =3D &quot; \<br=
>
            =C2=A0#<br>
            =C2=A0SRC_URI +=3D <a class=3D"m_5508455879794370387moz-txt-lin=
k-rfc2396E">&quot; file://configure_ac.patch&quot;</a><br>
            <br>
            -SRC_URI[md5sum] =3D &quot;6b6eb722f512e7a24855ff084f54f<wbr>e5=
5&quot;<br>
            -SRC_URI[sha256sum] =3D &quot;fdfc4df2d001ee0c44ec071186e77<wbr=
>0046249263c491fcae48df0e1a3ca8<wbr>f25a0&quot;<br>
            +SRC_URI[md5sum] =3D &quot;428de25834ef8c04076906d6d5c04<wbr>98=
e&quot;<br>
            +SRC_URI[sha256sum] =3D &quot;2594670367875e7d87b0f129b5e46<wbr=
>90150780884d90244ba0fe3e74a778<wbr>b5f90&quot;<br>
            <br>
            =C2=A0CVE_PRODUCT =3D &quot;libcurl&quot;<br>
            -inherit autotools pkgconfig binconfig multilib_header<br>
            +inherit autotools pkgconfig binconfig<br>
            <br>
            =C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_=
FE<wbr>ATURES&#39;,
            &#39;ipv6&#39;, d)} gnutls proxy threaded-resolver zlib&quot;<b=
r>
            =C2=A0PACKAGECONFIG_class-native =3D &quot;ipv6 proxy ssl
            threaded-resolver zlib&quot;<br>
            @@ -64,10 +60,6 @@ EXTRA_OECONF =3D &quot; \<br>
            =C2=A0 =C2=A0 =C2=A0--without-libpsl \<br>
            =C2=A0&quot;<br>
            <br>
            -do_install_append() {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header curl/curlbuild.h=
<br>
            -}<br>
            -<br>
            =C2=A0do_install_append_class-targe<wbr>t() {<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 # cleanup buildpaths from curl-conf=
ig<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i \<br>
            <span class=3D"m_5508455879794370387HOEnZb"><font color=3D"#888=
888">--<br>
                2.7.4<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a href=3D"mailto:Openembedded-core@lists.openembedded.org"=
 target=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                <a href=3D"http://lists.openembedded.org/mailman/listinfo/o=
penembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--001a1141b498585f26055ebd7a5e--
