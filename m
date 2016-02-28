Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id F3D9B77217
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 23:24:34 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id l127so170076933iof.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 15:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YyjKMBVlMUWRv9pBBWGW7Ah6qiCFgW+r8/hqLqL0izQ=;
	b=ueTduAuvEdHkYscMStrOhOl4G7WH4zvAK8zgkiNnqI+ZPcZ0zXXl3b+BodZEXMAkF4
	L5BX6f4oB8FNc+8gXUOxl84QR5qXMsAOyVbF33+FaFoKHpWMMk0spsPYhYJPEls4cxOU
	1exTh2Cjy1xHBrfbvPZqaQOvDxWnUTi7LM+KNcuItQwHIK3xXuNkJ+WHYvnwkUKMtoNQ
	Fh1Ea9rQYvhKTG0tsS4oYsuQbVqvSHDbVEjE/LjRvK0qG+wieT6pmEcO6OXioLpf+gct
	U+Mi3TmvMcgj8v3bmGXlNBUhl7cN2HecM+YnTp6F/yYBX6hPDJgvKej06/NBgcZqwqNN
	Rl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YyjKMBVlMUWRv9pBBWGW7Ah6qiCFgW+r8/hqLqL0izQ=;
	b=lVmttWaN+wmLnl3qeCQlRyRWPXj8O29FSkRtX4WmE/DhE55IDYicX0hVzszSCqi0Qj
	xPiDiHdrbOHWKM6p621NXFylXQJMdZ4hkknzk8/EoM2ZFhWuLK7zoAhZlrX22wEWfcj9
	XvFkj/u7yMXjcf89w9/a1s2H9aY0KSqrBXsPFnw8OPkcZvRQHAWokyyz7r9JcKJE4BAp
	jA8de2cEgI9P7AUICbODZrzReKIHm+39b5g8xKcZFunotwmNsnt9FDyuvXRwWrZelpST
	aRKptlOIDhouOVA6RE9sCFvBTfSQj+x78aIOcl3F9tFS7mC8cTUTyksBHIA/jgFtEkvk
	FAVQ==
X-Gm-Message-State: AG10YOTPeodJ2V1bT8+1h5qotbwacRHBoynEcC/9YG+OOSx2foKPdEqX2ztSUzRn7KKT3JlALe/tZ5ftKw2SghbB
X-Received: by 10.107.3.220 with SMTP id e89mr15632834ioi.99.1456701874808;
	Sun, 28 Feb 2016 15:24:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sun, 28 Feb 2016 15:24:15 -0800 (PST)
In-Reply-To: <898F5FB0-0062-4647-8A7A-1DE402384A75@gmail.com>
References: <898F5FB0-0062-4647-8A7A-1DE402384A75@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 28 Feb 2016 23:24:15 +0000
Message-ID: <CAJTo0LYt_SVFavOCtZmdcXcgZBarR+RMArwA_MJn7Amiy4iZuw@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] avahi: make dbus optional but default
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
X-List-Received-Date: Sun, 28 Feb 2016 23:24:35 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7ccabeba052cdcd51f

--001a113f0e7ccabeba052cdcd51f
Content-Type: text/plain; charset=UTF-8

On 28 February 2016 at 11:39, Jens Rehsack <rehsack@gmail.com> wrote:

> +PACKAGECONFIG[dbus] = ",--disable-dbus,dbus"
>

Add --enable-dbus for clarity, please.


> -       rm -rf ${D}${datadir}/dbus-1/interfaces
> -       rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
> +       ${@bb.utils.contains('PACKAGECONFIG','dbus','rm -rf
> ${D}${datadir}/dbus-1/interfaces','',d)}
> +       ${@bb.utils.contains('PACKAGECONFIG','dbus','rmdir
> --ignore-fail-on-non-empty ${D}${datadir}/dbus-1','',d)}
>

The interfaces files should probably be installed in avahi-dev as they're
genuinely useful, and then I think the rmdir --ignore-fail-on-non-empty can
always be executed.

Ross

--001a113f0e7ccabeba052cdcd51f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 February 2016 at 11:39, Jens Rehsack <span dir=3D"lt=
r">&lt;<a href=3D"mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail=
.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">+PACKAGECONFIG[dbus] =3D &quot;,--d=
isable-dbus,dbus&quot;<br>
</blockquote><div><br></div><div>Add --enable-dbus for clarity, please.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">-=C2=A0 =C2=A0 =C2=A0 =C2=
=A0rm -rf ${D}${datadir}/dbus-1/interfaces<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir --ignore-fail-on-non-empty ${D}${datadir}=
/dbus-1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;,&#=
39;dbus&#39;,&#39;rm -rf ${D}${datadir}/dbus-1/interfaces&#39;,&#39;&#39;,d=
)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;,&#=
39;dbus&#39;,&#39;rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1&#3=
9;,&#39;&#39;,d)}<br></blockquote><div><br></div><div>The interfaces files =
should probably be installed in avahi-dev as they&#39;re genuinely useful, =
and then I think the rmdir --ignore-fail-on-non-empty can always be execute=
d.</div><div><br></div><div>Ross</div></div></div></div>

--001a113f0e7ccabeba052cdcd51f--
