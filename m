Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 30A0565D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 06:52:08 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t189so53324616wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Etx+HzFxIr9OZqbLpKd0LK4yhEUtdrYN7bua6yMilB4=;
	b=iMEU8L+9/rO7cvVfBxsBf4AxpT5iN0xD2t/3p146CX7q+SVJfuWP1KwnLj6sE+7Aak
	efip9rs08iQ9H8bY5/2vauzwIukxesFbMmHSTLdf/xrsLpmnt027CdbHzcx65eJ/DcAB
	e7CLj7Mi73uz8LMkNCxPfv54HcLN0za96fit4AQKHAmThnRd0Wma+hCFFGWd1Icba18M
	aEzsFqAQdFpkknfvbia5KkL1XeMnLsf+WZ8mKNIH0tUyiXxiMgOn1SN3ld4RwlFWNa7h
	dx1+k/wsMtQM9hXuLaRIYtkn+FKJfaus6SsuJz7sCdi/6fkBqXK8gvuiLeVQXq7UUB60
	ACLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Etx+HzFxIr9OZqbLpKd0LK4yhEUtdrYN7bua6yMilB4=;
	b=jgo6vYIK65VRP7qqrKcEwAeSXE5GMY4PbbF3Lu1webI9Q2JYPmDI9MFcTSHQFUzfXE
	FnNkG9jjX0vI4txGzZJ8MtSC1B4NJ63x7gkRaK3z9e15U23TcVKLG3iwQyfky9uN8WkV
	k8QNw521sCLcu2NMm0Rv2sOk58u5LKYoj3YMBxPD/eXp9uEPq7RIli+rJoTFkymcoSvE
	9JIcbrU+SN9sSAOfNcCimX1zkqy4ThyeEVkSaTcqkMwajJDFytm0LPBUoc8sqMrRLUVx
	yvlxPoUMrpb9DU7W95Q6N7+61GYVVIo5UabvYdqhKajK2XCDeTHQXCPQ5T2WVjLcEHe4
	Fp/A==
X-Gm-Message-State: AN3rC/4i0TuP6/t7HFwZzpi1A//fft8f1BNcl/S+TzxFl5GFPXXNKXo3
	sZfg/ebJDI9+75eO+5qXYYOAC6Rfnw==
X-Received: by 10.28.175.209 with SMTP id y200mr6096837wme.81.1491893529106;
	Mon, 10 Apr 2017 23:52:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Mon, 10 Apr 2017 23:52:08 -0700 (PDT)
In-Reply-To: <20170411013850.GA25337@linux-uys3>
References: <20170411013850.GA25337@linux-uys3>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Apr 2017 08:52:08 +0200
Message-ID: <CA+chaQcT7jApSyB4SqwPhsn+Pn_XTbryPT0FQZ_ST0OKDTH5xA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Drew Moseley <drew_moseley@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: having llvm available for gallium
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
X-List-Received-Date: Tue, 11 Apr 2017 06:52:10 -0000
Content-Type: multipart/alternative; boundary=001a11444820d87add054cde87f9

--001a11444820d87add054cde87f9
Content-Type: text/plain; charset=UTF-8

Check this:

http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135050.html

On Tue, Apr 11, 2017 at 3:38 AM, Trevor Woerner <twoerner@gmail.com> wrote:

> I think this might be a casualty of RSS, but when trying to build mesa for
> the
> gizmo2 I get:
>
>         | checking for wayland-scanner... no
>         | checking for XCB_DRI2... yes
>         | checking for x86_64-oe-linux-llvm-config... no
>         | checking for llvm-config... no
>         | checking for RADEON... yes
>         | configure: error: LLVM is required to build Gallium R300 on x86
> and x86_64
>
> There already is a dependency on llvm${MESA_LLVM_RELEASE} so I'm not sure
> what
> magic is required to make llvm-config available.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11444820d87add054cde87f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Check this:<div><br></div><div><a href=3D"http://lists.ope=
nembedded.org/pipermail/openembedded-core/2017-April/135050.html">http://li=
sts.openembedded.org/pipermail/openembedded-core/2017-April/135050.html</a>=
<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Tue, Apr 11, 2017 at 3:38 AM, Trevor Woerner <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">I think this might be a c=
asualty of RSS, but when trying to build mesa for the<br>
gizmo2 I get:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | checking for wayland-scanner... no<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | checking for XCB_DRI2... yes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | checking for x86_64-oe-linux-llvm-config... n=
o<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | checking for llvm-config... no<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | checking for RADEON... yes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | configure: error: LLVM is required to build G=
allium R300 on x86 and x86_64<br>
<br>
There already is a dependency on llvm${MESA_LLVM_RELEASE} so I&#39;m not su=
re what<br>
magic is required to make llvm-config available.<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a11444820d87add054cde87f9--
