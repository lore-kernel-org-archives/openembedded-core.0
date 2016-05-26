Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id D934E60796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 19:15:08 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id z123so51826406itg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fw64p+QAsKuqKbjX0jcfnih9HCu6J52xhRofjX/QTF0=;
	b=QDVFMLCGOpceWKVu0cxxfd+J+KbmIhaSLWTSdkPXVNG87g0ufAn5QesVmUJTcIOmvm
	muJL32q69F5mlbVi7dTL4N1vJlEE/PSfihZ2+j5hxnKsh9lW0F9P/XDtiLanr5usfDNS
	i+plxAJRvoC83DjwcPfEtwGV8X3R4e+tDCeFz7s6iWWhuz7VUM1AXHowL68356t/Ya4D
	jXrB/eF9Jo/z3vIb91NZ2T2QBU/H9l07FRaM9h+NUoIDl+vvbjsS3NOWFo2Hy/RVnlKI
	6SlT7WTm9sOwe8+a/4j3AHMzv37W20cuCkpyxa40OeQfWnzWyhRSkYu91Lo9Ll1V5FEp
	ENaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fw64p+QAsKuqKbjX0jcfnih9HCu6J52xhRofjX/QTF0=;
	b=EHFvvzDHn4BfoninDtXPV6Xqw4wcZicmtV9EV4nym5OWN8kLUcyY7I2mxG0V8JnHrt
	MnB61SAopA+P2eQDBRNX2eVBuxEVPscOn/6e0tvM0pgE0pzTlsCH/E+ufyl4u/9XfBpI
	ItGN+559A/mcGLW4uL4aWI2cc/uty+WuSGVOpu8c7WuzXOhKsZdFoSoqtJIhXsydZ/Nn
	VvJCujyldVef6rJlFn4pBuYVfCtHQ9IpMOe5fvifwKLtcOQiMK8b3W3oyOjttktXH4zT
	QZ1RXae1gSITWIozTyrPLQygpaNWbBUJK3mLFQ5HCiPI1y4ybrGh2xXhLrlD8puHcP2m
	p5sw==
X-Gm-Message-State: ALyK8tJMdSrCwdJQcz25IXatm7Pr1ObaLO1gXs2po3cauWuvvemYAJwZhVsR26ijmJuGyUPEmL7MhYVQaYV0zhod
X-Received: by 10.36.120.12 with SMTP id p12mr4698320itc.22.1464290109402;
	Thu, 26 May 2016 12:15:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 26 May 2016 12:14:49 -0700 (PDT)
In-Reply-To: <CAJTo0LZB4hGFdGoavFwxgWg2bvj_7nPEWyT4c=jfjx-=wRKcJw@mail.gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<20160526172357.GB2575@jama>
	<CAJTo0LZB4hGFdGoavFwxgWg2bvj_7nPEWyT4c=jfjx-=wRKcJw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 May 2016 20:14:49 +0100
Message-ID: <CAJTo0LaRKxBn_fVuPsk9ANo6VrvGr071VWK7GPea-F5ciPazYg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Thu, 26 May 2016 19:15:09 -0000
Content-Type: multipart/alternative; boundary=001a114ab6cad1d2070533c39bd2

--001a114ab6cad1d2070533c39bd2
Content-Type: text/plain; charset=UTF-8

On 26 May 2016 at 20:13, Burton, Ross <ross.burton@intel.com> wrote:

> And literally nothing in oe-core uses libsdl2.  Does anyone who knows SDL
> have an opinion on whether we should switch qemu and ffmpeg to use libsdl2,
> or keep on libsdl and move libsdl2 to meta-oe?
>

It appears that qemu supports both but defaults to 1.2, which suggests that
it's the better supported option for qemu.

Ross

--001a114ab6cad1d2070533c39bd2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 May 2016 at 20:13, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">A=
nd literally nothing in oe-core uses libsdl2.=C2=A0 Does anyone who knows S=
DL have an opinion on whether we should switch qemu and ffmpeg to use libsd=
l2, or keep on libsdl and move libsdl2 to meta-oe?</div></blockquote><div><=
br></div><div>It appears that qemu supports both but defaults to 1.2, which=
 suggests that it&#39;s the better supported option for qemu.</div><div><br=
></div><div>Ross=C2=A0</div></div><br></div></div>

--001a114ab6cad1d2070533c39bd2--
