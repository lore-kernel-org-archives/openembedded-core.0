Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 713376FF9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:43:05 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id u185so45298269iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vyFUOcg0TmBR92h7a59bkKQ01s/m76+rpq+KjZOlnWA=;
	b=SMpl8FNOiVVlteW4U/r34JKCKJohIZgLBfrhpZtvItgaLxJ9PbPynjKfCdfqy6mv5h
	geMvt7zSD6K9L61mi2d3vvGrw3jBZl4XqS4iZfB8Kju9JIleE/8ddVFE91T37wA7DKiz
	kV9wEgV/xnEih0b2W36C3Kdi9w6vkk+RAqXJukPtVMYUVsyfJ1wCXkEHFVW7YgZepHcy
	To0OZdRJL9Qibqk3lCR3Kq7r2px91Rb9zChB7dCNuOvdDyDvF2fVWqwaRFbgpkQXQg9P
	lBbFzrn2yVriFmGwfvg03o+GIokFqXJ319hZLlQ0Onns51+JFo75eygg5Q4mibyI6a2/
	LfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vyFUOcg0TmBR92h7a59bkKQ01s/m76+rpq+KjZOlnWA=;
	b=X/LW6FzTMOfwRFoCW4Xa0haCn4jYFuxW2sozTP0WAuzqGF2meuUjoXBh1ISPsH3v5P
	vj1aItJIxeZ3RunfbYxoJxpUcf3XsxAdkPjA4nhY25Cz4yFCl8cehE8Sh10KepESJLRk
	3fT4/PWIYhZC3vYXAgw4yUPyWXuUfRy4mV53zD1ipRfy4AXY551cFc6o68Akd4KauqHV
	1on2qazlJzFNp4mwAQdwFn1MBuC1jmq8nvTRa1v8OrdrLiSXV4eJufkflmiLiejj1kZD
	uu5ej3x6UQ5369P+BXSISUjIDK0d2Jwu6ykUClqLnyanxp4ati6sX5ZBm+1ihx1F781+
	wDVA==
X-Gm-Message-State: AOPr4FV7i9UyJkOzLYf/ocgujtkgqPoyazOoeZeZ/rCuH0VUKwEWqENrRvhv7/tTkrY0XX+dAM3s6jEJj04ZflpJ
X-Received: by 10.107.134.84 with SMTP id i81mr8137764iod.99.1461141786426;
	Wed, 20 Apr 2016 01:43:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Wed, 20 Apr 2016 01:42:47 -0700 (PDT)
In-Reply-To: <CABAVd_HkmrR4AbO3h-WKbcnTGSgNva0mJmWP=mxTCXnahhbo-w@mail.gmail.com>
References: <CABAVd_HkmrR4AbO3h-WKbcnTGSgNva0mJmWP=mxTCXnahhbo-w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Apr 2016 09:42:47 +0100
Message-ID: <CAJTo0LZDxOzS2d0O6j-nNiSfNQgT4Lum8Xq4cvDe33WCwbNUEg@mail.gmail.com>
To: Tim Kilbourn <tkilbourn@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: backports for jethro
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
X-List-Received-Date: Wed, 20 Apr 2016 08:43:07 -0000
Content-Type: multipart/alternative; boundary=001a113febc8259d000530e69570

--001a113febc8259d000530e69570
Content-Type: text/plain; charset=UTF-8

On 19 April 2016 at 22:29, Tim Kilbourn <tkilbourn@gmail.com> wrote:

> What is the policy for backporting changes to released branches like
> jethro? I'm hitting an issue that was fixed in 2015 on master, but
> didn't get included in jethro 2.0.1. Is there any chance of having
> this cherrypicked so I can get the fix from the jethro branch in git?
>

Simply submit the patch to the list, rebased and tested for the jethro
branch, with [jethro] in the mail subject.

Ross

--001a113febc8259d000530e69570
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 April 2016 at 22:29, Tim Kilbourn <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:tkilbourn@gmail.com" target=3D"_blank">tkilbourn@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1cz" class=3D"a3s =
aXjCH">What is the policy for backporting changes to released branches like=
<br>
jethro? I&#39;m hitting an issue that was fixed in 2015 on master, but<br>
didn&#39;t get included in jethro 2.0.1. Is there any chance of having<br>
this cherrypicked so I can get the fix from the jethro branch in git?<br></=
div></blockquote></div><br>Simply submit the patch to the list, rebased and=
 tested for the jethro branch, with [jethro] in the mail subject.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a113febc8259d000530e69570--
