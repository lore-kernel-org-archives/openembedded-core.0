Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5C78778D72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 14:13:31 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id e84-v6so4793343ybb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 07:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kvB0MOUGuyeI4i03689dgrOUwxbU4/xO79ckkb5Mrh4=;
	b=qT2fHl/RJUbcrExX7zLK1tBnnxPLvUm+cD9QejpxaQkeXdjgpzt2leTXlQLPyxm8m5
	hljG6iOpHNWUcb5wULJDG75nQs7Cg/Cdq/KdVp3rMGeir0Le/1xoSnCmrW3MW+s25avf
	Ug8da+LsYycQZtRifnCTuO7w/QaFGM5UkUW7ePIDDbdX4JQHNsrgy7+d/MQlkQEe4CWH
	KINUpohzI7k+rtuFJ2LjOuyaHIZmp2lCY/1gVZ+bsiL+ARh7QV579t7MsAiVstH+HKlK
	mmasQJNlme4t9pzLMzdI+jBnAIkUoAJC/UEgsmA9DeuQfiUzO7gQ3frY+GQvewX6BTXM
	sPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kvB0MOUGuyeI4i03689dgrOUwxbU4/xO79ckkb5Mrh4=;
	b=uRxTDwAAgiMomYSOAxN7VNErqts4Tux0K2qpOc+DgG10vjvkt2vMFAQQpRPyQrIRcz
	rGJbj1Y/hNGLfzjRPuT1vgNu692PiB1Ie47iaUeKlXXHj3rYueCH/v0XzgCPIz3xjdkE
	Y0BrzvO6ADeskLInehFJlSsw+qXuo93RHTd+fFxFiATJHg2QBpiSbmDBz08+AghOZr3V
	zevSirAzN7nkFc1wWVNaZ62f6/3/1pfDjoFWtLP/lpBmZk8PJcLtPJbbzTdIWVOIpolH
	vwNOjMJiYVTqva35+v2GAhpcA6zHaWmsnqMKI++AAYsL5W/alz0ahoOgPpEEnP7hlqA0
	704A==
X-Gm-Message-State: AOUpUlFGxrScSMdrLMLGcQdjuzbXsGxJJWvdXecPQA6sluu2JxAskuyc
	NdmT7zfXIfW1lSByKDNeURPGsKBIWDvM0GLEIoOrXA==
X-Google-Smtp-Source: AAOMgpcdcjQvlf/ItPc+DDgue7RLyM+XyZFzW8IiAWb0W3qOc+WekIcVsU4T6NeCFiyXPhiFdb3JO0OxC0A0eVxTT1M=
X-Received: by 2002:a25:b091:: with SMTP id
	f17-v6mr9211793ybj.167.1532960012142; 
	Mon, 30 Jul 2018 07:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAFeBWL4WvT2CJkd25BVwje6_KvKZ5wquM6+YyPeHzywdMTT_iA@mail.gmail.com>
	<CAJ86T=W-DOtSSpBb_tK_XuiPJAxteirR8xeCvWz5q9Hv3Q3-xg@mail.gmail.com>
	<CAMKF1sqORifnSdwyUiQdGpEA1k1xxokSSAi17Z1z2OgSwe7c+g@mail.gmail.com>
In-Reply-To: <CAMKF1sqORifnSdwyUiQdGpEA1k1xxokSSAi17Z1z2OgSwe7c+g@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Mon, 30 Jul 2018 10:13:18 -0400
Message-ID: <CAFeBWL6oyrgaSpR-RPsRSYP2VdgtqkrMArp=h0kk4KPfLJaa5A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Setting include path in a recipe
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
X-List-Received-Date: Mon, 30 Jul 2018 14:13:31 -0000
Content-Type: multipart/alternative; boundary="000000000000fa8f8a0572381013"

--000000000000fa8f8a0572381013
Content-Type: text/plain; charset="UTF-8"

Thank you. Both works well!

On Wed, Jul 25, 2018 at 12:34 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jul 24, 2018 at 10:51 AM Andre McCurdy <armccurdy@gmail.com>
> wrote:
>
>> On Tue, Jul 24, 2018 at 6:52 AM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>> >
>> > How do I defined a custom include path for an autotools recipe?
>> >
>> > This may as well be explained somewhere in the reference manual, but I
>> can't
>> > seem to find it.
>>
>> Assuming you want to add a custom directory which is within sysroot:
>>
>> CPPFLAGS += "-I=/usr/include/specialheaders"
>>
> --
>
>
> -I= is gcc specific using STAGING_INCDIR would be portable
>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000fa8f8a0572381013
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you. Both works well!</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr">On Wed, Jul 25, 2018 at 12:34 PM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"=
ltr">On Tue, Jul 24, 2018 at 10:51 AM Andre McCurdy &lt;<a href=3D"mailto:a=
rmccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt; wrote:<br=
></div></div></div><div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On Tue, Jul 24, 2018 at 6:52 AM, Adam Lee &lt;<a href=3D"mailto:adam=
.yh.lee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; How do I defined a custom include path for an autotools recipe?<br>
&gt;<br>
&gt; This may as well be explained somewhere in the reference manual, but I=
 can&#39;t<br>
&gt; seem to find it.<br>
<br>
Assuming you want to add a custom directory which is within sysroot:<br>
<br>
CPPFLAGS +=3D &quot;-I=3D/usr/include/specialheaders&quot;<br></blockquote>=
</div></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-- </blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">-I=3D is gcc =
specific using STAGING_INCDIR would be portable=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>
</blockquote></div>

--000000000000fa8f8a0572381013--
