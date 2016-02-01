Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5FEFD771B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 21:14:05 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id 9so93694181iom.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 13:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MqARKquWsrvi25Ay0SffMFMUvMvBYTfq4ekBwAZEXBo=;
	b=H0oAr75RLqWXAVCdz1UupBUX/3DmiOj0t/sIvHLMhE/TTLwSSTj5Ch2wn7pOjTAZCA
	mEAjQeefiMWYC6bfHXdgiUdLvFWDNtw1VX5f7ivFxOfpi9rE5G+3tBVy/BioaDrQW4yR
	sjCfAFN12hEj4X3Z9qW21HklywxVyoypUKYXC7/hFFHmybKWczxdGCv8ertaZiFCvPMP
	ywVFaAShSzM72SoKAXzdtYXI5Lmx6nIUclGgZu8tM14BU9JO8bIYJl3orn2lCbEmEZLH
	Fytt7TfTMW6Pr0P90IgVepOO5nh+vdRZ9N1Qs4FeKadLHwnWFIbzUWeYeoSWmGhvEjrw
	qBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MqARKquWsrvi25Ay0SffMFMUvMvBYTfq4ekBwAZEXBo=;
	b=KmSPmLw0Z+QcTgQ5yDzhFF5fEqBQsgijdvSInUYiff9brHImRywT5SH/cVdHicxJvi
	IiQFXGKV2qHkuOAMYhjSaNCEkaL5WOL0r7Eq6muipNQyv/KJRl+B+F4344ll3QD48zUA
	DzJDh3Hwc7SEV9qoMTgkMeEN2rnIy0In94NTJSIOBjAJFHguqLJzMf5VsvC0yDYELUEo
	LvnQSXf4iNvOidNPytGOA9HkcNn2jTj6NFBssJX+fwoF97G/nz3NGRdkQMndxcQcDMvz
	w+Hs6wYEaWJ8ctamASTrkk9yV9GxS7gSXDG0+jN/xRWSlApCKwThwCAQY9/Iz+/bviKW
	LuXw==
X-Gm-Message-State: AG10YORNPS8lLA1b7xwk/unEyfOHSjc0lji/1be7Slyhc4NvbcZqYxYLM5XNqvjQf0PKt5BHmAnlrDSrmueBsCN5
X-Received: by 10.107.10.157 with SMTP id 29mr11088711iok.133.1454361245866;
	Mon, 01 Feb 2016 13:14:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 13:13:46 -0800 (PST)
In-Reply-To: <8414fe6c4db39df641533dfaf9d4c9021916517b.1454303080.git.raj.khem@gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
	<8414fe6c4db39df641533dfaf9d4c9021916517b.1454303080.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Feb 2016 21:13:46 +0000
Message-ID: <CAJTo0LaVpNfp0uDxWZM4=Q-_dPyxEDmuWvMBRA4FRNDXUkTP6Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] nss-myhostname: Fix build on musl
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
X-List-Received-Date: Mon, 01 Feb 2016 21:14:06 -0000
Content-Type: multipart/alternative; boundary=001a113f8df86f74cc052abbdd9c

--001a113f8df86f74cc052abbdd9c
Content-Type: text/plain; charset=UTF-8

On 1 February 2016 at 05:08, Khem Raj <raj.khem@gmail.com> wrote:

> +From d1345871b992f9a055c968963967e728da1a7ffb Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 30 Jan 2016 20:29:06 +0000
> +Subject: [PATCH] nss-myhostname: Check for nss.h presense before use
> +
> +We do not have nss.h on musl e.g. and configury is already checking for
> +nss.h presence, use this to define needed data structures if nss.h is
> +missing on a given libc implementation on a platform
> +
> +include stdint.h for uint32_h definition
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

No Upstream-Status.

Ross

--001a113f8df86f74cc052abbdd9c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 February 2016 at 05:08, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":5z" class=3D"a3s" styl=
e=3D"overflow:hidden">+From d1345871b992f9a055c968963967e728da1a7ffb Mon Se=
p 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Sat, 30 Jan 2016 20:29:06 +0000<br>
+Subject: [PATCH] nss-myhostname: Check for nss.h presense before use<br>
+<br>
+We do not have nss.h on musl e.g. and configury is already checking for<br=
>
+nss.h presence, use this to define needed data structures if nss.h is<br>
+missing on a given libc implementation on a platform<br>
+<br>
+include stdint.h for uint32_h definition<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br></div></blockquote></div><br>No Upstream-Status.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a113f8df86f74cc052abbdd9c--
