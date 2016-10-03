Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 62DF96093D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 10:56:41 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id j37so22387858ioo.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 03:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sE/76xyfgidAjhbrvL/YOaCkFG01zUTpka6J9dw9a6k=;
	b=RaNSvPiszBsZI9O2iKnyXzvT1+ogl5PP2Z/U36GFLj60JLgp6O6gURuDPAxi4jEndh
	pysb9scniv/D1d4P0T8VKuSLk5vf4LmYoequQIOYCZm/U7NmU9lDBzX4oQIyow0+C8Tv
	aIpJoz2a+tXh43uOesXL/nLLc5a3c0XTYsZ5ji7OE2Xwi1WMZ8oEPKKSHUHXhGJEhysr
	je4eoEgExUXOoji0Q6w4tcxwlPMYUY1HS99BqrmDYlHZNnyaJOJe8ccTNVkG5FKoerxN
	WAJ7N11c2fIxM9V3h7MzIj7z9pjJRvHExWehHlb8lwZyAo1ZKjYyYDQF+P/qikhhzwX6
	eZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sE/76xyfgidAjhbrvL/YOaCkFG01zUTpka6J9dw9a6k=;
	b=LWylNMXgHctEWMiw7i9Hhbm3zC8+1QbXf7OqRtGCxzZkrHSoNoYN/jx1yNqyOFwlYs
	MUMllCf/GTJ2dZIp30PR0g2/Dawow/5RESFdKgN1cLlQZIRSTaLyIBFNJ4Fn/SbL8kIY
	U0i6yMaJ3+YAKprbug7IWT13WfQLBZIR20sO6WQ3dxYaqFA2I9RRMnOsM2iKdBGdORCg
	Qgplj5sy10V9abgXKvRn/M83Auwc93FrlTYuRbcM1Wds3b17eHPm4RKQXmH2C0X6vr9e
	InxKhA5VksJ1dmNnqCSHpuJfprqHJe6Aw0V2ohytVIqUW3nvfkM5XFBzGDN4z+OAluBZ
	QjSQ==
X-Gm-Message-State: AA6/9RmYQwhTzf0hrsGLoxBF9BBH5M/WGpxjj7asACPdsZQG/LkLaREcBunEsY5iNp1ks7gLe8+RNNXsxwhVpTat
X-Received: by 10.107.5.147 with SMTP id 141mr20125666iof.132.1475492203098;
	Mon, 03 Oct 2016 03:56:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Mon, 3 Oct 2016 03:56:22 -0700 (PDT)
In-Reply-To: <CALDxG5hFH3h0aS0QBr82Ogp7aiggBbLFpTMvScAHNkN8OfnsQQ@mail.gmail.com>
References: <CALDxG5jveoshv5wXMZFFJOgprMOAOwARG4xXwQ+gNO8kFmvzuA@mail.gmail.com>
	<7D3A9BAC-9942-4D89-9B78-D3183E139F9D@gmail.com>
	<CALDxG5hFH3h0aS0QBr82Ogp7aiggBbLFpTMvScAHNkN8OfnsQQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Oct 2016 11:56:22 +0100
Message-ID: <CAJTo0LbgT0O3uNBWHkH4ATn_85eSpVHb4aEyy=Cbb1w_nP1pUg@mail.gmail.com>
To: srikanth krishnakar <skrishnakar@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Psplash on Systemd with progress bar
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
X-List-Received-Date: Mon, 03 Oct 2016 10:56:45 -0000
Content-Type: multipart/alternative; boundary=001a113edf34a28b3f053df3cc23

--001a113edf34a28b3f053df3cc23
Content-Type: text/plain; charset=UTF-8

On 3 October 2016 at 10:47, srikanth krishnakar <skrishnakar@gmail.com>
wrote:

> Thanks for your response. You are right about the splash support in
> splash.. but at least I wanted to eliminate the progress bar that is anyway
> non-functional. I masked the psplash_draw_progress and its associated
> psplash_fb_draw_image functions but the progress bar border still shows up
> leading to a less preferred splash image.
>

IIRC, the border is part of the image, so you should check this and if so
edit the splash image.

Ross

--001a113edf34a28b3f053df3cc23
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 October 2016 at 10:47, srikanth krishnakar <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:skrishnakar@gmail.com" target=3D"_blank">skrishnakar@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><font face=3D=
"Courier New">Thanks for your response. You are right about the splash supp=
ort in splash.. but at least I wanted to eliminate the progress bar that is=
 anyway non-functional. I masked the psplash_draw_progress and its associat=
ed psplash_fb_draw_image functions but the=C2=A0progress bar border still s=
hows up leading to a less preferred splash image. </font></div><div></div><=
/blockquote></div><br>IIRC, the border is part of the image, so you should =
check this and if so edit the splash image.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113edf34a28b3f053df3cc23--
