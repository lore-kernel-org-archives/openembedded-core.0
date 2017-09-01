Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 15E0E78358
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 10:09:35 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id z67so3290846iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rZ2NLhjJbp4CsxxilmWdGHCUKU68M70vVDzYFD+tksY=;
	b=Iw2hBNtyrkUk7GSmGZLOgLcJe4gD7J9WgtrdDBWur8fGkt0N7yJJvMR1q4FVVaOF+E
	k+YGGyVBnfkxFyt0Lr75j6yob0BFSaK51jhQdA2qWIbOWIslXJZiHjEzH+G+MA8lUBLt
	fDf/V+0udaxREwFveJvddbNqAGWZXBnVKbSqpmOHW8c5cE3jCNwfWNEV5q/K6s4OwtTA
	tMkSAnWckcppP2Il1xPFGAk4CwgVrLoHvGC5sP29onqqmXf1brixI8Ue5SeqHAxAw9D7
	xyva6wxy+ztip2dx5a9ire3E7Ew9txUp2p+3JVHwjaPZmyW28w8o8SFt2/I/rSOPCaDa
	riYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rZ2NLhjJbp4CsxxilmWdGHCUKU68M70vVDzYFD+tksY=;
	b=p4TwA3u+4r3ooqEPFQzyaLA+ORExgQ4uXSlZhCva87Xk7HFiA7ae/Q256VqnJ7Cua3
	ZYUvUU2dZKsGZKIrtBGapy5vyhk6haJ6OvoSn1kaswr+d5+whO/Aibh4lUybX84+Phcg
	mSumf9YYGUzwInnrx99Qpx58ygjfR33W0x5fOZWnLO2dll5tJQTu5SLohQY1Fkos/elM
	alDA3YnRbzIwp/EhlSpBbVqSd1i7UyoSQyyIq21NdxC5T6Wbn48JdO4rTNP4n25StBaL
	RGZvsjZwaOVfn5VlD01nTyfG2mla/vpQ92ANJ8Nc1Eet49lnsF1ZBK6lM3vAeY/qo6ta
	rg+Q==
X-Gm-Message-State: AHPjjUjzVGQVzmXc/xhzDIb1Ljes96YzrEaeFBuqP52E3ByrLjBpIL7n
	Ni1jr3o77HRY0sDTSHO61WDw/mYzMFcR
X-Google-Smtp-Source: ADKCNb6ZTZdIT+mTtlMXYDhByPCalNsObV+MiwxYo6ptV2H5FBjFCvKzAwlk5gantQMKu8yQKWJFOId6TgKTeZA5Qjo=
X-Received: by 10.107.59.200 with SMTP id i191mr962452ioa.117.1504260577118;
	Fri, 01 Sep 2017 03:09:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Fri, 1 Sep 2017 03:09:16 -0700 (PDT)
In-Reply-To: <CA+chaQfbZAM+mjNvZ-HYe=XZnNJz+H7Wq9z1vcEsMgDY=CUksg@mail.gmail.com>
References: <1504215229-79715-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfbZAM+mjNvZ-HYe=XZnNJz+H7Wq9z1vcEsMgDY=CUksg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Sep 2017 11:09:16 +0100
Message-ID: <CAJTo0LYArQkU-OtvmiSwsfa7DaxkiMNPYYTvr_kChi9RvpgC=w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 01 Sep 2017 10:09:36 -0000
Content-Type: multipart/alternative; boundary="001a114f80dc59759005581df561"

--001a114f80dc59759005581df561
Content-Type: text/plain; charset="UTF-8"

On 1 September 2017 at 11:03, Martin Jansa <martin.jansa@gmail.com> wrote:

> Is there any ticket requesting virgl support enabled in qemu-native? It
> might depend on providing virglrenderer-native, libsdl2-native,
> epoxy-native and maybe even mesa-native.
>

It's been something that I've been meaning to look at for a long time, but
between my build machine being headless and other stuff being more
important I've not got around to it.  I've not dug into the details: if you
run headless qemu and a spice client, presumably you don't get any real GL
acceleration?

Patches welcome, as always.  All the extra build dependencies means I
expect it will be off by default, but having the option would be great.

Ross

--001a114f80dc59759005581df561
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 September 2017 at 11:03, Martin Jansa <span dir=3D"lt=
r">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.j=
ansa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Is there=
 any ticket requesting virgl support enabled in qemu-native? It might depen=
d on providing virglrenderer-native, libsdl2-native, epoxy-native and maybe=
 even mesa-native.</div></blockquote><div><br></div><div>It&#39;s been some=
thing that I&#39;ve been meaning to look at for a long time, but between my=
 build machine being headless and other stuff being more important I&#39;ve=
 not got around to it.=C2=A0 I&#39;ve not dug into the details: if you run =
headless qemu and a spice client, presumably you don&#39;t get any real GL =
acceleration?</div><div><br></div><div>Patches welcome, as always.=C2=A0 Al=
l the extra build dependencies means I expect it will be off by default, bu=
t having the option would be great.</div><div><br></div><div>Ross</div></di=
v></div></div>

--001a114f80dc59759005581df561--
