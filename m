Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id BA813719F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 14:59:39 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n204so22045883qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 06:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fs78zAhFEU0lRriI0N//npo0I4LwLr6ro/W9fawFpno=;
	b=yJBXaX0rNe6lrWZdu25zBeI9acNOCK4XVBB0uVrobGmjGdk/5O9qXiS2Q8LIA4WgG/
	G1enOu4U/kJDBy0I0gP31/htl5Z01eACmbWKK1z89C78JkdLKa5bxIH4PFikfr1QpWgB
	52SOqkEUAlz3Papkszdo/JGJ2tE8gTeIYk0YJ2xh+AIc113lZyv+YaDPM9rUQzaTHbPj
	tmJGfWAaQ0RQhN0dNL5Y6YcEmQqCi55CsvnEd+8legsIqF6VOPjnWsAODuHBDKGdVt78
	ncmnwfg/j7vA4VGToD5z09cgoG9NTKNlmGPKuhm1WvcmPBnlTo587a3zHPgqc7GaNmRE
	wHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fs78zAhFEU0lRriI0N//npo0I4LwLr6ro/W9fawFpno=;
	b=iD3AJ4Kw03TLf1IBzdGn0f7//VVrOW7Yex9zAAn/Djj3ckTqhvDWFCeQhIdqHgijIH
	t3f7roeXB5cnsCkESK1m8Zg/YpxBkyy0wIjyX6j2Xak0EFtKa3iEqdGKCvwhSTwJQ2mn
	6NVODpX7/6+9AgnI8sn447xMxthgeRl3kkf6IdTeHFJbVkK9YHwMBYfquA7iN5o1fA7p
	mW1M0zOcO0tqhzn3+Q0rb8SGV2Yc+aTWjGmbX+LqFbbNWcPkFXTlECkbKH4bFbThf6D4
	L6/gOf3m8Qu/rxFfTeYdHxwENHoJYnprrm2MslNSryprJleJy+rQ6SZW7D7EcjY76uNT
	qIbA==
X-Gm-Message-State: ABUngvecLAeuD/8jwD1O/P54nWzNovSgFXNNdVyzWzUcScb/n8CTmkzUmf6G/1nyWpxsV0SPXvtsGnCqPu0M+TVk
X-Received: by 10.55.207.78 with SMTP id e75mr4246008qkj.36.1478876380506;
	Fri, 11 Nov 2016 06:59:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 11 Nov 2016 06:59:20 -0800 (PST)
In-Reply-To: <20161111142525.20700-1-zeeshan.ali@pelagicore.com>
References: <20161111142525.20700-1-zeeshan.ali@pelagicore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Nov 2016 14:59:20 +0000
Message-ID: <CAJTo0LbxTsvg6KJ-LYLq1bJ5yc7sEYJubJjpdaT2PfhXEMj9bA@mail.gmail.com>
To: Zeeshan Ali <zeeshanak@gnome.org>
Cc: Zeeshan Ali <zeeshan.ali@pelagicore.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [krogoth] nss: Disable warning on deprecated API usage
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
X-List-Received-Date: Fri, 11 Nov 2016 14:59:39 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b853d806054107bdf7

--001a1145b7b853d806054107bdf7
Content-Type: text/plain; charset=UTF-8

On 11 November 2016 at 14:25, Zeeshan Ali <zeeshanak@gnome.org> wrote:

> nss itself enables Werror if gcc is version 4.8 of greater, which fails
> the build against new glibc (2.24) because of use of readdir_r(), which
> is now deprecated. Let's just disable warnings on deprecated API usage.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10644
>

Oh, and please sign-off the commit message as well as the patch.

Ross

--001a1145b7b853d806054107bdf7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2016 at 14:25, Zeeshan Ali <span dir=3D"ltr">&lt;<a href=3D"=
mailto:zeeshanak@gnome.org" target=3D"_blank">zeeshanak@gnome.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7an" class=3D"a3=
s aXjCH m15853db7bd6199f1">nss itself enables Werror if gcc is version 4.8 =
of greater, which fails<br>
the build against new glibc (2.24) because of use of readdir_r(), which<br>
is now deprecated. Let&#39;s just disable warnings on deprecated API usage.=
<br>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10644" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/sh=
ow_bug.cgi?id=3D10644</a></div></blockquote></div><br>Oh, and please sign-o=
ff the commit message as well as the patch.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1145b7b853d806054107bdf7--
