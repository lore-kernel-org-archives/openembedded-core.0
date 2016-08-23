Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3F41576988
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 14:03:24 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id e63so148932649ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=if0eQvHhNnAcSZ6pfUi5hQB3qNyZl2WUb2ZzgKDPuCQ=;
	b=OotLkFXDPcCcFJvyMYEugp5mpVrHYahMdhcGkonHJU+Q8xL8tAU6IUS89YhB8OPjov
	KpgJcrwR6eUqPMHmZDOQ/nAwcCkdPVWbamo++W70V66sONgdmg9PnlBAork3bF+jKnFl
	uuq/RmwcgQTZgMbaEPvk50S0JFpHs/udgj20MxhJ8lVjkDW3hoX40QYXMkkbUvgzMDu0
	G6WC/XpfG5fT/hOPRBY2yQddjQ24nYtHE7e0NjV+qaMGjnz2ooUWgLZB00HAPs4H//bR
	6lBNJBaiPsFuEF/q+u8h+gBJXfd1QltkgMIRoZ+YotVeDbwEtyZhngwQ/JOD7dLg8Yeb
	FZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=if0eQvHhNnAcSZ6pfUi5hQB3qNyZl2WUb2ZzgKDPuCQ=;
	b=L8f/ICqYpoIUqCdE5uJ8qWIPIuN3+R79Z2FV6ajS4fxaVXMjJ46+5yhf0awSGW3jvi
	A+u4nmjv4zR+OzeR+Tnz/wS68ONGjh23S3g9oZ6mmRSOQ+IjHOON+qw2Pla9tzhBcATe
	cBkWhb0F6jGnWe0ExFimRGvmXUn+s4BPIVjHb4V3rQ4RRCcZ5zoa7TlWbd2v/OGQ9PNc
	0cmY1Qj6K6kDxeixf3ofpTKsxJ1/9i6RU6zEdKVml0EGaY7iGMtPFTBJMAFvKVjHbesq
	2xSp2cI3CfkmwlXaHg8ndHtfKYu5GqqwhwoFWtrmdjMKFpzRhz+UM5Azrdnp14vPaGRn
	Ut9g==
X-Gm-Message-State: AEkooutAYIacPKDmZLqepq/Z8ahLPPb/oq8XwFcVhJV1R3UcVcWHivfXw3E7rS2AGeXNOAu7B6vv4YUriIzM/fwV
X-Received: by 10.107.138.212 with SMTP id c81mr28809657ioj.148.1471961005078; 
	Tue, 23 Aug 2016 07:03:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 23 Aug 2016 07:03:04 -0700 (PDT)
In-Reply-To: <206bf819f402d94d3261b1f4590330ef41449e4d.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<206bf819f402d94d3261b1f4590330ef41449e4d.1471936926.git-series.jeremy.rosen@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Aug 2016 15:03:04 +0100
Message-ID: <CAJTo0LY4gVCD24Tc9ZJnUh0s+Lgzztk=2zG9ew14LFa6GBCGRg@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] [glibc] remove hard-coded reference to gcc -E
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
X-List-Received-Date: Tue, 23 Aug 2016 14:03:27 -0000
Content-Type: multipart/alternative; boundary=001a113ed932d4feec053abda02d

--001a113ed932d4feec053abda02d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 August 2016 at 08:25, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr> =
wrote:

> +-open F, "cat C-translit.h.in | gcc -E - |" || die "Cannot preprocess
> input file";
> ++open F, 'cat C-translit.h.in | $CPP - |' || die "Cannot preprocess
> input file";
>

Patch is missing an Upstream-Status, and I expect if you allowed for CPP to
be unset then there's a chance you can get this upstream.

${CPP:-gcc -E} should do the trick.

Ross

--001a113ed932d4feec053abda02d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 August 2016 at 08:25, J=C3=A9r=C3=A9my Rosen <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen@smile=
.fr</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex"><div id=3D":oq" class=3D"">+-=
open F, &quot;cat <a href=3D"http://C-translit.h.in" rel=3D"noreferrer" tar=
get=3D"_blank">C-translit.h.in</a> | gcc -E - |&quot; || die &quot;Cannot p=
reprocess input file&quot;;<br>
++open F, &#39;cat <a href=3D"http://C-translit.h.in" rel=3D"noreferrer" ta=
rget=3D"_blank">C-translit.h.in</a> | $CPP - |&#39; || die &quot;Cannot pre=
process input file&quot;;<br></div></blockquote></div><br>Patch is missing =
an Upstream-Status, and I expect if you allowed for CPP to be unset then th=
ere&#39;s a chance you can get this upstream.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">${CPP:-gcc -E} should do the trick.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a113ed932d4feec053abda02d--
