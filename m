Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5277197A;
	Tue,  8 Nov 2016 12:32:26 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id 51so145362070uai.1;
	Tue, 08 Nov 2016 04:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TOLwsGPZmpCj+qPBRi9UXPLdACnRCq6fbY+OySlVU7E=;
	b=ZtcJ9qu8kuIvXmLOOIiqtmpWlMq3Z8NL7J0HlUnDwsfXS3oZfD8ak+kLuOi9xuM3hE
	Rd7j5I1CTVdmnGv2CGYu/v+fC8ilOrX6gdFRJaMrOmFVmGQSt79S1MD38G1Lt6exZPNU
	paqM7hrwdQVHQEK+2KHjfoPpm5rUj4savE7rHJLC5+DtYK+iUSdrCMKjJt7HR+ZVf2kZ
	7WVpxnUEN5eQlqoT/oV4a1Uqu7uIEvtzMx3yZOt5aLedkHn1Lvxuw01yvZm36u495Hg6
	detcHsfto1T8Y9SbBd6KjT3d1TaLrPkIi32JKSzNCeg7Dtj0gTRIC6Eh3fV0On9FsrN/
	BheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TOLwsGPZmpCj+qPBRi9UXPLdACnRCq6fbY+OySlVU7E=;
	b=WkN4C9TGC9aqjjG5ySXmHI5Xdyr1BFMgeXJRs1iay88XtrVtCJnhhLbIt21SVH03q5
	i/pwnSJcvDUy9aXljQj5TN02HvOjZZ4BdW3+z2hS1uH/uCRr2PQM+P7FeLH4Ln4YEn22
	5n3+6XolBxOqM6UyM3stDnxBZb+qkf5u6HVOLyweU4bi3GtFrd8lPa3KfL/5mkW4vsFj
	ZlA30F5oLKxJZh7lKoeFmW6uzicDGPhO95etGiGaRupOENjtEwDI20tnauDoJyeReeHH
	wiIRDb+e4v2H3kgFMr26w1hAHwhlWIl1+7x2ApTqOZo8qMww45Fsp8+N+cHWDTbwxwa+
	V6yw==
X-Gm-Message-State: ABUngvcRe870+c962yk795tvN6GN7BbKu27cpjrn/rSH1v1AB2svNDvPA7nAwWRSzrtI9nLNILe9c8AEuSMJAw==
X-Received: by 10.176.84.152 with SMTP id p24mr214954uaa.76.1478608347867;
	Tue, 08 Nov 2016 04:32:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Tue, 8 Nov 2016 04:32:27 -0800 (PST)
In-Reply-To: <20161108122406.GA2916@jama>
References: <20161108122406.GA2916@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 8 Nov 2016 13:32:27 +0100
Message-ID: <CALbNGRSLA=tipe+eed4wSKzw0ycs0g+gZVUAC_6cq6Q=WBMjEg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world 2016-11-03
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
X-List-Received-Date: Tue, 08 Nov 2016 12:32:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2016 at 1:24 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> Please note that the logs aren't available online, because the server wit=
h logs
> was moved to other HW and the files weren't rsynced (yet - at least not t=
o correct
> location visible as http://logs.nslu2-linux.org/buildlogs/oe).
>
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date               !!colspan=3D'3'|Failed tasks                     !!c=
olspan=3D'6'|Failed depencencies                    !!|Signatures          =
  !!colspan=3D'12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||qemuarm=
||max||min     ||qemux86||max||min     ||all   ||already-stripped      ||li=
bdir        ||textrel       ||build-deps    ||file-rdeps    ||version-going=
-backwards       ||host-user-contaminated        ||installed-vs-shipped  ||=
unknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig  =
   ||pkgname       ||
> |-
> ||2016-11-03    ||3     ||3     ||2     ||6     ||3     ||2     ||6     |=
|3     ||2     ||0     ||0             ||0             ||1             ||1 =
            ||4             ||226           ||1             ||1            =
 ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Failed tasks 2016-11-03 =3D=3D
>
> INFO: jenkins-job.sh-1.8.11 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/log.report.20161108_021000.log
>
> =3D=3D=3D common (2) =3D=3D=3D
>     * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3=
.bb:do_configure
>     * openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb:do=
_compile
Woops - I touched both recently - can't wait for next build with logs..

Andreas

