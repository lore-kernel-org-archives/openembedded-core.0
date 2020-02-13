Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id E7F9460BB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 21:37:46 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id p2so3339790qvo.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 13:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+vIXxJfgiIoP8NI8l2OcMk1qaKB9swIJPSADFt39KuQ=;
	b=FWAtYb1aEaFKyoSsEm6HtzqJWc72d+ub5DvNQdkV3a+HJ6xageDbcFqSH+lGOORQik
	PMEP6zlPIzD9Yeqd3W9NbXV2BeKeztLcgd6DGx9WLJxTA66uhVNPVd5/KMl9Xs9W36vf
	nI9UmZEL3r/uPSkgVxpuWgYgYh5OMiLV+C9SDK2ttMzHPtjepa4GnZemx47M7OYH3Kna
	BGpjV6Y0zOd/4IopsRua+MJg2cwW/CwjptgvlN6/s/uMkgAzBJ1Vbqvu+uxZtLYr1hIH
	gOBHQg6lywss14MJYsMOEo4BTMqmGPHKbqprrQUj/N9/5NG1NlTXIqyjFL4n0+lwxU08
	ahrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+vIXxJfgiIoP8NI8l2OcMk1qaKB9swIJPSADFt39KuQ=;
	b=uJ1rnCB7T3t6QTs7aAfUc1C2iEnOS50Yt0C2maGnsFxL2rJm8pnpP5n7N+dAIT/fZR
	qjViTFibAX4tL+CrM+YV/zRPfvhIOsJPYL7dYhAVHnKmvPcpASWKh8RF2vL0pe/yK4zw
	csrgEFLLrnVZ066v4fQfWsD1XNCmNFC4/dNEZ1fkdNMRXScNve7DQYdw49Sn8v0DTsll
	occ7bB7qK0mfonnAhmlCCQ4rKwk4S2ltqKZQh0DLyQIMyBSRm4OAk5elcpJoiDHZAZcy
	CJ2eiYKo5/pQJPVcpv2l8+t7xrjRqZMmaQ56/64FZBlhhOQYOnRgG6e5WFmViBu+P4Ld
	9Y7g==
X-Gm-Message-State: APjAAAX5KCYbtTKa4km1I6cQVf+fkHxTkKr2omAjRMyT7FgTxgTRHgvp
	nU8wlsPTIvfwXZwxC8lqFLX1+e48WJD82FRATg5oIRT5
X-Google-Smtp-Source: APXvYqyyvYatpF14AxIBMuUzZaUgxFXtK++zLSClxcu55kOEJcfo48Rfc86Jz3xbQJJIL/ze3hYEot5nztX6zpuvL+E=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr13401109qva.109.1581629866827; 
	Thu, 13 Feb 2020 13:37:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
	<CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
	<CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
	<CANNYZj_7pG5EGjOR2BW3beJ3J__37GR29XZFaRotvuG9KFCnOQ@mail.gmail.com>
In-Reply-To: <CANNYZj_7pG5EGjOR2BW3beJ3J__37GR29XZFaRotvuG9KFCnOQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 13:37:36 -0800
Message-ID: <CAMKF1sp_fEAyuGxgxUG=bXuVEMm01NG+g6Vqz29Pseht0nPQDw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Thu, 13 Feb 2020 21:37:47 -0000
Content-Type: multipart/alternative; boundary="00000000000060e263059e7be698"

--00000000000060e263059e7be698
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 8:52 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 13 Feb 2020 at 17:44, Khem Raj <raj.khem@gmail.com> wrote:
>
>> I'd like to request that these two are held back until we figure out wha=
t
>>>>> is going wrong with the rpm test (see separate thread).
>>>>>
>>>>
>>>> We already know what=E2=80=99s going on what more
>>>> Do you want to know ?
>>>>
>>>
>>>  As the rpm maintainer, yes I do. The test is not being skipped when it
>>> should be, and I'd like to know why.
>>>
>>
>> I see that as separate issue orthogonal to these patches
>>
>
> Merging these patches will exclude rpm from images, and so will mask the
> issue, so it's not orthogonal.
>

are you actively working to fix the test case ?
In that case it would be justified to hold them


> Alex
>

--00000000000060e263059e7be698
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 13, 2020 at 8:52 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">O=
n Thu, 13 Feb 2020 at 17:44, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:=
rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-l=
eft:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-le=
ft-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"=
gmail_quote"><div>I&#39;d like to request that these two are held back unti=
l we figure out what is going wrong with the rpm test (see separate thread)=
.</div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">We already know what=E2=80=99s going on what more</div><div dir=3D"auto"=
>Do you want to know ?</div></div></div></blockquote><div><br></div><div>=
=C2=A0As the rpm maintainer, yes I do. The test is not being skipped when i=
t should be, and I&#39;d like to know why.</div><div></div></div></div></bl=
ockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I see that as separa=
te issue orthogonal to these patches=C2=A0</div></div></div></blockquote><d=
iv><br></div><div>Merging these patches will exclude rpm from images, and s=
o will mask the issue, so it&#39;s not orthogonal.</div><div></div></div></=
div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">are you acti=
vely working to fix the test case ?</div><div dir=3D"auto">In that case it =
would be justified to hold them</div><div dir=3D"auto"><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br><=
/div><div>Alex=C2=A0</div></div></div>
</blockquote></div></div>

--00000000000060e263059e7be698--
