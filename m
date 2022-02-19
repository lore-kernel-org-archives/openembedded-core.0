Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F220C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 00:27:59 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.5074.1645230477746616995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 16:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LZYvudLJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id p9so18560910ejd.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 16:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KXAkAo1OjA7pT9OWhipcM23xcom8NDSzOGW497RK0Yc=;
        b=LZYvudLJBwYxKgMuHcUydhnrz8Q+as8dbqSTFQYEpLRRONhN4XHk++6QMth0PiXdbq
         4Exv9pkKUV0Fc3dde6itnLOrSFVaYIopmOGuJGf4DtOTLpGvai55LiM6Od36ctGNajLX
         /Dnc2feGK1FEPnZTe5epqMoECtfd5UfneIcTgb8vRzowZ3CT+pZU9caBXAOpekBEQy3a
         gWrHThKkQ0zCF/Gnzla7xhKVhnBEqRU79UgCISNMjbbTVr1SFGtVM4fYaVq/+pmZKOu8
         icksRsyLH5Y4+eWjZVEEuKAr8GJ/lALmx3rL8HQG3QWIPugWgwxKhpPpL+vd+6s/18db
         tP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KXAkAo1OjA7pT9OWhipcM23xcom8NDSzOGW497RK0Yc=;
        b=Bjq3pXPJXT99YIxWhzLHOiDw4zrDW+1ntjv1jxYRy9LikovORSZd2YljmYLA81u3h3
         E+rKm5kt/3pVfXAXIXVkmnr11GiPTVtWTzBNfXmGndjDoqO5IEjXOyuGd0WFEwOmPUfU
         xv5UoaBMG6CB3Oo0lZy4BSsSLq0Oy3vKOt1v9VQZ8ocevHf0b+tkyNCK5HiHxTtMl36i
         H+eL5ojvoAJV0/ghtj0/aCh3CYy+P+DVP6ftPu4lKXGJZD3BU2zTph2OAKiWaANoBuMO
         0+drgyHjpCZ6XKpVGiGAKtQfp5rzQ9ZKU1/4oGLoTK+NlRssH34U+yPfVVhi9jwTOtXH
         2iiQ==
X-Gm-Message-State: AOAM530Cbf0SfSyi84qtEhSDhl5lznrEze2LFjz5CNv9PZHqAlR2hRAS
	Sp80PTenHP6b8CfjgET0iXHXN8N0QpLc5Ksfu5c=
X-Google-Smtp-Source: 
 ABdhPJxUnHabH3N+gLfr1Ws0Fh1OG6VhahLr0HqAjcQXdiMyPSi7IE3w4XhPnwhpBmxeEp70DATX9Ki0V+0SltilUV8=
X-Received: by 2002:a17:906:154c:b0:6ce:21d7:2826 with SMTP id
 c12-20020a170906154c00b006ce21d72826mr8194225ejd.9.1645230475837; Fri, 18 Feb
 2022 16:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20220216035900.851949-1-tim.orling@konsulko.com>
 <CAOSpxdYvC6Lk_d7MT81ZM72e4NUrPyg7W3HhF53_niN38bA77Q@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYvC6Lk_d7MT81ZM72e4NUrPyg7W3HhF53_niN38bA77Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 18 Feb 2022 16:27:44 -0800
Message-ID: 
 <CANx9H-B8pxFuD6Dsv+Zhw=iBzeVvOd+BCZijY96xjHtBCFwijA@mail.gmail.com>
Subject: Re: [dunfell][PATCH v2] openssl: upgrade to 1.1.1m for CVE-2021-4160
To: Steve Sakoman <steve@sakoman.com>
Cc: Tim Orling <tim.orling@konsulko.com>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000016036e05d85412ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 00:27:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161955

--00000000000016036e05d85412ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 3:36 PM Steve Sakoman <steve@sakoman.com> wrote:

> On Tue, Feb 15, 2022 at 5:59 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> > Changes are only security and bug fixes.
>
> I'm seeing ptest errors:
>
> WARNING: core-image-sato-sdk-ptest-1.0-r0 do_testimage: There were
> failing ptests.
> Traceback (most recent call last):
>   File
> "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/d=
ecorator/__init__.py",
> line 36, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/d=
ecorator/__init__.py",
> line 36, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/d=
ecorator/__init__.py",
> line 36, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtim=
e/cases/ptest.py",
> line 25, in test_ptestrunner_expectfail
>     self.do_ptestrunner()
>   File
> "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtim=
e/cases/ptest.py",
> line 108, in do_ptestrunner
>     self.fail(failmsg)
> AssertionError: Failed ptests:
> {'openssl': ['test/recipes/30-test_evp_extra.t,_test_returned_1']}
>

I saw this on qemux86-64, but was not sure it was due to the upgrade or a
one off infra issue. I=E2=80=99ll dig deeper and see what might be happenin=
g.


> Happens with both qemuarm64-ptest and qemux86-64-ptest:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2863
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3124
>
> Steve
>
> > https://www.openssl.org/news/cl111.txt
> > https://git.openssl.org/?p=3Dopenssl.git;a=3Dlog;h=3Drefs/tags/OpenSSL_=
1_1_1m
> >
> > CVE: CVE-2021-4160
> >
> > https://nvd.nist.gov/vuln/detail/CVE-2021-4160
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> > Changes in v2:
> >  - drop SRC_URI[md5sum] that devtool snuck in.
> >
> >  .../openssl/{openssl_1.1.1l.bb =3D> openssl_1.1.1m.bb}            | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb =3D>
> openssl_1.1.1m.bb} (98%)
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
> > similarity index 98%
> > rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
> > rename to meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
> > index bf7cd6527ef..c6f8499d4f5 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
> > @@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk =3D " \
> >             file://environment.d-openssl.sh \
> >             "
> >
> > -SRC_URI[sha256sum] =3D
> "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
> > +SRC_URI[sha256sum] =3D
> "f89199be8b23ca45fc7cb9f1d8d3ee67312318286ad030f5316aca6462db6c96"
> >
> >  inherit lib_package multilib_header multilib_script ptest
> >  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> > --
> > 2.30.2
> >
>

--00000000000016036e05d85412ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Feb 18, 2022 at 3:36 PM Steve Sakoman &lt;<a href=
=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Tue, Feb 15, 2022 at 5:59 PM Tim Orling &lt;=
<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; Changes are only security and bug fixes.<br>
<br>
I&#39;m seeing ptest errors:<br>
<br>
WARNING: core-image-sato-sdk-ptest-1.0-r0 do_testimage: There were<br>
failing ptests.<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/=
lib/oeqa/core/decorator/__init__.py&quot;,<br>
line 36, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/=
lib/oeqa/core/decorator/__init__.py&quot;,<br>
line 36, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/=
lib/oeqa/core/decorator/__init__.py&quot;,<br>
line 36, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/=
lib/oeqa/runtime/cases/ptest.py&quot;,<br>
line 25, in test_ptestrunner_expectfail<br>
=C2=A0 =C2=A0 self.do_ptestrunner()<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/=
lib/oeqa/runtime/cases/ptest.py&quot;,<br>
line 108, in do_ptestrunner<br>
=C2=A0 =C2=A0 self.fail(failmsg)<br>
AssertionError: Failed ptests:<br>
{&#39;openssl&#39;: [&#39;test/recipes/30-test_evp_extra.t,_test_returned_1=
&#39;]}<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I saw this on qe=
mux86-64, but was not sure it was due to the upgrade or a one off infra iss=
ue. I=E2=80=99ll dig deeper and see what might be happening.</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Happens with both qemuarm64-ptest and qemux86-64-ptest:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/2863" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/82/builds/2863</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/3124" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/81/builds/3124</a><br>
<br>
Steve<br>
<br>
&gt; <a href=3D"https://www.openssl.org/news/cl111.txt" rel=3D"noreferrer" =
target=3D"_blank">https://www.openssl.org/news/cl111.txt</a><br>
&gt; <a href=3D"https://git.openssl.org/?p=3Dopenssl.git;a=3Dlog;h=3Drefs/t=
ags/OpenSSL_1_1_1m" rel=3D"noreferrer" target=3D"_blank">https://git.openss=
l.org/?p=3Dopenssl.git;a=3Dlog;h=3Drefs/tags/OpenSSL_1_1_1m</a><br>
&gt;<br>
&gt; CVE: CVE-2021-4160<br>
&gt;<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2021-4160" rel=3D"nore=
ferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2021-4160</a=
><br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt;=C2=A0 - drop SRC_URI[md5sum] that devtool snuck in.<br>
&gt;<br>
&gt;=C2=A0 .../openssl/{<a href=3D"http://openssl_1.1.1l.bb" rel=3D"norefer=
rer" target=3D"_blank">openssl_1.1.1l.bb</a> =3D&gt; <a href=3D"http://open=
ssl_1.1.1m.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1m.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-connectivity/openssl/{<a href=3D"http://open=
ssl_1.1.1l.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1l.bb</a> =
=3D&gt; <a href=3D"http://openssl_1.1.1m.bb" rel=3D"noreferrer" target=3D"_=
blank">openssl_1.1.1m.bb</a>} (98%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://opens=
sl_1.1.1l.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1l.bb</a> b/=
meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1m.bb" rel=
=3D"noreferrer" target=3D"_blank">openssl_1.1.1m.bb</a><br>
&gt; similarity index 98%<br>
&gt; rename from meta/recipes-connectivity/openssl/<a href=3D"http://openss=
l_1.1.1l.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1l.bb</a><br>
&gt; rename to meta/recipes-connectivity/openssl/<a href=3D"http://openssl_=
1.1.1m.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1m.bb</a><br>
&gt; index bf7cd6527ef..c6f8499d4f5 100644<br>
&gt; --- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.=
1l.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1l.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.=
1m.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1m.bb</a><br>
&gt; @@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http:=
//environment.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environmen=
t.d-openssl.sh</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;0b7a3e5e59c34827fe0c3a74b7ec8baef302b98f=
a80088d7f9153aa16fa76bd1&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;f89199be8b23ca45fc7cb9f1d8d3ee6731231828=
6ad030f5316aca6462db6c96&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit lib_package multilib_header multilib_script ptest<br>
&gt;=C2=A0 MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br=
>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
</blockquote></div></div>

--00000000000016036e05d85412ae--

