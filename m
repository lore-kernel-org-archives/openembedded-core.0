Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id DECE76172D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 21:20:14 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:50652 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j5cC7-0018ro-9F; Sat, 22 Feb 2020 16:20:15 -0500
Date: Sat, 22 Feb 2020 16:20:13 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20200222211724.GC9628@localhost>
Message-ID: <alpine.LFD.2.21.2002221619190.11095@localhost.localdomain>
References: <alpine.LFD.2.21.2002221554210.9952@localhost.localdomain>
	<CANNYZj8EchSZ1vEPiOnx9n9X+osuikbL9hvYpnoykkPY+k66Og@mail.gmail.com>
	<alpine.LFD.2.21.2002221605550.10479@localhost.localdomain>
	<20200222211724.GC9628@localhost>
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
Subject: Re: can i totally ignore recipes not related to the current build?
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
X-List-Received-Date: Sat, 22 Feb 2020 21:20:15 -0000
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Feb 2020, Adrian Bunk wrote:

> On Sat, Feb 22, 2020 at 04:07:56PM -0500, Robert P. J. Day wrote:
> > On Sat, 22 Feb 2020, Alexander Kanavin wrote:
> >
> > > BBMASK?
> >
> >   BTW, that will work for me in this situation but is there a way to
> > not have to enumerate all the recipes to ignore, and just say, "don't
> > look at anything that is not related to building core-image-minimal?"
> >...
>
> How do you know without parsing that a recipe is not related?
> Information like names of packages built or RPROVIDES are in
> the recipes.

  ah, good point ... i am not really thinking this through. duh.

rday

