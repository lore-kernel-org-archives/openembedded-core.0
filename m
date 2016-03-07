Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id C7E04731D8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 16:01:17 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id ig19so21297390igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 08:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VILeqHSZ2qBCXPZ2Mc4mgRMyD5M4Zwt8Dig+FwVFM0I=;
	b=flRdmezJAhyvmdFytTZVdYUUO1YTX0VjCCD17XhdXIsou8DE54XzyQ/5GO15yfwJ0p
	MTWlV7sHk24pJxMVvXoVKfI+O0jsyfb4RxMlJZKfyc01SJS/TyztNwmxOUaRJPSb0MlQ
	YyLmT5XDMf19c+4FXumPVKqyN0fAnZ/eQeCcUR7Wfq/Z8GdZVY6V8eVjDgB+0b2D11es
	GLnRUpnl0ltJTcGZ2iryAU8gBxEF8wlcXoee2VrQKWHnaFxuap7fL+yLL2B2scPpfnSV
	eqP6c//lGze8gJN5oWwH5mkF6sQneosRkRfA0c1EEMGE6emsjFEbBmVaoj28Yg6nS7pK
	e0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VILeqHSZ2qBCXPZ2Mc4mgRMyD5M4Zwt8Dig+FwVFM0I=;
	b=IKBMGlEUNF/dNnqg/QIlY/GexbGEZ5wOFT/E8JvvVTIKu793HLWW3zKf4FgpNpnYwK
	BS8e6N6Z/67NGLaA/BzHafc1KhEQEBhNplMMNWruWq5nJudmIdOZ330oKr1d3/rwaXTm
	7imzYR9L5+lx3cLtb/w4AZIAiw1Uhc6G6gQqLJoVdozq1C8udVLhfElwWq+q4tCGJdTZ
	Yg5S+OPa8TZge1SMKKqB0Q58pKrsh6A4hCMB5fO7JsL6PUaMV45XlAdByjdEum6WWme7
	0OakVrRwJtpm21D6oICFYU9NMhcWq/CRsI2S7smHjUZ2819LL+waS83daDi/5jEmPLi9
	VJ5w==
X-Gm-Message-State: AD7BkJJTOQ9seM65rHCpR9dpJIx32i0AQKQZjrbfrcryrqeFGFYgDdcImbJB4PuDexVPVu1BQ3/mxdkKnxMFjfTZ
X-Received: by 10.50.126.8 with SMTP id mu8mr12154557igb.52.1457366478351;
	Mon, 07 Mar 2016 08:01:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 08:00:58 -0800 (PST)
In-Reply-To: <CAHvQdo0ckNBU19WSrMwehCsZ-HO37uqNRWqnywUfK3ZPtPT0Zg@mail.gmail.com>
References: <1456863137-7388-1-git-send-email-johannes.pointner@gmail.com>
	<CAJTo0LZ_rMH3zn+uox0D0tBw+T74xbkNzdvCoR3CCwpo1SnZpg@mail.gmail.com>
	<CAHvQdo0ckNBU19WSrMwehCsZ-HO37uqNRWqnywUfK3ZPtPT0Zg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 16:00:58 +0000
Message-ID: <CAJTo0LZd5wWn6U=uSrEWVMn40Zy=2AhvR9hguZ2E9dpN8-_avw@mail.gmail.com>
To: Johannes Pointner <h4nn35.work@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch][jethro] xf86-video-modesetting: Require sufficiently new libdrm
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
X-List-Received-Date: Mon, 07 Mar 2016 16:01:19 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf400a7e052d7793f5

--047d7b1635bf400a7e052d7793f5
Content-Type: text/plain; charset=UTF-8

On 7 March 2016 at 14:50, Johannes Pointner <h4nn35.work@gmail.com> wrote:

> The reason I thought this patch wouldn't be needed for master is that
> it was included in xserver 1.18.1 and master is already on xserver
> 1.18.0.
> Do you know if it is planned to switch to the newer 1.18.1 version?
>

No, we're upstream version frozen now, so this is appropriate for master
too.  Patches for stable branches should be applied to master first, so can
you also prepare a patch for the master branch too?

Ross

--047d7b1635bf400a7e052d7793f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 March 2016 at 14:50, Johannes Pointner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:h4nn35.work@gmail.com" target=3D"_blank">h4nn35.work@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":hk" clas=
s=3D"a3s" style=3D"overflow:hidden">The reason I thought this patch wouldn&=
#39;t be needed for master is that<br>
it was included in xserver 1.18.1 and master is already on xserver<br>
1.18.0.<br>
Do you know if it is planned to switch to the newer 1.18.1 version?</div></=
blockquote></div><br>No, we&#39;re upstream version frozen now, so this is =
appropriate for master too.=C2=A0 Patches for stable branches should be app=
lied to master first, so can you also prepare a patch for the master branch=
 too?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--047d7b1635bf400a7e052d7793f5--
