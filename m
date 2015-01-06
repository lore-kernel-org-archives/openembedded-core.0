Return-Path: <sujith.h@gmail.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 88C5F72825
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 14:15:14 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id dc16so16142992qab.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 06:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PL5J45o03+qLQ4XcJI6z4X5+vcgfKk1M05aQTSrG/+c=;
	b=cn4FZj9fVB9VhZDmrh+0kD1/J9CDI8cmIqpP6bXI+/h1Mj95oZaVSQgEv7QbyWbElU
	iP1o0MkeD5r4j6r6cewjpwpfLQdoLenGho9OTpHz9b6uuWrI7cGkVrQ3Xo/pCgwj3J8q
	mPpwNpiGzU6RYyAHJcB9rll0/EhNzJIeIxDLfgFzfrO4pgLpZwdCbBqGheH5Oe3z9o07
	m/ymYl1voc5R2V6Irsr/rzOZ/OrNeD1PqI0rSmfAsDJgYcbqHI4kFeXy19moR7ghwwOj
	HNp0JbFxaK11vLuyAIrKVmM3873dgRVMtQbipYnSEm3952KPcjn9xYusfxekd55AmVsV
	DHig==
X-Received: by 10.229.140.72 with SMTP id h8mr153437908qcu.25.1420553715180;
	Tue, 06 Jan 2015 06:15:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.165 with HTTP; Tue, 6 Jan 2015 06:14:55 -0800 (PST)
In-Reply-To: <CADyYWL=_NfQqCCBZM5c-Xe5MNVGwyNatONdxQo6DfnFPat3FJA@mail.gmail.com>
References: <1420541668-16699-1-git-send-email-sujith.h@gmail.com>
	<CAJTo0LYHY_MtYU7WPgdoaZwaLOtcZ9uo-209aZwnd4Uv0kLjeg@mail.gmail.com>
	<CADyYWL=ao0mzuh9Q3s2wLRLtVhNpYGfpV9awmXmaD4gagM8wgQ@mail.gmail.com>
	<CAJTo0LYpN0M2XVaiiY1R5DrNDw2gtPZrsrdH7PoZdT-FN20NNQ@mail.gmail.com>
	<CADyYWL=_NfQqCCBZM5c-Xe5MNVGwyNatONdxQo6DfnFPat3FJA@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Tue, 6 Jan 2015 19:44:55 +0530
Message-ID: <CADyYWLksfZxrio7+nyfM=OZdAXk0zWxT3aFTvAz4Pf4ejCAqiw@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 Jan 2015 14:15:20 -0000
Content-Type: multipart/alternative; boundary=001a1132ee4093ea7e050bfc6f18

--001a1132ee4093ea7e050bfc6f18
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2015 at 6:41 PM, sujith h <sujith.h@gmail.com> wrote:

>
>
> On Tue, Jan 6, 2015 at 6:38 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>>
>> On 6 January 2015 at 12:51, sujith h <sujith.h@gmail.com> wrote:
>>
>>> saying: "could not initialize glx" . Hence I made a change in the recip=
e
>>> and added IMAGE_INSTALL_append =3D " xserver-xorg-extension-glx" and it
>>> worked fine. Hence I thought of adding this change. Let me know if ther=
e is
>>> any issues/concern.
>>>
>>>>
>> Actually installing the GLX module in the image is a prerequisite to
>> loading the module...  you don't need to modify the xorg.conf - as I sai=
d
>> the GLX module (along with several other modules) are loaded automatical=
ly
>> *if present*.
>>
>
> Thanks for the clarification. I will check once again by adding glx modul=
e
> to the image and remove the patch and see the result. I will update here.
>

Just now I had verified and thanks for the clarification again. It worked
by removing the patch I had created and adding  xserver-xorg-extension-glx
to the image. Good learning for me :)


>> Ross
>>
>
>
>
> --
> =E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
> Bangalore
> <Project>Contributor to KDE project
> http://fci.wikia.com/wiki/Anti-DRM-Campaign
> <Blog> http://sujithh.info
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a1132ee4093ea7e050bfc6f18
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jan 6, 2015 at 6:41 PM, sujith h <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><di=
v><div class=3D"h5">On Tue, Jan 6, 2015 at 6:38 PM, Burton, Ross <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span><br><d=
iv class=3D"gmail_quote">On 6 January 2015 at 12:51, sujith h <span dir=3D"=
ltr">&lt;<a href=3D"mailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div>saying: &quot;could not initialize glx&quot; . Hence I made=
 a change in the recipe and added IMAGE_INSTALL_append =3D &quot; xserver-x=
org-extension-glx&quot; and it worked fine. Hence I thought of adding this =
change. Let me know if there is any issues/concern.<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_ex=
tra"><div class=3D"gmail_quote"><span><font color=3D"#888888"><div></div></=
font></span></div></div></div></blockquote></blockquote></div><br></span>Ac=
tually installing the GLX module in the image is a prerequisite to loading =
the module... =C2=A0you don&#39;t need to modify the xorg.conf - as I said =
the GLX module (along with several other modules) are loaded automatically =
*if present*.</div></div></blockquote><div><br></div></div></div><div>Thank=
s for the clarification. I will check once again by adding glx module to th=
e image and remove the patch and see the result. I will update here.=C2=A0 =
<br></div></div></div></div></blockquote><div><br></div><div>Just now I had=
 verified and thanks for the clarification again. It worked by removing the=
 patch I had created and adding=C2=A0 <span>xserver-xorg-extension-glx to t=
he image. Good learning for me :)<br><br></span></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><d=
iv class=3D"gmail_quote"><div></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><span><font color=3D"#888888"><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></font></span></di=
v>
</blockquote></div><span class=3D""><br><br clear=3D"all"><br>-- <br><div>=
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;=
Project&gt;Contributor to KDE project<br><a href=3D"http://fci.wikia.com/wi=
ki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-=
Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_bla=
nk">http://sujithh.info</a><br></div>
</span></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature">=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=
=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<b=
r>&lt;Project&gt;Contributor to KDE project<br><a href=3D"http://fci.wikia.=
com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Ant=
i-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh.info" target=
=3D"_blank">http://sujithh.info</a><br></div>
</div></div>

--001a1132ee4093ea7e050bfc6f18--
