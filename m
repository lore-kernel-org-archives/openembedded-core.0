Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id A3B977DFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 23:00:56 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id t15so2715278uao.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 16:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b1Jhj26a2IHRXU99IsR1WG5fQ0CVjwLZZzVJuuDOX98=;
	b=L154wuWKpip6tENLKyl+Y5xqg/cHTR8+YoH0/ekxHyONoh4CNwRpYlEdX+OYpDrpyL
	wPUf2mZm4n5npBti0fT6CaO+LihvG/5XM1hvzhydKXb4kaFYBcnm1paLKMhzgOdH/17Q
	LhSQFfB7n67wx2e9hXDFD08NHe1heuJ5Juxvofg5fMqKEbzkEKs/IUqKjEdqq8PVE7FL
	sNy10WZrLfszXDGu6U+9w+kBEO/X1bhFJTo/4tlJVZvQwLvNulRuU9tus5vhi6MukoS8
	CvnRn/xxInBUg9C5gntz0mB9xxHz1oDihp0ELC+AvjHgbZMLcYiOcNRx/usWfGB0oJNP
	Wl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b1Jhj26a2IHRXU99IsR1WG5fQ0CVjwLZZzVJuuDOX98=;
	b=nwlapBuqqTg/1gnsf76EtZOv0ftBiNV21Hlxggp2ePsIP1w8UJfrZ9dZ7B4acGfeP8
	52Js9l3aRnFjZR23a5beNcQv5jQQzclfOCMwkNwlSfsvs568I5omXzrtcs8Vu95X1E/I
	VEEe28cPbkDHW9QdZz/0StFaf7jFDxAxkjbX7L6e3eGxaW6Qv0We0OwojAYfMK8QgWVS
	0NSps1pmmJ7NlUA50OT2QTGYQ6i5yvDbRh6LGEXaZ9u0CMfHI22vWS21PE6ZbD9jXTpn
	At8lkx/c1LU/jNpqKy1IzkzdndYZJftKpemX5n+dRDyglBBQdLBFq1tHKT/KTsuBiUj2
	5uPQ==
X-Gm-Message-State: APjAAAX+J/2uwheDI8eDq8XixQeGYdj1kCv6+hKGUgwuuf0FaHPxc0vp
	Q5wrz3BwifHsm1pKS3f3Jnyd/Tq/rU4G9tPA6jQ=
X-Google-Smtp-Source: APXvYqzznfPD4FH2B6UvI8aEWpaK+H/DSgTU0cIR+IWKSUWc1YS475HcxcboKtz6MM+LGZVrEqqawh/kGSX1DRjeaqs=
X-Received: by 2002:ab0:2692:: with SMTP id t18mr873017uao.106.1557529257281; 
	Fri, 10 May 2019 16:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
	<283277a6-b6d3-a1c8-b0dc-cd4e37232fc5@gmail.com>
	<5f672760-135c-2ebc-aef1-65af6b1e9d4f@gmail.com>
In-Reply-To: <5f672760-135c-2ebc-aef1-65af6b1e9d4f@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 10 May 2019 16:00:45 -0700
Message-ID: <CAJ86T=V98Sv8re5sTq8w8KHAvHJKi2uSvDs4itO69SgXbi1JGQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Fri, 10 May 2019 23:00:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 10, 2019 at 3:16 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 5/10/19 3:13 PM, akuster808 wrote:
> > should we change the default to openssl ?
>
> I dont think so. Since newer versions of gnuTLS works okay.

Isn't one of the goals for OE 2.8 to replace dependencies on [L]GPLv3
components with non-[L]GPLv3 alternatives so that meta-gplv2 can be
deprecated? This would seem to fit that goal exactly.

It wasn't possible to build glib-networking with openssl until very
recently but now that it's supported upstream I think we should
switch.

  https://github.com/GNOME/glib-networking/blob/master/NEWS

> > - armin
> >
> > On 5/10/19 2:55 PM, Martin Jansa wrote:
> >> * gnutls from meta-gplv2 isn't new enough for this version of glib-networking:
> >>    meson.build:74:0: ERROR:  Invalid version of dependency, need 'gnutls' ['>= 3.4.6'] found '3.3.30'
> >>
> >> * disabling gnutls PACKAGECONFIG isn't an option either:
> >>    meson.build:131:2: ERROR:  Problem encountered: No TLS backends enabled. Please enable at least one TLS backend
> >>
> >> * add an option to replace gnutls with openssl
> >>
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >>   meta/recipes-core/glib-networking/glib-networking_2.60.1.bb | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> >> index 09af229d69..e2b4cffb2b 100644
> >> --- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> >> +++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> >> @@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] = "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0a
> >>   PACKAGECONFIG ??= "gnutls"
> >>
> >>   PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
> >> +PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
> >>   PACKAGECONFIG[libproxy] = "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
> >>
> >>   EXTRA_OEMESON = "-Dgnome_proxy=disabled"
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

