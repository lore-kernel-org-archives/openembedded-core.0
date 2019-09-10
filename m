Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id CE92F6D4B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 10:53:18 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id w16so5376330uap.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 03:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7YTAqBSbLYYae7R1CP00SpHcI6VDpyfhfZzMkm30xtU=;
	b=tup2Akl2xjdz0esawzT8AYvuVjBa5rb7vHQAY9jkjoeatJaI6ykUfo63DxPm9p6zzw
	YCFgUF91r+1Xyvfj4syOfbxlCtFi/+8JKf51JIlZERgcXPILqblaBlOkP+n76q/TsiEU
	9YGL+pV3JNhF/2xrkH0ExS6Cx2JqbmghB9vB+j++OJzi5ZeweLmfCy/+CfKxDIsM7MtQ
	Jf8YyOrFrL2DvtAu3io8/iRFGyLL4a1lb0ucyOtJuVm40E+dLBwv9v8WBt9YrrJRf9Je
	ruVzoldZ/Lr6ucCIwZB4MRvIs7tNsZa//sS2w4g2olu78gTxYwF9bWyrQnmaVaVum/Zp
	dBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7YTAqBSbLYYae7R1CP00SpHcI6VDpyfhfZzMkm30xtU=;
	b=ngIq/AxBgQu+aFFM/My9hqLnw+pigNthEv9vn9jrMMph6buxtpH3mziwEO3xnyPZEE
	OSbO8OIWBvAETft4Cw5a8caNelZUfytCXasm7XZ2AOTw9t1C+M5Py01fCWPUcs0rsvZm
	G9XgfuRe3n/i4vDebJhZr17Hrt1pdF3HlTZLS+V1oNy+dJoXS0Us4i2199HhhtQGnB5G
	bJ1WWij8uz1WReYIGRvW4RkbPMgHItr1zc2R0dPQ+MA5knSt78Iy6+CtvXM7yVu2BYJx
	75o/2guX9MVbdpYPHmT3raD5i7P+KEoWbSDzK2C3gClJi+B4SlRVVgPK2EupykhpFI7d
	wXgA==
X-Gm-Message-State: APjAAAU/7LJ5E1k51fuWfQo/7/P7xO2lQ4AijvCF8OBh97k+mksTv4Hs
	XF10fGZLj/YkLbi/Xg1YkbsOLK9zioEckkASaangNbe7
X-Google-Smtp-Source: APXvYqy4smHW7tAHYXGaKgZOP2ceDOi7YunzbIwNh9gjAlRs9F3CKTrZXP25Xztvluyn5+W5YQLP+N/owmMx2LiPhug=
X-Received: by 2002:ab0:6601:: with SMTP id r1mr13871679uam.100.1568112799420; 
	Tue, 10 Sep 2019 03:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <1568026619-117196-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj8kH3Oqp_ac8BsRCRpT4qEqnCg3VYk0LFW4vnkGxnoF9A@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E199@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj_OBagcWxfBb0yF80Jr=CmhPg_FND5-V6ze4a4qFWYOyA@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E403@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E403@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Sep 2019 12:53:08 +0200
Message-ID: <CANNYZj-KCVLR2zTNgu-KywKoyRteOk7sn1N0ArMguAENNPLgig@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Tue, 10 Sep 2019 10:53:19 -0000
Content-Type: multipart/alternative; boundary="000000000000609841059230b664"

--000000000000609841059230b664
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Sep 2019 at 10:07, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> In last patch, I put the config file in meta-environment as its do_instal=
l
> task is in the target environment which means the value of ${PACKAGE_ARCH=
S}
> is right.
>
> And it finally produce a nativesdk package.
>
>
>
> If I put the config file in nativesdk-rpm, the value of ${PACKAGE_ARCHS}
> will always be =E2=80=9Call any noarch x86_64-nativesdk=E2=80=9D which is=
 not suitable for
> x86, arm and other ARCHS.
>
>
>
> So I=E2=80=99d like to put config file in the rpm of meta-environment. Di=
d you
> have any good Suggestions?
>

You probably need to use the post-relocate-setup.d/ facility, like the
nativesdk-meson recipe does. I am not sure if PACKAGE_ARCHS is accessible
from it, but it does seem like the right mechanism for tweaking settings
that are specific to nativesdk packages.

Alex

--000000000000609841059230b664
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 10 Sep 2019 at 10:07, Zheng, Ruoq=
in &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujit=
su.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_3065483816656345781WordSection1"><span style=3D"font-=
size:11pt;font-family:&quot;Calibri&quot;,sans-serif">In last patch, I put =
the config file in meta-environment as its do_install task is in the target=
 environment which means the value of ${PACKAGE_ARCHS} is right.</span>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">And it</span>
<span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif">f=
inally produce a nativesdk package.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">If I put the config file in nativesdk-rpm, the value =
of ${PACKAGE_ARCHS} will always be =E2=80=9Call any noarch x86_64-nativesdk=
=E2=80=9D which is not suitable for x86, arm and other ARCHS.<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">So I=E2=80=99d like to put config file in the rpm of =
meta-environment. Did you have any good Suggestions?<u></u><u></u></span></=
p>
</div></div></blockquote><div><br></div><div>You probably need to use the p=
ost-relocate-setup.d/ facility, like the nativesdk-meson recipe does. I am =
not sure if PACKAGE_ARCHS is accessible from it, but it does seem like the =
right mechanism for tweaking settings that are specific to nativesdk packag=
es.</div><div><br></div><div>Alex<br></div><div><br></div><div><br> </div><=
/div></div>

--000000000000609841059230b664--
