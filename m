Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.8658.1591713189051789574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 07:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:37306 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jifJK-0009rE-KU; Tue, 09 Jun 2020 10:33:07 -0400
Date: Tue, 9 Jun 2020 10:33:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: Ross Burton <ross@burtonini.com>, Enrico J?rns <ejo@pengutronix.de>, 
    Khem Raj <raj.khem@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>, 
    jlu@pengutronix.de
Subject: Re: [OE-core] [PATCH] remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
In-Reply-To: <d8a4e2fc32bfec3e84d3e2ca6036e2ff74c755ba.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2006091032210.14841@localhost.localdomain>
References: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain>  <0d663371-0bb1-9ae8-a50b-bc4ed7fda412@gmail.com>  <CAMKF1spsARiB5ibBVZ2AF5sLGw9cAakGos-yqbfn=NG6B+nw9A@mail.gmail.com>  <2cf81259a8f75130bc7dfbb473ab92017d054ae4.camel@pengutronix.de>
  <CAAnfSTsshwC-aOTMR=6rx-04QaoVDJh3L6Turr1MsBwH2sbCFA@mail.gmail.com> <d8a4e2fc32bfec3e84d3e2ca6036e2ff74c755ba.camel@linuxfoundation.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jun 2020, Richard Purdie wrote:

> On Tue, 2020-06-09 at 14:33 +0100, Ross Burton wrote:
> > On Mon, 8 Jun 2020 at 21:15, Enrico J?rns <ejo@pengutronix.de> wrote:
> >
> > > What is the now suggested way of placing these kind of binaries?
> > > Simply in DEPLOY_DIR_IMAGES as the above-mentioned commit does
> > > (silently)?
> > > Or is there maybe still some motivation to keep DEPLOY_DIR_TOOLS?
> >
> > FWIW, meta-arm is also using DEPLOY_DIR_TOOLS and to fix builds with
> > master is now manually using DEPLOY_DIR/tools because having a
> > separate directory does help introduce some structure.
> >
> > Basically, I'd actually like to see this reverted.
>
> I'm tempted to agree. It was only merged on the basis that it was
> unused which isn't true.

  in my defense, i almost immediately admitted i hadn't noticed it in
meta-openembedded.

rday
