Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE9A60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 11:47:30 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 38so3726627iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 04:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oqoHcKwCwodlA89yGJViQ2AWKRQxbjqlUL16hGH/gI8=;
	b=lH7buIrb4PXvKcJ4OFqHB54D98+MrRxHBAKO0xsLU9BX1GkSzKItAJNTpm/xdPXObt
	ScjBpA/fSBZ3Z5udIwgg5+EpNNYFd9gR9zulcY2I9OeNOY5de5yGnGoS8et2oD/aK31E
	cdoQLq+JWTDYqOVE30rmdH4ZRmzuP83/Au4r9UWNHKu4nWJew11nLar5gyVGPidS2Pn+
	Qxh4FsdKq+LAElSEo0ykEbG2FHqx7fUmLV3H1kUg4AX5OQsWVYY4dx5IKc5RjbLdLHX7
	/V1ooVFMw8OuH0nVWQmihGTvA3lG9LX0tIl2yNNCt26vs8mlVZYPoQBbvd9EicaD59Zt
	2aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oqoHcKwCwodlA89yGJViQ2AWKRQxbjqlUL16hGH/gI8=;
	b=lVcGyeIQLYyrBDRtT+8I4IH0I3xbRuvhPZJwm2BlopBcRsFrUiO/KUB6dFAOBvIPbv
	Oxw8sqqrhXb3a1FzRdHsTfl6NUT233b2RJcDzK7r3Fk0ts16a/NTuLC/OssJFTlcGICp
	waqNTXh+dcy1lUp2e0QLLphibZHn48W1osO15FkSJh/8O+a1AmOWobea/PWeWV8CcXyU
	JN4YNdp4exXJw6q6/x8urMXOAgB9UdT8ulBBFWni/8JxZaebM1212O1CSCCh20oFQRQV
	J0sENuleI7fqx0kGVXhYrYcPMkzXHn2k8OEa0DE6wZNy082/sVM3G7wkWpzrrFgFsm4V
	djdg==
X-Gm-Message-State: ALyK8tJQaWa13dAwq9zkaRAWC00sTS04MeqPHCFMF+kDUB7h5HAcNEmIY2xnjcn99SJpNBW6UUce+5OR6Rpq97XM
X-Received: by 10.107.138.212 with SMTP id c81mr7551416ioj.148.1468237650608; 
	Mon, 11 Jul 2016 04:47:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 11 Jul 2016 04:47:11 -0700 (PDT)
In-Reply-To: <bb1a8cdb4a5bdc1ed1746244eb734f5efa8ec9c3.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
	<bb1a8cdb4a5bdc1ed1746244eb734f5efa8ec9c3.1467569369.git.akuster@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jul 2016 12:47:11 +0100
Message-ID: <CAJTo0LZ-od=MPWkq3xgg5SPHicKf5mHXML--ZFJ-TieE4dKm4A@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] qemu: add ppc64 to QEMU_TARGETS
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
X-List-Received-Date: Mon, 11 Jul 2016 11:47:31 -0000
Content-Type: multipart/alternative; boundary=001a113ed9329c7ff005375ab759

--001a113ed9329c7ff005375ab759
Content-Type: text/plain; charset=UTF-8

On 3 July 2016 at 19:15, Armin Kuster <akuster808@gmail.com> wrote:

> -QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4
> x86_64"
> +QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc ppc64
> sh4 x86_64"
>

Is this series meant to support user-mode qemu yet?

NOTE: Running intercept scripts:
NOTE: > Executing update_font_cache intercept ...
Invalid data memory access: 0x00000041bc926008
NIP 000000400084055c   LR 00000040008404ac CTR 0000000000000000 XER
0000000000000000 CPU#0
MSR 8000000102806000 HID0 0000000000000000  HF 8000000002806000 idx 0
TB 00005165 22187490268086
GPR00 0000004000840480 000000400081e8b0 0000004000869e00 00000043789e6010
GPR04 0000004000849478 000000000000000b 0000000000000002 0000000000000003
GPR08 0000004000849482 00000041bc925ff4 0000000000000000 000000400086600a
GPR12 0000000022242442 0000000000000000 00000040008634c0 0000004000847c18
GPR16 0000004000863188 0000000000000000 000000400081ed60 000000400081ed68
GPR20 000000400081ea10 0000000000000013 0000000000000000 0000000000000000
GPR24 0000000000000001 0000004000000821 000000004a01ffff 0000000087e8d51f
GPR28 00000043789e6010 000000002500ffff 0000004000866000 000000400081e8b0
CR 22242444  [ E  E  E  G  E  G  G  G  ]             RES ffffffffffffffff
FPR00 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR04 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR08 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR28 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPSCR 0000000000000000
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault

Ross

--001a113ed9329c7ff005375ab759
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 July 2016 at 19:15, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mail=
to:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":2yo" class=3D"">-QEMU_TARGETS ?=
=3D &quot;arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64&quot;=
<br>
+QEMU_TARGETS ?=3D &quot;arm aarch64 i386 mips mipsel mips64 mips64el ppc p=
pc64 sh4 x86_64&quot;<br></div></blockquote></div><br>Is this series meant =
to support user-mode qemu yet?</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra"><div class=3D"gmail_extra">NOTE: Running intercept=
 scripts:</div><div class=3D"gmail_extra">NOTE: &gt; Executing update_font_=
cache intercept ...</div><div class=3D"gmail_extra">Invalid data memory acc=
ess: 0x00000041bc926008</div><div class=3D"gmail_extra">NIP 000000400084055=
c =C2=A0 LR 00000040008404ac CTR 0000000000000000 XER 0000000000000000 CPU#=
0</div><div class=3D"gmail_extra">MSR 8000000102806000 HID0 000000000000000=
0 =C2=A0HF 8000000002806000 idx 0</div><div class=3D"gmail_extra">TB 000051=
65 22187490268086</div><div class=3D"gmail_extra">GPR00 0000004000840480 00=
0000400081e8b0 0000004000869e00 00000043789e6010</div><div class=3D"gmail_e=
xtra">GPR04 0000004000849478 000000000000000b 0000000000000002 000000000000=
0003</div><div class=3D"gmail_extra">GPR08 0000004000849482 00000041bc925ff=
4 0000000000000000 000000400086600a</div><div class=3D"gmail_extra">GPR12 0=
000000022242442 0000000000000000 00000040008634c0 0000004000847c18</div><di=
v class=3D"gmail_extra">GPR16 0000004000863188 0000000000000000 00000040008=
1ed60 000000400081ed68</div><div class=3D"gmail_extra">GPR20 000000400081ea=
10 0000000000000013 0000000000000000 0000000000000000</div><div class=3D"gm=
ail_extra">GPR24 0000000000000001 0000004000000821 000000004a01ffff 0000000=
087e8d51f</div><div class=3D"gmail_extra">GPR28 00000043789e6010 0000000025=
00ffff 0000004000866000 000000400081e8b0</div><div class=3D"gmail_extra">CR=
 22242444 =C2=A0[ E =C2=A0E =C2=A0E =C2=A0G =C2=A0E =C2=A0G =C2=A0G =C2=A0G=
 =C2=A0] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RES ffffffffffffffff</di=
v><div class=3D"gmail_extra">FPR00 0000000000000000 0000000000000000 000000=
0000000000 0000000000000000</div><div class=3D"gmail_extra">FPR04 000000000=
0000000 0000000000000000 0000000000000000 0000000000000000</div><div class=
=3D"gmail_extra">FPR08 0000000000000000 0000000000000000 0000000000000000 0=
000000000000000</div><div class=3D"gmail_extra">FPR12 0000000000000000 0000=
000000000000 0000000000000000 0000000000000000</div><div class=3D"gmail_ext=
ra">FPR16 0000000000000000 0000000000000000 0000000000000000 00000000000000=
00</div><div class=3D"gmail_extra">FPR20 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000</div><div class=3D"gmail_extra">FPR24 000=
0000000000000 0000000000000000 0000000000000000 0000000000000000</div><div =
class=3D"gmail_extra">FPR28 0000000000000000 0000000000000000 0000000000000=
000 0000000000000000</div><div class=3D"gmail_extra">FPSCR 0000000000000000=
</div><div class=3D"gmail_extra">qemu: uncaught target signal 11 (Segmentat=
ion fault) - core dumped</div><div class=3D"gmail_extra">Segmentation fault=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div></div>

--001a113ed9329c7ff005375ab759--
