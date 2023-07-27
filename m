Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBD8C04A6A
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:55:30 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.9563.1690469727504962537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oewHPrGf;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1a28de15c8aso846870fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690469727; x=1691074527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6In70JXbs61+iInHipiUyArEVk1nXVuaETPqnNDJCDE=;
        b=oewHPrGf1eINU2zMfmo+45zGBtxofvd0Na5NU5l7piqqPfTWQLOSnncJPy6/eABHAn
         nFkw4oUWmHzI2ais5rvxIIjRY73OqMzKb6ZF3ZL+jbw6yK09VVelI0oqyqqhWzV2Pil6
         ciMebYkQcGLOyaRhhX8JseKmKKG1NWAeJ54tJKwQ9qkSa3aMw//dPyJar7Fh7tiUvTy0
         B8D/dC7LvUzZKzHEHncGtDNVtkrDQN/TiN9Cgp7AmHWdLhVkbq6ZtZHLDRyy1xdnPbT3
         zLVMJjII7QhzxBzLq4pj0hjd3UaxERtHRNmhYzZmCygrYFdaT/LEZLyhdhWSzi5IehEh
         cGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690469727; x=1691074527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6In70JXbs61+iInHipiUyArEVk1nXVuaETPqnNDJCDE=;
        b=JDO5Yu5ijcilDNAHOTSABf18tFZ6O8AHYwH5x1REflW9EVhXS98lLRkP/oK0rIk/0V
         1yfOtPnj8CLletOE7VEvJEeQWJGGSjZrcSQ+tbQZOIqBGmDwy0l3770zgSybu3Wn4zkY
         qJyzgmsw0MqpOrGA5Z2eNPbZT8JNw2N6TdD5kHU4oM6n3QOTODTSxwBg+cgV13ZhZ1zv
         kR6XqOfWkLLf0Ml3ldvd5UId7ijoIyR0iKw1q2c6GEZWcki0vl93K6mbWPALyKFG3tmd
         Pv9dUcmuKQOt2MDjdogbnz9tEF0G4qbuiSvKWmAPW7DGgLLpsVBfJfR00baBW9T/MIyv
         LQsg==
X-Gm-Message-State: ABy/qLYZYvaiThqeOFsUH1JyTAG1FJ6xF8WsJMV5ehnTW1B3GcbMpLTg
	aLwhqZ0CDTRptdIEDy5UE6WMp0rJxptJsVUYtu8=
X-Google-Smtp-Source: APBJJlFwa1ZkFgsnzukB0Dgd0e+Os7Aj5ZNSgGhTMemf+JmCrRwV4y181bjSABUDdjZDH8QouJfPhRYI0dcN8ubJzj8=
X-Received: by 2002:a05:6870:472b:b0:1b7:4870:9075 with SMTP id
 b43-20020a056870472b00b001b748709075mr3911448oaq.6.1690469726402; Thu, 27 Jul
 2023 07:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230727075604.2954034-1-raj.khem@gmail.com> <1a913a55f07b7d094451690c86c14348120a51a3.camel@linuxfoundation.org>
In-Reply-To: <1a913a55f07b7d094451690c86c14348120a51a3.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jul 2023 07:55:15 -0700
Message-ID: <CAMKF1sp-+XsmULpuwVdMpS2B1dmGrMin-W45xwKK2v5QxmWVuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] ltp: Use bfd linker when lld is distro
 linker default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008bbaab060179275f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184962

--0000000000008bbaab060179275f
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 27, 2023 at 1:38 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2023-07-27 at 00:56 -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Also fix KVM_LD and remove -fuse-ld=lld
> >
> >  meta/recipes-extended/ltp/ltp_20230516.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/ltp/ltp_20230516.bb
> b/meta/recipes-extended/ltp/ltp_20230516.bb
> > index e9407d3148e..1efb7637dcf 100644
> > --- a/meta/recipes-extended/ltp/ltp_20230516.bb
> > +++ b/meta/recipes-extended/ltp/ltp_20230516.bb
> > @@ -41,13 +41,15 @@ inherit autotools-brokensep pkgconfig
> >  # https://sourceware.org/bugzilla/show_bug.cgi?id=18097
> >  #
> https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
> >  LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> ' -fuse-ld=bfd', '', d)}"
> > +LDFLAGS:remove = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',
> '-fuse-ld=lld', '', d)}"
> > +LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',
> ' -fuse-ld=bfd', '', d)}"
>
> Why do we need the remove? Nobody would set both ld-is-gold and ls-is-
> ldd would they?
>
> I don't really like remove on principle in OE-Core...


I think it is not needed for will test a v2

>
>
> Cheers,
>
> Richard
>

--0000000000008bbaab060179275f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Jul 27, 2023 at 1:38 AM Richard Purdie &=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@lin=
uxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Thu, 2023-07-27 at 00:56 -0700, Khem Raj wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Also fix KVM_LD and remove -fuse-ld=3Dlld<br>
&gt; <br>
&gt;=C2=A0 meta/recipes-extended/ltp/<a href=3D"http://ltp_20230516.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20230516.bb</a> | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20230516.=
bb" rel=3D"noreferrer" target=3D"_blank">ltp_20230516.bb</a> b/meta/recipes=
-extended/ltp/<a href=3D"http://ltp_20230516.bb" rel=3D"noreferrer" target=
=3D"_blank">ltp_20230516.bb</a><br>
&gt; index e9407d3148e..1efb7637dcf 100644<br>
&gt; --- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20230516.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20230516.bb</a><br>
&gt; +++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20230516.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20230516.bb</a><br>
&gt; @@ -41,13 +41,15 @@ inherit autotools-brokensep pkgconfig<br>
&gt;=C2=A0 # <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D1=
8097" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/=
show_bug.cgi?id=3D18097</a><br>
&gt;=C2=A0 # <a href=3D"https://github.com/linux-test-project/ltp/commit/3f=
ce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b=
12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae32=
6c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a=
8785c0dd6R36</a><br>
&gt;=C2=A0 LDFLAGS:append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATUR=
ES&#39;, &#39;ld-is-gold&#39;, &#39; -fuse-ld=3Dbfd&#39;, &#39;&#39;, d)}&q=
uot;<br>
&gt; +LDFLAGS:remove =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;ld-is-lld&#39;, &#39;-fuse-ld=3Dlld&#39;, &#39;&#39;, d)}&quot;<br=
>
&gt; +LDFLAGS:append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;ld-is-lld&#39;, &#39; -fuse-ld=3Dbfd&#39;, &#39;&#39;, d)}&quot;<b=
r>
<br>
Why do we need the remove? Nobody would set both ld-is-gold and ls-is-<br>
ldd would they?<br>
<br>
I don&#39;t really like remove on principle in OE-Core...</blockquote><div =
dir=3D"auto"><br></div><div dir=3D"auto">I think it is not needed for will =
test a v2=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000008bbaab060179275f--

