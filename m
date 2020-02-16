Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 40E306142F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 13:04:20 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:60560 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j3Jau-001xeh-BN; Sun, 16 Feb 2020 08:04:21 -0500
Date: Sun, 16 Feb 2020 08:04:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
In-Reply-To: <0e84f991adc74cbc9de3abcbb8dc3cfc@XBOX03.axis.com>
Message-ID: <alpine.LFD.2.21.2002160803180.2281367@localhost.localdomain>
References: <alpine.LFD.2.21.2002160247270.2008500@localhost.localdomain>
	<0e84f991adc74cbc9de3abcbb8dc3cfc@XBOX03.axis.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fix various, innocuous typos
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
X-List-Received-Date: Sun, 16 Feb 2020 13:04:20 -0000
Content-Type: text/plain; charset=US-ASCII

On Sun, 16 Feb 2020, Peter Kjellerstedt wrote:

> >
> >   /****************************************************************************
> > -@@ -259,38 +263,39 @@ cpu-state-varible M.x86.mode. There are several potential states:
> > +@@ -259,38 +263,39 @@ cpu-state-variable M.x86.mode. There are several potential states:
>
> Don't change this. It is part of the patch context information. Even if the
> part after the second @@ is just a comment, it matches information in the
> existing file and that is no longer true if you change it. Moreover, it will
> just be reset if someone refreshes the patch.

  ah, quite right, i was being sloppy and not paying attention to
things like that. will fix (that and others) and re-submit, sorry.

rday

