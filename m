Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 26E0A76E4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:42:40 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id x131so147506911ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J7m3AZPMu3wpJ7m3vjYGHMbrdJ3w2EodnTkwBh71Ut8=;
	b=KoYrwklsuFUAOSSO+zPgaOzN+/SPkexaZ/p5ulvHgDXqVJ2GlwuBTNxjbHL4LjrzQH
	D0VMwKd1N5B2zmyDgA9dG9COkA++7HvcLbZHO1Zyz/LLKOKvR73mty0v9BKtGebJsU6t
	ikQc2I6BAb4dWDQSXnakJ9E8DeBgLD98ZBFHou1CerQWfGwe7rFh3u9ivpCTDiYCuhf1
	FhUVP6t9MIWJjYMM7LAy2/6KkQhqqBfpkwVKb5Ao3IXk45p5pFNzhCXxJJMtkl9GMpAY
	7y5ycBsHWUcgc1xlfj5PUkswP8Wk3cvQ58ZGUxI719qzGEqDwsAAUBRcozwCvPRQC2u/
	Zr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J7m3AZPMu3wpJ7m3vjYGHMbrdJ3w2EodnTkwBh71Ut8=;
	b=L5wgFjZq6BSN18UKnynPQMfPh9Sp23P7SnTOOz0UAlUYr5rgGd3uEKtTj0XjkFsB4Y
	ZDaxm+Cm7vlmwv+mlONs1kX+hViRWofKdz3N86fJU4OEq1YT8OzOnUxX6Fm+IaWrNIuW
	D9sh77en9pqB6VdCli06xLp5NPwgK4fwhrYrGReLJqoO5EH9HqpA6zvmnmCvMoOzuPRY
	cFLmcboTPNTh1QUKfT1R8vk3hFLjUpHoyxJQyLlPu3fJfQm3CST6AmWyXJiYAlBTJtVX
	1dx9vUFtBPQPeHM8Kb+WvYdKdpPBSyrBy+OyRUFN6gGPHdODk+uCRA5frigJrwqbEDA9
	qUhA==
X-Gm-Message-State: AEkoouuY1tgPMhODkIiGQGhiLUCy0B3++Sok7K+VO8LeSbiULbCtZzWpsuVAWDhAUZsG3qdYFK5ya/R+9xuuCnnI
X-Received: by 10.36.19.75 with SMTP id 72mr26312448itz.83.1471959760871; Tue,
	23 Aug 2016 06:42:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 23 Aug 2016 06:42:20 -0700 (PDT)
In-Reply-To: <CAHiDW_EQRvyZOnUQXif0mD1Fh+zDa_8Wuh4bEDDpgfnQ=6+wOA@mail.gmail.com>
References: <2e948106-ac15-2c16-5bb6-f234079be725@embed.me.uk>
	<20160822142711.26042-1-clemens.lang@bmw-carit.de>
	<20160822142711.26042-2-clemens.lang@bmw-carit.de>
	<CAJTo0Lb1+G+cF2tFkVpA14w_1borw95msdtiRPDUPz0-RPMPDQ@mail.gmail.com>
	<FEF4FC9A-75CF-4EBD-A4E4-A7AE2941668E@bmw-carit.de>
	<CAHiDW_EQRvyZOnUQXif0mD1Fh+zDa_8Wuh4bEDDpgfnQ=6+wOA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Aug 2016 14:42:20 +0100
Message-ID: <CAJTo0LbRJTOXbr20W2+fkvVREVHfyZAQJyPoF7PXGUZayepxEA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Thomas Witt <Thomas.Witt@bmw.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: call cmake with a relative path
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
X-List-Received-Date: Tue, 23 Aug 2016 13:42:42 -0000
Content-Type: multipart/alternative; boundary=001a1145180aabc48c053abd562d

--001a1145180aabc48c053abd562d
Content-Type: text/plain; charset=UTF-8

On 23 August 2016 at 11:00, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Arguably this should be explicitly selectable but even then it would also
> be reasonable for bash-completion.bbclass to ensure that bash-completion.pc
> and the cmake equivalents are installed in the sysroot...
>

So all this time I'd assumed that bash-completion.bbclass had
DEPENDS=bash-completion but it appears not.  Surely this is the obvious fix?

Ross

--001a1145180aabc48c053abd562d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 August 2016 at 11:00, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D=
"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Arguably thi=
s should be explicitly selectable but even then it would also be reasonable=
 for bash-completion.bbclass to ensure that bash-completion.pc and the cmak=
e equivalents are installed in the sysroot...=C2=A0</div><div></div></block=
quote></div><br>So all this time I&#39;d assumed that bash-completion.bbcla=
ss had DEPENDS=3Dbash-completion but it appears not.=C2=A0 Surely this is t=
he obvious fix?</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a1145180aabc48c053abd562d--
