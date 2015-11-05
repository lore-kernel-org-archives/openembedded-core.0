Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7ABE960125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 20:31:50 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so23271945qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 12:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cB1CRPO5zoxMZaEQaL178KzlM3ewNQEnVEE6sBchfwE=;
	b=kgWzLnm82gXEljVm77qf0xHTB07UmQn0ulZquNaxW07NSpBj3K7KTdqwqSIBXDaosX
	eik8kHhX4hVvg4zzrNkSCu8PXO7ZdsjAP64awSeV9JPCPZyxMrTOqCy4X/tjOCTWohnT
	fDyR9V9WDtjCCmFXD2kfC7sjUgHLt6JCvyMZiV7A7mWVzAkBTeznALJNAgnkr0BLT67K
	9lwO7dev3cjw5wcc6RMv+OU5jM6VEh1mmDTRF0nqIWrZMaFDaVMlfh1/LNgqXUtKJrtB
	jvfKiosXO5SrXVp+sICaQFM5M0uMQ3Aq+bsWV8kGZqUj+aCP7ew5rpfNa9uvSwi2V2u3
	xeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cB1CRPO5zoxMZaEQaL178KzlM3ewNQEnVEE6sBchfwE=;
	b=i8gEDUkCUKVlzR8emxXH7ScVTIw3xdT2p90bB2Hzncp2keScqZhazlfuSfdQ9tgSp2
	CA0gSLNxsQlVDyFbKmHq6wmEUOh6XRIttpNjUKwQB4avI4+fqxLa7xqL9+xoF2xwAzj6
	rVhfnv7Ad0f24VT8OODUk4qoCrtn0w983z+jRZ/ffy6J7uTOI7eCUZ/OflDqZ87HyOyW
	a26jxAThIvhJ1sECieGkK+sy5MuYZqL8gXriupn95LnHUPiqUEDAFyhRXMq/Mjt9u0mz
	o2aMEp7x/cvwNPiufQGx7o+wa9qUc1MmTYaWMLuUgvZxlp7Ctr40+HLvHEK+LtROz/Ab
	Glwg==
X-Gm-Message-State: ALoCoQld0ZuFGJYCY9AqNe6502FotNCTCE1IzkN69qXRhe5NEDuU/FCX5G6UNN79RLUfcs1Zri9C
X-Received: by 10.140.20.98 with SMTP id 89mr9638480qgi.15.1446755510958; Thu,
	05 Nov 2015 12:31:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 5 Nov 2015 12:31:31 -0800 (PST)
In-Reply-To: <563BBC15.7030407@gmail.com>
References: <1446160961-25182-1-git-send-email-akuster808@gmail.com>
	<563BBC15.7030407@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Nov 2015 20:31:31 +0000
Message-ID: <CAJTo0LZiu2tUe_oYz_EL9MMZd5ONCyU9MKcJ+5kHyX0pW9sTHQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][jethro][fido][PATCH] libxslt: CVE-2015-7995
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
X-List-Received-Date: Thu, 05 Nov 2015 20:31:51 -0000
Content-Type: multipart/alternative; boundary=001a11c126fc4ed3920523d10476

--001a11c126fc4ed3920523d10476
Content-Type: text/plain; charset=UTF-8

On 5 November 2015 at 20:29, akuster808 <akuster808@gmail.com> wrote:

> Ping.
>

Queued in mut, will be hitting the AB soon.

Ross

--001a11c126fc4ed3920523d10476
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2015 at 20:29, akuster808 <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2as" class=3D"a3=
s" style=3D"overflow:hidden">Ping.<div class=3D"yj6qo ajU"><div id=3D":27a"=
 class=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br>Queu=
ed in mut, will be hitting the AB soon.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c126fc4ed3920523d10476--
