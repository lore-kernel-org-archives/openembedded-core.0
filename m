Return-Path: <net147@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 51A5577357
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 23:16:00 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id e75so38153006itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 16:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=62x/L/86ItOGKr8L/1YLN8VyRH+ZbNdJwTGHnI+cG6Y=;
	b=OWCIToP+nLj7nyhJhPkab2dw8j7F1fK3qFn2VtFqpY72eqHbvLHZmVVGzgC0QXdc4c
	T6dJZIy/qQlW5EYV/wSY+P/32Dv6vC3oWDjZEEqLJNvlys/Uv2iws6mpvwFWcRiTo8no
	ctq9DJXBTbj52wAtJ7eqEHyZUZbq50lJ70Sw9d0xlJ91JsKbbqaPyUY4g8SRmM0ikTuV
	XDRtrjmrV+mbkAorvvM49FoycsYT5iReiew4mf3M8Vavc+6C+BpArUOjzq9PHBEcGiRh
	ohHV4bdjcpJDWyJmTcrpJZ/WXuUsFb47zzJyS6ol+rJ2r5VE9jXVI5Y+TQu/go9EEGG/
	xaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=62x/L/86ItOGKr8L/1YLN8VyRH+ZbNdJwTGHnI+cG6Y=;
	b=tjsvDSUJzMTtP6kjrMu0vSPibDEbhYMLEBfSPgkWqPRSZmTzmS2edhNHJ64VH027gD
	qrXnzAM+UW5h4kTmF2Unjai9DKpzIJer3Od7KpPKRWTwdkQBY7f2m3+5Ch8DvkHRUVxD
	zZ/5OGjfa+PIwe0TWI/mhp7AFze9Ndmz5kBFyImo6B+/4S4aWN6Nv0dj9khZriJfVkHR
	MiDytVbinWfssdxR3WDYsRW5W5pP1+ATnJEoY5I6n1+FRAcxcHHVcwTdMdJrFiHDcYYS
	k8XiHrh1gDshV05FmFQCpif0EWmg82SqZGF4IIX5NzDDDGm5+96uPgge0yy6cjY4GbXU
	GPEA==
X-Gm-Message-State: AFeK/H2RlfCWLQxzYwa0bjuswdCE32oWd4RoXw9we+jJEwV2NSQzZtxjtpvUxt9TZy3YKEU4FbSBgLHreJhIBw==
X-Received: by 10.107.50.71 with SMTP id y68mr23796860ioy.77.1490656562384;
	Mon, 27 Mar 2017 16:16:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.48.11 with HTTP; Mon, 27 Mar 2017 16:16:01 -0700 (PDT)
In-Reply-To: <20170327200929.2357-1-otavio@ossystems.com.br>
References: <20170327200929.2357-1-otavio@ossystems.com.br>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 28 Mar 2017 10:16:01 +1100
Message-ID: <CANwerB04wVBrfSPwrQ5wNxumbO8oKtfhnefAVDOxcJzNT1XQyw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] eudev: restore userspace firmware loading support
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
X-List-Received-Date: Mon, 27 Mar 2017 23:16:01 -0000
Content-Type: multipart/alternative; boundary=001a11447064e218d8054bbe8623

--001a11447064e218d8054bbe8623
Content-Type: text/plain; charset=UTF-8

Hi Otavio,

On 28 March 2017 at 07:09, Otavio Salvador <otavio@ossystems.com.br> wrote:

> From: Lauren Post <lauren.post@nxp.com>
>
> This sycncs eudev with systemd. This is required for old kernels to
> work and does same backport as did in:
>
> ,----
> | commit 31163abc7bedd477c1aad10e6d1f47dbee194513
> | Author: Jonathan Liu <net147@gmail.com>
> | Date:   Thu Mar 19 15:38:32 2015 +1100
> |
> |     systemd: restore userspace firmware loading support
> |
> |     This changes the minimum required Linux version from 3.7 back to 3.0.
> |
> |     [YOCTO #7409]
> |
> |     Signed-off-by: Jonathan Liu <net147@gmail.com>
> |     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> `----
>
> Signed-off-by: Lauren Post <lauren.post@nxp.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>

It may be a good idea to submit a pull request at
https://github.com/gentoo/eudev/ to upstream this into eudev as Gentoo
users have also experienced this issue in the past -
https://forums.gentoo.org/viewtopic-t-1011456.html. One of the goals of the
eudev fork is obtaining better compatibility with older kernels.

Regards,
Jonathan

--001a11447064e218d8054bbe8623
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Otavio,<br><div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 28 March 2017 at 07:09, Otavio Salvador <span dir=3D"=
ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavi=
o@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><span class=3D"gmail-">From: Lauren Post &lt;<a href=3D"=
mailto:lauren.post@nxp.com">lauren.post@nxp.com</a>&gt;<br>
<br>
This sycncs eudev with systemd. This is required for old kernels to<br>
work and does same backport as did in:<br>
<br>
,----<br>
| commit 31163abc7bedd477c1aad10e6d1f47<wbr>dbee194513<br>
| Author: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@gmail=
.com</a>&gt;<br>
| Date:=C2=A0 =C2=A0Thu Mar 19 15:38:32 2015 +1100<br>
|<br>
|=C2=A0 =C2=A0 =C2=A0systemd: restore userspace firmware loading support<br=
>
|<br>
|=C2=A0 =C2=A0 =C2=A0This changes the minimum required Linux version from 3=
.7 back to 3.0.<br>
|<br>
|=C2=A0 =C2=A0 =C2=A0[YOCTO #7409]<br>
|<br>
|=C2=A0 =C2=A0 =C2=A0Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net1=
47@gmail.com">net147@gmail.com</a>&gt;<br>
|=C2=A0 =C2=A0 =C2=A0Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@<wbr>linuxfoundation.org</=
a>&gt;<br>
`----<br>
<br>
Signed-off-by: Lauren Post &lt;<a href=3D"mailto:lauren.post@nxp.com">laure=
n.post@nxp.com</a>&gt;<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;</span><br></blockquote><div><br></div><d=
iv>It may be a good idea to submit a pull request at <a href=3D"https://git=
hub.com/gentoo/eudev/">https://github.com/gentoo/eudev/</a> to upstream thi=
s into eudev as Gentoo users have also experienced this issue in the past -=
 <a href=3D"https://forums.gentoo.org/viewtopic-t-1011456.html">https://for=
ums.gentoo.org/viewtopic-t-1011456.html</a>. One of the goals of the eudev =
fork is obtaining better compatibility with older kernels.<br><br></div><di=
v>Regards,<br></div><div>Jonathan<br></div></div></div></div></div>

--001a11447064e218d8054bbe8623--
