Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 46E4B76977
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 14:33:29 +0000 (UTC)
Received: by qgj62 with SMTP id 62so115487528qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=etCyWJWTe9jjIdroavI3WsRXt5GzeR3BaHJuTcUkil8=;
	b=DWpIuaHnABtUNsG7tiPN43LM1jRY5cQNoH0fEcKbZH50SyV79se+fEQHRSQY46I12H
	Y7vPISR9cV3alKqHCmIm0Oxrbv95TN/x/gMYFym9n82KvZObPkt58MHEvBD9odaXpgBs
	TYnkvfoFw90v3Pyr+k/daDGe037SvC0TDFyMAUyT7GUJSd9cTlH6YePMoFCrrgLX9Qn3
	CHkFHJnL0xWinzxwGSjCopPCAXrU1HaXKtThdSdD8I63SdXgc120RWfndwaPYBgChnjc
	lW2wH7HewdcJ2P38HLcliMM+kituC2EyO97dse6RkiHfaSD6sPrBBnoBV3BIOgBz8Vef
	N3TQ==
X-Gm-Message-State: ALoCoQlFy8ugBYxSF4HqQcQWrZByZC4EkGHousoCeKmJpAOEL8Uw7+1WCdvKjfarFCu8urK3RHsA
X-Received: by 10.141.28.6 with SMTP id f6mr52290826qhe.64.1439303609891; Tue,
	11 Aug 2015 07:33:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 07:33:10 -0700 (PDT)
In-Reply-To: <6af40fe1752b8cf25efca4a906361c4437249841.1439281753.git.patrick.ohly@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<6af40fe1752b8cf25efca4a906361c4437249841.1439281753.git.patrick.ohly@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 15:33:10 +0100
Message-ID: <CAJTo0LbMmZ9rf-Jq_XoGJzTCj_0E=1qene_ooyf_T_nWsH60Jw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] mtd-utils: keep xattr support enabled
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
X-List-Received-Date: Tue, 11 Aug 2015 14:33:30 -0000
Content-Type: multipart/alternative; boundary=001a11422ff46455a4051d09fc76

--001a11422ff46455a4051d09fc76
Content-Type: text/plain; charset=UTF-8

On 11 August 2015 at 09:45, Patrick Ohly <patrick.ohly@intel.com> wrote:

> -EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}'
> 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
> +EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}'
> 'CFLAGS=${CFLAGS} -I${S}/include' 'BUILDDIR=${S}'"
>

There's a "xattr" DISTRO_FEATURE that should be respected here for target
builds (and explicitly enabled for native I guess).

Does enabling xattr mean adding build dependencies?

Ross

--001a11422ff46455a4051d09fc76
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2015 at 09:45, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2b0" class=
=3D"a3s" style=3D"overflow:hidden">-EXTRA_OEMAKE =3D &quot;&#39;CC=3D${CC}&=
#39; &#39;RANLIB=3D${RANLIB}&#39; &#39;AR=3D${AR}&#39; &#39;CFLAGS=3D${CFLA=
GS} -I${S}/include -DWITHOUT_XATTR&#39; &#39;BUILDDIR=3D${S}&#39;&quot;<br>
+EXTRA_OEMAKE =3D &quot;&#39;CC=3D${CC}&#39; &#39;RANLIB=3D${RANLIB}&#39; &=
#39;AR=3D${AR}&#39; &#39;CFLAGS=3D${CFLAGS} -I${S}/include&#39; &#39;BUILDD=
IR=3D${S}&#39;&quot;</div></blockquote><div><br></div><div>There&#39;s a &q=
uot;xattr&quot; DISTRO_FEATURE that should be respected here for target bui=
lds (and explicitly enabled for native I guess).</div><div><br></div><div>D=
oes enabling xattr mean adding build dependencies?</div><div><br></div><div=
>Ross=C2=A0</div></div></div></div>

--001a11422ff46455a4051d09fc76--
