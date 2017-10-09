Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id AD6AC77BE0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 13:15:47 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id l196so744031itl.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 06:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6lQ5tiybOBtZ96M0e3gB7VsUlNJsrIGQr8V4CcMwaLg=;
	b=o0GEHzGqEN5b9j4fBiiplXtrR2xsudbBsIl+JENjRRbVs8IA+n6+g8bTuUxK+zBDEW
	2NzCXzRm+kl1sIWJVQFcwxmC3N9ILgy2WO0mT83e0iDWRGH1lVSeum/Kl+1jlE12kH/9
	kwfAaTLabG32V0Be3NHq/JFm9tGPc8tP+25ZxmxYlOcF3lYt4zAeRcK8/rGCpJb3l9f6
	IYZGBFhZxGKd8mJ47f+fBVZIv40Jd//9S+gzjfYqJhicza7YHDufwchdIcfD8CpwTGsT
	1bopkSvI88J9XFxtWn1iboApWUCMLAdcOJJzSaVSkB6/4pvuTHDvj5TbfDlXvZVEhddU
	xMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6lQ5tiybOBtZ96M0e3gB7VsUlNJsrIGQr8V4CcMwaLg=;
	b=tFC+xAHT5m15A2wj3Rh2fdwjXoVrXPWO52R1IZgMm6jY+m0N2H0g8Yg41HIyltlnMb
	RvLxxhdV75/UyuFyukK9sGAXxpDrdQTVRrVE6BDtmWM/vPbD8ny1SnL2HaXZzBOMGayU
	h+vLd+l0yo2+sE435k19xXpXqld4iY2mu3PIb7vKwNK0g6OjqMqJjGq7plzPda+zoEnj
	gP9aR4fPVgyXEMiMlbD9Xki9XMeV+lNODVxBeoKMBNaGbldwmolqwt+rFYeWK4cQEmWz
	IMq2xo9pju3GS6qbgTIsdIyI8gOfQ+cS4/2X4Jyqi29bBv4aSz4KQK/3kQbnd05NkgOH
	FyUQ==
X-Gm-Message-State: AMCzsaVhFIXeqzAFSd+yyIK4zU88Dos09sVrTukgzmejRU9vf51zOHSD
	bBSWRU2rsCbqql146jn0gDOYX2uGDk+E2EHheuSl9A==
X-Google-Smtp-Source: AOwi7QCDoLOaJv2nCem0r5dQ9JYSEp9D81RRhN1jsEqxetC62DSB8jj4dGMMXpOKpSfCi73xs6Ra5WCb/vU71fY1pQw=
X-Received: by 10.36.167.79 with SMTP id s15mr13210765iti.6.1507554948621;
	Mon, 09 Oct 2017 06:15:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Mon, 9 Oct 2017 06:15:28 -0700 (PDT)
In-Reply-To: <CAPyrkgzum8JGfqsP2tu+7bjG8-J-UNBMgJPhLK08o7i0YXWHqw@mail.gmail.com>
References: <1507551680-26238-1-git-send-email-pbarker@toganlabs.com>
	<CAJTo0LZ8OkfLxgCLZi9-d2vpXUtWFo6jROedC01zid7fx=FX3A@mail.gmail.com>
	<CAPyrkgzum8JGfqsP2tu+7bjG8-J-UNBMgJPhLK08o7i0YXWHqw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Oct 2017 14:15:28 +0100
Message-ID: <CAJTo0La9PqqgOfRZB-cXo89e4x8HAHcfyUVCKcwuCUJ+jRhESg@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Fix building on armv6
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
X-List-Received-Date: Mon, 09 Oct 2017 13:15:47 -0000
Content-Type: multipart/alternative; boundary="f403045fb21831403a055b1cfd93"

--f403045fb21831403a055b1cfd93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, queued for rocko.  We've just fired RC2 so this is unlikely to make
it into 2.4.0 but it can be in the queue for 2.4.1 if it doesn't.

Ross

On 9 October 2017 at 13:48, Paul Barker <pbarker@toganlabs.com> wrote:

> On Mon, Oct 9, 2017 at 1:42 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 9 October 2017 at 13:21, Paul Barker <pbarker@toganlabs.com> wrote:
> >>
> >> This patch is backported from the upstream git repository to fix
> building
> >> libgcrypt on armv6 platforms such as raspberrypi.
> >
> >
> > Is this fixed in 1.8.1?  We've a pending upgrade for that waiting for
> > master, if so then this would be rocko-specific.
> >
> > Ross
>
> Yes this change is in 1.8.1. I backported just the single patch as I
> assume it's too late for a version bump in rocko now.
>
> I still see rocko =3D=3D master in the git repository so I didn't include
> a [rocko] tag.
>
> Cheers,
>
> --
> Paul Barker
> Tog=C3=A1n Labs Ltd
>

--f403045fb21831403a055b1cfd93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, queued for rocko.=C2=A0 We&#39;ve just fired RC2 s=
o this is unlikely to make it into 2.4.0 but it can be in the queue for 2.4=
.1 if it doesn&#39;t.<div><br></div><div>Ross</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 9 October 2017 at 13:48, Paul Ba=
rker <span dir=3D"ltr">&lt;<a href=3D"mailto:pbarker@toganlabs.com" target=
=3D"_blank">pbarker@toganlabs.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Mon, Oct 9, 2017 =
at 1:42 PM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.=
burton@intel.com</a>&gt; wrote:<br>
&gt; On 9 October 2017 at 13:21, Paul Barker &lt;<a href=3D"mailto:pbarker@=
toganlabs.com">pbarker@toganlabs.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This patch is backported from the upstream git repository to fix b=
uilding<br>
&gt;&gt; libgcrypt on armv6 platforms such as raspberrypi.<br>
&gt;<br>
&gt;<br>
&gt; Is this fixed in 1.8.1?=C2=A0 We&#39;ve a pending upgrade for that wai=
ting for<br>
&gt; master, if so then this would be rocko-specific.<br>
&gt;<br>
&gt; Ross<br>
<br>
</div></div>Yes this change is in 1.8.1. I backported just the single patch=
 as I<br>
assume it&#39;s too late for a version bump in rocko now.<br>
<br>
I still see rocko =3D=3D master in the git repository so I didn&#39;t inclu=
de<br>
a [rocko] tag.<br>
<br>
Cheers,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Paul Barker<br>
Tog=C3=A1n Labs Ltd<br>
</font></span></blockquote></div><br></div>

--f403045fb21831403a055b1cfd93--
