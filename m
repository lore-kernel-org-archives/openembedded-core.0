Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 06E3B7D94B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:24:16 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id u65so3295328itc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=l9FIXoKA7+QXgePbe7n5apIS3B1ZZ+00Elhy/rAUPTU=;
	b=mgoObMBZc/mRtfABG9ByoWvvRzORNAbIOuBzjX85FXv2dYsZWraG8vGo4x6FyMnspw
	6/dZrsNWkkrJzUAm/hPUc1IqpPLYCOmdnVW3LwsFK/z5EUruvdi7BZS2LpXgcoalFgua
	GYRl1v2IDEouq/O4jKPnjPAs0IXvN2Gl5UoVtY+GQaky5D3yvhRaNHN7CYuCB9Kn8MO1
	52+P4g242qjNW6EojLR/rZLYksuPuoXzRVZ0wmWZRp7hBwuWX0htWSWYXXlY1NEvl5Fw
	yo+rk3Wr7XStR5ye+Mfz5WhEPw9gWy0mEkEmKLYgySmapSv0v+XRKpuiGQeM3lYXqyRo
	hLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=l9FIXoKA7+QXgePbe7n5apIS3B1ZZ+00Elhy/rAUPTU=;
	b=PALseWJFrGLCrw+5LElS4thlyYHOmwXqnZWR+F0Hr+ZXpnekaDsUL4ycZYsFv46yZL
	u0NGBfr+UD/QYC1gCstDNV3uagIDSHyCKYNz2jFKPtJP35jLXnsA7wwMLyqRcv7GXBdR
	W75RmhRbxnpDL7cCx3WSf2OqMHgqTypLisL4kMn/i4Aa+cdXbzyNm27j/XaKE4JQDx+g
	D915dBoSyoWJwxafUT0aUPzIPq3ow1BpszaGHzjr7X5ggT5Zkz86Jjj8nEBG4ucrcDNN
	/iDGXW2b3s9OHZ8PfIzXWq/5Og6zSvwG8fIwrLyOIMsoUmoHfW1RUXXZ4AIuHSYturox
	9DFw==
X-Gm-Message-State: APjAAAVOXkqjIC8HeVthcZ3KYwUpUdfNSm2wTK/StUMCdcoHNVALv/UX
	PL0DUj5l1q1/q4h7UgqCdS9gydAS2r7080B67pk=
X-Google-Smtp-Source: APXvYqxy+EGG4zqZTdftjkRJTc6euJrv3J+OgeKZHBqxUb0A7KyME2zfxAop+PS4KP9NnmMzDFb0dpXzuo2yzVutjio=
X-Received: by 2002:a24:fc06:: with SMTP id b6mr2780291ith.130.1554902657964; 
	Wed, 10 Apr 2019 06:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRT1ng9=Gfd8m9g=L4BnyvsF6qE_rL79DxdDNZ8yKaEtDA@mail.gmail.com>
	<CAJTo0LaSMUzctZU-hXvA4DpuqubBY3GNPGrFJM6Etd-96NxZ5A@mail.gmail.com>
	<CALbNGRSeHpT2xFrJkPUEey-BbXZnBnNZC96cZ_9joUN2UWeTkA@mail.gmail.com>
	<CAJTo0Lbe62V5M4gtyDexboyraoX1RLAt-Q2AQvYzw1Di=1_NqA@mail.gmail.com>
In-Reply-To: <CAJTo0Lbe62V5M4gtyDexboyraoX1RLAt-Q2AQvYzw1Di=1_NqA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 10 Apr 2019 15:24:06 +0200
Message-ID: <CALbNGRRtETpanrxLWd69TmKC4Qwm5VuGu=feNeECXM+cZO8AoQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build broken with current master
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
X-List-Received-Date: Wed, 10 Apr 2019 13:24:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2019 at 3:00 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Tue, 9 Apr 2019 at 22:41, Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
> > > The recipe that depends on docbook-xml-dtd4-native also needs to
> > > depend on libxml2-native.
> >
> > Do I have to go through recipes failing - or is there a chance for a
> > common solution?
>
> Very few recipes should be depending directly on docbook-xml and
> docbook-xsl, and they'll need the depends added.
Had two and stopped then.
>
> A common solution would be great but would mean adding new dependency
> support into the staging code.
>
Rolled back - have no time to look into this one.

maybe naive but is

RDEPENDS_${PN}_append_class-native =3D " libxml2-native"

in docbook-xml-dtd4 a possible way to fix this in a common way?

Andreas

