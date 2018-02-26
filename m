Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0A39C780F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 14:49:20 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id o9so11043809itc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 06:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g+aBy3NaHWWYMLmfVgZLZLWZnm/qwANrEa2rDbZVCZk=;
	b=CXftmgciy7wKrKBSkPt+JVgQfkdA60OwRfyLwmQiOGLN4VIA8riFVvY8i7fYo3EuSV
	HD3FK3Dy6Q44MMvSv8A2hyHhOEgj5kslEckWAC0NTwvcGW/kbc8b9unkZ0+iBWYYrIQF
	BsKHci8BQb3w84NozudUK0VFwxnT6TE9x7ivaGoPyJkRq8U/aAoWxmmifmdVvi17nTsi
	NiwIYuk6r4vlYmnyvatlE7n2/wYuNS5qxdSV1vcQqoIFpZw3PMYVlqTMH/dKe9J3wNEW
	Ne05ZGDU/kcpwERFF5LVqFsLuaIPioC+5RUah9FwWlnc9JK7yV3VCP1p+7fl94ac8opf
	zQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g+aBy3NaHWWYMLmfVgZLZLWZnm/qwANrEa2rDbZVCZk=;
	b=hnmUkQNsBx4uMnleNTwZ4UAnuL9EWMIyR1XD9U3ufhgPCzcGsCmAQ30zlqf5SH6mj9
	VXk46yH0mQOS35TGlEewIsk3KHmsg3cDJ1p+SmFZ105Fg8QrzsjT4tW1em83RmopEWEN
	VYxNhSAQUDIyfTAuwfyzOYXlzlO+w7nkBKKYwrJjAjRCYA2xrMtw21c8Qqd1IWKet+5o
	4P4VhFlAxvfVZYUjQm2BNHULPKFk78krtSwSjptkJRobRWhRzt0P2zNKSgXsUrFXLTRt
	Qh/bSdlK8CPw4YA5Ajs+yZgkJDlC4m1E4Bs3FYI9RAdWKuc/NnxsNKblzHfssXWBFcKP
	0uyw==
X-Gm-Message-State: APf1xPBDnRMK8J+fdMmGxLwJ80YlaQJwoAX56YkrGtGQK9UTIwAVnK8D
	nAD2rK8qOKiZjpiAGQgG55VHbzHmUVlsa4jW1DaUJCkc
X-Google-Smtp-Source: AH8x225cwnRGZtq/8XT7QD7ezM4e18UA2GAcBMLG6Bos8pAjelmzXUsI1JIslLjMnuS62i5E9SZ9psoL3zesgNRVaWY=
X-Received: by 10.36.185.24 with SMTP id w24mr12522160ite.127.1519656561927;
	Mon, 26 Feb 2018 06:49:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Mon, 26 Feb 2018 06:49:01 -0800 (PST)
In-Reply-To: <a469d763-d304-5808-30c4-533188aa28f3@pseudoterminal.org>
References: <a469d763-d304-5808-30c4-533188aa28f3@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Feb 2018 14:49:01 +0000
Message-ID: <CAJTo0LZ93onx1jxN=8a8scFGVUVhYYLYq8OdNYSv_CQjQkM0YA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding recipe to DEPENDS only if mesa provides virtual/opengl
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
X-List-Received-Date: Mon, 26 Feb 2018 14:49:21 -0000
Content-Type: multipart/alternative; boundary="f403045d9a508e0eb005661e9d05"

--f403045d9a508e0eb005661e9d05
Content-Type: text/plain; charset="UTF-8"

You could look at the value of PREFERRED_PROVIDER_virtual/libgl but
considering I've seen GL implementations being almost-mesa and providing
gbm I suspect you should have a PACKAGECONFIG that you can set from your
machine/distro configuration.

Ross

On 25 February 2018 at 13:30, Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> A recipe here has support for Mesa 3D GBM based EGL contexts (which is
> needed for rendering directly to KMS framebuffers). However, this also
> needs libdrm.
> I'd like to detect that the provider is Mesa3D, and if so, add libdrm to
> DEPENDS.
> Perhaps it is possible to detect that libgbm is available, and I can use
> that to decide whether or not I need to add libdrm to DEPENDS?
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045d9a508e0eb005661e9d05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You could look at the value of=C2=A0PREFERRED_PROVIDER_vir=
tual/libgl but considering I&#39;ve seen GL implementations being almost-me=
sa and providing gbm I suspect you should have a PACKAGECONFIG that you can=
 set from your machine/distro configuration.<div><br></div><div>Ross</div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 25 Februa=
ry 2018 at 13:30, Carlos Rafael Giani <span dir=3D"ltr">&lt;<a href=3D"mail=
to:dv@pseudoterminal.org" target=3D"_blank">dv@pseudoterminal.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">A recipe here has support fo=
r Mesa 3D GBM based EGL contexts (which is needed for rendering directly to=
 KMS framebuffers). However, this also needs libdrm.<br>
I&#39;d like to detect that the provider is Mesa3D, and if so, add libdrm t=
o DEPENDS.<br>
Perhaps it is possible to detect that libgbm is available, and I can use th=
at to decide whether or not I need to add libdrm to DEPENDS?<span class=3D"=
HOEnZb"><font color=3D"#888888"><br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403045d9a508e0eb005661e9d05--
