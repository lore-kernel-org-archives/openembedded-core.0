Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.14422.1629895333010836144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 05:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:39102 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mIsEL-0000RY-VC; Wed, 25 Aug 2021 08:42:10 -0400
Date: Wed, 25 Aug 2021 08:42:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ross Burton <ross@burtonini.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] should "${D}${systemd_unitdir}/system" => "${D}${systemd_system_unitdir}"?
In-Reply-To: <CAAnfSTunSXr2u5xjdj2-cVPFq0acHxn_SWE7hha8xXBNOYtx=g@mail.gmail.com>
Message-ID: <37c93c88-37b0-27fd-8c25-b8edef979e73@crashcourse.ca>
References: <74a0ce8a-7158-789-2e7a-b05d7937eed5@crashcourse.ca> <CAAnfSTunSXr2u5xjdj2-cVPFq0acHxn_SWE7hha8xXBNOYtx=g@mail.gmail.com>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Aug 2021, Ross Burton wrote:

> No, yes.  systemd_system_unitdir is newer so it's used less.
>
> Ross
>
> On Wed, 18 Aug 2021 at 08:48, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   i've (so far) run across a small number of OE recipes that use the
> > identifier "${D}${systemd_unitdir}/system", which appears(?) to be
> > equivalent to "${D}${systemd_system_unitdir}". is there any potential
> > functional difference, or should this be standardized?

  please help me with basic REs ... i want to run a single perl
command of the form

  $ perl -pi -e 's|...|...|' $(all the relevant files)

to change "${D}${systemd_unitdir}/system" -> "${D}${systemd_system_unitdir}"

and then eyeball it afterwards to make sure it's sane, but i can't get
the proper combination of quotes versus backslashes. i can generate
the list of appropriate files with:

  $ grep -rl '${systemd_unitdir}/system' *

but it's the perl expression that is defeating me. help.

rday

