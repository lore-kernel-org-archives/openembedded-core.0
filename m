Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2A03B71440
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 16:42:39 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id x3so1135886qcv.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 08:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Dp+6Ji858QR3FaQ/kPgs+edV4Y/12dmJn5m2E9BLJfo=;
	b=Il+G0qV+qSbC0UvKwGWg/nDEWX0UHWIMX5bRwp/44JPOv1V5xwuNg9yWwUHuUXkuiz
	byliEFK9lcK6sAYLdmjH+kxZQJsvAUrCA0nv9JocUolCUzz6lg90DkIgLD/CmdPvfVnr
	S54eX7nJne1OvyvyuXCgM17Gh96g34G5astLbtsTrbA2zsmrwD7zSbm1yDLETlbWgcF7
	JQdsaYBaF6f4bLnrigWzL560zeDZFIizfWVoLafsPDg/rvdNAYgH/hx7jneikyE+3aKn
	m8n/QT7VsQFs+tIzm1Nm0tQVM1xeSpnowBzedLtRQCdF0QzyTBbKZyVKrRxHXw03/zGd
	OFkw==
X-Gm-Message-State: ALoCoQkPAlSLvTKczZj8nYYPHU1uFknZ9BhY291rbNKh8SFLrvFUscBj9cvx1aTTMIMkbDgb9Tl/
X-Received: by 10.140.21.80 with SMTP id 74mr5787756qgk.87.1420648959340; Wed,
	07 Jan 2015 08:42:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 7 Jan 2015 08:42:19 -0800 (PST)
In-Reply-To: <1420233904-26745-3-git-send-email-max.oss.09@gmail.com>
References: <1420233904-26745-1-git-send-email-max.oss.09@gmail.com>
	<1420233904-26745-3-git-send-email-max.oss.09@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jan 2015 16:42:19 +0000
Message-ID: <CAJTo0LZjDPRQ6ymgUyt1ETo_b8ncV28yvt5TPD8JQXh_-zZ-eg@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCH 2/3] menu-cache: update to 1.0.0
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
X-List-Received-Date: Wed, 07 Jan 2015 16:42:51 -0000
Content-Type: multipart/alternative; boundary=001a11c131a4928e43050c129caa

--001a11c131a4928e43050c129caa
Content-Type: text/plain; charset=UTF-8

On 2 January 2015 at 21:25, Max Krummenacher <max.oss.09@gmail.com> wrote:

> +SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/${PN}-${PV}.tar.xz"
>

Don't use ${PN} as in multilib environments that isn't what you expect:

DEBUG: Fetcher failure: Fetch command failed with exit code 8,
output:http://sources.openembedded.org/lib64-menu-cache-1.0.0.tar.xz:


BPN is PN without any magic prefixes, so use that in variables like
SRC_URI.  For convenience, ${BP} is ${BPN}-${PV} so you can use that in
SRC_URI.

Ross

--001a11c131a4928e43050c129caa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 January 2015 at 21:25, Max Krummenacher <span dir=3D"ltr">&lt;<a href=
=3D"mailto:max.oss.09@gmail.com" target=3D"_blank">max.oss.09@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex"><div id=3D":5uy" class=3D"" style=3D=
"overflow:hidden">+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/lxde/${PN}-${PV}=
.tar.xz&quot;<br></div></blockquote></div><br>Don&#39;t use ${PN} as in mul=
tilib environments that isn&#39;t what you expect:</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra"><pre style=3D"padding:9.5px;fo=
nt-family:Monaco,Menlo,Consolas,&#39;Courier New&#39;,monospace;font-size:1=
3px;color:rgb(51,51,51);border-radius:4px;margin-top:0px;margin-bottom:10px=
;line-height:20px;word-break:break-all;word-wrap:break-word;white-space:pre=
-wrap;border:1px solid rgba(0,0,0,0.14902);background-color:rgb(245,245,245=
)">DEBUG: Fetcher failure: Fetch command failed with exit code 8, output:
<a href=3D"http://sources.openembedded.org/lib64-menu-cache-1.0.0.tar.xz">h=
ttp://sources.openembedded.org/lib64-menu-cache-1.0.0.tar.xz</a>:
</pre><div><br></div><div>BPN is PN without any magic prefixes, so use that=
 in variables like SRC_URI.=C2=A0 For convenience, ${BP} is ${BPN}-${PV} so=
 you can use that in SRC_URI.</div><div><br></div><div>Ross</div></div></di=
v>

--001a11c131a4928e43050c129caa--
