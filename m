Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2C28971CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 11:44:55 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id g47so653032uad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 04:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l9u7CioWuUd04q/l/BIJ8qk+uAChnfRc2V+c4zBXj3w=;
	b=B8FIKuAMV7EHXZe2Me4yOFYDzHzR+znTGFLThMpY6d+2TI0J7VbQdoVlA8HcFh1N34
	9iT6WSoAHORFpqA1qVxwIbh4Wn3ohTYyzwi3//dG3uz9SZTjbXY0yd+2RYbGxJdKLxqV
	TsJKI1HOJBxIBm9JkYRq/i+tdlPfZkIQWCXm7AwDkI6a+ZsGSE4SHOzj3vFfslSoIXv0
	lmNi9bZZ1mEV+fiIEdgPE0sHOO1Lqjw00ov9wdfaQ79isfwQiY/YzB0zS4fSPYoKbTK+
	ib1nm3RH5miY07Alzyj7DBtiqMWu6vkGemra1KorSFdgR9WVSJH4WWJPg4mml3wfZKb8
	BjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l9u7CioWuUd04q/l/BIJ8qk+uAChnfRc2V+c4zBXj3w=;
	b=A413kGfsXvj0QYX3yf0WJbKg/T+Od8MotUpw88X7z0ujkZQKaAxnl3+6F1JpfAMybb
	Bf0XMqxqvjihLfjUxKp3msIadnMTMUMri5NA+L1IrcuxdGSC0BF+JmSod0Otmg1Sf7rF
	o22VXZjFd1/qe/VML0Hjhc3rA9c5JbrdV7BHfWfyBLkkGnYaXicTmxDVXlf77d38i62b
	JpfSQk1slX1Po+dINmNdy+cuXCcUr/rMNKqmDIUje+sM6opXMmZ75EJIWkaxfQURU1dk
	OrW7WmqjrzG6IoL09YZh454rVpBenElS94BPQrW6CDS7eOv/nLeqBJ/ncBsVPSmWU80j
	N2YQ==
X-Gm-Message-State: AHPjjUhzdysGi2LzT4M11C030MRUacspafZFwwBdkB35AW/rNx0hqzPa
	iKZ72y13qWv+PcfAJeqhkAgDgDt61Q==
X-Google-Smtp-Source: ADKCNb7m2HeOi9GoYLVB6MQ+17V9JEy1JFPnzPZOED+p+S0aBKOsk93yMKxJg0sRA4rxPfRpw/nhA53yLdE6IXFC3p4=
X-Received: by 10.176.22.102 with SMTP id l35mr811535uae.183.1504266297053;
	Fri, 01 Sep 2017 04:44:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Fri, 1 Sep 2017 04:44:56 -0700 (PDT)
In-Reply-To: <CAJTo0LYArQkU-OtvmiSwsfa7DaxkiMNPYYTvr_kChi9RvpgC=w@mail.gmail.com>
References: <1504215229-79715-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfbZAM+mjNvZ-HYe=XZnNJz+H7Wq9z1vcEsMgDY=CUksg@mail.gmail.com>
	<CAJTo0LYArQkU-OtvmiSwsfa7DaxkiMNPYYTvr_kChi9RvpgC=w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Sep 2017 13:44:56 +0200
Message-ID: <CA+chaQdAuijLCAM8UzwMh1DO-7gc5tD3Ek3DYc-9rUNBY=85cg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to version 2.10.0
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
X-List-Received-Date: Fri, 01 Sep 2017 11:44:56 -0000
Content-Type: multipart/alternative; boundary="001a11451f3e48971a05581f4a98"

--001a11451f3e48971a05581f4a98
Content-Type: text/plain; charset="UTF-8"

I don't know how accelerated GL will be in the end, but this commit:
https://git.qemu.org/?p=qemu.git;a=commitdiff;h=474114b7305cc1be7c2ee8ba5267be159a9d56e3
made it possible.

I've built qemu with my Gentoo host with virgl and spice support, and I
plan to try how fast it goes.


On Fri, Sep 1, 2017 at 12:09 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 1 September 2017 at 11:03, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> Is there any ticket requesting virgl support enabled in qemu-native? It
>> might depend on providing virglrenderer-native, libsdl2-native,
>> epoxy-native and maybe even mesa-native.
>>
>
> It's been something that I've been meaning to look at for a long time, but
> between my build machine being headless and other stuff being more
> important I've not got around to it.  I've not dug into the details: if you
> run headless qemu and a spice client, presumably you don't get any real GL
> acceleration?
>
> Patches welcome, as always.  All the extra build dependencies means I
> expect it will be off by default, but having the option would be great.
>
> Ross
>

--001a11451f3e48971a05581f4a98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t know how accelerated GL will be in the end, bu=
t this commit:<div><a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit=
diff;h=3D474114b7305cc1be7c2ee8ba5267be159a9d56e3">https://git.qemu.org/?p=
=3Dqemu.git;a=3Dcommitdiff;h=3D474114b7305cc1be7c2ee8ba5267be159a9d56e3</a>=
<br></div><div>made it possible.</div><div><br></div><div>I&#39;ve built qe=
mu with my Gentoo host with virgl and spice support, and I plan to try how =
fast it goes.</div><div><br></div></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On Fri, Sep 1, 2017 at 12:09 PM, Burton, Ross <span =
dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">=
ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr"><span class=3D"">On 1 September 2017 at 11:03, Martin J=
ansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br></span><div cla=
ss=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D""><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr">Is there any ticket requesting virgl su=
pport enabled in qemu-native? It might depend on providing virglrenderer-na=
tive, libsdl2-native, epoxy-native and maybe even mesa-native.</div></block=
quote><div><br></div></span><div>It&#39;s been something that I&#39;ve been=
 meaning to look at for a long time, but between my build machine being hea=
dless and other stuff being more important I&#39;ve not got around to it.=
=C2=A0 I&#39;ve not dug into the details: if you run headless qemu and a sp=
ice client, presumably you don&#39;t get any real GL acceleration?</div><di=
v><br></div><div>Patches welcome, as always.=C2=A0 All the extra build depe=
ndencies means I expect it will be off by default, but having the option wo=
uld be great.</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><br>=
</div><div>Ross</div></font></span></div></div></div>
</blockquote></div><br></div>

--001a11451f3e48971a05581f4a98--
