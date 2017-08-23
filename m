Return-Path: <andrei@gherzan.ro>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 35BE978195
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 16:48:42 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id p8so2132529wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eZzCQGBYq57OTKzcYVE6lj3kr0RZqrSXtXgY215JD7g=;
	b=hZkqzJzjbWZWwj91umPW5Jrb48AvKxKhe2u1FddtS7Cfn8xKiSuXa4B2510yHgdnyv
	gIT93MXvH8osH/8fOSAtPcevZ2CgcPeew2lJaiYXjBqxzcfWroKxn/cxAdCo0T+lGHS+
	urMg993ccAKNvKmPNa/ZOeObMCyOYhHMpvtKx6SUrO78z1Bec80qGozg0O2p03hXyhgm
	74s+C21BdJHvk04/BF6jTGfgRc5xR190HEu6KWXppbT8Lmi1jdhAlcJWtFx7uRhnS51h
	5kCgoyU9nAKvB4mcCaw2r1o4xI4SLhK/oFaWVQNFrqwXuv2Z9c67KApFtyXhLed4EN1G
	0AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eZzCQGBYq57OTKzcYVE6lj3kr0RZqrSXtXgY215JD7g=;
	b=i4pYNrJdSBmhW95VLwfNREC1/soKI2gVam7nvA+IRtkFiMY6mIzSxuQMxoNz6YZogr
	1RBU2RDdDrye1rGOIuXmXyhhitQ4PMBZxNSguCiCSNk7juqE4wIY4CZCiHkeLpN04uoM
	7gGEq/iMcBqIWa+nIA2K130dkGttdOhSQ8z7C/epjAiO5U4FMCEqiwZkBl6bDnGOKN3W
	GMQhTbFQJqQv4C/ZbEv0f4QY0EJle9wfCAZCTem9uAGA1PQPnhrhFl6rtZQz1ybdCT9o
	5BLrFBLgjT//OYO5k6v5E4Xl0JIp2TuDIwX8xjVeG/EVku0QXX3cFGOSv/rI5DZj8m34
	P/wQ==
X-Gm-Message-State: AHYfb5gKFkLEQk+Aw8HME7/A2gk5qJ/WcooXi4j2vjeots6dGpQ1tOFt
	ALgQr43mjzlafhV7/ArQFJLg6dNYQRVWG20=
X-Received: by 10.223.170.73 with SMTP id q9mr2027764wrd.305.1503506923358;
	Wed, 23 Aug 2017 09:48:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.45.195 with HTTP; Wed, 23 Aug 2017 09:48:02 -0700 (PDT)
X-Originating-IP: [82.22.166.118]
In-Reply-To: <CAK18fxG23fiaTMk86hQUYZVbRZApZMtM3StvuM5QefmCEHdw-g@mail.gmail.com>
References: <CAK18fxG23fiaTMk86hQUYZVbRZApZMtM3StvuM5QefmCEHdw-g@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 23 Aug 2017 17:48:02 +0100
Message-ID: <CAK18fxEj3ZLHzBAh5FgEKq8P9=QPr8MNBO6r4fri47nZZCeVbg@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Cc: bruce.ashfield@windriver.com
Subject: kernel-yocto class requires BSP definition now
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
X-List-Received-Date: Wed, 23 Aug 2017 16:48:43 -0000
Content-Type: multipart/alternative; boundary="94eb2c1cc60215a2de05576e7c4c"

--94eb2c1cc60215a2de05576e7c4c
Content-Type: text/plain; charset="UTF-8"

(Resending this from the yocto mailing list)

Hello all,

Since...

commit b6f78c7a27d6d3acae63cf1fdb7b56c11c919830
Author: Bruce Ashfield <bruce.ashfield@windriver.com>
Date:   Sun Aug 20 22:58:21 2017 -0400

    kernel-yocto: ensure that only valid BSPs are built

    There was a bug in the search routines responsible for locating
    BSP definitions which returned a valid match if only the ktype
    matched.

    This meant that someone looking for "qemux86foo" (which is an
    invalid definition) would potentially end up building "qemuarm"
    and be none the wiser (until it didn't boot).

    With this fix to the tools search routine, and improved return
    code testing, we will now stop the build and report and error to
    the user.

    [YOCTO: #11878]

    (From OE-Core rev: 44aea7b87307795fe4e089c51d45afccaa2f6525)

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


... the build fails for cases where there is no scc definition used.
meta-raspberrypi was using this for configuration fragments feature but
without defining any scc or using any feature branches etc. This got broken
now since finding BSP definition files is a requirement in the class.

--
Andrei Gherzan

--94eb2c1cc60215a2de05576e7c4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_signature" data-smartmail=3D"gmai=
l_signature"><div dir=3D"ltr"><div>(Resending this from the yocto mailing l=
ist)</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Hello all,<br></div><=
/div></div></div><div class=3D"gmail_quote"><div dir=3D"ltr"><div><br></div=
><div>Since...</div><div><br></div><div><div>commit b6f78c7a27d6d3acae63cf1=
fdb7b56<wbr>c11c919830</div><div>Author: Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver=
.com</a>&gt;</div><div>Date: =C2=A0 Sun Aug 20 22:58:21 2017 -0400</div><di=
v><br></div><div>=C2=A0 =C2=A0 kernel-yocto: ensure that only valid BSPs ar=
e built</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 There was a b=
ug in the search routines responsible for locating</div><div>=C2=A0 =C2=A0 =
BSP definitions which returned a valid match if only the ktype</div><div>=
=C2=A0 =C2=A0 matched.</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=
=A0 This meant that someone looking for &quot;qemux86foo&quot; (which is an=
</div><div>=C2=A0 =C2=A0 invalid definition) would potentially end up build=
ing &quot;qemuarm&quot;</div><div>=C2=A0 =C2=A0 and be none the wiser (unti=
l it didn&#39;t boot).</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=
=A0 With this fix to the tools search routine, and improved return</div><di=
v>=C2=A0 =C2=A0 code testing, we will now stop the build and report and err=
or to</div><div>=C2=A0 =C2=A0 the user.</div><div>=C2=A0 =C2=A0=C2=A0</div>=
<div>=C2=A0 =C2=A0 [YOCTO: #11878]</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=
=C2=A0 =C2=A0 (From OE-Core rev: 44aea7b87307795fe4e089c51d45af<wbr>ccaa2f6=
525)</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 Signed-off-by: B=
ruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D=
"_blank">bruce.ashfield@windriver.com</a>&gt;</div><div>=C2=A0 =C2=A0 Signe=
d-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@<wbr>linuxfoundation.org</a>&gt;</=
div></div><div><br></div><div><br></div><div>... the build fails for cases =
where there is no scc definition used. meta-raspberrypi was using this for =
configuration fragments feature but without defining any scc or using any f=
eature branches etc. This got broken now since finding BSP definition files=
 is a requirement in the class.</div><br clear=3D"all"><div><div class=3D"m=
_-1565503859024970629gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div>--</div>Andrei Gherzan</div></div></div></div></div>
</div>
</div><br></div>

--94eb2c1cc60215a2de05576e7c4c--
