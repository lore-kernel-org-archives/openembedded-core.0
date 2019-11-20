Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2204E7F80E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:16:51 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id d10so5926939vke.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 03:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+hxJGHWRqDGBTiebb5styjbl6WJYpMxTmno6gfjgEY8=;
	b=i+m3Y2ywZvaeNPz/LiloAHV4XLq8NouLInHV+G4pOi8I2gnA59KBce0v/rpda1N1JL
	NStjInWAZAxqljWlCJTPosiBDLHH5UC+7GaG5t105T7zlPcP3Z0ji0IvWsw9o4/YcYms
	kTO2nV/KqO12aWOU9/KH+XA09r09J7qoksVdt4F1OfTjRMOqLCeY6pBcncwfISGcMobN
	bUDZ6HS3xUleC53tmcysGJgWDG3gyA8MvIWA8TUwYzQO8qtAPIWkAsylUdFla7Tbyc8s
	fSzMzbTdxSomYZsqCC2okmP5CBEOGQRd7nAjS17twibTBXOvq2G3jQpGJrHyladgFj5L
	yd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+hxJGHWRqDGBTiebb5styjbl6WJYpMxTmno6gfjgEY8=;
	b=AN0xP+4r0HGxL6meolGE4T7r16mSxsNefUkFZKKIs0SeY4nv+XcQNAee/IAHXmSHz4
	fftOD1nP6msuvHT3ayMyjAzdupWcgFmEZUoUCnHGfp1hPBqVvmCZN9VBk5dUy3RcBW1J
	7RE7ACdAO2gskdgMeKI05D4boXbWyTpeTpEYPK1Lzgo9RBpTcPvpAo1KWxgYNxBIqG4C
	Zu66qRS4yIc6xevM3KgICDdzJf7mrwrbUyFiLXC9wSQWfM+JdUNhGNxca4pxtGMTg4S+
	gDZoa/vv632maJHRPXOWzxT0LU+w5Xg4AteNexMIcwuyM+DcFnx2xzGuIyVsCGoyUkWg
	uuLw==
X-Gm-Message-State: APjAAAV71t51zX/BBDYxeCReJ8kts39IujoQUSroMDrGQxkdEcrZAjIB
	X/rTe0TaBdnIsIdBkZMDEirTckp/pYBpRoxwq3Y=
X-Google-Smtp-Source: APXvYqwugGorWmtAe/HzD4cReHdHijHynBolu0gnAtdh7xZYJDX6FRTbV1ys4KnlNf9WjenM3QwDkCiMwXlpEywDhww=
X-Received: by 2002:a1f:22d5:: with SMTP id i204mr1109190vki.0.1574248612839; 
	Wed, 20 Nov 2019 03:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20191120051704.24066-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191120051704.24066-1-zangrc.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Nov 2019 12:16:40 +0100
Message-ID: <CANNYZj9Xhm3ciQZQjSy6-sGamkQTFxT0K2QZ=k0ncwnWXYuMZw@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib:upgrade 1.1.9 -> 1.2.1.1
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
X-List-Received-Date: Wed, 20 Nov 2019 11:16:52 -0000
Content-Type: multipart/alternative; boundary="0000000000005b463f0597c551ed"

--0000000000005b463f0597c551ed
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 06:17, Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> +From f419276a716daf8d98846b3df50995e5ac030134 Mon Sep 17 00:00:00 2001
> +From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> +Date: Wed, 20 Nov 2019 11:24:17 +0800
> +Subject: [PATCH] Fix problem with libtool not found
> +
> +Upstream-Status: Inappropriate
>

Why inappropriate? To me this seems like a real problem and should be
submitted upstream.

Alex

--0000000000005b463f0597c551ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 20 Nov 2019 at 06:17, Zang Ruoche=
n &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">+From f419276a716daf8d98846b3df50995e5ac03013=
4 Mon Sep 17 00:00:00 2001<br>
+From: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.com" targe=
t=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
+Date: Wed, 20 Nov 2019 11:24:17 +0800<br>
+Subject: [PATCH] Fix problem with libtool not found<br>
+<br>
+Upstream-Status: Inappropriate<br></blockquote><div><br></div><div>Why ina=
ppropriate? To me this seems like a real problem and should be submitted up=
stream.</div><div><br></div><div>Alex<br></div></div></div>

--0000000000005b463f0597c551ed--
