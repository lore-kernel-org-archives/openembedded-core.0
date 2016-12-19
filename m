Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6C80C731C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:53:55 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n21so6649922qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UssbRbsQvG/uBSqjOFVpATnk5IIT7YBxv55jIZ6oFzo=;
	b=tN8H6w+VV+eoMm7d7obAiOPe3wWubnWquSa/f6jS+uEcVuFOJ29FDK79Tuw8fNJvfg
	sUV2OFjfnYooyq2DU3X+jqhtdp7fIX4mkPajhmAwRO9y2x4p19nNnWIb6C+ceiPtQ8bp
	JPpQ8YQ9FREvJy2YWbBTKFGr5U915eUCzJOOref6JYLm+sy6gZcSZ+a8pV5dWIoAO+H8
	a9lXpRtM21zxtc7vuzXiLySalYklmA3BI54aAag3RDbaa7Eg5djoTCJmWGJHVqSf9Qd2
	GX9gvDA9ro7VaMiu6uAywCKbtesTAw2OZ8PXuMnFeOub+S7wijGumR9Ybq5erpejutao
	c4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UssbRbsQvG/uBSqjOFVpATnk5IIT7YBxv55jIZ6oFzo=;
	b=mloK+T7BK7HIUtvzkE0bO9r7b3dRf8OrB+bOIbXt5NgI9JD7L8Odv0pTqhF1lPfLn2
	R006dcjbD4CuGKLsaurXSs7Vnh9R9haVoMN1r4g2nxOecOJNpgnVDIDniFVZxrtd2JSm
	SEUzsIvaUeYoDo0jXQM8ecYz7xeR7YkJlgWs9xCsYVNAE5tKgAVox9uxRYQJBjqhwXnd
	Mg4x2n+133aNRHmCWd2YmVKAhIbNY5jXUsWPMia5WfjR7IXS8Zt6WM/M84IG0uGSJuJU
	o4pmI1rT0bnoS8ajR7Xk8dtPWVhycDb/2qWfoPr+nmXn6XOgVVax/UbhQ+FCxsi2gAog
	Dt0w==
X-Gm-Message-State: AIkVDXKMpg+tqURAgyBkr6GCZRqsWTLFjjSQD60u5QDLB15yj8zM/NDp9lBwZV1vQ5tUoKm/HpCPYVyFKZHTVO8G
X-Received: by 10.55.106.134 with SMTP id f128mr573699qkc.121.1482148437449;
	Mon, 19 Dec 2016 03:53:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 03:53:37 -0800 (PST)
In-Reply-To: <1d8d15e8fd9c4c9c1eeb6f13e5b069df6d995dce.1482127585.git.dengke.du@windriver.com>
References: <cover.1482127585.git.dengke.du@windriver.com>
	<1d8d15e8fd9c4c9c1eeb6f13e5b069df6d995dce.1482127585.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 11:53:37 +0000
Message-ID: <CAJTo0LbuTPCrsjZhfwAhczEsN=nrwUrE33mojDLOocMxxT1WMw@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cdrtools-native: update 3.01 -> 3.02
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
X-List-Received-Date: Mon, 19 Dec 2016 11:53:56 -0000
Content-Type: multipart/alternative; boundary=001a114fddf61e91f105440193bd

--001a114fddf61e91f105440193bd
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 06:07, Dengke Du <dengke.du@windriver.com> wrote:

> 3.01a31 -> 3.02a07
>

As the aXX releases are alpha releases for testing, is there a good reason
to switch to an alpha?  In general we ship releases, not previews.

Ross

--001a114fddf61e91f105440193bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 06:07, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":286" class=
=3D"a3s aXjCH m15915b1cf614de6a">3.01a31 -&gt; 3.02a07<br></div></blockquot=
e></div><br>As the aXX releases are alpha releases for testing, is there a =
good reason to switch to an alpha?=C2=A0 In general we ship releases, not p=
reviews.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a114fddf61e91f105440193bd--
