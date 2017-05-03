Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id D0AE371AC5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 13:48:51 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id u68so14996262qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GYk6QhV6gJe2505cC6bEKWWDe9jXJqgYZq22Wg3a0cA=;
	b=xb+UyQLd2FqLpdf61hJ8z6t97jrfjSGczsLGBNhLIp656fYA2c8z6iBtl01MXdiye7
	+Q4yCSjG7seAL3aJ/fKrEcUuvlpYR5XahbbwOqg8NXwB2QcaB6LQcunarPqsBmXeQv1Y
	iHDd7EC72QRgoNxhcOGd+Irw6FArgixnth0i83wQ/poEP/TNGJONY1K5TXlbSw4K5tMs
	6W+2Zb/nGh8ytiultjxrK24kfZ2Nvecn7z6Cx8JxZb7g3RCIfIdZbsOYL/5ORZ1EzyoH
	wi7TGEqA35Pe+nXEriyZV7oasfB4RsYbEfSCw3e7lZzRENBlOQUqZiswgz/NlNU7xez3
	O3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GYk6QhV6gJe2505cC6bEKWWDe9jXJqgYZq22Wg3a0cA=;
	b=CbUMnzfxmCA6V07E1wq75+gJgw02/FUPXpGJZeYvY7s01+ljz/1iLioFt1xaiCzNuh
	vYFSX3/82TBGHweX5PR6Y6qNe1RzG2eEujo1Pv/ft3DAb0RDSD/md4Qpl4O3Q8YFAV47
	ixgi/qv4s9G3/fAFI9uvME3KUhqNZ2KyIkSLdORwN9hchRU7gAG9WHp9X8xmkL7/uweM
	5rbiHu53tcmYbeTG/HKaxNFlBla3MDb3Kk3dn2rCOOzxjFGfCy1V2p9opbxQGnfG7W3d
	QGa/FKfd6zrxaKWhz9ZGBPfjfMTDCoInlMLpLPGSfcincN+jbTz3mbQG0Py9ZktKbLir
	unkQ==
X-Gm-Message-State: AODbwcBq4PQ5OCp7qkJpqgSFu5jyV8EI23L0CUJF/PNOdf7tUNOb0o9E
	Mzm2Po6RREQbt6xsP2zrdwbJ8Uf75MT8
X-Received: by 10.55.17.224 with SMTP id 93mr2895146qkr.244.1493819332491;
	Wed, 03 May 2017 06:48:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Wed, 3 May 2017 06:48:32 -0700 (PDT)
In-Reply-To: <1493799829-96908-2-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1493799829-96908-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1493799829-96908-2-git-send-email-rebecca.swee.fun.chang@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 May 2017 14:48:32 +0100
Message-ID: <CAJTo0LbhnYVxmk-rNK_ejSwnP=-YxywuYHT6Oa=9_Ap9C5QUtw@mail.gmail.com>
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ghostscript: check for incompatible TARGET_ARCH
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
X-List-Received-Date: Wed, 03 May 2017 13:48:52 -0000
Content-Type: multipart/alternative; boundary=001a1135cbccac5109054e9eeaaa

--001a1135cbccac5109054e9eeaaa
Content-Type: text/plain; charset=UTF-8

On 3 May 2017 at 09:23, <rebecca.swee.fun.chang@intel.com> wrote:

> +# Check for incompatible TARGET_ARCH
> +python __anonymous () {
> +    if d.getVar('TARGET_ARCH') == "arc":
> +        raise bb.parse.SkipRecipe("ghostscript is incompatible with
> target arc")
> +}
>

Wouldn't it be neater to use COMPATIBLE_HOST?  For example sysprof doesn't
work on aarch64 and uses COMPATIBLE_HOST = "^(?!aarch64).*".

Ross

--001a1135cbccac5109054e9eeaaa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 May 2017 at 09:23,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rebecca.sw=
ee.fun.chang@intel.com" target=3D"_blank">rebecca.swee.fun.chang@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:wx" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15bcd69dcf1a7b7c">+# Check for incompatible TARG=
ET_ARCH<br>
+python __anonymous () {<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;TARGET_ARCH&#39;) =3D=3D &quot;arc&quot;:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;<wbr>ghostscri=
pt is incompatible with target arc&quot;)<br>
+}</div></blockquote></div><br>Wouldn&#39;t it be neater to use COMPATIBLE_=
HOST?=C2=A0 For example sysprof doesn&#39;t work on aarch64 and uses=C2=A0C=
OMPATIBLE_HOST =3D &quot;^(?!aarch64).*&quot;.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135cbccac5109054e9eeaaa--
