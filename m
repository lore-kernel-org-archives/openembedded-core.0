Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F1110F2846
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 15:40:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75520.1774626048142746652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 08:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CNoBZ1Xc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-487012ce896so14133105e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774626046; x=1775230846; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=24LX7ECCe6hbMBVdfiDVJrlgWQKLFfpmrs15wJ2n9mw=;
        b=CNoBZ1XcKUxK3fgsv8Hhi1zJmZOnFYEyvHdcjXytiGJzGrgzP5zz2+W7GU86Q8cZYP
         +vmOSJqCstOsoOOLqletA3R9fH34oX3zVaO+IZ5KBgVAObQ6k1n5Q+Kf2QCSi/WMvnsC
         3UwXq355CWENVxRR3TX6E1l/9T3l8YPpkPoG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774626046; x=1775230846;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24LX7ECCe6hbMBVdfiDVJrlgWQKLFfpmrs15wJ2n9mw=;
        b=FsRQLuKRRSZ5japP9H12tqUz/Zgzp+9gNYjZhl5TSDV55vx5VNP0bbkx//ZpFwvsVV
         at0dkORavI+pVgKQt3CxoYEyJVDZfYrHU7s+zOgXT1mWyMjAPrnlk8kfAWkXvhbLZ74r
         TZLCSu8BI0UM+4USXLryxbZXpq2lHec/WgCQYsU6IxPqZB/Gzn900RwHoAieVywVY17A
         P7LO9Y0WmGvZDNDlHkMaB3kzQirw5dzxsilA/sC78yQHkjMlixiVL9c2dR8wd3v4klUT
         pXCPWxIidfmtiEobz/zRPofuFLOABH4FNBbMBGYzjEVPVKnjGSw4wpDhVgF99qigOoO1
         WaXQ==
X-Gm-Message-State: AOJu0YynqxQYkGm7moXUNXQXKLEw3NTDVOuMfIhDsGANtHdDtYqnqJXR
	EAI5NXN8rC8Qtn9FVBZJxGo+47dJdxuImO2HMroDu7EZEMMYJTpPLNNVsOV2g1UAnBpFZ+i4Gx0
	cE22/
X-Gm-Gg: ATEYQzzq43FLL6nWwixPbO0pTnZ4hwUUZyuLdM5b5+LPFzdh3nuLPgfmy22LP5vm51D
	7b1aMnYP3EwPGScy5PCSohMgazR5t6+yb5kCiUcJGNgQ3FwcSj1o3XUPrtCcyHIjPELaWomopU+
	ZNVc2AfHqJJRpoAtjZj0VBF6JhPe0FjsbVv5GwAmYgrvKcJIpHkdqJsZJ8S+RgYhwn00G2zJq6B
	PyZNR9TSZLaOViJGkxQd+FhSdd3quiW3hpCVpHupCnvCYMpLONvIBt6DZ1uvrBiqgvnUK85+LXM
	KXwRQQqs9ujE97RYPlYwaBZ6CbtrZftnNfJp/PS9xC5vZsoZavcF5pjZ2Z4LI7nn8d5xZhIWKk3
	Mv8G5tJkwP6I7505W2ktURB4JA0FjLhzmTyyK9+6RMrs/qIWg8iWI3dUJKaIC21SZnyTwO5sslf
	tNDkc5kElfxDDL/OYvHXdo9SOiOghZKuwJa8B0gKmCLE2TjVOPMN/64azlU6ajW35F1QRjqsLt3
	91FDddgW8wTpWQB
X-Received: by 2002:a05:600c:a016:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-48727ef153cmr46658365e9.26.1774626046295;
        Fri, 27 Mar 2026 08:40:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4d9b:9818:1b9c:6027? ([2001:8b0:aba:5f3c:4d9b:9818:1b9c:6027])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm15747343f8f.19.2026.03.27.08.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:40:45 -0700 (PDT)
Message-ID: <f9aacf9124191baa4386fbcca1db435a08f8ccbf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.nystrom@est.tech>, 
	daniel.turull@ericsson.com
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "pratik.farkase@est.tech"
	 <pratik.farkase@est.tech>, bruce.ashfield@gmail.com
Date: Fri, 27 Mar 2026 15:40:44 +0000
In-Reply-To: <550d7d85-7e12-53d6-3dad-ff8e7a20ccd8@est.tech>
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>
	  <20260325084021.3915804-2-daniel.turull@ericsson.com>
	 <136e62fde93b3b6a61cbd476f2b19724500b8643.camel@linuxfoundation.org>
	 <PA3PR07MB10721A419D82B4B57F78F31748A56A@PA3PR07MB10721.eurprd07.prod.outlook.com>
	 <550d7d85-7e12-53d6-3dad-ff8e7a20ccd8@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 15:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234092

On Fri, 2026-03-27 at 13:30 +0100, David Nystr=C3=B6m wrote:
>=20
> On Thu, 26 Mar 2026, Daniel Turull via lists.openembedded.org wrote:
>=20
> > Just an update.
> >=20
> > It is taking a bit more time than expected. My original test only
> > covered the math test suite in ltp to verify the functionality.
> >=20
> > Some of the ltp test are failing with OOM, some related to systemd-
> > udev. I'll be disabling them now to have a working ltp. Then look
> > at the underlaying issues.
> >=20
> > So far I have found 4 failing test cases. Using the default config
> > without any changes with qemux86-64
> >=20
> > min_free_kbytes (mm) (OOM)
>=20
> This seems to be a buggy testcase for automation. Disable until its
> fixed.=20
> Even if the test own memory consumers sets their own OOM-score
> higher,=20
> there are still chances that the OOM-killer kill the wrong things.
>=20
> > pty07 (pty) (OOM)
> > ptem02 (pty) (OOM)
>=20
> These seem to me to be related to systemd-udevd having unbounded
> message=20
> queue sizes to its udev workers. IMO, this is a systemd-udevd issue.=20
> Some other udev implementations starts dropping events.
>=20
> We should have seen this when using runltp as well ?
>=20
> Death spiral: systemd_259.5=20
> 1. Test tight loop creating devices floods systemd-udevd's workers=20
> unbounded inbox queue(s).=20
> - Single core, low mem, and long running udev rules makes the problem
> worse.
> 2. systemd-udevd grows to consume all available RAM
> 3. OOM killer kills everything but systemd-udevd (OOMScoreAdjust=3D-
> 1000)
> 4. Kernel panic: "no killable processes"

Are the systemd developers aware of this?

You're correct that the ltp testing as currently run does sometimes
seem to have issues and not all tests pass. It is something we've been
wanting to look into and resolve but simply haven't had time.

Finding an issue like the systemd one does hint that there may be value
in some of the testing.

Ideally we'd identify and disable the problematic tests, then we would
know any failures were new and potential issues. The new version of the
patch series from Daniel does move us forward with that, thanks!

Cheers,

Richard





