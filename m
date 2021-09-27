Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9809C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:10:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.30088.1632744636367024856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 05:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gzfje11O;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 136-20020a1c048e000000b0030d05169e9bso346093wme.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 05:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=71nbptfVcLwO3VHot2rZJB5N0TumVm9LZzfl8ne3T5Y=;
        b=gzfje11OSuixE0kViFHfxS8CPGECjOjYvbimIKZ2EK4aYcpwXfiGh42J2In3guYTkV
         B4/uyM5j+P9OLPIZFds4JlO8cMZNMXfre7QfKI2OUXQZgEjajqXdJnUcz48UWPdC9z6p
         N/jzaN2ZQJeTi9l3eUZQP4y4U+AIoMdESDI72FeLov8HD47DroKG6a7/FnAreethnowL
         ZYVKVGdzomYHdTq+aIqID+8On82cNw5IsA/HaEXNUCFN6iHkkkMiUgAKc1rb16RmQi9y
         LbkY+hAccexDDRloTDv6QJpW4kZTyjvzDo4tcaIzX6xnWHV3VGqJ4p+muxWlVHfjdjse
         KZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=71nbptfVcLwO3VHot2rZJB5N0TumVm9LZzfl8ne3T5Y=;
        b=hRpc9rW7XltE1U/fQYQyunVPNU9Kj42ekeec6t/WHauQ0813Pc4j9t9Z0sa9jH16/a
         wHasQCNShXWt2Kws/I1pgRafXdEj4fhxKFMZlNliYwHJUXYulVaMdHTNfAzPZQ0Px35g
         OBI/kUFPyP4Iw8nzlBF718BKN9ua+FJbR4dFUn3CcMeu2F4Eehpb+y19iksu8TNmbFI2
         jLX/DiSnkGN+X4hkdeWUX9DaXhfepq03rmSKHwpeIoXcYr2CM4uBwgFYmxnfMET7UGbc
         oLPX0jgEAjK6c/5vAijMZRPi/1bTS73bQ3qNB0xSOFgIzZF/KJQTDmGlXOVB0U7IlpQN
         t6kQ==
X-Gm-Message-State: AOAM5320QKEZp+bzQWC/j/aciMa0bVz0eUOb4hEh4SBFrxu0sVSFWZLk
	dl0MAt09W2wU1k6nTRgiza1hP6DGGS39iQv8/Ak=
X-Google-Smtp-Source: 
 ABdhPJxfe4q1uw8awgHI8Jp4Wtp3jE4nYamoc9/kdZwB+AcIt7vY/hmbQYraaVAOVtCUkjW/2fhYADOKSRdsc26BtB0=
X-Received: by 2002:a05:600c:22d6:: with SMTP id
 22mr15791297wmg.17.1632744634752;
 Mon, 27 Sep 2021 05:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210924160026.145611-1-tom.pollard@codethink.co.uk>
 <b8091408cf8c31f5c5e6dafcfd1b1f9cb649fd5b.camel@linuxfoundation.org>
 <7134b4ce-9d94-183e-cf18-0a8c5d95d90f@codethink.co.uk>
In-Reply-To: <7134b4ce-9d94-183e-cf18-0a8c5d95d90f@codethink.co.uk>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 27 Sep 2021 07:10:24 -0500
Message-ID: 
 <CAJdd5GaS+ot5k-4ys9HH8ew+qEHC8nf0JaB3O5fYVADf0Fvh8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] curl: Update tls backend PACKAGECONFIG options
To: Tom Pollard <tom.pollard@codethink.co.uk>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f6a08c05ccf8fb2e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 12:10:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156386

--000000000000f6a08c05ccf8fb2e
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 27, 2021, 6:36 AM Tom Pollard <tom.pollard@codethink.co.uk>
wrote:

> Hi Richard,
>
> On 25/09/2021 22:43, Richard Purdie wrote:
> > On Fri, 2021-09-24 at 17:00 +0100, Tom Pollard wrote:
> >> curl 7.77.0 made the tls backend configuration explicit. openssl
> >> is now a specific option replacing the default `--with-ssl`, and
> >> `--without-ssl` is required to build without any tls, overriding any
> >> other tls config. Adding 'without-ssl` as a mutually exclusive
> >> option against the existing tls options should prevent users
> >> silently disabling other enabled tls backends.
> >>
> >> https://curl.se/changes.html#7_77_0
> >>
> >> Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
> >> ---
> >>  meta/recipes-support/curl/curl_7.78.0.bb | 16 +++++++++-------
> >>  1 file changed, 9 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/meta/recipes-support/curl/curl_7.78.0.bb
> b/meta/recipes-support/curl/curl_7.78.0.bb
> >> index dece0babb2..315755c9b1 100644
> >> --- a/meta/recipes-support/curl/curl_7.78.0.bb
> >> +++ b/meta/recipes-support/curl/curl_7.78.0.bb
> >> @@ -20,16 +20,17 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl
> curl:libcurl libcurl:libcurl dan
> >>
> >>  inherit autotools pkgconfig binconfig multilib_header
> >>
> >> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}
> ssl libidn proxy threaded-resolver verbose zlib"
> >> -PACKAGECONFIG:class-native = "ipv6 proxy ssl threaded-resolver verbose
> zlib"
> >> -PACKAGECONFIG:class-nativesdk = "ipv6 proxy ssl threaded-resolver
> verbose zlib"
> >> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}
> openssl libidn proxy threaded-resolver verbose zlib"
> >> +PACKAGECONFIG:class-native = "ipv6 proxy openssl threaded-resolver
> verbose zlib"
> >> +PACKAGECONFIG:class-nativesdk = "ipv6 proxy openssl threaded-resolver
> verbose zlib"
> >>
> >>  # 'ares' and 'threaded-resolver' are mutually exclusive
> >> +# 'without-ssl' explicitly disables tls, silently overriding other tls
> config and is required if no backend(s) are configured
> >>  PACKAGECONFIG[ares] =
> "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
> >>  PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
> >>  PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
> >>  PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
> >> -PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
> >> +PACKAGECONFIG[gnutls] =
> "--with-gnutls,--without-gnutls,gnutls,,,without-ssl"
> >>  PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
> >>  PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
> >>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> >> @@ -39,7 +40,7 @@ PACKAGECONFIG[ldaps] =
> "--enable-ldaps,--disable-ldaps,"
> >>  PACKAGECONFIG[libgsasl] = "--with-libgsasl,--without-libgsasl,libgsasl"
> >>  PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
> >>  PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
> >> -PACKAGECONFIG[mbedtls] =
> "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
> >> +PACKAGECONFIG[mbedtls] =
> "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls,,,without-ssl"
> >>  PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt,"
> >>  PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
> >>  PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
> >> @@ -48,12 +49,13 @@ PACKAGECONFIG[rtmpdump] =
> "--with-librtmp,--without-librtmp,rtmpdump"
> >>  PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
> >>  PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
> >>  PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
> >> -PACKAGECONFIG[ssl] = "--with-ssl
> --with-random=/dev/urandom,--without-ssl,openssl"
> >> -PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
> >> +PACKAGECONFIG[openssl] = "--with-openssl
> --with-random=/dev/urandom,,openssl,,,without-ssl"
> >> +PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss,,,without-ssl"
> >>  PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
> >>  PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
> >>  PACKAGECONFIG[threaded-resolver] =
> "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
> >>  PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
> >> +PACKAGECONFIG[without-ssl] = "--without-ssl,,,,,gnutls mbedtls openssl
> nss"
> >>  PACKAGECONFIG[zlib] =
> "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
> >>
> >>  EXTRA_OECONF = " \
> >
> > I think this change breaks mingw:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4055
>
> It looks like the append in meta-mingw will need updating to align with
> the changing the 'ssl' package option to 'openssl' and additionally the
> requirement of explicitly adding the 'without-ssl' option to achieve the
> old behavior:
>
>
> http://git.yoctoproject.org/cgit.cgi/meta-mingw/tree/recipes-support/curl/curl_%25.bbappend
>
> How would I go about synchronizing the change? I guess this also
> highlights that it could be a breaking change to other meta layers that
> append curl.
>

Submit the patch to meta-mingw; now that Richard and I know to look for it
we will make sure it is synchronized


> Enforcing the mutual exclusivity of the `without-ssl` option is also
> something that be considered to deem if it is necessary,  or should it
> be left to the integrator to understand the change in behavior if the
> option is selected whilst other ssl options are also included.
>
> Regards,
>
> Tom
>
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156357):
> https://lists.openembedded.org/g/openembedded-core/message/156357
> > Mute This Topic: https://lists.openembedded.org/mt/85842512/2167528
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> tom.pollard@codethink.co.uk]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
> --
> https://www.codethink.co.uk/privacy.html
>

--000000000000f6a08c05ccf8fb2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Sep 27, 2021, 6:36 AM Tom Pollard &lt;<a href=
=3D"mailto:tom.pollard@codethink.co.uk">tom.pollard@codethink.co.uk</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Hi Richard,<br>
<br>
On 25/09/2021 22:43, Richard Purdie wrote:<br>
&gt; On Fri, 2021-09-24 at 17:00 +0100, Tom Pollard wrote:<br>
&gt;&gt; curl 7.77.0 made the tls backend configuration explicit. openssl<b=
r>
&gt;&gt; is now a specific option replacing the default `--with-ssl`, and<b=
r>
&gt;&gt; `--without-ssl` is required to build without any tls, overriding a=
ny<br>
&gt;&gt; other tls config. Adding &#39;without-ssl` as a mutually exclusive=
<br>
&gt;&gt; option against the existing tls options should prevent users<br>
&gt;&gt; silently disabling other enabled tls backends.<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://curl.se/changes.html#7_77_0" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://curl.se/changes.html#7_77_0</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Tom Pollard &lt;<a href=3D"mailto:tom.pollard@codet=
hink.co.uk" target=3D"_blank" rel=3D"noreferrer">tom.pollard@codethink.co.u=
k</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-support/curl/<a href=3D"http://curl_7.78.0.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">curl_7.78.0.bb</a> | 16 +++=
++++++-------<br>
&gt;&gt;=C2=A0 1 file changed, 9 insertions(+), 7 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.78=
.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">curl_7.78.0.bb</a> b=
/meta/recipes-support/curl/<a href=3D"http://curl_7.78.0.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">curl_7.78.0.bb</a><br>
&gt;&gt; index dece0babb2..315755c9b1 100644<br>
&gt;&gt; --- a/meta/recipes-support/curl/<a href=3D"http://curl_7.78.0.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">curl_7.78.0.bb</a><br>
&gt;&gt; +++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.78.0.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">curl_7.78.0.bb</a><br>
&gt;&gt; @@ -20,16 +20,17 @@ CVE_PRODUCT =3D &quot;haxx:curl haxx:libcurl c=
url:curl curl:libcurl libcurl:libcurl dan<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 inherit autotools pkgconfig binconfig multilib_header<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES=
&#39;, &#39;ipv6&#39;, d)} ssl libidn proxy threaded-resolver verbose zlib&=
quot;<br>
&gt;&gt; -PACKAGECONFIG:class-native =3D &quot;ipv6 proxy ssl threaded-reso=
lver verbose zlib&quot;<br>
&gt;&gt; -PACKAGECONFIG:class-nativesdk =3D &quot;ipv6 proxy ssl threaded-r=
esolver verbose zlib&quot;<br>
&gt;&gt; +PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES=
&#39;, &#39;ipv6&#39;, d)} openssl libidn proxy threaded-resolver verbose z=
lib&quot;<br>
&gt;&gt; +PACKAGECONFIG:class-native =3D &quot;ipv6 proxy openssl threaded-=
resolver verbose zlib&quot;<br>
&gt;&gt; +PACKAGECONFIG:class-nativesdk =3D &quot;ipv6 proxy openssl thread=
ed-resolver verbose zlib&quot;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 # &#39;ares&#39; and &#39;threaded-resolver&#39; are mutuall=
y exclusive<br>
&gt;&gt; +# &#39;without-ssl&#39; explicitly disables tls, silently overrid=
ing other tls config and is required if no backend(s) are configured<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[ares] =3D &quot;--enable-ares,--disable-ares,c=
-ares,,,threaded-resolver&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[brotli] =3D &quot;--with-brotli,--without-brot=
li,brotli&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[builtinmanual] =3D &quot;--enable-manual,--dis=
able-manual&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[dict] =3D &quot;--enable-dict,--disable-dict,&=
quot;<br>
&gt;&gt; -PACKAGECONFIG[gnutls] =3D &quot;--with-gnutls,--without-gnutls,gn=
utls&quot;<br>
&gt;&gt; +PACKAGECONFIG[gnutls] =3D &quot;--with-gnutls,--without-gnutls,gn=
utls,,,without-ssl&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[gopher] =3D &quot;--enable-gopher,--disable-go=
pher,&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[imap] =3D &quot;--enable-imap,--disable-imap,&=
quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6,&=
quot;<br>
&gt;&gt; @@ -39,7 +40,7 @@ PACKAGECONFIG[ldaps] =3D &quot;--enable-ldaps,--=
disable-ldaps,&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[libgsasl] =3D &quot;--with-libgsasl,--without-=
libgsasl,libgsasl&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[libidn] =3D &quot;--with-libidn2,--without-lib=
idn2,libidn2&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[libssh2] =3D &quot;--with-libssh2,--without-li=
bssh2,libssh2&quot;<br>
&gt;&gt; -PACKAGECONFIG[mbedtls] =3D &quot;--with-mbedtls=3D${STAGING_DIR_T=
ARGET},--without-mbedtls,mbedtls&quot;<br>
&gt;&gt; +PACKAGECONFIG[mbedtls] =3D &quot;--with-mbedtls=3D${STAGING_DIR_T=
ARGET},--without-mbedtls,mbedtls,,,without-ssl&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[mqtt] =3D &quot;--enable-mqtt,--disable-mqtt,&=
quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[nghttp2] =3D &quot;--with-nghttp2,--without-ng=
http2,nghttp2&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[pop3] =3D &quot;--enable-pop3,--disable-pop3,&=
quot;<br>
&gt;&gt; @@ -48,12 +49,13 @@ PACKAGECONFIG[rtmpdump] =3D &quot;--with-librt=
mp,--without-librtmp,rtmpdump&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[rtsp] =3D &quot;--enable-rtsp,--disable-rtsp,&=
quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[smb] =3D &quot;--enable-smb,--disable-smb,&quo=
t;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[smtp] =3D &quot;--enable-smtp,--disable-smtp,&=
quot;<br>
&gt;&gt; -PACKAGECONFIG[ssl] =3D &quot;--with-ssl --with-random=3D/dev/uran=
dom,--without-ssl,openssl&quot;<br>
&gt;&gt; -PACKAGECONFIG[nss] =3D &quot;--with-nss,--without-nss,nss&quot;<b=
r>
&gt;&gt; +PACKAGECONFIG[openssl] =3D &quot;--with-openssl --with-random=3D/=
dev/urandom,,openssl,,,without-ssl&quot;<br>
&gt;&gt; +PACKAGECONFIG[nss] =3D &quot;--with-nss,--without-nss,nss,,,witho=
ut-ssl&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[telnet] =3D &quot;--enable-telnet,--disable-te=
lnet,&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[tftp] =3D &quot;--enable-tftp,--disable-tftp,&=
quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[threaded-resolver] =3D &quot;--enable-threaded=
-resolver,--disable-threaded-resolver,,,,ares&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[verbose] =3D &quot;--enable-verbose,--disable-=
verbose&quot;<br>
&gt;&gt; +PACKAGECONFIG[without-ssl] =3D &quot;--without-ssl,,,,,gnutls mbe=
dtls openssl nss&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[zlib] =3D &quot;--with-zlib=3D${STAGING_LIBDIR=
}/../,--without-zlib,zlib&quot;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 EXTRA_OECONF =3D &quot; \<br>
&gt; <br>
&gt; I think this change breaks mingw:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/89/=
builds/4055" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobu=
ilder.yoctoproject.org/typhoon/#/builders/89/builds/4055</a><br>
<br>
It looks like the append in meta-mingw will need updating to align with<br>
the changing the &#39;ssl&#39; package option to &#39;openssl&#39; and addi=
tionally the<br>
requirement of explicitly adding the &#39;without-ssl&#39; option to achiev=
e the<br>
old behavior:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/meta-mingw/tree/recipes-sup=
port/curl/curl_%25.bbappend" rel=3D"noreferrer noreferrer" target=3D"_blank=
">http://git.yoctoproject.org/cgit.cgi/meta-mingw/tree/recipes-support/curl=
/curl_%25.bbappend</a><br>
<br>
How would I go about synchronizing the change? I guess this also<br>
highlights that it could be a breaking change to other meta layers that<br>
append curl.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Submit the patch to meta-mingw; now that Richard and I know to =
look for it we will make sure it is synchronized</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
Enforcing the mutual exclusivity of the `without-ssl` option is also<br>
something that be considered to deem if it is necessary,=C2=A0 or should it=
<br>
be left to the integrator to understand the change in behavior if the<br>
option is selected whilst other ssl options are also included.<br>
<br>
Regards,<br>
<br>
Tom<br>
<br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#156357): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/156357" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1563=
57</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85842512=
/2167528" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/85842512/2167528</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:tom.pollar=
d@codethink.co.uk" target=3D"_blank" rel=3D"noreferrer">tom.pollard@codethi=
nk.co.uk</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
-- <br>
<a href=3D"https://www.codethink.co.uk/privacy.html" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://www.codethink.co.uk/privacy.html</a><br>
</blockquote></div></div></div>

--000000000000f6a08c05ccf8fb2e--

