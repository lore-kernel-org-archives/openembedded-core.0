Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 576B6727B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 13:11:58 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id z60so16907712qgd.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 05:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+xUR7A2Tg+diHHhOJ4bhs6Xhmr3RbEDe56XFeHQVIQ4=;
	b=OF6Bv7w1d3CzpghJ9/uwASqC0cxWak1OD2jUplx19HYFB+fUj2Uq51zPVvNdOptw1V
	N+zyPEtiwtMCUJKJjUaeLYz+fM90MnJjufFgJxAAKYRluT+nyKqZVQmZJYjBfhRze74Y
	t8hMOL+eOUAv3+f79T7JqMNvSWoN9voiQMQzbPz1H4948VUquEoqEMVgrJh1+DIxcEbQ
	ftlGIWUAfUmkHAvJp9kox4eE+n2AV5qVxvVqsCFemCuvgc3Hc0nEPMaWSbcGhR6SGKp/
	qCGCZXW3P8TGQTXSabIEpQ5+NyPfYZ4woeOeJH2ikLCOIvsSKcZOPW3Lg1ed6TdAzoTp
	4WrA==
X-Received: by 10.224.99.3 with SMTP id s3mr152143336qan.79.1420549917858;
	Tue, 06 Jan 2015 05:11:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.165 with HTTP; Tue, 6 Jan 2015 05:11:37 -0800 (PST)
In-Reply-To: <CAJTo0LYpN0M2XVaiiY1R5DrNDw2gtPZrsrdH7PoZdT-FN20NNQ@mail.gmail.com>
References: <1420541668-16699-1-git-send-email-sujith.h@gmail.com>
	<CAJTo0LYHY_MtYU7WPgdoaZwaLOtcZ9uo-209aZwnd4Uv0kLjeg@mail.gmail.com>
	<CADyYWL=ao0mzuh9Q3s2wLRLtVhNpYGfpV9awmXmaD4gagM8wgQ@mail.gmail.com>
	<CAJTo0LYpN0M2XVaiiY1R5DrNDw2gtPZrsrdH7PoZdT-FN20NNQ@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Tue, 6 Jan 2015 18:41:37 +0530
Message-ID: <CADyYWL=_NfQqCCBZM5c-Xe5MNVGwyNatONdxQo6DfnFPat3FJA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xf86-config: Loading glx module
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
X-List-Received-Date: Tue, 06 Jan 2015 13:12:06 -0000
Content-Type: multipart/alternative; boundary=047d7b6773843d6315050bfb8dc9

--047d7b6773843d6315050bfb8dc9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2015 at 6:38 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 6 January 2015 at 12:51, sujith h <sujith.h@gmail.com> wrote:
>
>> saying: "could not initialize glx" . Hence I made a change in the recipe
>> and added IMAGE_INSTALL_append =3D " xserver-xorg-extension-glx" and it
>> worked fine. Hence I thought of adding this change. Let me know if there=
 is
>> any issues/concern.
>>
>>>
> Actually installing the GLX module in the image is a prerequisite to
> loading the module...  you don't need to modify the xorg.conf - as I said
> the GLX module (along with several other modules) are loaded automaticall=
y
> *if present*.
>

Thanks for the clarification. I will check once again by adding glx module
to the image and remove the patch and see the result. I will update here.

>
> Ross
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--047d7b6773843d6315050bfb8dc9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jan 6, 2015 at 6:38 PM, Burton, Ross <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">=
On 6 January 2015 at 12:51, sujith h <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div>saying: &quot;could not initia=
lize glx&quot; . Hence I made a change in the recipe and added IMAGE_INSTAL=
L_append =3D &quot; xserver-xorg-extension-glx&quot; and it worked fine. He=
nce I thought of adding this change. Let me know if there is any issues/con=
cern.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><span><font =
color=3D"#888888"><div></div></font></span></div></div></div></blockquote><=
/blockquote></div><br></span>Actually installing the GLX module in the imag=
e is a prerequisite to loading the module... =C2=A0you don&#39;t need to mo=
dify the xorg.conf - as I said the GLX module (along with several other mod=
ules) are loaded automatically *if present*.</div></div></blockquote><div><=
br></div><div>Thanks for the clarification. I will check once again by addi=
ng glx module to the image and remove the patch and see the result. I will =
update here.=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
"><span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature">=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=
=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<b=
r>&lt;Project&gt;Contributor to KDE project<br><a href=3D"http://fci.wikia.=
com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Ant=
i-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh.info" target=
=3D"_blank">http://sujithh.info</a><br></div>
</div></div>

--047d7b6773843d6315050bfb8dc9--
