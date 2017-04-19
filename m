Return-Path: <krussell7711@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0161F71A99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 03:45:24 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id g60so9886184qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 20:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=dZ7zg+VPelwDp/Jac/9otVDP8hDQL7nO9u6UJGnZTKg=;
	b=R4OPuj7DymDW+3p552NzKggA/I6AREHOLorl8ZwGlH+whTyTvNN/StSG+Y1kZsWhfw
	QhE8JRkLHge0Yb5YU6G0PAFZMCXJglQbnGGJftr1KgDHzKgaTt0AlrH8++2GqVpMESny
	hlJPCzs7SWfMcg6QeAnjlTqV+9GLCp4Evt1wW1zAQiJ64xN4TAuZHgSoKPuYN8u+YUVI
	e8G78JJcoonqwH+SY81wPdH6HYIHhkB34uPaxLpli4LRjoaSMI7PUz0j6sG7nC6cZ5FL
	/ZfmRprYxBz8ag6WIS5pZM2Qj8ftq+fhlP/3PYQ2SJttdrPj1Fvmejba4Pr8mV6Idii0
	B/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=dZ7zg+VPelwDp/Jac/9otVDP8hDQL7nO9u6UJGnZTKg=;
	b=OkeBVvqpiLS7pOgwzW8bx3A/3KRzmLs54W92STpIsAwK3terdcj+RE7wbQRnz5WERx
	Olloif4JVEQU8O26TfM5j494Inc4PAv6ZYIJxOFu0bC0DhPsBexz2w/cvf3xf3ieIMoE
	pATe4Yp/aG7Vjhlhglc8e0J2ec+KqjFEi/UrzCR9Nsv9Vdp7m1/b2q/GoIEJ53i8HWQB
	1gYz6KJnWgciD/623klaKpvs0LR8iujsT6vQR9S46hIA/ccYIaHFG9HbFR94gyhek9Ys
	jO/3vIqHYJdpOFgsh/NRwXg9q8y/JKis4fvS5bitfLvAarK5Zvv1mQWUZ9dw02Zfk51F
	x3fQ==
X-Gm-Message-State: AN3rC/74IFJhEGbEM0adctAY74AJZtDgd/cYSEA+ivxDOvEJgwSSECxw
	+UTKZxksPS9QDYB0f6Wwbn8+OgUUTw==
X-Received: by 10.200.49.61 with SMTP id g58mr648597qtb.151.1492573525931;
	Tue, 18 Apr 2017 20:45:25 -0700 (PDT)
MIME-Version: 1.0
Sender: krussell7711@gmail.com
Received: by 10.12.151.137 with HTTP; Tue, 18 Apr 2017 20:45:05 -0700 (PDT)
In-Reply-To: <CAJTo0LYr9XCsG0yFAYeLmQtnc0n99w0dULWdz01J+kLWSp90uQ@mail.gmail.com>
References: <1492527724-26361-1-git-send-email-bkylerussell@gmail.com>
	<CAMKF1soMAfgVG78+dywZ5nAnmAfi0-6hnUjC+MohWHm7JsBuUw@mail.gmail.com>
	<CAJTo0LYr9XCsG0yFAYeLmQtnc0n99w0dULWdz01J+kLWSp90uQ@mail.gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Tue, 18 Apr 2017 23:45:05 -0400
X-Google-Sender-Auth: ZOGhkRPhgItgEbDEC02thtTVfv4
Message-ID: <CAFrQVPMr9Y8WB1HsvRWMEALD03qraOzVeKaW78FRbaE-444f=w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: Set CMAKE_CROSSCOMPILING correctly
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
X-List-Received-Date: Wed, 19 Apr 2017 03:45:25 -0000
Content-Type: multipart/alternative; boundary=001a11405d0ad07c85054d7cdac8

--001a11405d0ad07c85054d7cdac8
Content-Type: text/plain; charset=UTF-8

Thank you.  Do I need to submit an amended patch to the mailing list, or
will your fixup get merged in from your staging branch pending no problems?

On Tue, Apr 18, 2017 at 3:17 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 18 April 2017 at 19:53, Khem Raj <raj.khem@gmail.com> wrote:
>
>> dont use == here that will make it bash specific.
>>
>
> Well spotted Khem.  I've merged this into my staging branch with the test
> changed to = for POSIXness.
>
> Thanks,
> Ross
>

--001a11405d0ad07c85054d7cdac8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you.=C2=A0 Do I need to submit an amended patch to t=
he mailing list, or will your fixup get merged in from your staging branch =
pending no problems?</div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Tue, Apr 18, 2017 at 3:17 PM, Burton, Ross <span dir=3D"ltr">&l=
t;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_q=
uote">On 18 April 2017 at 19:53, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-1401236897100699=
610:1rr" class=3D"m_-1401236897100699610a3s m_-1401236897100699610aXjCH m_-=
1401236897100699610m15b826a1c6fa7980">dont use =3D=3D here that will make i=
t bash specific.<div class=3D"m_-1401236897100699610yj6qo m_-14012368971006=
99610ajU"><div id=3D"m_-1401236897100699610:1q8" class=3D"m_-14012368971006=
99610ajR"></div></div></div></blockquote></div><br></span>Well spotted Khem=
.=C2=A0 I&#39;ve merged this into my staging branch with the test changed t=
o =3D for POSIXness.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">Ross</div></div>
</blockquote></div><br></div>

--001a11405d0ad07c85054d7cdac8--
