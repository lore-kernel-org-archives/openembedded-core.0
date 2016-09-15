Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 075A773695
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 06:45:55 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id z143so2737407qka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 23:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=47jl0uawH/68tuFux3sOSpok8VRwVtngORGXeeWvMJY=;
	b=Iw7vvIrik12PDvjAruT8JUY4yn5+ikrpWdvHMlSjkaLRvouVy741CHYHiiA73oGkxc
	hqGNeLesy4R9s24gdxfb0uVLqq3XU4rwLpQ28zaxsA7CDoCO911ddGVjvTdHWm2OWqGh
	XQ2xK1yFeorY6K7ChhxacGyTpcJf7s3qT9cuIk0J7Ag64M24J4lDhHTRkGzE5U1Fz+ju
	Rnmpp7OButFakXntJZjbCGqJiLpk3gN6ZwcaHYDZk/4b1rOsLZ+J+Xxu3yBzydUoEdtZ
	mF9vCtiau3shDsK6WSNre8AS5i2zQ51+ARba20D0Lep3pOhl7nu0hIeY2QhHlbvqOXFK
	BFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=47jl0uawH/68tuFux3sOSpok8VRwVtngORGXeeWvMJY=;
	b=lLiRCHQhQRjPlARIHCuZv8BlQVkVn5v4/maSjsnZOXYaKLkRx8mLweBz4wYB9jTOGV
	vwZtu+0FfoqE/KgF5rNbIdzoqoGgaMo2fu1y/fE1e4gmLmuqjC4VzOsbTIKuzKrU8KVG
	KAwGYD9lMCezIuENdVNwSO37wA2P4conu/AvqWBYbtPtE2zpJRo8/51ARdtn7cEeNtaj
	AwNveSyinTWqI12HKPFf/Ewc18pCFd5nBUUk29NCsVyZ8Ay+cLL1GUW0rpv0LfkdfyQn
	IKSEIemU940TwbISeBRAjufWx/ZQYKBYzSKbS43bNvzHYSOOd9szURGBWT6WqVb9isim
	wo7g==
X-Gm-Message-State: AE9vXwP2jFyeMmNFjY3X38dgjexYdjHzi+UMA5DiDpXjnuCmhyWkTz0cJybjJj26fmBYaC6tThtPZmd4yakXfg==
X-Received: by 10.233.237.11 with SMTP id c11mr7614614qkg.118.1473921955986;
	Wed, 14 Sep 2016 23:45:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Wed, 14 Sep 2016 23:45:35 -0700 (PDT)
In-Reply-To: <CADyYWL=_YCXJ1nD-VxFisu6J813MBEs2QCU2TjFGRGVFJJhDHg@mail.gmail.com>
References: <1473660793-3296-1-git-send-email-sujith.h@gmail.com>
	<CAJTo0Lb-bsJNvxDyfkRraQ5-dQ+cJqigThm2CMBUSg5EJGOV7A@mail.gmail.com>
	<CADyYWL=_YCXJ1nD-VxFisu6J813MBEs2QCU2TjFGRGVFJJhDHg@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Thu, 15 Sep 2016 12:15:35 +0530
Message-ID: <CADyYWL=VezFuDFy=ZV8y4XDyzTP20ErxgpfXjLh5uCoCWDrdHQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Sep 2016 06:45:56 -0000
Content-Type: multipart/alternative; boundary=001a114f55d29d0368053c8632e3

--001a114f55d29d0368053c8632e3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 10:13 AM, sujith h <sujith.h@gmail.com> wrote:

>
>
> On Thu, Sep 15, 2016 at 4:41 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>>
>> On 12 September 2016 at 07:13, Sujith H <sujith.h@gmail.com> wrote:
>>
>>> +# PIC can't be enabled for 32-bit x86 and cyclone5
>>>  INSANE_SKIP_${PN}_append_x86 =3D " textrel"
>>> +INSANE_SKIP_${PN}_append_cyclone5 =3D " textrel"
>>>
>>
>> Can this be generalised or is it absolutely specific to cyclone5?  If it
>> can't be generalised then I feel that this should belong in the cyclone5
>> BSP.
>>
>
> We found this with cyclone5 BSP. I will try to figure out how if we can
> see it with qemuarm or other BSP's too.
>

I tried with qemuarm, it wasn't reproducible. But with imx6qsabresd from
meta-fsl-arm, it was reproducible. So I believe we can generalize this
patch. I will send the updated one shortly. Thanks for the pointer Ross.


>
>>
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

--001a114f55d29d0368053c8632e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Sep 15, 2016 at 10:13 AM, sujith h <span dir=3D"ltr">&lt;<a tar=
get=3D"_blank" href=3D"mailto:sujith.h@gmail.com">sujith.h@gmail.com</a>&gt=
;</span> wrote:<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><div d=
ir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><s=
pan class=3D"gmail-">On Thu, Sep 15, 2016 at 4:41 AM, Burton, Ross <span di=
r=3D"ltr">&lt;<a target=3D"_blank" href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;</span> wrote:<br><blockquote style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" cl=
ass=3D"gmail_quote"><div dir=3D"ltr"><div class=3D"gmail_extra"><span><br><=
div class=3D"gmail_quote">On 12 September 2016 at 07:13, Sujith H <span dir=
=3D"ltr">&lt;<a target=3D"_blank" href=3D"mailto:sujith.h@gmail.com">sujith=
.h@gmail.com</a>&gt;</span> wrote:<br><blockquote style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"=
gmail_quote"><div>+# PIC can&#39;t be enabled for 32-bit x86 and <span>cycl=
one5</span><br>
=C2=A0INSANE_SKIP_${PN}_append_x86 =3D &quot; textrel&quot;<br>
+INSANE_SKIP_${PN}_append_<span>cycl<wbr>one5</span> =3D &quot; textrel&quo=
t;</div></blockquote></div><br></span>Can this be generalised or is it abso=
lutely specific to cyclone5?=C2=A0 If it can&#39;t be generalised then I fe=
el that this should belong in the cyclone5 BSP.</div></div></blockquote><di=
v><br></div></span><div>We found this with cyclone5 BSP. I will try to figu=
re out how if we can see it with qemuarm or other BSP&#39;s too.<br></div><=
/div></div></div></blockquote><div><br></div><div>I tried with qemuarm, it =
wasn&#39;t reproducible. But with imx6qsabresd from meta-fsl-arm, it was re=
producible. So I believe we can generalize this patch. I will send the upda=
ted one shortly. Thanks for the pointer Ross.<br><br></div><blockquote styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex" class=3D"gmail_quote"><div dir=3D"ltr"><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote"><div>=C2=A0<br></div><blockquote style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex" class=3D"gmail_quote"><div dir=3D"ltr"><span><font color=3D"#888888"><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></f=
ont></span></div><span class=3D"gmail-HOEnZb"><font color=3D"#888888">
</font></span></blockquote></div><span class=3D"gmail-HOEnZb"><font color=
=3D"#888888"><br><br clear=3D"all"><br>-- <br><div><div dir=3D"ltr"><div><d=
iv dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =
=E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br=
>Bangalore<br>&lt;Project&gt;Contributor to KDE project<br></div><div>&lt;P=
roject&gt;Contributor to Yocto project<br></div><div><a target=3D"_blank" h=
ref=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign">http://fci.wikia.com/wi=
ki/<wbr>Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a target=3D"_blank" href=3D"=
http://sujithh.info">http://sujithh.info</a><br></div><div>C-x C-c<br></div=
></div></div></div></div>
</font></span></div></div>
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

--001a114f55d29d0368053c8632e3--
