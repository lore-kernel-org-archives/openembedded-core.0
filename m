Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id A4B886FEFE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 06:41:03 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id q188so6115837oia.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 23:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lF48edRUKs6Xu8x4SMNpIB8VS9dl4RSiphT8QDcUL8Y=;
	b=SQobuA7aS3dbqE95Loo1b2ViR2qOHeaSusesT3iaDmtkzYdX/SUCdsrkdPlRaDMJRq
	c/waNl0ml3uG+YkiJmtw2MGCT7eC6JOqeB4m5KeWXUGrqxxvoqYe0hsjOdG0Hs3Rb4gh
	TMN1ddaKUu3VmBbdL/YEooIYp0keXHCW3dvqJOKrkI2fjPfl8Y6iJGeWX5nul7I97W+W
	T897VOGcjI0NkDQ0dPyWKdDSGoqNgZ0NeMKsYtYHAli0gN9WAOXBSHtIVCARsNAkA8w5
	Lq8qBW2Izo1An8a5cbQpfZZ/a4c30momCI8pPOJLzi+mzaJZk1Hg/vQkY5/nwFqe7MXW
	hiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lF48edRUKs6Xu8x4SMNpIB8VS9dl4RSiphT8QDcUL8Y=;
	b=iLuBxUvsl0JKviUHxyrFiTFfJSml83bFvMg2iBbtZrkhyTq0i2/z50DS07t5c8Aaqo
	jCXYl6/yFy+TVkXS7GbDR2epvn/7ykzGbCCJN4vwRXbSNN5Siqo2a5Xm1UbXLJdHLiDD
	0LBgCxkL1N/YmGKQkjSgANWUIu44a0BxKO/wJBWYp+0juEQMAV9ZpuyTZhISiWgiRIj8
	uqM6+SHeniylXPIt+IUWiMF/+EKXpz84TduGlVZGzMngwPrKg8edEi9JmDD6V2buuvfC
	6Uhq6BU4a71h5R2y9tAi+PKMzCIlJxONCFeOwzA6/5+/WmAk1uZh33z7l/XzTjQo5KVb
	zy5g==
X-Gm-Message-State: AE9vXwMhkwbxGWdpTBfKe7Y06+SJUafZDBiysmaPx29lG8mYqSPbcwwqHpB0t29+QLvjvAt3oVBC7eGYsMGPkpie
X-Received: by 10.202.60.87 with SMTP id j84mr3017567oia.53.1473403263822;
	Thu, 08 Sep 2016 23:41:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Thu, 8 Sep 2016 23:40:33 -0700 (PDT)
In-Reply-To: <AMSPR04MB3092135C0903E60A9999689E2EA0@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <AMSPR04MB3092135C0903E60A9999689E2EA0@AMSPR04MB309.eurprd04.prod.outlook.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 9 Sep 2016 09:40:33 +0300
Message-ID: <CAHiDW_HLjc9GyoFkcSs_HU1LES5Kn8jSX8HmJf76NfdK_tTrfA@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: "Patches and discussions about the oe-core layer
	\(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: weston startup problem
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
X-List-Received-Date: Fri, 09 Sep 2016 06:41:04 -0000
Content-Type: multipart/alternative; boundary=001a113cd25c26e992053c0d6ef6

--001a113cd25c26e992053c0d6ef6
Content-Type: text/plain; charset=UTF-8

On 24 August 2016 at 20:08, Tom Hochstein <tom.hochstein@nxp.com> wrote:

> Hi All,


Hi, sorry for missing this in the originally,


> The weston systemd startup implementation is not working correctly and I
> need some help fixing it.
>
> With systemd and pam on the image, the expected behavior is that
> XDG_RUNTIME_DIR would already be set when weston is launched from
> weston.service. Turns out XDG_RUNTIME_DIR is not set, and weston.service
> sets it itself. This is already a problem, and the problem would be worse
> except that weston happens to use a different folder. If weston.service is
> modified to use the same folder name, the folder ends up getting replaced
> later by pam.



I can see our XDG_RUNTIME_DIR handling indeed should be cleaned up but just
so I understand the whole issue: can you explain the problem you have in
detail? It seems one issue is that the variable isn't set outside of
 Xsession (it really should) but why is it a problem if weston.service
decides a runtime directory for itself? How does pam interfere with that?


Thanks,
 Jussi


>
>
From looking at the weston-launch code and its pam handling, I thought to
> try the weston-launch option '--user=root' to force the creation of the pam
> session. This does seem to help, and I was able to get it mostly working by
> modifying the openvt args in weston-start, removing -e and adding -w:
>
> openvt -v -s -w -- weston-launch --user=root -- --modules=xwayland.so
> --log=/var/log/weston.log
>
> The problem I have now is that keyboard input goes to both weston and the
> desktop. I tried with and without the -s option, and there is no difference.
>
> I'm stuck at this point and would appreciate some help.
>
> Tom
>

--001a113cd25c26e992053c0d6ef6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
4 August 2016 at 20:08, Tom Hochstein <span dir=3D"ltr">&lt;<a href=3D"mail=
to:tom.hochstein@nxp.com" target=3D"_blank">tom.hochstein@nxp.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi All,</=
blockquote><div>=C2=A0</div><div>Hi, sorry for missing this in the original=
ly,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
The weston systemd startup implementation is not working correctly and I ne=
ed some help fixing it.<br>
<br>
With systemd and pam on the image, the expected behavior is that XDG_RUNTIM=
E_DIR would already be set when weston is launched from weston.service. Tur=
ns out XDG_RUNTIME_DIR is not set, and weston.service sets it itself. This =
is already a problem, and the problem would be worse except that weston hap=
pens to use a different folder. If weston.service is modified to use the sa=
me folder name, the folder ends up getting replaced later by pam.</blockquo=
te><div><br></div><div><br></div><div>I can see our XDG_RUNTIME_DIR handlin=
g indeed should be cleaned up but just so I understand the whole issue: can=
=C2=A0you explain the problem you have in detail? It seems one issue is tha=
t the variable isn&#39;t set outside of =C2=A0Xsession (it really should) b=
ut why is it a problem if weston.service decides a runtime directory for it=
self? How does pam interfere with that?</div><div><br></div><div><br></div>=
<div>Thanks,</div><div>=C2=A0Jussi</div><div>=C2=A0=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">=C2=A0<br></blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
From looking at the weston-launch code and its pam handling, I thought to t=
ry the weston-launch option &#39;--user=3Droot&#39; to force the creation o=
f the pam session. This does seem to help, and I was able to get it mostly =
working by modifying the openvt args in weston-start, removing -e and addin=
g -w:<br>
<br>
openvt -v -s -w -- weston-launch --user=3Droot -- --modules=3Dxwayland.so -=
-log=3D/var/log/weston.log<br>
<br>
The problem I have now is that keyboard input goes to both weston and the d=
esktop. I tried with and without the -s option, and there is no difference.=
<br>
<br>
I&#39;m stuck at this point and would appreciate some help.<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
Tom<br>
</font></span></blockquote></div><br></div></div>

--001a113cd25c26e992053c0d6ef6--
