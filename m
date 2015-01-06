Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 96CC465C75
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 12:51:50 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id l89so16911629qgf.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 04:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BsSVdGED0MWqZs4uybfVe4mf6Z4CDu8HDM8XmIKTA9g=;
	b=mooptFqjqkZ9sMERnC/Oqeai+Iy2ts0I5txB02bWDUPpTgc1kcr11dc6FHDkz+kk6c
	K2hTgM7GBHKc850vZFcj1Qv2v44CSTrPjctWAplj+pL9k4qrdYsORovsWZ3o3/qth9f2
	oyNpEEHM7Rb61MSrCGMLP+G7XwL8M0YpDs/dj6i8SLOBpnp8ltfhcP881PkjYL3MRcHo
	NVSOZGxVcFXRhaiAsyl1aSqeCYDavBTxix1V99OCRuixYWDfSMlY+dVLuwKjhOjmbuuk
	VDHAHqC/liU+/6htUuApKW0UAFqZukiAce6Ch+wGel5XDr4as/YPBmx7EPwUseZ79qun
	gy9g==
X-Received: by 10.229.24.6 with SMTP id t6mr75131985qcb.17.1420548711548; Tue,
	06 Jan 2015 04:51:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.165 with HTTP; Tue, 6 Jan 2015 04:51:31 -0800 (PST)
In-Reply-To: <CAJTo0LYHY_MtYU7WPgdoaZwaLOtcZ9uo-209aZwnd4Uv0kLjeg@mail.gmail.com>
References: <1420541668-16699-1-git-send-email-sujith.h@gmail.com>
	<CAJTo0LYHY_MtYU7WPgdoaZwaLOtcZ9uo-209aZwnd4Uv0kLjeg@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Tue, 6 Jan 2015 18:21:31 +0530
Message-ID: <CADyYWL=ao0mzuh9Q3s2wLRLtVhNpYGfpV9awmXmaD4gagM8wgQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 Jan 2015 12:51:55 -0000
Content-Type: multipart/alternative; boundary=001a1133b34e568e3d050bfb4526

--001a1133b34e568e3d050bfb4526
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2015 at 5:00 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 6 January 2015 at 10:54, Sujith H <sujith.h@gmail.com> wrote:
>
>> +        if
>> ${@bb.utils.contains('DISTRO_FEATURES','x11','true','false',d)}; then
>>
>
> Why would a X11-specific recipe need an X11 feature check?
>
Correct, I will remove the x11 feature check from the patch.

>
>
>> +                cat >> ${D}/${sysconfdir}/X11/xorg.conf << EOF
>> +Section "Module"
>> +    Load           "glx"
>> +EndSection
>>
>
> But GLX is automatically loaded by the xserver,  My test machine doesn't
> have a xorg.conf and GLX loads on startup.  Does your machine configurati=
on
> ship a xorg.conf?
>
No, we get the xorg.conf from this same recipe. And while I was testing
some opengl related examples from Qt5, I was getting error
saying: "could not initialize glx" . Hence I made a change in the recipe
and added IMAGE_INSTALL_append =3D " xserver-xorg-extension-glx" and it
worked fine. Hence I thought of adding this change. Let me know if there is
any issues/concern.

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

--001a1133b34e568e3d050bfb4526
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jan 6, 2015 at 5:00 PM, Burton, Ross <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
"><span class=3D"">On 6 January 2015 at 10:54, Sujith H <span dir=3D"ltr">&=
lt;<a href=3D"mailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;,&#39;x11&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br></div=
></blockquote><div><br></div></span><div>Why would a X11-specific recipe ne=
ed an X11 feature check?</div></div></div></div></blockquote><div>Correct, =
I will remove the x11 feature check from the patch. <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><span class=3D""><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt;&gt; ${D}/=
${sysconfdir}/X11/xorg.conf &lt;&lt; EOF<br>
+Section &quot;Module&quot;<br>
+=C2=A0 =C2=A0 Load=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;glx&quot;=
<br>
+EndSection</div></blockquote><div><br></div></span><div>But GLX is automat=
ically loaded by the xserver, =C2=A0My test machine doesn&#39;t have a xorg=
.conf and GLX loads on startup.=C2=A0 Does your machine configuration ship =
a xorg.conf?</div></div></div></div></blockquote><div>No, we get the xorg.c=
onf from this same recipe. And while I was testing some opengl related exam=
ples from Qt5, I was getting error<br></div><div>saying: &quot;could not in=
itialize glx&quot; . Hence I made a change in the recipe and added IMAGE_IN=
STALL_append =3D &quot; xserver-xorg-extension-glx&quot; and it worked fine=
. Hence I thought of adding this change. Let me know if there is any issues=
/concern.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><span clas=
s=3D""><font color=3D"#888888"><div><br></div><div>Ross</div></font></span>=
</div></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature">=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=
=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<b=
r>&lt;Project&gt;Contributor to KDE project<br><a href=3D"http://fci.wikia.=
com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Ant=
i-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh.info" target=
=3D"_blank">http://sujithh.info</a><br></div>
</div></div>

--001a1133b34e568e3d050bfb4526--
