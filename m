Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.4086.1614307192434386898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 18:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OJrOZY+7;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: kergoth@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id b145so5267763pfb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 18:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=sO3YVcNAZO23zhBHzgrS6NfuYJwNUkTfTJnHfSNm/VM=;
        b=OJrOZY+7MxE2GkmjUqeD+NANy3lxu0JP3fphS6GG6V0YtQ26R1Ou5ej6wwzwrr/4mr
         YJipEVOlEgqKyWAWc8k0SAU3BlUOW5uMHHLIT6IEb9DPASZnmI+xNgXg291ZxJOY+Ub6
         lm8xYMau9LnuJIp79kShtcjcfquuwT5QbTl+sRZubnPonWsG5EKyxbvcdSQKwHC5bjN1
         RM4XzNZzhJoTpRdocLpky/SBQxtXgADGsz1RNl3TpxsZcgNwRoLNgWwMnVE9gxTGm8OL
         U1HeWWqiW2HCq4EL23tfXfM4XfzxPwLbV+wQUG5COubmu+m0dlUaUf8QTuNShlPhBXqg
         dsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=sO3YVcNAZO23zhBHzgrS6NfuYJwNUkTfTJnHfSNm/VM=;
        b=BxgX/wRA7szXmaOVVDdlZdk5RlOZ5gZwIAODsi58d0p54ycR4/rcm2hVJh4R4OFS9V
         VNblZG/Sx8U3nYyt79LQFChR57YVBYy6v/txBalYB8eeZ/UDSWzIq4PqvNJPywc7P1u8
         r/Da5IRt6MKCLfZLLX5f1d7MX2R7Vu6I5mQeDC6VNJZIr0a7237h76XRruPdQ73s+wGK
         uXWalJCjlwG7u5KWpTxl8zo0s5xGPIwvTpBGdIdiP5kYDaSvj4mhdDSxgYkd89+dYcMK
         4bo8qxCjEQEUfD7JpZ4z2dfOs97aNwtdg0Mj8rHneie0uNeaSdeiw0wu9Lk7k8VTXpTZ
         j0sg==
X-Gm-Message-State: AOAM531gWBbM2ZtWU/iZpdSJWLcfr/07gyRnYX/3yD610SywiWG+wjcE
	hM23eW7/PIId230S2fidUow=
X-Google-Smtp-Source: ABdhPJwwgR95ADkMmSd+wiQoZlfGDKd8zrCjOoNNxiZvQn4HDxMRj4BTD/8ivWTCZO/uLGmlsFvMgQ==
X-Received: by 2002:a63:2884:: with SMTP id o126mr872906pgo.452.1614307191692;
        Thu, 25 Feb 2021 18:39:51 -0800 (PST)
Return-Path: <kergoth@gmail.com>
Received: from [192.168.1.30] (ip72-201-170-237.ph.ph.cox.net. [72.201.170.237])
        by smtp.gmail.com with ESMTPSA id c12sm6997583pjq.48.2021.02.25.18.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 18:39:51 -0800 (PST)
From: "Christopher Larson" <kergoth@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] [PATCH v2] toolchain-scripts.bbclass: customize prompt string for SDKs
Date: Thu, 25 Feb 2021 19:39:49 -0700
Message-Id: <92081049-AC38-4FDE-B699-C17D8DA4A532@gmail.com>
References: <0a2eff5a-9121-e31f-abee-47c096799e85@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
In-Reply-To: <0a2eff5a-9121-e31f-abee-47c096799e85@windriver.com>
To: Kai <kai.kang@windriver.com>
X-Mailer: iPhone Mail (18D52)
Content-Type: multipart/alternative; boundary=Apple-Mail-FE5A330B-0ADE-4588-918C-0251BF729DBF
Content-Transfer-Encoding: 7bit

--Apple-Mail-FE5A330B-0ADE-4588-918C-0251BF729DBF
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

There is no way with this patch to prevent it from mucking with the prompt =
at all. Setting that variable to the empty string will just empty the promp=
t instead.
> On Feb 25, 2021, at 6:57 PM, Kai <kai.kang@windriver.com> wrote:
>=20
> =EF=BB=BF
> On 2/25/21 11:29 PM, Christopher Larson wrote:
>> Are we sure we want to completely override it rather than adding to it?=
 I'd be rather irritated if this blows away my prompt without my asking for=
 it. I think either it should append or have a variable controlling whether=
 this is enabled when building the SDK.
> The original requirement is that the PS1 after source sdk environment fi=
le is as same as the original one. It can not tell whether in a sdk environ=
ment.
> The default assignment of SDK_PS1 is '?=3D', you can set it in conf file=
 to override it.
>=20
> Regards,
> Kai
>=20
>>=20
>> On Wed, Feb 24, 2021 at 10:59 PM kai <kai.kang@windriver.com> wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>=20
>>> Introduce a new variable SDK_PS1 to customize prompt string for SDKs
>>> when source script environment-setup-script.
>>>=20
>>> The default prompt string of SDKs looks like:
>>>=20
>>> SDK-poky-glibc-x86_64--cortexa57-qemuarm64$
>>>=20
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>> v2: not set PS1 for buildtools-tarball
>>>=20
>>>  meta/classes/toolchain-scripts.bbclass | 1 +
>>>  meta/conf/bitbake.conf                 | 1 +
>>>  2 files changed, 2 insertions(+)
>>>=20
>>> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/too=
lchain-scripts.bbclass
>>> index db1d3215ef..88df373d0b 100644
>>> --- a/meta/classes/toolchain-scripts.bbclass
>>> +++ b/meta/classes/toolchain-scripts.bbclass
>>> @@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {
>>>                 EXTRAPATH=3D"$EXTRAPATH:$sdkpathnative$bindir/${TARGET=
_ARCH}${TARGET_VENDOR}-$i"
>>>         done
>>>         echo "export PATH=3D$sdkpathnative$bindir:$sdkpathnative$sbind=
ir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bi=
ndir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PA=
TH' >> $script
>>> +       echo 'export PS1=3D"${SDK_PS1}"' >>$script
>>>         echo 'export PKG_CONFIG_SYSROOT_DIR=3D$SDKTARGETSYSROOT' >> $s=
cript
>>>         echo 'export PKG_CONFIG_PATH=3D$SDKTARGETSYSROOT'"$libdir"'/pk=
gconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
>>>         echo 'export CONFIG_SITE=3D${SDKPATH}/site-config-'"${multimac=
h_target_sys}" >> $script
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index 48af17fbf7..6075749a5e 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -422,6 +422,7 @@ PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MACHINE}"
>>>=20
>>>  SDK_NAME_PREFIX ?=3D "oecore"
>>>  SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
>>> +SDK_PS1 ?=3D "SDK-${SDK_NAME}:\\\\$ "
>>>  SDKPATH =3D "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
>>>  SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"
>>>=20
>>> --=20
>>> 2.17.1
>>>=20
>>>=20
>>>=20
>>>=20
>>=20
>>=20
>> --=20
>> Christopher Larson
>> kergoth at gmail dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Senior Software Engineer, Mentor Graphics
>=20
> --=20
> Kai Kang
> Wind River Linux

--Apple-Mail-FE5A330B-0ADE-4588-918C-0251BF729DBF
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=
=3Dutf-8"></head><body dir=3D"auto">There is no way with this patch to pre=
vent it from mucking with the prompt at all. Setting that variable to the e=
mpty string will just empty the prompt instead.<br><br><div dir=3D"ltr"></d=
iv><div dir=3D"ltr"><br><blockquote type=3D"cite">On Feb 25, 2021, at 6:57 =
PM, Kai &lt;kai.kang@windriver.com&gt; wrote:<br><br></blockquote></div><bl=
ockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">


    <div class=3D"moz-cite-prefix">On 2/25/21 11:29 PM, Christopher Larson
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CABcZANm-+8uOoAskLz7GM4DDGrYM4c2=
O4NZyAz2WuHhdiH7jMg@mail.gmail.com">

      <div dir=3D"ltr">Are we sure we want to completely override it
        rather than adding to it? I'd be rather irritated if this blows
        away my prompt without my asking for it. I think either it
        should append or have a variable controlling whether this is
        enabled when building the SDK.</div>
    </blockquote>
    The original requirement is that the PS1 after source sdk
    environment file is as same as the original one. It can not tell
    whether in a sdk environment.<br>
    <p>The default assignment of SDK_PS1 is '?=3D', you can set it in conf
      file to override it.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CABcZANm-+8uOoAskLz7GM4DDGrYM4c2=
O4NZyAz2WuHhdiH7jMg@mail.gmail.com"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 24, 2021 at 10:5=
9
          PM kai &lt;<a href=3D"mailto:kai.kang@windriver.com" moz-do-not-=
send=3D"true">kai.kang@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom:
          Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D=
"_blank" moz-do-not-send=3D"true">kai.kang@windriver.com</a>&gt;<br>
          <br>
          Introduce a new variable SDK_PS1 to customize prompt string
          for SDKs<br>
          when source script environment-setup-script.<br>
          <br>
          The default prompt string of SDKs looks like:<br>
          <br>
          SDK-poky-glibc-x86_64--cortexa57-qemuarm64$<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver=
.com" target=3D"_blank" moz-do-not-send=3D"true">kai.kang@windriver.com</a>=
&gt;<br>
          ---<br>
          v2: not set PS1 for buildtools-tarball<br>
          <br>
          &nbsp;meta/classes/toolchain-scripts.bbclass | 1 +<br>
          &nbsp;meta/conf/bitbake.conf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;| 1 +<br>
          &nbsp;2 files changed, 2 insertions(+)<br>
          <br>
          diff --git a/meta/classes/toolchain-scripts.bbclass
          b/meta/classes/toolchain-scripts.bbclass<br>
          index db1d3215ef..88df373d0b 100644<br>
          --- a/meta/classes/toolchain-scripts.bbclass<br>
          +++ b/meta/classes/toolchain-scripts.bbclass<br>
          @@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
EXTRAPATH=3D"$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDO=
R}-$i"<br>
          &nbsp; &nbsp; &nbsp; &nbsp; done<br>
          &nbsp; &nbsp; &nbsp; &nbsp; echo "export
PATH=3D$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bi=
ndir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$=
sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH'
          &gt;&gt; $script<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;echo 'export PS1=3D"${SDK_PS1}"' &gt=
;&gt;$script<br>
          &nbsp; &nbsp; &nbsp; &nbsp; echo 'export PKG_CONFIG_SYSROOT_DIR=
=3D$SDKTARGETSYSROOT'
          &gt;&gt; $script<br>
          &nbsp; &nbsp; &nbsp; &nbsp; echo 'export
PKG_CONFIG_PATH=3D$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT=
'"$prefix"'/share/pkgconfig'
          &gt;&gt; $script<br>
          &nbsp; &nbsp; &nbsp; &nbsp; echo 'export
          CONFIG_SITE=3D${SDKPATH}/site-config-'"${multimach_target_sys}"
          &gt;&gt; $script<br>
          diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
          index 48af17fbf7..6075749a5e 100644<br>
          --- a/meta/conf/bitbake.conf<br>
          +++ b/meta/conf/bitbake.conf<br>
          @@ -422,6 +422,7 @@ PKGDATA_DIR =3D
          "${TMPDIR}/pkgdata/${MACHINE}"<br>
          <br>
          &nbsp;SDK_NAME_PREFIX ?=3D "oecore"<br>
          &nbsp;SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARC=
H}"<br>
          +SDK_PS1 ?=3D "SDK-${SDK_NAME}:\\\\$ "<br>
          &nbsp;SDKPATH =3D "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"<br=
>
          &nbsp;SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"<br>
          <br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
      <br clear=3D"all">
      <div><br>
      </div>
      -- <br>
      <div dir=3D"ltr" class=3D"gmail_signature">
        <div dir=3D"ltr">
          <div>
            <div dir=3D"ltr">Christopher Larson<br>
              kergoth at gmail dot com<br>
              Founder - BitBake, OpenEmbedded, OpenZaurus<br>
              Senior Software Engineer, Mentor Graphics</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>


</div></blockquote></body></html>

--Apple-Mail-FE5A330B-0ADE-4588-918C-0251BF729DBF--
