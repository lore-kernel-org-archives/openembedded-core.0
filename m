Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D41C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 09:04:54 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.17291.1754384686378597460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 02:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BTnHCPYw;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1140B4317F;
	Tue,  5 Aug 2025 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754384684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hW5SL3n8gdepZa7qWOtHz4EatFVWpcDTIfk7/gwz1nQ=;
	b=BTnHCPYwSe8OhznZfkiYuCpwK5Krn5cOjBPmCczShVpdI7rQe4A06yNIMGf+/1I62RfgB/
	9c+JQHG41cy5rB8C98moyei9BQN1qcvlqR8SPSRfm6OzMirXUxHQPKCYSC3cqwWnjQtrhx
	vY20HvcyHByPSvjjnYVaBIzU6g25YrW81a1D/qZHOib6CWg3LrRuRK0YKqCrWT/K8ukHgu
	GF6TeAxWBB58mpf1P5PyoJgprHWRfSrZCSp4iYsr9TFmQmaGgSceqXzHakY0MXsOXY2pjb
	bkjz6QZCSrEUiV4IcP9ik2uZAStKPH7u1tAVClA6u2wk0Mn+n/IpC/UF8gMqCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 11:04:43 +0200
Message-Id: <DBUDGTFZM43O.22SQN5VKTB6Y9@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] librsvg: upgrade 2.59.2 -> 2.60.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250805063925.771875-1-skandigraun@gmail.com>
In-Reply-To: <20250805063925.771875-1-skandigraun@gmail.com>
X-GND-State: clean
X-GND-Score: -6
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudegjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecufghrlhcuvffnffculddqiedmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvddtgfffudduhfejleffteffieehvdejvdejkedtgeffleetgeekvdehledtjeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgnhhomhgvrdhorhhgpdhnihhsthdrghhovhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehsk
 hgrnhguihhgrhgruhhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 09:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221467

On Tue Aug 5, 2025 at 8:39 AM CEST, Gyorgy Sarvari via lists.openembedded.o=
rg wrote:
> 0001-gdk-pixbuf-loader-meson.build-do-not-look-for-gdk-pi.patch and
> 0001-meson.build-do-not-force-disable-introspection-and-v.patch
> patches were dropped, because they are included in this release.
>
> Removed the CVE exception for CVE-2018-1000041, because it has been
> fixed in 2017[1].
>
> During the do_configure step, the following error popped up:
>
> | Program meson/query-rustc.py found: YES (/home/meeee/stuff/ptest-images=
/build/tmp/work/core2-64-poky-linux/librsvg/2.60.0/sources/librsvg-2.60.0/m=
eson/query-rustc.py)
> |
> | ../sources/librsvg-2.60.0/meson.build:357:4: ERROR: Problem encountered=
: error[E0463]: can't find crate for `std`
> |   |
> |   =3D note: the `x86_64-poky-linux-gnu` target may not be installed
> |   =3D help: consider downloading the target with `rustup target add x86=
_64-poky-linux-gnu`
> |
> | error: aborting due to 1 previous error
> |
> | For more information about this error, try `rustc --explain E0463`.
>
> The meson script is trying to gather the static native libraries for the
> target from rust, to link with them later. However it invokes rustc binar=
y
> directly without cargo, and the RUSTFLAGS environment variable is ignored=
,
> which makes it to fail to find the Yocto targets.
>
> To avoid this error, add a patch to append the RUSTFLAGS to the command
> that calls rustc. (0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.=
patch)
>
> Changelog:
>
> - The minimum supported Rust version (MSRV) is 1.77.2.
> - Many build fixes for various platforms (Amyspark, Alexander Kanavin,
>   Colin Sane).
> - #414 - Basic support for the dominant-baseline property (Paul Melis).
> - #1146 - Parse the white-space property.  It is not processed yet;
>   this is part of the work to support SVG2 text layout (Adetoye Anointing=
).
> - #1138 - Report errors correctly from the parsers for attribute values.
> - Portability fixes to the C header files.
>
> Version 2.59.91
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - #1147 - Fix linkage on Illumos.
> - #1143 - Fix the build of the static library on MinGW (Amyspark).
> - Fix versioning of library name (Amyspark).
> - Enable cross-compilation of the gdk-pixbuf loader if meson/qemu can
>   handle it (Colin Sane).
>
> Version 2.59.90
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - #414 - Basic support for the dominant-baseline property (Paul Melis).
> - #1138 - Report errors correctly from the parsers for attribute values.
> - #951 - Slightly improved test coverage (Vaishnavi Nawghare).
> - #1136 - Don't use defined() in C macro definitions, since it is not
>   portable.
> - #1146 - Parse the white-space property.  It is not processed yet;
>   this will come after the Outreachy internship (Adetoye Anointing).
> - Documentation fixes (Kleis Auke Wolthuizen).
> - Many build fixes (Amyspark).
> - Improvements for cross builds (Alexander Kanavin).
> - Fix CRLF characters in Python sources (sulincix).
>
> [1]: https://gitlab.gnome.org/GNOME/librsvg/-/commit/c6ddf2ed4d768fd88adb=
ea2b63f575cd523022ea
> (this fixed the CVE according to https://nvd.nist.gov/vuln/detail/CVE-201=
8-1000041 )
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

It looks like the build is failing with this patch:

ERROR: librsvg-2.60.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-w=
orker/qemuarm64-alt/build/build/tmp/work/cortexa57-poky-linux/librsvg/2.60.=
0/temp/run.do_configure.832057' failed with exit code 1
...
| Program /usr/bin/gdk-pixbuf-query-loaders found: NO
|
| ../sources/librsvg-2.60.0/gdk-pixbuf-loader/meson.build:40:29: ERROR: Pro=
gram '/usr/bin/gdk-pixbuf-query-loaders' not found or not executable

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2147

Now, as this is in the configure step, it might be related with the
gdk-pixbuf commits from Ross, but they look like fairly straightforward.

I will first drop this series and keep you up-to-date.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


