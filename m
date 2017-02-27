Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id 92A5F72FE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:57:02 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id l138so13033439ywc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 06:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fg0F+ZtpxOuGrtaMXmYPSgR/IF8F0oDAZtLBH6sFa4k=;
	b=Gvg3sDO9qDVtKvulWjUre+byejVcWjnE+ht4ulcp/kYylWAxW5ep2ysp/ROxfVe2Yl
	IdBJ6HvthjatISuLWsZDPWzJ2jR3w/zfK4oyLJe7IZXGU7xMWRhzM1y4juhKWqFFz3Vu
	Oy92BuOyUC3kZ/08s5tCzugbshAejGlbsDRl0Sz/EljDStXAREY2QZGD1+3Sp7fptBt9
	0n5FzdeHt8cqQS+dYrqHT1Vqx6yzOG4L7S1jtzBaxvx6vv5VhOqRicdqo5xkBURZ8NHc
	duS+JGqyQdOs9gx2KbJxYROT46mXlKIbPnFDPfCmRbC0qVue/VTou7wQ2rpxegT3YOoU
	lYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fg0F+ZtpxOuGrtaMXmYPSgR/IF8F0oDAZtLBH6sFa4k=;
	b=BK0gwJ+cEiwhVoERsgbskl09gke7V9QtnflVbz8EyJ/YbqqqhNJBXkhdwG1ZThC5OQ
	xWVYPn8j8N/Lf/eSGLoO/W+hlN0wJXXXfZ3y1shKt1Yt9GZvhKgVVm5nc8YYl1r+gW+j
	HxCHa+uGgPrmGwKGRMAe6j6Jrlv2VAFRjRjbA1aIzUCY+qizyJBCvSaA+dB/NfSpk7LK
	a8z8ojjQ3kfDXBQRmmaNBXhbbn2YkpBiWBlzudXruAcYBbMVvIV6ZM1oIZKIYAnD/thx
	PvzGrNj6DYIWAtvUlQz8iDi9Vow7EOXvYSmkhUCe3lru+APZWAAIQWMh/9bWQvzkHLeG
	MXrA==
X-Gm-Message-State: AMke39kxCRgdCr9zMpLT/hKFxFRSFFdZin0a5Zb/D1Ek9DEsHX+rDnCQZpzXXFVkSqNdndT1JImgKKYXa0nNEUVq
X-Received: by 10.37.200.68 with SMTP id y65mr11637551ybf.51.1488207423302;
	Mon, 27 Feb 2017 06:57:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Mon, 27 Feb 2017 06:56:32 -0800 (PST)
In-Reply-To: <CA+chaQcSpX=a77jcg1-D7Uj30ukOto2gpuemf9JMCpZ0n9m3jA@mail.gmail.com>
References: <cover.1488125460.git.jussi.kukkonen@intel.com>
	<03b310a8701ba7a927c8de949af9398d5739e8a8.1488125460.git.jussi.kukkonen@intel.com>
	<CA+chaQcSpX=a77jcg1-D7Uj30ukOto2gpuemf9JMCpZ0n9m3jA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 27 Feb 2017 16:56:32 +0200
Message-ID: <CAHiDW_FbTEr8BZysykOVDqbHy930vxnuGJCpxLVcyaF2sVRr=A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] vkcube: Add recipe for minimal vulkan demo
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
X-List-Received-Date: Mon, 27 Feb 2017 14:57:03 -0000
Content-Type: multipart/alternative; boundary=001a114ff28ad1f9270549844a83

--001a114ff28ad1f9270549844a83
Content-Type: text/plain; charset=UTF-8

On 26 February 2017 at 20:15, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> > +PV = "0+git${SRCPV}"
>
> https://github.com/krh/vkcube/blob/master/configure.ac#L1
>
> says 0.1 since the very first commit, why not use that as base version
instead of just "0"?

I've fixed this in the branch on poky-contrib.

I also added a source file to vulkan LIC_FILES_CHECKSUM (since there were
none).

Thanks,
 Jussi

--001a114ff28ad1f9270549844a83
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 26 February 2017 at 20:15, Martin Jansa &lt;<a href=3D"=
mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>&gt=
;<br>&gt; &gt; +PV =3D &quot;0+git${SRCPV}&quot;<br>&gt;<br>&gt; <a href=3D=
"https://github.com/krh/vkcube/blob/master/configure.ac#L1">https://github.=
com/krh/vkcube/blob/master/configure.ac#L1</a><br>&gt;<br>&gt; says 0.1 sin=
ce the very first commit, why not use that as base version instead of just =
&quot;0&quot;?<br><br><div>I&#39;ve fixed this in the branch on poky-contri=
b.</div><div><br></div><div>I also added a source file to vulkan LIC_FILES_=
CHECKSUM (since there were none).</div><div><br></div><div>Thanks,</div><di=
v>=C2=A0Jussi</div></div>

--001a114ff28ad1f9270549844a83--
