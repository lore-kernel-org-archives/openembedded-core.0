Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
	[209.85.222.49])
	by mail.openembedded.org (Postfix) with ESMTP id 17BC77E467
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 10:37:36 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id 59so8745017uap.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 02:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UFGtUO9OsWA7m74AdjScrO8vVZE2J2G+4c0cYvlz4j4=;
	b=SNoByQDE74ZTutXUjxOL1Y10wEc7mTxTupHr3HUOCuInayEaUJF9TuIpxBmAA5pl2M
	pNzdoKQKTG9rrnNBecPxF8sTTniXvM/+KieBYNelH5zRd0ZyewAm8ksRm2S26Vebasd0
	7x60UIO6KL+MLisg7N948j+cgFU9blb0y9nnW2vcVqIqZBfmI4IhtIhVsJVW80b6BBhU
	2sPOgrer/IJSvv5h92AdmtaSGiXjuUF4cFGjAvnsVMLgokNhOBPexAO2HuJ7DdlyJIRe
	wlV/LDe5ONttHaoCGCTB82jFKTbRrof7SBgLLyMHhLKmuQmr19l3z40iFHpJ80WE+EEn
	/INA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UFGtUO9OsWA7m74AdjScrO8vVZE2J2G+4c0cYvlz4j4=;
	b=LQP9JGa08aoxJnCbD7XiYvtP5mI13JecnjGBlbUx2LnTMUGrhJcusX3Pvyyfqcz46q
	30a8F0N0TnGMH3N+YR6sIjOU5zIFfoW9+af1VC0npaKos6AR9PwK8H6DqAnd0agSQDqd
	4UU/jlUUYERzwUPlB9Smu9+uJRy8rA0WSnnxvR5q4l8db0Wd97Xl8AK6KUxqj3Tw+9/h
	KFQZ1m3BQwzvOWA+d+FSMG5pAfRmgnENPI7uwBtrhoPK0QclgtDy49+r+VOV5G3V8mkv
	n6VDLA1yQPFG9YK8Ee59hcAQQ2uRl1QGU/NAejWA4qwFGYq0xi23cYcPV43FYQqzdBJQ
	VrTQ==
X-Gm-Message-State: APjAAAVFKcPGok59E0s0psYtytyyjJlBUpjV0+qMEB9lLzbf3Lx+kyp1
	ryC/OXDE7SoWy3mWHK669GI39ZFBr+I+xzmErtsDTg==
X-Google-Smtp-Source: APXvYqxEZhVNt8HBC0c6+y9XeDID/pO4PUy2PdyM8O/VYHHqIPo0x98Y3+5gf0NC/tz5yYD9W6ibFhj9j9COSwNf4wc=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr22080658uak.22.1579257457023; 
	Fri, 17 Jan 2020 02:37:37 -0800 (PST)
MIME-Version: 1.0
References: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Jan 2020 11:37:26 +0100
Message-ID: <CANNYZj-QgS9n7sNS1W0i843DqFyM6imwmZvnvQ2D=S+XAHk0Ew@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 17 Jan 2020 10:37:36 -0000
Content-Type: multipart/alternative; boundary="000000000000bc1ff1059c5387dc"

--000000000000bc1ff1059c5387dc
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2020 at 07:59, Sumit Garg <sumit.garg@linaro.org> wrote:

>
> --- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> +++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.x.org/"
>  BUGTRACKER = "https://bugs.freedesktop.org"
>  SECTION = "x11/apps"
>  LICENSE = "MIT-X"
> -DEPENDS = "util-macros-native virtual/libx11"
> +DEPENDS = "util-macros-native virtual/libx11 gettext-native"
>

Would 'inherit gettext' do the trick here? Depending on full gettext is
undesired as it is slow to build; we ship a minimal gettext to mitigate
that.

--000000000000bc1ff1059c5387dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 17 Jan 2020 at 07:59, Sumit Garg =
&lt;<a href=3D"mailto:sumit.garg@linaro.org">sumit.garg@linaro.org</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc<br>
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc<br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.x.org/" rel=3D"nor=
eferrer" target=3D"_blank">http://www.x.org/</a>&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://bugs.freedesktop.org" rel=3D"=
noreferrer" target=3D"_blank">https://bugs.freedesktop.org</a>&quot;<br>
=C2=A0SECTION =3D &quot;x11/apps&quot;<br>
=C2=A0LICENSE =3D &quot;MIT-X&quot;<br>
-DEPENDS =3D &quot;util-macros-native virtual/libx11&quot;<br>
+DEPENDS =3D &quot;util-macros-native virtual/libx11 gettext-native&quot;<b=
r></blockquote><div><br></div><div>Would &#39;inherit gettext&#39; do the t=
rick here? Depending on full gettext is undesired as it is slow to build; w=
e ship a minimal gettext to mitigate that.<br></div></div></div>

--000000000000bc1ff1059c5387dc--
