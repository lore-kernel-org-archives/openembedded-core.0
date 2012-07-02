Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SlqZB-0008HN-8i
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 02:02:05 +0200
Received: by eaal1 with SMTP id l1so2314871eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 16:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=1kpk9V+BpfiS2GRiMVp1jNVxEIqjL/3mis27HslIUk8=;
	b=WkCB67R5Mq5Imk0JAaQokDzdvOvwjb0xu5ki69qLc8nSPI+3CS0UflXWJdEXbPiJii
	clXhF0GyPGKohW0mxk6T8Y5iuf1PFwa9KHJxKitv39CauGC8LPyk7Clp7d1793lj0hKN
	enYBH4N9PZoETw+jpnBxT9Tf7Xk3ryBQ6ErW+DZOfnuWv33A6y0kdOmu4pyENx9PHVmD
	OMyoqhZNQk8upR2wPo5NNoKLQeuM8foLuE9aPCs0zsTdRCK7eDY8OexFL9IMgLVqfymP
	akVvl6fA3IL+P5vMQ2Sl49ta52EFqGQVu15oqkcvkE9p6hvFDXbVE0JZBBRGUJmKC2ze
	cdZg==
Received: by 10.14.99.201 with SMTP id x49mr2337475eef.142.1341273064151; Mon,
	02 Jul 2012 16:51:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 2 Jul 2012 16:50:34 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207021702510.27692@oneiric>
References: <alpine.DEB.2.02.1207021702510.27692@oneiric>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jul 2012 16:50:34 -0700
Message-ID: <CAMKF1sq7qJZKqjN14M=uhu3ub69_PtyrkOmL2Z31Xf0MCp=xLg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: any value in still accommodating pcmcia-cs?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 00:02:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 2, 2012 at 2:04 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   given that pcmcia-cs has *long* been deprecated in favour of
> pcmciautils, is there any value in still supporting pcmcia-cs?
>
bitbake.conf still falls back to pcmcia-cs if no PCMCIA_MANAGER is set
so I think many
might be using it unintentionally. I am ok with dropping pcmcia-cs
just make sure
that all references are gone too.

> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


