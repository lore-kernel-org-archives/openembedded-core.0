Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
	[209.85.217.46])
	by mail.openembedded.org (Postfix) with ESMTP id DD5017FD7C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 19:26:09 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id k188so2522844vsc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 11:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fHCUtlo1ADQdXKRBpXM1hXz+Y19K0Iqf+Er3Wqa5gRg=;
	b=b1OxKraIrRVRKGXcBOf7jAX7Qdj9PAG4/1Vu2027TmDzVPAAsV4sQ8aN7bMMoWic3S
	OBgDkEAUiA92MRib4xfpf4z1853YTNEOcdHbIJJp8TVVhWbdco/zA3KZDyGV7n8xhRoA
	3l7ALGVBZ+4hfcfbLec2uyROHjyKX90nrqdkBgM+3N9zZztFxb2CKgDMhsuiTNzslufC
	BDDH9DUc+YIp/0zoJ9iNsWfsEFST6CBWrUmq2mkbR66taXDyXmqxxs+zm1yF98GEPRDp
	Kcip3bNaRFj6NeAtFukohb9OVPdJdsFArl0tL/ne9/8DoHyexwoYYzKV/E2Pr74feiNR
	NVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fHCUtlo1ADQdXKRBpXM1hXz+Y19K0Iqf+Er3Wqa5gRg=;
	b=II+IyigHSuRtedagPLUrT6jCoRY6MbIzDnFSIMT6JI8akaWfgLrBqxez89XSCfCa4U
	1ivkS4/x+F25Amj08lgR/9kX3nE+UZhe5CJHbLIBsi8tyzzpmGkFpmx7t28HOVuGCK3t
	A7ms+chjayPuYoFtG/+LBghFXNu2MdSm97WZRSzKUTN+wa7cViSPyig76jOBhUBF91sL
	+SL/njMG3P4lQWghlYjljItSl/ttCAu37tOXHbEypMLNxvZLZLypHwW2ytzPRGbehNnG
	3WDFwhSfju7eQO24dtrrkz++RqUyPQmoo5G7/bJQKhPp9cbLX3Og3dRYYiRv5Z9mU63c
	KGhQ==
X-Gm-Message-State: APjAAAUUAHWIF7zF5wfjedzmE7yqIIRmEVXv4Uu3Da9HRJ+IKA8hjFBt
	xsNySvM1n8oeblWm0giP5zF/DK+xpeRjF6xnXaDxcg==
X-Google-Smtp-Source: APXvYqytMw10nNVFl3cyP3uX318ClO140de3COecdYm+SeL98VP0Z4pL5hVXwbB2QdZrYh985TNud0jSX5uKK7/bbr4=
X-Received: by 2002:a67:e443:: with SMTP id n3mr7565338vsm.137.1579807570643; 
	Thu, 23 Jan 2020 11:26:10 -0800 (PST)
MIME-Version: 1.0
References: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
	<fc798fd12d4a06537fd235b6247a0193d1df3022.camel@linuxfoundation.org>
	<555772143.2167690.1579789341772.JavaMail.zimbra@savoirfairelinux.com>
	<b1cbeea067af1e54e596425c87b55b36062bb49f.camel@linuxfoundation.org>
	<1908740460.2169186.1579791546237.JavaMail.zimbra@savoirfairelinux.com>
	<91c23ebb8817e8cc5e0c1644529f6d3034749e53.camel@linuxfoundation.org>
In-Reply-To: <91c23ebb8817e8cc5e0c1644529f6d3034749e53.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Jan 2020 11:25:58 -0800
Message-ID: <CAJ86T=X=B9n3xo+aOXhfnw8JT38z6Frk1RzT2Z6BR8hyLnAcSw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Connectivity check uris
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
X-List-Received-Date: Thu, 23 Jan 2020 19:26:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 7:24 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2020-01-23 at 09:59 -0500, Jean-Marie LEMETAYER wrote:
> > On Jan 23, 2020, at 3:37 PM, Richard Purdie
> > richard.purdie@linuxfoundation.org wrote:
> > > On Thu, 2020-01-23 at 09:22 -0500, Jean-Marie LEMETAYER wrote:
> > > > I understand the issue with blocked domains this is why I suggest
> > > > the
> > > > custom domain "connectivitycheck.openembedded.org".
> > > >
> > > > But I dont know if it could be an option. Can OE have a sub-
> > > > domain
> > > > like that? maybe using some cdn to handle the load?
> > >
> > > We can certainly setup domains but we can't easily get a cdn. I'd
> > > be
> > > worried about OE's response time too.
> > >
> > > > Another option will be to provide multiple URIs:
> > > >     CONNECTIVITY_CHECK_URIS ?= " \
> > > >         https://google.com \
> > > >         https://www.bing.com \
> > > >         https://www.baidu.com \
> > > >     "
> > >
> > > Looking at the code, I wonder if a CONNECTIVITY_CHECK_MIRRORS,
> > > injected
> > > into MIRRORS internally with google as the default and baidu as the
> > > mirror would work?

How about checking github.com? That's probably the host that a network
dependent build needs to access most often.

