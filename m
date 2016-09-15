Return-Path: <sujith.h@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE2873216
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 08:00:26 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id p47so1367704qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 01:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FmdyrLaIXabs2EottkrDgd48XprbWPWBU96+Fe4MqNI=;
	b=kxctTmf/0Gb0EP+TtlatIfztLqBUeYHxNjo478g5yiA7dQ2mm4MsE01yHWHj/cycIK
	MpnJ5BJC2oaQsQpeaDx1XJmaAo5c/OnGHxvMoAaeEMNw6WDPNeODoJEOqHnf1x8JzCsh
	uvMaaMatclKFPi4Pg4EV6IWgp25qubBb78t30sGvLaIyPpAdifEZ4qilFJdmxpdUGFEP
	dBTNEoVLOFtManErAWWSnS/AvEAQlA+g930/ufe//9iVlDYSUhdSAKjzVOxJQO5eW5Fy
	V8lxJTl3I6yRWigBx7pU4Q41nA303p7wT8lDbeW2DvT50epFYeJipyCcEUByO0qKX/o8
	5xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FmdyrLaIXabs2EottkrDgd48XprbWPWBU96+Fe4MqNI=;
	b=mIgtZoXHykC2qiCdHiyp8ZGHs2pkFuRM5LYA65qnpHigMVvxNcAFiRV9tLNdmEvIuK
	D/VWTdzziVtsZ6aiquIMCmvwf0ZMrBh7Aix7Mrb7iKghhEnD9OjCq+K2N0qEPpQ7QrCk
	aJpUPJgtcF2cQn8/jY+cTNjwZy1MOsUCrZhIMjDuOZuEP15+MNEfTzDskqlsrpdbsshX
	DlcGXIfzd/ccTgqwl75ITFLC3GVTbpXccrXMHvr1d2lLqz+Ls2CwVb0iMm7mRaQLhbyf
	Af1YjOUQRmqYJ4gmbQbOmtqqmpojHLAZ4YlaS4VkN7yx7YBuerDnFCYsXypkuCGCSeNW
	ezXA==
X-Gm-Message-State: AE9vXwNquQXpcs+wwD4XOL0qzhZiUSe/CO6irAVrazI/X5Fa5B6wbckClx4nkq25gekiUG2CFCap2EQ4ouE5/g==
X-Received: by 10.200.52.60 with SMTP id u57mr7962739qtb.87.1473926427264;
	Thu, 15 Sep 2016 01:00:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Thu, 15 Sep 2016 01:00:06 -0700 (PDT)
In-Reply-To: <CADyYWL=VezFuDFy=ZV8y4XDyzTP20ErxgpfXjLh5uCoCWDrdHQ@mail.gmail.com>
References: <1473660793-3296-1-git-send-email-sujith.h@gmail.com>
	<CAJTo0Lb-bsJNvxDyfkRraQ5-dQ+cJqigThm2CMBUSg5EJGOV7A@mail.gmail.com>
	<CADyYWL=_YCXJ1nD-VxFisu6J813MBEs2QCU2TjFGRGVFJJhDHg@mail.gmail.com>
	<CADyYWL=VezFuDFy=ZV8y4XDyzTP20ErxgpfXjLh5uCoCWDrdHQ@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Thu, 15 Sep 2016 13:30:06 +0530
Message-ID: <CADyYWLnjSuHC2JHfRcWX0XM5F3S8g3Km8SSxXXN_3=zfJ9E7zA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: add textrel to INSANE_SKIP for cyclone5 machine
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
X-List-Received-Date: Thu, 15 Sep 2016 08:00:27 -0000
Content-Type: multipart/alternative; boundary=001a113f40d61f4d7b053c873d83

--001a113f40d61f4d7b053c873d83
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 12:15 PM, sujith h <sujith.h@gmail.com> wrote:

>
>
> On Thu, Sep 15, 2016 at 10:13 AM, sujith h <sujith.h@gmail.com> wrote:
>
>>
>>
>> On Thu, Sep 15, 2016 at 4:41 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>
>>>
>>> On 12 September 2016 at 07:13, Sujith H <sujith.h@gmail.com> wrote:
>>>
>>>> +# PIC can't be enabled for 32-bit x86 and cyclone5
>>>>  INSANE_SKIP_${PN}_append_x86 =3D " textrel"
>>>> +INSANE_SKIP_${PN}_append_cyclone5 =3D " textrel"
>>>>
>>>
>>> Can this be generalised or is it absolutely specific to cyclone5?  If i=
t
>>> can't be generalised then I feel that this should belong in the cyclone=
5
>>> BSP.
>>>
>>
>> We found this with cyclone5 BSP. I will try to figure out how if we can
>> see it with qemuarm or other BSP's too.
>>
>
> I tried with qemuarm, it wasn't reproducible. But with imx6qsabresd from
> meta-fsl-arm, it was reproducible. So I believe we can generalize this
> patch. I will send the updated one shortly. Thanks for the pointer Ross.
>

I forgot to mention that I posted this change in meta-altera for review. I
got the feedback from meta-altera to post the change for review here:
https://github.com/kraj/meta-altera/pull/37. Sharing this for the reference=
.


>
>>
>>>
>>> Ross
>>>
>>
>>
>>
>> --
>> =E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=
=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
>> Bangalore
>> <Project>Contributor to KDE project
>> <Project>Contributor to Yocto project
>> http://fci.wikia.com/wiki/Anti-DRM-Campaign
>> <Blog> http://sujithh.info
>> C-x C-c
>>
>
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

--001a113f40d61f4d7b053c873d83
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Sep 15, 2016 at 12:15 PM, sujith h <span dir=3D"ltr">&lt;<a tar=
get=3D"_blank" href=3D"mailto:sujith.h@gmail.com">sujith.h@gmail.com</a>&gt=
;</span> wrote:<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><div d=
ir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><s=
pan class=3D"gmail-">On Thu, Sep 15, 2016 at 10:13 AM, sujith h <span dir=
=3D"ltr">&lt;<a target=3D"_blank" href=3D"mailto:sujith.h@gmail.com">sujith=
.h@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote"><span>On Thu, Sep 15, 2016 at 4:41 AM, Burton, Ross <span =
dir=3D"ltr">&lt;<a target=3D"_blank" href=3D"mailto:ross.burton@intel.com">=
ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span><br=
><div class=3D"gmail_quote">On 12 September 2016 at 07:13, Sujith H <span d=
ir=3D"ltr">&lt;<a target=3D"_blank" href=3D"mailto:sujith.h@gmail.com">suji=
th.h@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div>+# PIC can&#39;t be enabled for 32-bit x86 and <span>cy=
clone5</span><br>
=C2=A0INSANE_SKIP_${PN}_append_x86 =3D &quot; textrel&quot;<br>
+INSANE_SKIP_${PN}_append_<span>cycl<wbr>one5</span> =3D &quot; textrel&quo=
t;</div></blockquote></div><br></span>Can this be generalised or is it abso=
lutely specific to cyclone5?=C2=A0 If it can&#39;t be generalised then I fe=
el that this should belong in the cyclone5 BSP.</div></div></blockquote><di=
v><br></div></span><div>We found this with cyclone5 BSP. I will try to figu=
re out how if we can see it with qemuarm or other BSP&#39;s too.<br></div><=
/div></div></div></blockquote><div><br></div></span><div>I tried with qemua=
rm, it wasn&#39;t reproducible. But with imx6qsabresd from meta-fsl-arm, it=
 was reproducible. So I believe we can generalize this patch. I will send t=
he updated one shortly. Thanks for the pointer Ross.<br></div></div></div><=
/div></blockquote><div><br></div><div>I forgot to mention that I posted thi=
s change in meta-altera for review. I got the feedback from meta-altera to =
post the change for review here: <a href=3D"https://github.com/kraj/meta-al=
tera/pull/37">https://github.com/kraj/meta-altera/pull/37</a>. Sharing this=
 for the reference.<br><br> </div><blockquote style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmai=
l_quote"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><div><br></div><span class=3D"gmail-"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><span><font color=3D"#888888"><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></font></span></di=
v><span><font color=3D"#888888">
</font></span></blockquote></div><span><font color=3D"#888888"><br><br clea=
r=3D"all"><br>-- <br><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=E0=
=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=
=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Pro=
ject&gt;Contributor to KDE project<br></div><div>&lt;Project&gt;Contributor=
 to Yocto project<br></div><div><a target=3D"_blank" href=3D"http://fci.wik=
ia.com/wiki/Anti-DRM-Campaign">http://fci.wikia.com/wiki/Anti<wbr>-DRM-Camp=
aign</a><br>&lt;Blog&gt; <a target=3D"_blank" href=3D"http://sujithh.info">=
http://sujithh.info</a><br></div><div>C-x C-c<br></div></div></div></div></=
div>
</font></span></div></div>
</blockquote></span></div><span class=3D"gmail-"><br><br clear=3D"all"><br>=
-- <br><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=
=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=
=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contrib=
utor to KDE project<br></div><div>&lt;Project&gt;Contributor to Yocto proje=
ct<br></div><div><a target=3D"_blank" href=3D"http://fci.wikia.com/wiki/Ant=
i-DRM-Campaign">http://fci.wikia.com/wiki/<wbr>Anti-DRM-Campaign</a><br>&lt=
;Blog&gt; <a target=3D"_blank" href=3D"http://sujithh.info">http://sujithh.=
info</a><br></div><div>C-x C-c<br></div></div></div></div></div>
</span></div></div>
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

--001a113f40d61f4d7b053c873d83--
