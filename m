Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id A634E77A6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:28:43 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id u75so14766147qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S5ZZiETMLyOexHSc7FpUTq03b8hh7Pm4A7crO25o9uc=;
	b=IJewKg1f2VQIqbQDLOw9NnhUxDuyF7WuzfmxJ0t7UBMN6mRJjqHgrOdCm12l0MhLbI
	U/7VGLiaRWotf7MBXQnGYS+PizmiTtE/S75EhBuKOmTjJP8kCzM9Tys2U1AQowlsm5ao
	QEIpB5JfrmTOGYIhoPGsoaCYu2Hoy7TzyGkJtYFcmalVcGlbb7J3iU5tj7TcU41mxNe0
	8dwzZIoM3Y92E/Fjb7Mq0K0DZzVNgDYmi0TsOQRysRoVKZUOu9/uJdtG9uFeI9K+OUpf
	8Gs+iKspMN2wM0HxPn4e+L6pW2k/KNf9wIA8eAysfodJPKYwcLdsf1o4cq9JL79XTlmZ
	85kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S5ZZiETMLyOexHSc7FpUTq03b8hh7Pm4A7crO25o9uc=;
	b=ukRioOOUihj8sxGQw7jjOoca1hmTid0WTh2owzGXEkgu+yjQhmcDAlfYNoEodjuwKg
	8Uw+0u5l2h6T+F7KUEiAVAPL6SiFuOSzUopaLi7Ymf7ZhuoJduRPorSEdSVeznKtuEo/
	iSU9Lj+EATXoKydX+6Usw4LjSnhpREl2VTb8vjPVb/s/jsRDXHM7kDU/nJfT0EvLI/4+
	aOnQMQ587RiFQm/sOg3rijTDhINYsKRVkgGC65+OZ83KJP8N+l4oCAv6oGTsUVV2y+k3
	1Ue/E0dJtNYx3uylJQxqoTYAgEqzFb7G7PjbGw5jfIDbJ9UFtJxhyNWtnmy9ZXAIqXKB
	q1Nw==
X-Gm-Message-State: AN3rC/61Q9NI8UjMj2cjUGPBXddVggWiM8HSId4bq7RzIMelWWSrrZxY
	PxO8em6imswE39ZFIP11MzKcdH3if5KU
X-Received: by 10.55.17.224 with SMTP id 93mr22007070qkr.244.1493026125390;
	Mon, 24 Apr 2017 02:28:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 02:28:24 -0700 (PDT)
In-Reply-To: <1493020723-49403-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1493020723-49403-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 10:28:24 +0100
Message-ID: <CAJTo0LbryERzUb_ZRcJgOFSP7zKMos8iqYAfymRvDrDn9n_hfg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgpg-error: 1.26 -> 1.27
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
X-List-Received-Date: Mon, 24 Apr 2017 09:28:45 -0000
Content-Type: multipart/alternative; boundary=001a1135cbccd83cdd054de63bd4

--001a1135cbccd83cdd054de63bd4
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 08:58, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

>  PR = "r1"
>

As you're doing a version upgrade, the PR assignment can be deleted (r0 is
default).

Ross

--001a1135cbccd83cdd054de63bd4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 08:58, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mail=
to:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":492"=
 class=3D"a3s aXjCH m15b9ef90756e5662">=C2=A0PR =3D &quot;r1&quot;<br></div=
></blockquote></div><br>As you&#39;re doing a version upgrade, the PR assig=
nment can be deleted (r0 is default).</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1135cbccd83cdd054de63bd4--
