Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD7E6067D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 10:31:01 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id r187so55331521oih.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 03:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1DbgOXc1KBo8LAzqvWJOKtALNvhHiopjFJTc9UHxX3s=;
	b=s31ymWf3CqV1ISmNKJCna9dib2qpk+sWllNi2Vx28ihWlmnWslvtar26ZcUIroC7p9
	J0wWO1hGN3k2CupIYH01OjD/+7Xth42aXhEaXA1Je8YW24+YwtiMpJMA7zmUosGZ96s7
	HMl+zKEU24xysSbtdgfUHswLLhP7eXKz6WO7lGk4bYUVTQerRJvzjoHg22Yg08A/lPma
	y3vRy/RGVBu+kDWW0ZyUVgIYgEXWpCFBlmncyTZkbZOC62ZzbENE723SJVi28c3vtqJQ
	WXeQW9B/oiyE1rsyPDCN/WII0HmHQb2LGsiKHFEEJzhK/RYSYdo0nzTbWhb0MNLIVogG
	RZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1DbgOXc1KBo8LAzqvWJOKtALNvhHiopjFJTc9UHxX3s=;
	b=TzD1pINqtw+EaZzKgElLG8R5AFS5TS51v4JkoNPZMOfcTUNw4Gcvy4mcyf1IsZ9vWK
	tVjAbRQcxdbfEVclqHuA8ZjAYfGbBKsoqtGBiYUZcP60JgqhmKug2D+Q/dQi2M6+9i+W
	62+Agk4eaTJ0IUz2+ekzKKrojM52GXRauwDJA9XaTXZqv9i9dxb4VGeip5cVTBdssVN8
	Ql22zO98Jj9vwaj6zZXDUgfSUbdY+64+fgCp86uwsOGSR+4XYRKDEYfoIxJMq0HZnkTi
	bfNY3JIbj2S+oZK5WfvXcmAfqOn/blQbX+j2p19VVd27Y22P5GEzSSgskOhQuWsNtVsr
	5SpQ==
X-Gm-Message-State: AD7BkJLEATNGLDV8mr/FHm79o83j5ZBtLI650HaCICqSOcAaslW/c9R556543CkUUyIFXdiNWZLScEm/RBsJLjCZ
X-Received: by 10.157.47.166 with SMTP id r35mr3637796otb.29.1458815462688;
	Thu, 24 Mar 2016 03:31:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.90.134 with HTTP; Thu, 24 Mar 2016 03:30:43 -0700 (PDT)
In-Reply-To: <56F3C11E.5000204@mlbassoc.com>
References: <56F3B739.3030108@mlbassoc.com>
	<CAJTo0LZWmp7iqE22miPiq2Sp+oNUYzGtU-YR=7ZGiA3QjDaRbg@mail.gmail.com>
	<56F3C11E.5000204@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Mar 2016 10:30:43 +0000
Message-ID: <CAJTo0LaS8jvkQ-ANsmyeVGNDR8rbfsti-oEXuO2LN6gM+PUj3Q@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Change in udev
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
X-List-Received-Date: Thu, 24 Mar 2016 10:31:04 -0000
Content-Type: multipart/alternative; boundary=001a113dce08726553052ec8f177

--001a113dce08726553052ec8f177
Content-Type: text/plain; charset=UTF-8

On 24 March 2016 at 10:27, Gary Thomas <gary@mlbassoc.com> wrote:

> More recent than poky:2df514bfe4a911c0dca8828038dd94e6265f50ca?
>

In that case the file should have been generated at build time (please file
a bug with logs if it wasn't) and is in a separate package so if you don't
need it (its basically the USB and PCI ID tables) then you can remove it.

As you say, eudev is new, so there's bound to be small configuration issues
to work out before release.

Ross

--001a113dce08726553052ec8f177
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 March 2016 at 10:27, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":h9v" class=3D"a3s" styl=
e=3D"overflow:hidden">More recent than poky:2df514bfe4a911c0dca8828038dd94e=
6265f50ca?<br></div></blockquote></div><br>In that case the file should hav=
e been generated at build time (please file a bug with logs if it wasn&#39;=
t) and is in a separate package so if you don&#39;t need it (its basically =
the USB and PCI ID tables) then you can remove it.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">As you say, eudev is new, so t=
here&#39;s bound to be small configuration issues to work out before releas=
e.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a113dce08726553052ec8f177--
