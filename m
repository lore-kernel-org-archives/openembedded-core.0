Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
	[209.85.222.51])
	by mail.openembedded.org (Postfix) with ESMTP id C1E277ECBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 20:22:51 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id o19so17531482uap.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=es568nykRz53kKuyJVN+nakzkltmCa4E6GH0O9w9cyc=;
	b=TklzmwPkJ4Q0HTGSbDv1TVPsMh+JpEu4L/MYpvkaOGXEwP7uQIZvchsrdxGHf5rClm
	AB8sRADmKSp67MELkCi1/x+DJ9qrgg50nKi7Dx1O8iBPytv2s3Tpdfdg8NSNVfnGHJuv
	AHUt6abKTt5SFZ/z6kwtOfXzVStXPr52X0xBGytTc+UzqkwhXOFU8gcHMgSVFe+aoMb4
	fpNFGOe55BOXhLJWxkdPH6i6qjGqH+Kf6hBjlIqaWQj52sEdacflxEkpaOdJAH0xaXhQ
	XA4JOPHpczoWl7JArn+OE/tiFgCejhpTtLEwFNi7p3ELsWeGfivrlXMOVFgCBZU8wMby
	zymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=es568nykRz53kKuyJVN+nakzkltmCa4E6GH0O9w9cyc=;
	b=Ssyyf4FlwuKO7DJK0CQ7KuQGHq9LhYJ4PLPckr3sNEdJWJnc/vt7NlCG23LGnxfJAK
	TPcw4Q2ReaW5Vpc0a2wIKz1cdzgX7XaV05+rw5LTgGWzEwOq+ND/vR7gQ9772LEtx+9f
	YughaUYzlIp3QzRx97ntl3HnxD26/9kJPC/BfbRrqqSbxgt60+MucVcvMKriHPIu1kdu
	G4kZl2xyPsuf/Rfy7prW4uMboU/rxlmItHg4e3nyhPs5zTDDLgIgsXCj0p2Ux9NsD52l
	wv1JerIl6nOWGWhHLCAdgtDsEtWoRgdMGKmwpAeYsbSU543OKVDXA1Rw19xtvR8L1H2B
	jh6A==
X-Gm-Message-State: APjAAAWzamFs/UUVBCIEGLtJGK9S45nLDlAHxoxv49XIDIAyTIjy81Bu
	ecxsf9vZ36DsE4Ah7jAdrAhdmuK3+xGVb6MM2U0=
X-Google-Smtp-Source: APXvYqzR3eP3go1VeAi+1Xe8qD/gk9YmqhHapE0r7N2mjgAZ536HIxiryGEchSIJR++EVKcaClwdLP2G1sgGZkVShLA=
X-Received: by 2002:ab0:760e:: with SMTP id o14mr31311303uap.93.1563913372778; 
	Tue, 23 Jul 2019 13:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <006d01d5417e$e1c31180$a5493480$@gmail.com>
In-Reply-To: <006d01d5417e$e1c31180$a5493480$@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jul 2019 23:22:41 +0300
Message-ID: <CANNYZj9n2q1udd4Rg_sGrh=8u-S4_mg+cRx3k1m5i-ZFHZXFGw@mail.gmail.com>
To: sjolley.yp.pm@gmail.com, Yocto discussion list <yocto@yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Joshua Watt <jpewhacker@gmail.com>
Cc: Lieu.Ta@windriver.com
Subject: Re: Yocto Project Status WW30'19
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
X-List-Received-Date: Tue, 23 Jul 2019 20:22:52 -0000
Content-Type: multipart/alternative; boundary="0000000000000b43dc058e5ef5eb"

--0000000000000b43dc058e5ef5eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Jul 2019 at 20:49, <sjolley.yp.pm@gmail.com> wrote:

>
>    - There are patches available which enable runqueue optimisations
>    based on output comparisons of tasks. This removes the need to run lat=
er
>    tasks if the output is unchanged and is based upon the previous hash
>    equivalence server work. This feature should be a significant win for =
the
>    users and is now working to a level where we=E2=80=99ll likely make th=
is a key
>    feature of the next release.
>
> This is going to be awesome! Maybe this achievement should get wider
exposure via a LWN article? (provided they accept the submission)

Alex

--0000000000000b43dc058e5ef5eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 23 Jul 2019 at 20:49, &lt;<a href=
=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div lang=3D"EN-US"><d=
iv class=3D"gmail-m_-7111157689397501626WordSection1"><ul style=3D"margin-t=
op:0in" type=3D"disc"><li class=3D"MsoNormal" style=3D"color:black;vertical=
-align:baseline"><span style=3D"font-family:Arial,sans-serif">There are pat=
ches available which enable runqueue optimisations based on output comparis=
ons of tasks. This removes the need to run later tasks if the output is unc=
hanged and is based upon the previous hash equivalence server work. This fe=
ature should be a significant win for the users and is now working to a lev=
el where we=E2=80=99ll likely make this a key feature of the next release.<=
/span></li></ul></div></div></blockquote><div>This is going to be awesome! =
Maybe this achievement should get wider exposure via a LWN article? (provid=
ed they accept the submission)</div><div><br></div><div>Alex=C2=A0</div></d=
iv></div>

--0000000000000b43dc058e5ef5eb--
