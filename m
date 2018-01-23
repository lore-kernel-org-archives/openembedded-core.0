Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 371B278213
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 19:50:57 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id k68so1008815pga.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 11:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qNB4hMZl1swLQK0BRQL6R3uYbYwlv8aPJwlzmmZQxcM=;
	b=Yb7tP4vV4c/Yj4iTZkpbcrI2XfAkMpgH4jQBEOdLOW6sIhl5ClUa0nuGAaKqup97rM
	tbyQ881DxparvKoJieliC598vp4ySQsBXmbXmlHxAJ286Xt0dJYGvoGsyGX15CsmTfZl
	67Uk1ZiNzQC6e0AQdgQ78BCfT4gD3okhhbt8gqptNpmsrCte40YPgM9T3tOHwooEyhqe
	RFr7TbHFB1Ffp3UUe7jxUGwM8khiRPw6UJjsdRWCdejVwvohO0MwThapTLDyk/ipt6Va
	axApaX1VQm/luZueJ/WodwdreO1eqtwG7Uh4fhjBoccrL1PKq/2gYTfSCNYKh2G8x7jr
	2iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qNB4hMZl1swLQK0BRQL6R3uYbYwlv8aPJwlzmmZQxcM=;
	b=KfEnYQoSnoF5RUMXTxF+t5Xdp9tREnkUf5ydI6YruGJH2Mmf6rLSKkdzlhmvGFGcui
	AW/FFXAHU0X7WjqupStWSK7uisSM+VJ3vjJK+aSuWeGnms69Gy2MpHuIZ0X8cEyHzeNJ
	K45ZSL70bthUVHddglc/J5jS0a6iA3VmGjg5gO7qEGfkh18Og2+elLswb/zlEyqDOeBc
	ZqcI1FaYJV17NHUlJnlxICe8H9XiuVMhXTpjyXYgDJ/7F5pCzPZ3qurq+4JgPbxwmJO+
	/c96SNT/j9HFU4+E0t5btiU3NeyYXtqyBxvgapuXT8HNLD8YkkwyncWiopMJsBXE7c4B
	dnaQ==
X-Gm-Message-State: AKwxyteKfNi32y7cOIA3D2Hgbwc4B+ALf1JVZrUa8acSbFtmMEeDCALP
	Y2CXFuM+UwuO5tMyLjF5Rz9Yx7347cwlvQjeLtA=
X-Google-Smtp-Source: AH8x226V+jNS8aWJ2zPBYH9jv4DAyoiKsQUKAbCuuo1HjNZHosafSPprTsN7iNx7XLoZ6fqN8QaR+qCOeak6hctjDVg=
X-Received: by 10.99.137.195 with SMTP id v186mr9459729pgd.25.1516737059130;
	Tue, 23 Jan 2018 11:50:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Tue, 23 Jan 2018 11:50:28 -0800 (PST)
In-Reply-To: <HE1PR1001MB13391F01B9DB432BB3B9EF13FBE80@HE1PR1001MB1339.EURPRD10.PROD.OUTLOOK.COM>
References: <HE1PR1001MB13391F01B9DB432BB3B9EF13FBE80@HE1PR1001MB1339.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jan 2018 13:50:28 -0600
Message-ID: <CAMKF1sqyhn9=SN8JihJnqgyHE0C1Ec+RDqtMcfr+d8qtbrdL3g@mail.gmail.com>
To: =?UTF-8?Q?H=C3=A5kan_Eriksson?= <Hakan.Eriksson@verisure.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: devtool deploy-target fails with "no files to deploy"
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
X-List-Received-Date: Tue, 23 Jan 2018 19:50:58 -0000
Content-Type: multipart/alternative; boundary="94eb2c116500a0a578056376dd96"

--94eb2c116500a0a578056376dd96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2018 at 4:46 AM, H=C3=A5kan Eriksson <Hakan.Eriksson@verisu=
re.com
> wrote:

> Hi!
>
>
> This is my first post to this mailing list, so I want to start by
> apologizing if I go about it in the wrong way, but the impression I got o=
n
> http://lists.openembedded.org/mailman/listinfo/openembedded-core was that
> it's OK to simply email the list. I have searched for answers first, both
> in the list archives and the internet in general, but no luck. This makes
> me believe that it probably is something wrong in our
> configuration/implementation, but I have no clue of what.
>
>
> We are using Yocto to build Linux for an NXP imx7 device. Everything work=
s
> OK, so the setup we have (which I believe is based on the imx7dsabresd
> machine) at least does that right.
>
>
> At the moment I am trying to evaluate eSDK, so I have built it, installed
> it, and used it a little bit, but when I tried to deploy to target, devto=
ol
> failed to find any files to deploy. The files are there, though, but not =
in
> the place where devtool is searching; the built binaries all are under
> tmp/work/armv7at2hf-neon-fslc-linux-gnueabi, and devtool tries to find
> them under tmp/work/armv7ahf-neon-fslc-linux-gnueabi.
>
>
> So, something seems to be wrong in the setup of hardware target (armv7at2=
hf
> vs. armv7ahf)? I cannot figure out what, though, since bitbake uses the
> same config files to build our image as well as the eSDK.
>
>
>
=E2=80=8Bdoes this recipe have ARM_INSTRUCTION_SET =3D "arm" set explicitly=
 ?
it seems you have 'thumb' enabled as machine feature may be via
DEFAULT_TUNE=E2=80=8B



> By the way, using devtool the same way (deploy-target) on a recipe in our
> normal bitbake environment produces the same kind of error. So, come to
> think of it, it's probably not a problem with eSDK as such.
>
>
> Best regards,
>
> H=C3=A5kan Eriksson
>
>
> Openembedded-core Info Page
> <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> lists.openembedded.org
> To see the collection of prior postings to the list, visit the
> Openembedded-core Archives. Using Openembedded-core: To post a message to
> all the list ...
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--94eb2c116500a0a578056376dd96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace"><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On Thu, Jan 18, 2018 at 4:46 AM, H=C3=A5kan Eriksson <span dir=3D"ltr=
">&lt;<a href=3D"mailto:Hakan.Eriksson@verisure.com" target=3D"_blank">Haka=
n.Eriksson@verisure.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">




<div dir=3D"ltr">
<div id=3D"m_1028910490603768780divtagdefaultwrapper" style=3D"font-size:12=
pt;color:#000000;font-family:Consolas,Courier,monospace" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi!</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">This is my first post to this mai=
ling list, so=C2=A0I want to start by apologizing if I go about it in the w=
rong way, but the impression I got on=C2=A0<a href=3D"http://lists.openembe=
dded.org/mailman/listinfo/openembedded-core" class=3D"m_1028910490603768780=
OWAAutoLink" id=3D"m_1028910490603768780LPlnk945271" target=3D"_blank">http=
://lists.openembedded.<wbr>org/mailman/listinfo/<wbr>openembedded-core</a>=
=C2=A0was
 that it&#39;s OK to simply email the list. I have searched for answers fir=
st, both in the list archives and the internet in general, but no luck. Thi=
s makes me believe that it probably is something wrong in our configuration=
/implementation, but I have no clue
 of what.=C2=A0</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">We are using Yocto to build Linux=
 for an NXP=C2=A0imx7 device. Everything works OK, so the setup we have (wh=
ich I believe=C2=A0is based on the=C2=A0imx7dsabresd machine) at least does=
 that right.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">At the moment I am trying to eval=
uate eSDK, so I have built it, installed it, and used it a little bit, but =
when I tried to deploy to target, devtool failed to find any files to deplo=
y. The files are there, though, but
 not in the place where devtool is searching; the built binaries all are un=
der=C2=A0<span>tmp/work/armv7at2hf-<wbr>neon-fslc-linux-gnueabi, and devtoo=
l tries to find them under=C2=A0<span>tmp/work/armv7ahf-neon-<wbr>fslc-linu=
x-gnueabi.=C2=A0</span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span><br>
</span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span>So, something seems t=
o be wrong in the setup of hardware target (<span style=3D"font-family:Cons=
olas,Courier,monospace,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emo=
ji&quot;,EmojiSymbols;font-size:16px">armv7at2hf
 vs.=C2=A0<span style=3D"font-family:Consolas,Courier,monospace,EmojiFont,&=
quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quo=
t;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;font-size:16=
px">armv7ahf)? I cannot figure out what, though, since bitbake uses
 the same config files to build our image as well as the eSDK.=C2=A0</span>=
</span></span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span><br></span></span></p=
></div></div></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-family:monospace,monospace">=E2=80=8Bdoes this recipe have AR=
M_INSTRUCTION_SET =3D &quot;arm&quot; set explicitly ?</div><div class=3D"g=
mail_default" style=3D"font-family:monospace,monospace">it seems you have &=
#39;thumb&#39; enabled as machine feature may be via DEFAULT_TUNE=E2=80=8B<=
/div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr"><div id=3D"m_1028910490603768780divtagdefaultwrapper" style=3D"font-si=
ze:12pt;color:#000000;font-family:Consolas,Courier,monospace" dir=3D"ltr"><=
p style=3D"margin-top:0;margin-bottom:0"><span><span>
</span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span><span style=3D"font-f=
amily:Consolas,Courier,monospace,EmojiFont,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;A=
ndroid Emoji&quot;,EmojiSymbols;font-size:16px"><span style=3D"font-family:=
Consolas,Courier,monospace,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Se=
goe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android=
 Emoji&quot;,EmojiSymbols;font-size:16px"></span></span>By
 the way, using devtool the same way (deploy-target) on a recipe in our nor=
mal bitbake environment produces the same kind of error. So, come to think =
of it, it&#39;s probably not a problem with eSDK as such.=C2=A0</span></spa=
n></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span><br>
</span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span>Best regards,=C2=A0</=
span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span>H=C3=A5kan Eriksson</=
span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span>=C2=A0</span></span><=
/p>
<div id=3D"m_1028910490603768780LPBorder_GT_15162705160320.8546527615897628=
" style=3D"margin-bottom:20px;overflow:auto;width:100%;text-indent:0px">
<table id=3D"m_1028910490603768780LPContainer_15162705160270.27990635844492=
44" cellspacing=3D"0" style=3D"width:90%;background-color:rgb(255,255,255);=
overflow:auto;padding-top:20px;padding-bottom:20px;margin-top:20px;border-t=
op:1px dotted rgb(200,200,200);border-bottom:1px dotted rgb(200,200,200)">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td id=3D"m_1028910490603768780TextCell_15162705160280.983592839268109" col=
span=3D"2" style=3D"vertical-align:top;padding:0px;display:table-cell">
<div id=3D"m_1028910490603768780LPRemovePreviewContainer_15162705160280.832=
0406519321948"></div>
<div id=3D"m_1028910490603768780LPTitle_15162705160280.48758109487441303" s=
tyle=3D"color:rgb(160,163,166);font-weight:400;font-size:21px;font-family:w=
f_segoe-ui_light,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&quot;,&quo=
t;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;line-height:2=
1px">
<a id=3D"m_1028910490603768780LPUrlAnchor_15162705160300.663155671633956" h=
ref=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" st=
yle=3D"text-decoration:none" target=3D"_blank">Openembedded-core Info Page<=
/a></div>
<div id=3D"m_1028910490603768780LPMetadata_15162705160300.9494617975043163"=
 style=3D"margin:10px 0px 16px;color:rgb(102,102,102);font-weight:400;font-=
family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,=
Arial,sans-serif;font-size:14px;line-height:14px">
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a></div>
<div id=3D"m_1028910490603768780LPDescription_15162705160310.80822760289312=
32" style=3D"display:block;color:rgb(102,102,102);font-weight:400;font-fami=
ly:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Aria=
l,sans-serif;font-size:14px;line-height:20px;max-height:100px;overflow:hidd=
en">
To see the collection of prior postings to the list, visit the Openembedded=
-core Archives. Using Openembedded-core: To post a message to all the list =
...</div>
</td>
</tr>
</tbody>
</table>
</div>
<br>
</div>
</div>

<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div>

--94eb2c116500a0a578056376dd96--
