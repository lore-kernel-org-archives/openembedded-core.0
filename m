Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3A26A71C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:38:13 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id 203so35864222ywe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ijHjBdG2Xf4bInPbDHV9SxXvQrj5he4IBv5ad5wRrRE=;
	b=rYYB5PpTrOYB8UbnEJNqhHxcTSKXHgHsKOrF+BrnNjpdP+h4uRVYM/FZlP/eeIFOeP
	3xd1VZ6t0UM52/NL4jaVNWPVshcfV+GQkZ9xOalV/p6iqZJv6EPi2gHZ/JcrK3vHoqgQ
	bjq2ZPjLDWrrxX8kkGnEE3ENUVp2xI+oW18NoEJjnkb7f4mRnjzzvqWDwdAo3VM3GWFQ
	D0OnrIgIOzQ6vptucdY+f0XZfutIc4OO7+sL5QbKbgbuqiIX7tMcF4aFevbpnGv+7byK
	dBOgWcF7qb/TbZecELP2Hxmb02GHR2hMpXdqUB21W35j0MB2LrCqG9TvdzfbIk0ypHxV
	dtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ijHjBdG2Xf4bInPbDHV9SxXvQrj5he4IBv5ad5wRrRE=;
	b=WaVmkqm7deSZ19V4/8xFn+/ZeF7hbUr/TnPYvjn6H9wLE3t1omZIA3g8LfBE2d/gJS
	WzPhWBvAx5L9r96m2zoU3dPwpOjl/oYfXx/dO9RGpfs3V9tAqpRlk6EygpzXyCjSMily
	5YirU1DnQO9RJKG2qsZMQn0HXtGL/CsHF82TXM6YDdqT57vrBO9+cDSwm29Q/YaxluLI
	fUHoVsC6XB/XRTmFcQROAAGiDHhHPls2bZce7jgXjjEpE5EB+tyhJV+prw77PhDPc5wx
	vE/IdOHETCbOXA0Xyxz8qyy3cv25An5HQyKh5gvXk82weasYAvvDgOWX8xwL9H9PN3Hh
	azWg==
X-Gm-Message-State: AODbwcCvJ6WzDoEQfTESXQZDxNQJezvRSeMYiamccW6Pjkn3v58DNikB
	7TXFZ+09KpWvHsQYPu7VUdJlnYCDDEnR
X-Received: by 10.129.92.134 with SMTP id q128mr4787390ywb.268.1494848294820; 
	Mon, 15 May 2017 04:38:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.194.134 with HTTP; Mon, 15 May 2017 04:37:44 -0700 (PDT)
In-Reply-To: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
References: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 15 May 2017 14:37:44 +0300
Message-ID: <CAHiDW_GksyO+YLMzejrL+9=tgw4wdAPrRjHf32h321fi=_F2ag@mail.gmail.com>
To: Yuqing Zhu <carol.zhu@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 0/6] Add patches for gstreamer1.0-plugins-bad V1.10.4
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
X-List-Received-Date: Mon, 15 May 2017 11:38:15 -0000
Content-Type: multipart/alternative; boundary="001a114d800e9b3ce4054f8e7dc0"

--001a114d800e9b3ce4054f8e7dc0
Content-Type: text/plain; charset="UTF-8"

On 15 May 2017 at 11:52, Yuqing Zhu <carol.zhu@nxp.com> wrote:

> -Add some enhancements for qmlglsrc
>
> -Add configuration for enabling accurate seeks
>
> -Add get track number media info API
>
> -Add overlayvideorenderer video sink
>
> -Fix gst-player failed to load external subtitle uri
>
> -Fix memory leak when use a GValue in glupload
>

These all seem to be backports from 1.12 or earlier. Maxin is currently
working on upgrading the GStreamer stack to to 1.12 so these probably do
not make sense for master.

The patches could be considered for Pyro (not too fond of backported new
features though -- I don't think oe-core should normally do that).

Jussi

--001a114d800e9b3ce4054f8e7dc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
5 May 2017 at 11:52, Yuqing Zhu <span dir=3D"ltr">&lt;<a href=3D"mailto:car=
ol.zhu@nxp.com" target=3D"_blank">carol.zhu@nxp.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">-Add some enhancements for qmlglsrc<br>
<br>
-Add configuration for enabling accurate seeks<br>
<br>
-Add get track number media info API<br>
<br>
-Add overlayvideorenderer video sink<br>
<br>
-Fix gst-player failed to load external subtitle uri<br>
<br>
-Fix memory leak when use a GValue in glupload<br></blockquote><div><br></d=
iv><div>These all seem to be backports from 1.12 or earlier. Maxin is curre=
ntly working on upgrading the GStreamer stack to to 1.12 so these probably =
do not make sense for master.</div><div><br></div><div>The patches could be=
 considered for Pyro (not too fond of backported new features though -- I d=
on&#39;t think oe-core should normally do that).</div><div><br></div><div>J=
ussi</div><div><br></div></div></div></div>

--001a114d800e9b3ce4054f8e7dc0--
