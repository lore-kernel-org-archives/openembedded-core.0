Return-Path: <matt@madison.systems>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id EDEDE71A71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 21:22:55 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id 54so4989061wrz.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 14:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yDlagIqN7J3R2QwgmSB+oCuUERXepkgFBTGUJypDiGo=;
	b=PkGZv6c1PpXmob15d526OwepcVR3eF/iQvtL6nt/3ULx64r+Tu2a+oErYy1R2k3zZh
	CQr2ig0zg8e7uDRz0FF+lA0ydc+t0O1S9ez0rXx3jHaetRo82oiz8nUIowpC/0aJenNl
	WIpqy3JPs/YNzbQ3x1GvcBl7jf+rBoDde4z9LryMTag8KUasrbyIl9W2qk/KYbpKma+p
	oVMVE+oZa7D4xzGcdJbl3eabrCFXBeJnLO6ggVrYlLhFFhg2nFdGqs4oVbMsQv22QCmx
	DaoP9BY5OY0FWNfemc0/JHh8Lf6F4QejAsLnXdJVKHT86BZuYB8hDQWgM1aZygX90a1O
	yNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yDlagIqN7J3R2QwgmSB+oCuUERXepkgFBTGUJypDiGo=;
	b=OpT6+HvHr4yEYFhb6qjMHDZuiwii1jlhb3FDeDDW0aaNwJQFkiMNNNjDxjvq71htOD
	e5LXD/JIAKTIXM0bAw87B4dBlSeXGTUHbTNDj5N/Hz5bikOTrWFRX20nEx372IQl/k8M
	58VOYLkowO1RA+tbzV6izotjwVqDTeclx/TRCirgNAsZ/ukfxcDq8cV4BxnceVnW//F0
	3L/RbMPbqNPgVr97PC4x0m82GxGjAO9wZqZi2Hhl4qGmW3lvsOT0aO2dEcplb/kkiShK
	q0qG15/baj9D1i4lSLSYL8WiDQdqOapgnNVUxAzLIy0okSaFNK+opRGekyuaSiWPijuk
	fVyQ==
X-Gm-Message-State: AHPjjUjMaChyxdu755JcgFb8kFRMv220abEmYeggAUHtBjnZOgXR9BZ6
	pc8jqs679R9pm/PWLSs5w/P6HN6i1JiLsHpbMPdk8A==
X-Google-Smtp-Source: AOwi7QCnz0FwRgTKXomNmuNX9tIt7bCtsb9tp7vFLKnY/3uhiYQISucvqtyTDGAaNlfIlkq9aqFndTPFuM4WzUfCEWs=
X-Received: by 10.25.74.75 with SMTP id x72mr716345lfa.186.1506633776537; Thu,
	28 Sep 2017 14:22:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.225.68 with HTTP; Thu, 28 Sep 2017 14:22:55 -0700 (PDT)
In-Reply-To: <CAPyrkgyyXnZCkL=_GzW1pwfXzUmRrRQ8UiqNDcKdGiNqc5ruSQ@mail.gmail.com>
References: <CAPyrkgyyXnZCkL=_GzW1pwfXzUmRrRQ8UiqNDcKdGiNqc5ruSQ@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Thu, 28 Sep 2017 14:22:55 -0700
Message-ID: <CAGgRHJrwm9yWbSrK_3FpgTxKVuAjhpF31U9TAUeq9asLhY91Ag@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Go runtime host contamination
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
X-List-Received-Date: Thu, 28 Sep 2017 21:22:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 10:28 AM, Paul Barker <pbarker@toganlabs.com> wrote=
:
> Hey,
>
> I'm trying to upgrade runc-opencontainers in meta-virtualization to
> v1.0.0-rc4 and hitting a host contamination issue.
>
> Both host and target are x86-64 but I'm using glibc on the host
> (Ubuntu 16.04) and musl on the target. I'm getting link failures
> referring to missing symbols "__vfprintf_chk" and "__fprintf_chk" in
> libcontainer. I'm pretty sure these symbols exist in glibc but not in
> musl.
>
> The failure is occurring when trying to link libcontainer which uses
> the go extension cgo to incorporate some c code in with the go code.
>
> Using a pretty dumb grep, I can see the contamination in the go-runtime p=
ackage:
>
>     $ grep -r __fprintf_chk
> tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/
>     Binary file
> tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/usr/lib/go/src/ho=
st-tools/trace
> matches
>     Binary file
> tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/usr/lib/go/src/ho=
st-tools/pprof
> matches
>     Binary file
> tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/usr/lib/go/pkg/li=
nux_amd64/runtime/cgo.a
> matches

Yep, I see what's going on here.  I have a patch in the works to take
care of it.

Thanks,
-Matt

>
> The go build process seems to build host tools & runtime first and
> then the target runtime, even for the go-runtime recipe. It looks like
> it's installing the host version of the runtime library instead of the
> target version but I'm not 100% sure here. There is some code in
> go/src/make.bash to handle the case when host arch & os match target
> arch & os and I think this is getting tripped up.
>
> I can provide further info and logs tomorrow. Just wondering if anyone
> has seen this sort of problem before and has any suggestions.
>
> Cheers,
>
> --
> Paul Barker
> Tog=C3=A1n Labs Ltd
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

