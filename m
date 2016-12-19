Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3AEA26011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:25:33 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id u25so681960qki.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XzBp+N2m1/z2pcvFu2fvBTrHZbTe5F38ATxGTKHHdAE=;
	b=aZLIC7hnfji1lJXyNpfKVv0SR2RxnjD7U3TMcVTx+HFD5qXoG/wRi0ni5OJ2uufKyi
	Y/37OTQ6CqYbQt/5I56/zShCHfbNPKCnICRHG+yLT4OAAAYsiyb4BAMrJazkBF0p+wBv
	IZ3lqw4OAL8AGeiKyNnXQvEX3UApqLmbzVRFDgr20toT20WKp0lhYZjCevyH/8t/gTNc
	3oRb1FmKZYgOHqizd1GY7gJxS/VvPhJqay76lKeLZ6hFW2IE4z1j/Kw4wEl5CJhkj83L
	SjlEhNMwXG7C/NXGPiuNwJzc/GxcpZnEsgYFeS7xixrfj1CVaqHy59nB++QOHcLgfVZm
	FvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XzBp+N2m1/z2pcvFu2fvBTrHZbTe5F38ATxGTKHHdAE=;
	b=ZpyRjquMZNcN90WraQ+pEcBTNqb6F/v5khDqqFnlxvj5XDO+3eN6xZa/axAYkK7l4E
	34kE64fLwb3T3GjUS5bFAK/reo0CfGm+39xqQiWyuQjftYQXFpOgpSWOF6+bTBlQiqzH
	t3Ze7MEaoVn/sNcPfz76l1usUa/EMxrm9CYPLnPIh/CjyLp2UsKI0DC/F/l+6TE3hvlJ
	QqmqJApemWgTNHR6y+sBgtJdDync5mBPlQl+L22muvujqt7MKrwIeJsZovCmiCTcnj5f
	1KOQzwXLh42mi6Zp7+Y7SgW0oWatTyvQSsxU8hlg9eF21Kkn4WhyVr1e1NLlCwgKFAvQ
	z8Iw==
X-Gm-Message-State: AIkVDXLIkse3dHtjBNa7pyE/4grwSALWs7Eq2ArHaNAVp6rX4HuYUhlPhNTYDdwRXjo+Rl7zcjBzAgx7x8MOE5t4
X-Received: by 10.55.31.24 with SMTP id f24mr2195120qkf.221.1482146735132;
	Mon, 19 Dec 2016 03:25:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 03:25:14 -0800 (PST)
In-Reply-To: <CALbNGRQ+hDgM+AsRFq3YYidr4S-7yDXbx+abbfA5tpLqKTD9JQ@mail.gmail.com>
References: <CALbNGRThWRoOfZjN1BaQpT2hAGzuRCfHUnfG89gxQcDE=6cgUw@mail.gmail.com>
	<CAJTo0LZbgGV9kd0bw8jGgfg0kLbJn0ANgETon7_gJxG5fWML7g@mail.gmail.com>
	<CALbNGRQ+hDgM+AsRFq3YYidr4S-7yDXbx+abbfA5tpLqKTD9JQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 11:25:14 +0000
Message-ID: <CAJTo0LawS5UMdCeXmzg=Ff0N+8H7MKGB9wwwn0iQaXwnK0stWw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: 'From OE-Core rev: <commit-id>' in recent master commits
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
X-List-Received-Date: Mon, 19 Dec 2016 11:25:35 -0000
Content-Type: multipart/alternative; boundary=001a1147e2baa72acb0544012d37

--001a1147e2baa72acb0544012d37
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 December 2016 at 11:22, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> commit c87361fc886432a9db584712bf3e41ecd0541960
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Thu Dec 15 17:19:46 2016 +0000
>
>     lib/oe/package_manager: bail if createrepo can't be found
>
>     If createrepo isn't found then the errors later are mysterious, so
> explicitly
>     check and error out early if it isn't there.
>
>     (From OE-Core rev: e09636bbb3ea8ec58984197fd9c691bb908efe00)
>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

Looks like there was a bit of mess with patches going from Richard's poky
clone's master-next to my poky clone's mut branch back to oe-core master.
I believe Richard generally ensures these get stripped out but obviously
this didn't happen.  Human error, sorry!

Ross

--001a1147e2baa72acb0544012d37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 11:22, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":1xo" class=3D"a3s aXjCH m15916d2359ac387c">commit c87361fc886432a=
9db584712bf3e41<wbr>ecd0541960<br>
Author: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burto=
n@intel.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Thu Dec 15 17:19:46 2016 +0000<br>
<br>
=C2=A0 =C2=A0 lib/oe/package_manager: bail if createrepo can&#39;t be found=
<br>
<br>
=C2=A0 =C2=A0 If createrepo isn&#39;t found then the errors later are myste=
rious, so<br>
explicitly<br>
=C2=A0 =C2=A0 check and error out early if it isn&#39;t there.<br>
<br>
=C2=A0 =C2=A0 (From OE-Core rev: e09636bbb3ea8ec58984197fd9c691<wbr>bb908ef=
e00)<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<=
/div></blockquote></div><br>Looks like there was a bit of mess with patches=
 going from Richard&#39;s poky clone&#39;s master-next to my poky clone&#39=
;s mut branch back to oe-core master.=C2=A0 I believe Richard generally ens=
ures these get stripped out but obviously this didn&#39;t happen.=C2=A0 Hum=
an error, sorry!</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1147e2baa72acb0544012d37--
