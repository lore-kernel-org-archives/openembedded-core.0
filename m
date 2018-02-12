Return-Path: <ccherukuri.chaitanya@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8D084700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 21:06:40 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 141so12377247wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 13:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=rAxSbiGpGqMHg+DcXEYbPXn0m2BDy5WUeiquCc1KC/Q=;
	b=hw+L/PihlVctK/YSpKrAyO+j4GQZcvbKv1J3Dei60UsyLCyMJgr8H1RY+g4Tywpkyu
	DWQY0+VMNvnp1jEpB/8j7HKlux4B8/vgSej9xsOAgvsD4ia9oKeGYZF2wmgTqTv3G0oh
	UavoDNhZB7xyN+5ZZwVGMjsk6JYC9hvSZLhS0nFaLFZZinilliR74ey4SshxYJ66SlKU
	AEZ5AombWk/NhQrvRRJ+xVDWwo69a6Ojfn83hFUPNxJAvDrvvOP5mj982W3YhMMOtKci
	+8BWVbqNeqhvWbmTebetUMoAp8AoTOmesW6ntS0mp2G2xmNfnDVWcQY2uVxSo1jHB2RL
	0gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=rAxSbiGpGqMHg+DcXEYbPXn0m2BDy5WUeiquCc1KC/Q=;
	b=otnOQrcc5BJo/vTpU1eP340jVeIwG+Pznb90w6wCzUxjNgtdGukVAHXeSz1WM4M9PI
	37Nof7Y7ht7iwiUAE4GlTyzfXXmrTY61nATLnFloKbXPN4xXnYFKbTueOeyCdFGCGbDP
	xExR5XNcDO55u1goPrQX4KG0VzG3xypUVbjQ4Ppb+J7pvXlug5sKMLe8MJU76MAMpTJZ
	4sZWtMiyd6zjSVIUd5m6YDETpWz3mLU5hUn03ARwMXq2FDxRKWG8tReR+VOVUT8VcO/q
	euGPvme0One6nCXc1G++t4n8+q/mB1Zy5cmrOlFvHZGxFVUqsoBuq+BskJ2soTNsHG8+
	H9dg==
X-Gm-Message-State: APf1xPAsttCAP/iqyevpGXRJg2AuOWQmQ6WiNky9/LZSINuHYBW7VTjK
	AE++oi475sAOkgyPlErPlcHQL8jCz22jFa7ZXUARHg==
X-Google-Smtp-Source: AH8x227Ab+4+phl8cweV3XSBwKqzsDjvZ7b5dlM94vSVBt4dH4/QkaHyQ3onUbhTDkM6MKy2daM7+O7zniszFG6k914=
X-Received: by 10.28.245.3 with SMTP id t3mr4451024wmh.134.1518469600616; Mon,
	12 Feb 2018 13:06:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.30.70 with HTTP; Mon, 12 Feb 2018 13:06:40 -0800 (PST)
From: Chaitanya Cherukuri <ccherukuri.chaitanya@gmail.com>
Date: Mon, 12 Feb 2018 16:06:40 -0500
Message-ID: <CAGix03zhY3ZEhKLUyzU3HDmMD3t2MmOwkM2TffZVUdByk+cA+A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Regarding Patch ID: 132816
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
X-List-Received-Date: Mon, 12 Feb 2018 21:06:40 -0000
Content-Type: multipart/alternative; boundary="089e082f884425a6ab05650a4169"

--089e082f884425a6ab05650a4169
Content-Type: text/plain; charset="UTF-8"

 Hello,

I'm new to this forum and didn't know to where to report an issue. I'm
contacting you regarding the patch ID 132816 ( cmake: improve
CMAKE_SYSTEM_PROCESSOR assignment in nativesdk).

If SDKTARGETSYSROOT is "/sysroots/cortexa9hf-neon-poky-linux-gnueabi" this
patch sets the CMAKE_SYSTEM_PROCESSOR as  "cortexa9hf-neon-poky"  instead
of
"cortexa9hf-neon".

This patch works if  SDKTARGETSYSROOT is "/sysroots/core2-32-poky-linux".

Thanks,
Chaitanya

--089e082f884425a6ab05650a4169
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<div class=3D"gmail_default" style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;font-size:small"><font face=3D"verdana, sans-serif">Hello,<br></font>=
</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><div class=3D"gmail_default" style=3D"font-size:small"><font face=3D"=
verdana, sans-serif"><br></font></div><div class=3D"gmail_default"><font fa=
ce=3D"verdana, sans-serif">I&#39;m new to this forum and didn&#39;t know to=
 where to report an issue.=C2=A0</font><span style=3D"font-family:verdana,s=
ans-serif">I&#39;m contacting you regarding the patch ID 132816 (=C2=A0</sp=
an><span style=3D"font-family:verdana,sans-serif;color:rgb(51,51,51)">cmake=
: improve CMAKE_SYSTEM_PROCESSOR assignment in nativesdk).=C2=A0</span></di=
v><div class=3D"gmail_default"><font face=3D"verdana, sans-serif"><span sty=
le=3D"color:rgb(51,51,51)"><br></span></font></div><div class=3D"gmail_defa=
ult"><font face=3D"verdana, sans-serif"><span style=3D"color:rgb(51,51,51)"=
>If SDKTARGETSYSROOT is &quot;/</span></font><font color=3D"#333333" face=
=3D"verdana, sans-serif">sysroots/cortexa9hf-neon-<wbr>poky-linux-gnueabi&q=
uot; this patch sets the CMAKE_SYSTEM_PROCESSOR as=C2=A0=C2=A0&quot;<span s=
tyle=3D"color:rgb(51,51,51);font-family:verdana,sans-serif;font-size:small;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">cortexa9hf-neon-poky&quot;=C2=A0 instead of=C2=A0 =C2=
=A0</span></font></div><div class=3D"gmail_default"><font color=3D"#333333"=
 face=3D"verdana, sans-serif"><span style=3D"color:rgb(51,51,51);font-famil=
y:verdana,sans-serif;font-size:small;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">&quot;c<span styl=
e=3D"color:rgb(51,51,51);font-family:verdana,sans-serif;font-size:small;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">ortexa9hf-neon&quot;.</span></span></font></div><div clas=
s=3D"gmail_default"><font color=3D"#333333" face=3D"verdana, sans-serif"><s=
pan style=3D"color:rgb(51,51,51);font-family:verdana,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline"><span style=3D"color:rgb(51,51,51);font-family:ve=
rdana,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline"><br></span></span></f=
ont></div><div class=3D"gmail_default"><font color=3D"#333333" face=3D"verd=
ana, sans-serif"><span style=3D"color:rgb(51,51,51);font-family:verdana,san=
s-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline"><span style=3D"color:rgb(51,51=
,51);font-family:verdana,sans-serif;font-size:small;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">Th=
is patch works if=C2=A0<span>=C2=A0</span><font face=3D"verdana, sans-serif=
" style=3D"color:rgb(34,34,34);font-size:small;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(51,51,51=
)">SDKTARGETSYSROOT is &quot;/</span></font><font color=3D"#333333" face=3D=
"verdana, sans-serif" style=3D"font-size:small;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial">sysroots/core2-32-poky-<wbr>linux=
&quot;.</font></span></span></font></div><div class=3D"gmail_default"><br><=
/div><div class=3D"gmail_default"><font color=3D"#333333" face=3D"verdana, =
sans-serif"><span style=3D"color:rgb(51,51,51);font-family:verdana,sans-ser=
if;font-size:small;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline"><span style=3D"color:rgb(51,51,51);=
font-family:verdana,sans-serif;font-size:small;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline"><font c=
olor=3D"#333333" face=3D"verdana, sans-serif" style=3D"font-size:small;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial">Thanks,</=
font></span></span></font></div><div class=3D"gmail_default"><font color=3D=
"#333333" face=3D"verdana, sans-serif"><span style=3D"color:rgb(51,51,51);f=
ont-family:verdana,sans-serif;font-size:small;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline"><span st=
yle=3D"color:rgb(51,51,51);font-family:verdana,sans-serif;font-size:small;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline"><font color=3D"#333333" face=3D"verdana, sans-serif" st=
yle=3D"font-size:small;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial">Chaitanya</font></span></span></font></div></div>

<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><i><font face=3D"comic sans ms,sans-serif"></font></i></div>
</div></div>
</div>

--089e082f884425a6ab05650a4169--
