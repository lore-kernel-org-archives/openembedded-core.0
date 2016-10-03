Return-Path: <skrishnakar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C7149605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 09:48:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f193so9192797wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 02:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/sn1x0WzdFxMH+IuyhMDgVEV5rz14pEzpYQpEcHOMYE=;
	b=ohq8gPivRceDfimQVapQBkgRG68Umw6hd1FX2QNWKKo9JwLIusdNbhHpyj4QRdKhn+
	385lUioJAz1ASSSCuBVwIHjQQqw7tYlS4mbrkR24/FKX4KLMgd+9lkIbOAzK6QuLYVOL
	54pLoI/iJhE5c7iTQJiTTGzQIg/87ia5ruugQKExzA1cHLRIcwQUMe/6Qq/vdmasOuJU
	oVHMLtyLJy578txEWIFO/eCNOY5/Ypsc+9RMe4l7jgpkhUPe5GvOBOuuXbeBX75lW1VY
	A92XuyF/dkKsapoFewIHgEKNdhwrcbhFj2QjJuPK7t2LRKelHP7OaAv0GotZfNM1pUqi
	DAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/sn1x0WzdFxMH+IuyhMDgVEV5rz14pEzpYQpEcHOMYE=;
	b=fjygnbNOWTaDBY+oYXqRBfR7mQ+Mn9eqCI4ZG95KedWWXrPgD/L6f/W/HzvxqaQ+E2
	tvnwIeSSIUROErXWvKc1UuFJtC4s3y6aLqApl5ErhhilYVBmytiDcAI7hrZAOeTaK3c1
	ZfP87uuAFnDgD2+kfO9ekDoVhmOjaIRM4Zf/3I4FB+Pp26Ywq+WpFYNVP+EpBke1+4Db
	hgqZIIkRtOvnftYR4rlo5lH9fWPeym1A8R0wceQ9DmiYybJUuSE5DmbiKRu4tvuHqGeF
	8Cft05QM9vcesUYGiB971ImRTVsuLfqtCa0N1hSLYpGwOpu857QzOCfJGjg3LuA+N/8u
	S8UA==
X-Gm-Message-State: AA6/9RnSPxmG8L+8BkDq+mkfMngKDGhdwPiE0zPhszWs5lSpy4xKzAkIVj7eGfNAPuqgIxVI9f1GGp3DWBp7WQ==
X-Received: by 10.28.193.72 with SMTP id r69mr3050646wmf.110.1475488099462;
	Mon, 03 Oct 2016 02:48:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.64.87 with HTTP; Mon, 3 Oct 2016 02:47:39 -0700 (PDT)
In-Reply-To: <7D3A9BAC-9942-4D89-9B78-D3183E139F9D@gmail.com>
References: <CALDxG5jveoshv5wXMZFFJOgprMOAOwARG4xXwQ+gNO8kFmvzuA@mail.gmail.com>
	<7D3A9BAC-9942-4D89-9B78-D3183E139F9D@gmail.com>
From: srikanth krishnakar <skrishnakar@gmail.com>
Date: Mon, 3 Oct 2016 15:17:39 +0530
Message-ID: <CALDxG5hFH3h0aS0QBr82Ogp7aiggBbLFpTMvScAHNkN8OfnsQQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Psplash on Systemd with progress bar
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
X-List-Received-Date: Mon, 03 Oct 2016 09:48:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c13145409f24e053df2d86e

--94eb2c13145409f24e053df2d86e
Content-Type: text/plain; charset=UTF-8

Hello Khem,

Thanks for your response. You are right about the splash support in
splash.. but at least I wanted to eliminate the progress bar that is anyway
non-functional. I masked the psplash_draw_progress and its associated
psplash_fb_draw_image functions but the progress bar border still shows up
leading to a less preferred splash image.

Thanks!

On Mon, Oct 3, 2016 at 5:07 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Sep 28, 2016, at 10:38 PM, srikanth krishnakar <skrishnakar@gmail.com>
> wrote:
>
> Hi All,
>
> Yocto version: yocto-2.1
> Target: ARM imx6
> Graphics: X11 (core-image-sato)
>
> I am trying to use psplash with systemd and have come across the service
> files prepared by Eric:
>
> http://lists.busybox.net/pipermail/buildroot/2014-May/097233.html
>
> Although the splash comes up for a split second and vanishes on my imx6
> target it never stays till desktop appears nor it displays any progress
> bar. I read Eric mention about patch to systemd (src/core/manager.c) to
> write progress data to psplash socket but I couldn't find the patch. Can
> anyone point me to the patch for systemd that writes progress data to
> psplash socket so that I can see progress bar and while keeping splash
> alive till desktop shows up ?
>
>
> systemd is not integrated with psplash as systemV is. system has other
> graphic systems e.g. dietsplash which work better.
>
>
> Thanks in Advance!!
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

--94eb2c13145409f24e053df2d86e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font face=3D"monospace,monospace">Hello Khem,</font>=
</div><div><font face=3D"Courier New"><br></font></div><div><font face=3D"C=
ourier New">Thanks for your response. You are right about the splash suppor=
t in splash.. but at least I wanted to eliminate the progress bar that is a=
nyway non-functional. I masked the psplash_draw_progress and its associated=
 psplash_fb_draw_image functions but the=C2=A0progress bar border still sho=
ws up leading to a less preferred splash image. </font></div><div><br></div=
><div><font face=3D"Courier New">Thanks!</font>=C2=A0</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Oct 3, 2016 at 5:07=
 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div style=3D"word-wrap:break-word"><br><div><span><blockq=
uote type=3D"cite"><div>On Sep 28, 2016, at 10:38 PM, srikanth krishnakar &=
lt;<a href=3D"mailto:skrishnakar@gmail.com" target=3D"_blank">skrishnakar@g=
mail.com</a>&gt; wrote:</div><br class=3D"m_583430688787036017Apple-interch=
ange-newline"><div><div dir=3D"ltr">Hi All,<div><br></div><div>Yocto versio=
n: yocto-2.1</div><div>Target: ARM imx6</div><div>Graphics: X11 (core-image=
-sato)</div><div><br></div><div>I am trying to use psplash with systemd and=
 have come across the service files prepared by Eric:</div><div><br></div><=
div><a href=3D"http://lists.busybox.net/pipermail/buildroot/2014-May/097233=
.html" target=3D"_blank">http://lists.busybox.net/<wbr>pipermail/buildroot/=
2014-May/<wbr>097233.html</a><br></div><div><br></div><div>Although the spl=
ash comes up for a split second and vanishes on my imx6 target it never sta=
ys till desktop appears nor it displays any progress bar. I read Eric menti=
on about patch to systemd (src/core/manager.c) to write progress data to ps=
plash socket but I couldn&#39;t find the patch. Can anyone point me to the =
patch for systemd that writes progress data to psplash socket so that I can=
 see progress bar and while keeping splash alive till desktop shows up ?</d=
iv></div></div></blockquote><div><br></div></span><div>systemd is not integ=
rated with psplash as systemV is. system has other graphic systems e.g. die=
tsplash which work better.</div><br><blockquote type=3D"cite"><div><div dir=
=3D"ltr"><div><br></div><div>Thanks in Advance!!</div></div><span class=3D"=
HOEnZb"><font color=3D"#888888">
-- <br>______________________________<wbr>_________________<br>Openembedded=
-core mailing list<br><a href=3D"mailto:Openembedded-core@lists.openembedde=
d.org" target=3D"_blank">Openembedded-core@lists.<wbr>openembedded.org</a><=
br><a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-c=
ore" target=3D"_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/=
openembedded-<wbr>core</a><br></font></span></div></blockquote></div><br></=
div></blockquote></div><br></div>

--94eb2c13145409f24e053df2d86e--
