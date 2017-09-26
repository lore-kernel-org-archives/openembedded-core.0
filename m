Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8857804E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 19:22:40 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id g32so13741178ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V0k4Nk6d05X7if0ct7eQNIqqudZoLmLZB/lHNLnCjJg=;
	b=GMghNEBEwZLhkvUVmXuDyPiWeb40JfhCX9WDK0VmLQm7aaqR8H3Lz9ahReCVErVaqa
	nSXO+aLwKrefXsGulCTCi21CdIY6v0dRYmhGB/zM4gu96R4z6oEQ3atZKd5SOxJIW1Wk
	szCLreeQdzaeTxVWi+MAIyb7xOuZPsXUV8YoDK87SsCJ8VDSYpzYe0aUH5zzRVAA78TS
	Arvkt9q8BlglDzgel46hnekfhnSBsL+nV+sfIAp81uHRgcsdEhWmz3y2rWGRSa3fBMGY
	HIp0g6+yeLCpHcP8d3McQAnTub/+SDUM32kuQZwqA5NnZZ6ofMEAVVTpST8GWEQ5LeYF
	+7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V0k4Nk6d05X7if0ct7eQNIqqudZoLmLZB/lHNLnCjJg=;
	b=Rl/+GeZQ8p255GbPH6MQASA+Sj46k0ghrCjxb8bBruhDeuJKhhXw/yq8IpIIGqYzVb
	Y2HVDtiSbLeH4NrZ9u9oMSx947f5ozmYuoCcg2Mb1vqHVfwn26vn2fxO6M+9AXdakOwI
	NRQGD3a3f2NpWV9gzB+lg0YxSaoDcCVm/ftUnyoToZOmkAQds2dNhZMVe6EpFJ+CvbV3
	T7FARR2pEY5SYeuUG1WeQs+ddLrvv9HX4VqZV8s6IeDw0DY5aDLPT93IE/TB8Y9McxiU
	lZoUbfu+pqwa6U5eb6oBHUeSeym+ObyxfZunSVmJTjhBH518vxVQhGUrTAyMxxXIhW1+
	IcDQ==
X-Gm-Message-State: AHPjjUgQF47POFmXm2AK5Uy1q6qWXPwd+15ov1hDeUFCoBNcGqpCx2LT
	saWHUND/WDOI84lY6sWkOE+JIs7OKGfg5DMeV6qfYA==
X-Google-Smtp-Source: AOwi7QD6G750FV1kpIiCcqSLngsJKzGWXV18lj+tYuyUJ7wp9QWJ7pbPJ+uOXfBW5xhyrbGyqj5ixc6rRQfNrWStjKU=
X-Received: by 10.107.135.72 with SMTP id j69mr16625164iod.210.1506453761836; 
	Tue, 26 Sep 2017 12:22:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 26 Sep 2017 12:22:21 -0700 (PDT)
In-Reply-To: <CAP9ODKpM8_5_AdiO=g-FbcZEH7EVby5nKniQ0m2XhVRdbG593Q@mail.gmail.com>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
	<20170922110243.10454-2-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LYMQ9NAvK+zNegmtbPQnPao1rx6wQM1q48TRP6FDUopHg@mail.gmail.com>
	<CAP9ODKp6tsZd34jS1QzDnEpi=0ALSs8GaHFPC9iVO-5wjkUD7A@mail.gmail.com>
	<CAJTo0La3fRSYaQAgWZt-qWB-noNsqvgO8Q2G4wYgqj62qB8Mug@mail.gmail.com>
	<CAP9ODKpM8_5_AdiO=g-FbcZEH7EVby5nKniQ0m2XhVRdbG593Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Sep 2017 20:22:21 +0100
Message-ID: <CAJTo0LbzUwTeLro_gQ9-sNq3qVJjq9xk=vf1BWyW5krM6=T1Hg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/4] wayland-protocols: Fix installation patch issue
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
X-List-Received-Date: Tue, 26 Sep 2017 19:22:41 -0000
Content-Type: multipart/alternative; boundary="001a113f8e70586058055a1c9940"

--001a113f8e70586058055a1c9940
Content-Type: text/plain; charset="UTF-8"

On 26 September 2017 at 20:19, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Are you using pkgconfig or pkgconf?


pkg-config.

Ross

--001a113f8e70586058055a1c9940
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
6 September 2017 at 20:19, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">A=
re you using pkgconfig or pkgconf?</blockquote><div><br></div><div>pkg-conf=
ig.</div><div><br></div><div>Ross</div></div></div></div>

--001a113f8e70586058055a1c9940--
