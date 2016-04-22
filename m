Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id DE19465CB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 13:31:33 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id q76so26132369qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=okujcr8JeQ+tX0E7zZZT8dF7DXGtAWn+pS8Uj7Yk7C0=;
	b=BNPL3PJFHtWxldGT8JHOc1yJkrkZpKg3Yl1yfMeJC3WVT2Rgu6SsZiYOc9yJSLYuis
	1IkVb9xojkDE/FdGSsSkAt8WwRcypvpP0dJCGoKBTdStnjv6Ll2j+7/SrtZaVgkRC81H
	Al8vYi/xbaFqS8rN2nPuYDVMNLutbln5CuDxt3dvGHZZfh5iJNLAZgsDFMDoB9mjC2X0
	oHYydA6udt7QzlZCp6hpLkO1e6l//QFptoZ62pPixF+PrqbRFQDXdaH2KuZWXw3bnWEi
	sJfOsTgknYEoD4YCsKNpJRy/rX8rOHjbWYX+GGqdWgoq25cqTZaUj9YzWfZPXWu0YPIc
	GYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=okujcr8JeQ+tX0E7zZZT8dF7DXGtAWn+pS8Uj7Yk7C0=;
	b=jWE3Gvd2Bs4RVO8TS3mLgFXA+ncDH18/hASt4bFgul0bmzikV2nqWZ0L4dDDMeyEUe
	EdzQ8ZC0DVQEi788JAIM4FtivMKbku+nJ9lo8Lvcfst6sdakFXIkdf4HJNOpw+KeUeyj
	0c7JMWVT8BIGBfY1wJta0BN97cRYYw26W6Q7z+CCs0QvKJ/HiyPlg7OvlpxMksoBIdnW
	bUhR3vGBVWf9nFsHivNwjxEQiJpTkYozaIV41v+IJlxq5sH4kZ+GNb9rlYi1JEZnRpg4
	GUz+36bkvzaiDSVdnPQi4bETxEiMebN7tsxdq2tnfJqykdLwRvZOXgjipqccJk4GsPhM
	IThg==
X-Gm-Message-State: AOPr4FWVEbkDn2HV7lmNHWd3EvLCKY/3Mtqtua4ooEuS2BGYuw+JkXc4xplX4ysWVgz6byHBZ5erEGPB45dR3Q==
X-Received: by 10.55.20.97 with SMTP id e94mr4593259qkh.199.1461331894082;
	Fri, 22 Apr 2016 06:31:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.89.178 with HTTP; Fri, 22 Apr 2016 06:31:14 -0700 (PDT)
In-Reply-To: <CAJTo0LaA_rkiUrAvGxiadD3OuKzozCyjEJpMSXD6qcG_3R6vPA@mail.gmail.com>
References: <1461328888-5911-1-git-send-email-Sujith_Haridasan@mentor.com>
	<CAJTo0LaA_rkiUrAvGxiadD3OuKzozCyjEJpMSXD6qcG_3R6vPA@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Fri, 22 Apr 2016 19:01:14 +0530
Message-ID: <CADyYWLktf5mHsaiBBAVwhQMJrRJE7WLgGeS1t2cNQq3zzKBLxw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: package debug files properly and move -g removal to staging
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
X-List-Received-Date: Fri, 22 Apr 2016 13:31:34 -0000
Content-Type: multipart/alternative; boundary=001a1144d2087225a1053112d8e3

--001a1144d2087225a1053112d8e3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2016 at 6:28 PM, Burton, Ross <ross.burton@intel.com> wrote=
:

>
> On 22 April 2016 at 13:41, Sujith Haridasan <sujith.h@gmail.com> wrote:
>
>> +FILES_${PN}-dbg +=3D "${libdir}/webkit2gtk-4.0/injected-bundle/.debug \
>> +                    ${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
>>
>
> Debug packages are collected automatically, no need for FILES_PN-dbg
> anymore unless you want to package something that isn't .debug/.
>
> Please verify patches against master when submitting!
>

Apologies for the inconvenience caused. This patch shouldn't have been sent
for review.

>
> Ross
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--001a1144d2087225a1053112d8e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 22, 2016 at 6:28 PM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote"=
>On 22 April 2016 at 13:41, Sujith Haridasan <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div>+FILES_${PN}-dbg +=3D &quot;${libdi=
r}/webkit2gtk-4.0/injected-bundle/.debug \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/webkitgtk/webkit2gtk-4.0/.debug/*&quot;<br></div></blockquote></div><=
br></span>Debug packages are collected automatically, no need for FILES_PN-=
dbg anymore unless you want to package something that isn&#39;t .debug/.<br=
></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Plea=
se verify patches against master when submitting!</div></div></blockquote><=
div><br></div><div>Apologies for the inconvenience caused. This patch shoul=
dn&#39;t have been sent for review. <br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr"><span class=3D"HOEnZb"><font color=3D"#888888"><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font></s=
pan></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=
=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=
=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributo=
r to KDE project<br></div><div>&lt;Project&gt;Contributor to Yocto project<=
br></div><div><a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" targe=
t=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt=
; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujithh.info</a>=
<br></div><div>C-x C-c<br></div></div></div></div></div>
</div></div>

--001a1144d2087225a1053112d8e3--
