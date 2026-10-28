Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46086.1793202400850607389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 08:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=o1PylJTy;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91b89c6caffso10119196d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202400; cv=none;
        d=google.com; s=arc-20260327;
        b=MdMsFdvXCO+STwDnKiZfPMD6of8SyOi+tFhK21KAeHNxDJIRLe7mG4mw4OhiJCu0Q6
         USkZ5Kc7kTIrE73Epy7CacJ2fKuCeNqPh+ME8K0aNx9lQr/OTSYaU4mrTPtMbznK2uPk
         4QP4HuVhBgI4Hripo+A0xv0bDji/fuu8WmLZ/AK3M+JAPXkHdSPkithfn38Y2dOQwGuZ
         pzQoUknsejpGZMwD7SNfmR1kfmpX28YEjoodk6tNXu/G8d3t0fqCZp3yWpzP9eAgrul8
         +62TbKlvPbZtaWx3a8ZjhLOPfm9xOPj6CKeMmlCsby3QFZAjq3Sr6KUnVVppJyM8cJ+A
         ccCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ud7ND5mtvQI8zYcAuPAngLe5hkxKmejpYjcy785rfOs=;
        fh=zaPu89ylyx6nGmEEaTjwDnOkaj7OVteF0cJHdWKlapg=;
        b=NpzzqJINM2HEixrWylAbPCqP59iTEMnHznlh2FlBsGxmsr9gvSEDx6TpBYm8V0zm28
         cn3Gy6QCmWQ0srT/xQeDOp5EIfu7Cug25xtPKcWkJEi0jYT6bt+PgwYw5n6aYThXflI0
         u76dvxdI6/evOuaIyXf4P+Z2ev3iyW1pYFaCjFckjcGNg/AIkJYVuQ9RwCVujrEjsdN5
         /kWN7/HemvWK6rxptddzxT1wF30Q4NOknn8kDkf/AloXkEfzwT8TmDtowY1GJc8ynNbz
         8n+7ydrkT85/BiW+M3mE5uiCEh15cu8//iHMfPZd5k+A0wtYjW5rlymokJ8RTzm4DBtg
         /fiA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202400; x=1793807200; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud7ND5mtvQI8zYcAuPAngLe5hkxKmejpYjcy785rfOs=;
        b=o1PylJTyI04VVRQAVnv7loVC0gd3onoLXEHBOaorsA6gWOOnGEiUgBNCYwmw8XgYnn
         GOXEFIv4B3WDpZZ7PL4xv4ZLMp/38V9s+ZS3ca6GbhVQWFfxj7M68OWG4lMN21qkpAx1
         VpT261ktZESlEisPOjCFHB1k7uuOPXEXMLBsKDcymsEqCCplOSAN9dwLX9M7hHxl78zr
         kH2xsK5lM62g1MQDuPKW4E69C0Ae9b3T6wSFLqbjEZ0Iqc0ullVt109nVMPWccAV21pm
         9pifUkJnfK9dimfSzZvJLxM0NTqqxtYWwE9VyKNcXr/BaoGxLDfEvAe+pKk5JyC+h4eA
         uETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202400; x=1793807200;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ud7ND5mtvQI8zYcAuPAngLe5hkxKmejpYjcy785rfOs=;
        b=F0VZUrrXcyUvg+mq7d2MqSLCDXUUVAfF+q9slswpWT8NC8a8TUndSlt8lWyYZUUwOh
         MxckJzTDmALTDvC2K9Gn/r+6cUO1sySBY6TbaQCA50tDWzoupBLsw103SSok9bX9Xgam
         lvnVV+WvpKtEXca8vMFQacMd0eWDssqrFRrkMAmSEA+MvBwJ+J7mgEDR3mWjYc50zrZn
         Sy6zuRICBwe89wOk8A0NEO9RUg5Yhu1Qxzqz5kessz7IZd0j9q8jT7EjP9hY2v6Wd/Rf
         dSboq/D5/gCDKiOEnHiMczdDuAA5tTnTUEaA3AzrrspJIvldfsn1FV+GZS4/qLoZECcH
         59aQ==
X-Gm-Message-State: AFq9FYIe4zWgpM545BAK5FgRntAMRoRVP3aeH3kI7j2A68AUoUUIgQHK
	CbPDFfTtqYQ3NjlpiCu/UnK1osYYWi/WmOvONlKz0oa3Pgzn/13G4Db5bMQmBJh3f7EZz6hQx5F
	G+Cww8UmgB41y5HpNGHdO1SUXEBNGvHY=
X-Gm-Gg: AYBFou1vlTzMh0HmjN6409z5vqaFnKSJHkfdTbN/hbbIn2MqMpO4Iuz6R9l2BlOmUrE
	4Hg9mklr+vv4OQSCQIF/fIFnb/lC1Gz+JAeZzoUQJL9CPAAZDVe3xaVmncU+nYlLg8yOoMRx7I4
	jgzr/Y2p4UNLon4Ej7xmlQTYHyw9dYMdRdPtu3tZFPkMnAoomplGFzLTQcRJo44mppcqTkbzVNY
	yFLr9mURgvuR4tS0ihYwK8tE6sA14I9ofSfm83BCuehEls8cMnL3+UzJI5I37oNQuBPfqt5WOZ/
	fRCjIGtrOy56XF+ywOtX4MIcNaCfyNT7XeNvAOZNDq5pcQrlJZPzc1uwlSz4rwwJbtdPQibtGb/
	MtWRw+cB/m73TN10vHBA8/5BGm2VB8Hkwzq3CeyVhXhtFcjxcpC+QEBYS/AfdA1etExyf5tkh
X-Received: by 2002:a05:6214:cac:b0:91c:73fc:a5a8 with SMTP id
 6a1803df08f44-91c7cf27f36mr42434326d6.9.1793202399561; Wed, 28 Oct 2026
 08:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261028093240.345039-1-ayoub.zaki@embetrix.com>
In-Reply-To: <20261028093240.345039-1-ayoub.zaki@embetrix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Oct 2026 16:46:26 +0100
X-Gm-Features: AclHuK8nqBFyX4Ieh2aGfyCMOWyay0oXU1YeuRToi7MDFFmuYSb28ACgJ4M-izY
Message-ID: <CANNYZj__g7pMtjyu-yBj1aOtTkRPqfy7kTPWsL4yPo_jwyb4Dg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH v2] pkcs11-provider: import version 1.3.0
 from meta-oe
To: ayoub.zaki@embetrix.com
Cc: openembedded-core@lists.openembedded.org, jlu@pengutronix.de
Content-Type: multipart/alternative; boundary="000000000000094bf2065ee87801"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248820

--000000000000094bf2065ee87801
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 at 10:49, Ayoub Zaki via lists.openembedded.org
<ayoub.zaki=embetrix.com@lists.openembedded.org> wrote:

> OpenSSL 4.x removed the ENGINE API. Add pkcs11-provider to OE-Core
> to support token-backed keys for target applications and native signing
> tools without requiring meta-oe. Token drivers and provider activation
> remain product-specific.
>

I would note that meta-oe contains a signing.bbclass, which presumably
offers a better more and standard way to handle signing in Yocto than just
setting custom, recipe- (or layer-) specific variables in local.conf, and
generating disk keys with custom shell scripts.

If you want to add a recipe to oe-core, you need have consumers for the
recipe, or explain how is it supposed to be used.  Let's say I built this
recipe, what then?

Should we import the signing class as well?  Maybe we need softhsm in
oe-core too? Should we have tests and documentation for all of this? I lean
towards yes, because secure boot is becoming increasingly important, and
yocto's support for it is fragmented and vendor-specific, but doing this
right does require quite a bit more work than just copying the recipe from
one layer into another.

In other words, the justification should be more than just "I don't want
meta-oe in dependencies".

Alex

--000000000000094bf2065ee87801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 28 Oct 2026 at 10:49, Ayoub Zaki via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ay=
oub.zaki=3D<a href=3D"mailto:embetrix.com@lists.openembedded.org">embetrix.=
com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">OpenSSL 4.x removed the ENGINE API. Add pkcs11-pr=
ovider to OE-Core<br>
to support token-backed keys for target applications and native signing<br>
tools without requiring meta-oe. Token drivers and provider activation<br>
remain product-specific.<br></blockquote><div><br></div><div>I would note t=
hat meta-oe contains a signing.bbclass, which presumably offers a better mo=
re and standard way to handle signing in Yocto than just setting custom, re=
cipe- (or layer-) specific variables in local.conf, and generating disk key=
s with custom shell scripts.</div><div><br></div><div>If you want to add a =
recipe to oe-core, you need have consumers for the recipe, or explain how i=
s it supposed to be used.=C2=A0 Let&#39;s say I built this recipe, what the=
n?</div><div></div><div><br></div><div></div><div>Should we import the sign=
ing class as well?=C2=A0 Maybe we need softhsm in oe-core too? Should we ha=
ve tests and documentation for all of this? I lean towards yes, because sec=
ure boot is becoming increasingly important, and yocto&#39;s support for it=
 is fragmented and vendor-specific, but doing this right does require quite=
 a bit more work than just copying the recipe from one layer into another.<=
/div><div><br></div><div>In other words, the justification should be more t=
han just &quot;I don&#39;t want meta-oe in dependencies&quot;.</div><div></=
div><div><br></div><div>Alex</div></div></div>

--000000000000094bf2065ee87801--
