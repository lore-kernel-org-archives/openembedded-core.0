Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD416D586
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 05:38:19 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id eh20so5726491lab.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 21:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=tkZVRrGSbYhXVwSCwua2gSrPEiM/CdOZ9mfGdXZR1D8=;
	b=DuRRvYUl/sRRGf5ZhxEMXGLmURUo/j4KmMhN2TDapW9lqPEKhPRbjOSMf8x1aUrJzJ
	ebkM1Ejy732lQqiKo7ZxOCLWBhrBqWIYugntC9wH+jM4lsv40QwC3h0k+ffPygwOCd3i
	8HbFmgrwLLzEwygvQY8cfECwR4Hrngn0Hd2qcF0sX0ipPJlQCkV5SXOwRrldL+njdPpq
	2BefmIXeKRLDmtYTwzIxDeVoser0nYXEnMGbPhE59PSwgd/xlm/E4So92QKQneufi42S
	9xRSFHqKNIGkrExY74Uplv3i4GtvBE5EZ/ILQU1FxKnLN26sv8ikUXBmIHx9vcF5hEJb
	F7tA==
X-Received: by 10.152.8.18 with SMTP id n18mr17615091laa.24.1384839500473;
	Mon, 18 Nov 2013 21:38:20 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Mon, 18 Nov 2013 21:38:00 -0800 (PST)
In-Reply-To: <20131118162014.GH3727@jama>
References: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
	<52898177.5000303@windriver.com> <20131118114000.GB3727@jama>
	<1384775852.6460.214.camel@ted>
	<CANyK_8eR05HauKBOd3AoTMjibYBgZEhBSv5pN5Yt_+s2CavsNA@mail.gmail.com>
	<20131118162014.GH3727@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 18 Nov 2013 22:38:00 -0700
X-Google-Sender-Auth: ksHFO4B9Z9u8nt_3-Dfj6_BkNJA
Message-ID: <CABcZANmwUp7kowAk7FpDWCRmcvAqqg_RPP36jwrauHbx6_4NFg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg dependencies and update-alternatives
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
X-List-Received-Date: Tue, 19 Nov 2013 05:38:21 -0000
Content-Type: multipart/alternative; boundary=001a11c34ede7f2a1d04eb811255

--001a11c34ede7f2a1d04eb811255
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 9:20 AM, Martin Jansa <martin.jansa@gmail.com>wrote=
:

> > There is also an "alternatives" program in chkconfig which is listed
> > as a possible provider of "virtual/update-alternatives" but again,
> > trying to use in causes a dependency loop. I haven't given this
> > version more than a quick glance though.
> >
>

At Mentor, we=E2=80=99ve been using
https://github.com/MentorEmbedded/meta-mentor/blob/master/recipes/chkconfig=
/chkconfig-alternatives_1.3.59.bb
for
a while now with good results, for what it=E2=80=99s worth.

https://github.com/MentorEmbedded/meta-mentor/blob/master/conf/distro/inclu=
de/mel.conf#L140-L144
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c34ede7f2a1d04eb811255
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Mon, Nov 18, 2013 at 9:20 AM=
, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><div =
class=3D"gmail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">&gt; There is also an &quot;alternatives=
&quot; program in chkconfig which is listed<br>


&gt; as a possible provider of &quot;virtual/update-alternatives&quot; but =
again,<br>
&gt; trying to use in causes a dependency loop. I haven&#39;t given this<br=
>
&gt; version more than a quick glance though.<br>
&gt;</div></blockquote></div><div class=3D"gmail_extra"><br></div>At Mentor=
, we=E2=80=99ve been using=C2=A0<a href=3D"https://github.com/MentorEmbedde=
d/meta-mentor/blob/master/recipes/chkconfig/chkconfig-alternatives_1.3.59.b=
b">https://github.com/MentorEmbedded/meta-mentor/blob/master/recipes/chkcon=
fig/chkconfig-alternatives_1.3.59.bb</a>=C2=A0for a while now with good res=
ults, for what it=E2=80=99s worth.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"=
https://github.com/MentorEmbedded/meta-mentor/blob/master/conf/distro/inclu=
de/mel.conf#L140-L144">https://github.com/MentorEmbedded/meta-mentor/blob/m=
aster/conf/distro/include/mel.conf#L140-L144</a><br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c34ede7f2a1d04eb811255--
