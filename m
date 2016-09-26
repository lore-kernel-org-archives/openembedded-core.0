Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id A12E5605C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 09:31:26 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id n185so157773957qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4d8JBFd7KNu3OibfmOqgohrts0LSYnvOysSQgEC+bSE=;
	b=Do1a16qGYnnOqZqCFA1W6c67JCWKxSH7tqkZJbfTwJx+GRdg69gf7H7DmkRZflzKpF
	XyhUjQKm85wYTyJRX8QhfJ7NZmt+J3xaIXv1jmzrXFt26jcvpovCkEm6CDmx2ljXpTM1
	KpGTQaxYPYwiWstRNFZ021sZjlRepaOP9fBe3IdXkpEsiYRBJ3kKaTaA9N4VNnWxQkb0
	hKuBGSUYGKWN9T79VK2w3MEe4YTUyiUZvtIuhPDXz4DLYex++GTJoVoz5L1AkBVuN9yq
	VRDcl9ShwdmXdu9fXoIa5LMVb6Ip7OCx8kYpcsFg7xKnfvAiFBCJy+ssLyZ8PhHQaid0
	CPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4d8JBFd7KNu3OibfmOqgohrts0LSYnvOysSQgEC+bSE=;
	b=hY64z0Ac7tekHHmPE/5dOoGi/aghS7idzybrg+ruDquUvOOysF7ahNcCwPDnBzrStG
	3fsYsdBes4TUJVX/y6wknH2lGuxblTk+VOwDFT1c6/z/nAt9GSWB3iEa2rwkHV5kmRrI
	Curm+cdDlVep6hQct2YVPU1ggd7kNhOOAoDVe/WcKnrHd5OrDdjFZDAhWjWPz5iVVp3P
	RpJ/TTws8wZL8/owA9UdHgNtyrXRseuEs6UNvms6Hxx3DjyiS1V0P2smBFEJrAUYtv4D
	9oB01SGn2yhA6T4nMIu/+MwPj0LnR10PXFb0WKThg9ZHfcX8Cz0Uj6DRQrq64dcyLJ4V
	21Tw==
X-Gm-Message-State: AA6/9RnKLWXDHwz6jO9lcx38IkTieD85VYBH5Hwg1gmvgYZwpkodkv7wGZDQQ111Dc8V9kFLpNp9z1xSPZfx4g==
X-Received: by 10.55.108.6 with SMTP id h6mr19449641qkc.289.1474882287512;
	Mon, 26 Sep 2016 02:31:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Mon, 26 Sep 2016 02:31:07 -0700 (PDT)
In-Reply-To: <CADyYWLn9zWELS7Ly_J8cZkW3K4WgOKDhFSrHVPaAF7V=Ety=EQ@mail.gmail.com>
References: <1474450963-4114-1-git-send-email-sujith.h@gmail.com>
	<CADyYWLn9zWELS7Ly_J8cZkW3K4WgOKDhFSrHVPaAF7V=Ety=EQ@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 26 Sep 2016 15:01:07 +0530
Message-ID: <CADyYWLnh7EbREpXPCvg8YiWkjcm8VADxv52a7cgZ7HraD3CZhQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>
Subject: Re: [PATCH] x264: add textrel to INSANE_SKIP
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
X-List-Received-Date: Mon, 26 Sep 2016 09:31:26 -0000
Content-Type: multipart/alternative; boundary=001a114feed2d5314f053d65ca3a

--001a114feed2d5314f053d65ca3a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2016 at 11:39 AM, sujith h <sujith.h@gmail.com> wrote:

> Hi,
>
> Let me know if this patch is ok. Else I can help make this patch better.
>

oops, sorry for my earlier mail. This patch is merged :
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Daa7f7b63485b8c4=
d33491b9cd467fc4487a281c7

>
> Thanks,
> Sujith H
>
> On Wed, Sep 21, 2016 at 3:12 PM, Sujith H <sujith.h@gmail.com> wrote:
>
>> From: Fahad Usman <fahad_usman@mentor.com>
>>
>> Tried by adding CFLAGS_append =3D " -fpic " to
>> the recipe. But that couldn't help resolve the
>> warning message:
>>
>> x264/r2491+gitAUTOINC+c8a773ebfc-r0/packages-split/x264/usr/lib/libx264.=
so.144'
>> has relocations in .text [textrel]
>>
>> It was found that this warning is emitted because of the
>> assembly files in the source code. And it is not easy to
>> get rid of TEXTREL's which are coming from the assembly
>> source files.
>>
>> Adding textrel to INSANE_SKIP resolves this issue.
>> This issue was observed in cyclone5 and imx6qsabresd BSP's.
>> So generalizing the patch.
>>
>> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
>> Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
>> ---
>>  meta/recipes-multimedia/x264/x264_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/x264/x264_git.bb
>> b/meta/recipes-multimedia/x264/x264_git.bb
>> index fa44f9c..393310f 100644
>> --- a/meta/recipes-multimedia/x264/x264_git.bb
>> +++ b/meta/recipes-multimedia/x264/x264_git.bb
>> @@ -48,6 +48,6 @@ do_install() {
>>      oe_runmake install DESTDIR=3D${D}
>>  }
>>
>> -# PIC can't be enabled for 32-bit x86
>> -INSANE_SKIP_${PN}_append_x86 =3D " textrel"
>> +# PIC can't be enabled for few BSP's
>> +INSANE_SKIP_${PN}_append =3D " textrel"
>>
>> --
>> 1.9.1
>>
>>
>
>
> --
> =E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
> Bangalore
> <Project>Contributor to KDE project
> <Project>Contributor to Yocto project
> http://fci.wikia.com/wiki/Anti-DRM-Campaign
> <Blog> http://sujithh.info
> C-x C-c
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

--001a114feed2d5314f053d65ca3a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Sep 26, 2016 at 11:39 AM, sujith h <span dir=3D"ltr">&lt;<a tar=
get=3D"_blank" href=3D"mailto:sujith.h@gmail.com">sujith.h@gmail.com</a>&gt=
;</span> wrote:<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><div d=
ir=3D"ltr"><div><div><div>Hi,<br><br></div>Let me know if this patch is ok.=
 Else I can help make this patch better.<br></div></div></div></blockquote>=
<div><br></div><div>oops, sorry for my earlier mail. This patch is merged :=
 <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Daa7=
f7b63485b8c4d33491b9cd467fc4487a281c7">http://git.yoctoproject.org/cgit/cgi=
t.cgi/poky/commit/?id=3Daa7f7b63485b8c4d33491b9cd467fc4487a281c7</a> <br></=
div><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb=
(204,204,204);padding-left:1ex" class=3D"gmail_quote"><div dir=3D"ltr"><div=
><div><br></div>Thanks,<br></div>Sujith H<br><div><div><div><div><div><div>=
<div class=3D"gmail_extra"><div><div class=3D"gmail-h5"><br><div class=3D"g=
mail_quote">On Wed, Sep 21, 2016 at 3:12 PM, Sujith H <span dir=3D"ltr">&lt=
;<a target=3D"_blank" href=3D"mailto:sujith.h@gmail.com">sujith.h@gmail.com=
</a>&gt;</span> wrote:<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"=
>From: Fahad Usman &lt;<a target=3D"_blank" href=3D"mailto:fahad_usman@ment=
or.com">fahad_usman@mentor.com</a>&gt;<br>
<br>
Tried by adding CFLAGS_append =3D &quot; -fpic &quot; to<br>
the recipe. But that couldn&#39;t help resolve the<br>
warning message:<br>
<br>
x264/r2491+gitAUTOINC+c8a773eb<wbr>fc-r0/packages-split/x264/usr/<wbr>lib/l=
ibx264.so.144&#39; has relocations in .text [textrel]<br>
<br>
It was found that this warning is emitted because of the<br>
assembly files in the source code. And it is not easy to<br>
get rid of TEXTREL&#39;s which are coming from the assembly<br>
source files.<br>
<br>
Adding textrel to INSANE_SKIP resolves this issue.<br>
This issue was observed in cyclone5 and imx6qsabresd BSP&#39;s.<br>
So generalizing the patch.<br>
<br>
Signed-off-by: Fahad Usman &lt;<a target=3D"_blank" href=3D"mailto:fahad_us=
man@mentor.com">fahad_usman@mentor.com</a>&gt;<br>
Signed-off-by: Sujith Haridasan &lt;<a target=3D"_blank" href=3D"mailto:Suj=
ith_Haridasan@mentor.com">Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/x264/<a target=3D"_blank" rel=3D"noreferrer" =
href=3D"http://x264_git.bb"><wbr>x264_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/x264<wbr>/<a target=3D"_blank" rel=3D"=
noreferrer" href=3D"http://x264_git.bb">x264_git.bb</a> b/meta/recipes-mult=
imedia/x264<wbr>/<a target=3D"_blank" rel=3D"noreferrer" href=3D"http://x26=
4_git.bb">x264_git.bb</a><br>
index fa44f9c..393310f 100644<br>
--- a/meta/recipes-multimedia/x264<wbr>/<a target=3D"_blank" rel=3D"norefer=
rer" href=3D"http://x264_git.bb">x264_git.bb</a><br>
+++ b/meta/recipes-multimedia/x264<wbr>/<a target=3D"_blank" rel=3D"norefer=
rer" href=3D"http://x264_git.bb">x264_git.bb</a><br>
@@ -48,6 +48,6 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake install DESTDIR=3D${D}<br>
=C2=A0}<br>
<br>
-# PIC can&#39;t be enabled for 32-bit x86<br>
-INSANE_SKIP_${PN}_append_x86 =3D &quot; textrel&quot;<br>
+# PIC can&#39;t be enabled for few BSP&#39;s<br>
+INSANE_SKIP_${PN}_append =3D &quot; textrel&quot;<br>
<span><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br></div></div><spa=
n class=3D"gmail-HOEnZb"><font color=3D"#888888">-- <br><div><div dir=3D"lt=
r"><div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=
=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=
=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE project<br></di=
v><div>&lt;Project&gt;Contributor to Yocto project<br></div><div><a target=
=3D"_blank" href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign">http://fci=
.wikia.com/wiki/<wbr>Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a target=3D"_bl=
ank" href=3D"http://sujithh.info">http://sujithh.info</a><br></div><div>C-x=
 C-c<br></div></div></div></div></div>
</font></span></div></div></div></div></div></div></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=
=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=
=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributo=
r to KDE project<br></div><div>&lt;Project&gt;Contributor to Yocto project<=
br></div><div><a target=3D"_blank" href=3D"http://fci.wikia.com/wiki/Anti-D=
RM-Campaign">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt=
; <a target=3D"_blank" href=3D"http://sujithh.info">http://sujithh.info</a>=
<br></div><div>C-x C-c<br></div></div></div></div></div>
</div></div>

--001a114feed2d5314f053d65ca3a--
