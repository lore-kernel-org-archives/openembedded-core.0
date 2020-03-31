Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.6434.1585652283729339141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 03:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJEak-0003pU-HS; Tue, 31 Mar 2020 12:57:58 +0200
Received: from localhost ([127.0.0.1])
	by ptx.hi.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJEai-0006aT-Ir; Tue, 31 Mar 2020 12:57:56 +0200
Message-ID: <9464fbdc93aa48aac796a3ea44e04efcd9564963.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH] file: explicitly disable seccomp
From: "Jan Luebbe" <jlu@pengutronix.de>
To: Ross Burton <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>, 
	Martin =?ISO-8859-1?Q?Hundeb=F8ll?=
	 <martin@geanix.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Enrico Jorns
 <ejo@pengutronix.de>
Date: Tue, 31 Mar 2020 12:57:56 +0200
In-Reply-To: <f6cb669c-d302-c1fa-e2ed-5995b82677ed@intel.com>
References: <20191018112819.16210-1-ross.burton@intel.com>
	 <CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
	 <1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
	 <9bac0b45-777c-faba-f448-d2d03c7e6fac@geanix.com>
	 <CAMKF1soa5bEfN23uPAhDCk4rfD_OGjaf2xR+m5ET9cLt+kOn0Q@mail.gmail.com>
	 <f6cb669c-d302-c1fa-e2ed-5995b82677ed@intel.com>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2020-01-20 at 17:10 +0000, Ross Burton wrote:
> On 20/01/2020 15:45, Khem Raj wrote:
> > pseudo needs some love since it alters syscalls which go out of bounds
> > what is allowed by libseccomp until then pin your file version to 5.37
> > in arch till a supported distro is affected by same problem. It wont
> > be long better option is to fix pseudo
> 
> That's not quite right.  pseudo LD_PRELOADs itself into file, and makes 
> syscalls which are not whitelisted in file's seccomp configuration.
> 
> There's nothing pseudo can do to solve this.

I stumbled across this thread when checking why libseccomp is not in
oe-core or meta-oe. It seems to me that pseudo could intercept the
seccomp(2) or libseccomps seccomp_* function calls and report them as
unsupported to simulate running on a kernel without seccomp support.

What am I missing? :)

Regards,
Jan

