Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6D0496FFC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 20:34:23 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id e89so9776401ioi.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 13:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1p6z4vDo1cC/9O+LvdQuobHewpMjiB+t08eZ0qrMR/A=;
	b=LVF0HUV2Rv2jAyrk3H2eDRjYtn/SKjzeu6xRI81fuzLwlO37c+yHWmYRI3mV6g6cvi
	hW0y6oDSblny7av3pZ4qO9NF1TnRmMWvth2ZTU3SdowOep/w6HTc5/EX0AioeUGHypMt
	f3pW4kuV9m9Kuiap+NT6/uQLWgaBZ6dyPF+izS76FdDtGNkyP7c7AQQTLdYX3YUBGlIo
	TFr1VrTwi4XLwkNwgvvjJyGUiNUE8N4U7rQmIdjy1ZWMndSKpLIL7K5Atyp3fdBjSC+G
	FChfqw8n6a9e+Je4XrZG0TfFIZXZB2pKpQgoJEoVxSksCgyrsuSw50khaEVPq7ZF4ofP
	Xgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1p6z4vDo1cC/9O+LvdQuobHewpMjiB+t08eZ0qrMR/A=;
	b=tFzC7Mi+uQFjuOCoGJfDxzrYjwYWcD4EoeUarGSzBVvpN5vvQCl5foHkuOqdODDXy0
	N+7P9P93Qa0PvixBc90JYqhtEFbyxSk/cbeBkR7UbpR0GL6czhdSAI+5qTFGZDJasm6y
	pKU4L5qbiHYxLoVKzzjnkckdeaBJRE84FJbMcIZQ5iAALgRudaabDL5FTGzsVJXiXeII
	jtXEydFt/f/2IUH3ZAPvwvNW202jDqymUFiBt2UrBZjebCGiUQj3KmnD2P3ARYTLhFuI
	SZj3+IPO0eCo7KHX4ArboRTIMsmcDafTH/G03/fe0nWFt2OUj1wI/lbwm4hmWMYzg8yu
	zMxA==
X-Gm-Message-State: AMCzsaVMFcsjECJEai7OnRf+vfJNlBDqt9uC0jKrL0Q7CGeQRK+hvA5A
	Hy/4ki5YQ+blJ913z67UNVzQ5rOua1wELlTk0vQdXg==
X-Google-Smtp-Source: ABhQp+RSkL5PiPJvjoqMEfQxxbtTqL5lVHCA7UIofFcoCUiVihLyVIixEOFNoODgTIRSehIpUt2GMDmH2QuQfysrHSk=
X-Received: by 10.107.18.67 with SMTP id a64mr15261790ioj.165.1508186065504;
	Mon, 16 Oct 2017 13:34:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 16 Oct 2017 13:34:04 -0700 (PDT)
In-Reply-To: <CAP9ODKp4-ohZnA6tkDBaQKqUE_YDTLOQeGNpUTzV5zHH294quw@mail.gmail.com>
References: <20171016172158.22773-1-fabien.lahoudere@collabora.co.uk>
	<20171016172158.22773-3-fabien.lahoudere@collabora.co.uk>
	<CAP9ODKp4-ohZnA6tkDBaQKqUE_YDTLOQeGNpUTzV5zHH294quw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Oct 2017 21:34:04 +0100
Message-ID: <CAJTo0LbsxAbhK=XnqB0fMQXbju7gDGhu_9vnB5tg_0uCNhEnow@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 3/3] weston: Bump version to 3.0.0
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
X-List-Received-Date: Mon, 16 Oct 2017 20:34:24 -0000
Content-Type: multipart/alternative; boundary="001a113ee9b2b09073055bafeea3"

--001a113ee9b2b09073055bafeea3
Content-Type: text/plain; charset="UTF-8"

On 16 October 2017 at 18:30, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

>
> > +          file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
> \
> > +          file://fix-missing-header.patch \
>
> Those should be documented on commit log
>
>
Agreed.  The missing header one should say what platform causes it to be a
problem (in case it never gets upstreamed and someone tests it again on
just glibc).  And is the pitch patch sufficiently broken that we need to
backport it?

Ross

--001a113ee9b2b09073055bafeea3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 16 October 2017 at 18:30, Otavio Salvador <span dir=3D"=
ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_bla=
nk">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div class=3D=
"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://weston-gl-renderer-Set-<wbr=
>pitch-correctly-for-<wbr>subsampled-textures.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-missing-header.<wbr>pat=
ch \<br>
<br>
</div></div>Those should be documented on commit log<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div><=
br></div><div>Agreed.=C2=A0 The missing header one should say what platform=
 causes it to be a problem (in case it never gets upstreamed and someone te=
sts it again on just glibc).=C2=A0 And is the pitch patch sufficiently brok=
en that we need to backport it?</div><div><br></div><div>Ross=C2=A0</div></=
div></div></div>

--001a113ee9b2b09073055bafeea3--
