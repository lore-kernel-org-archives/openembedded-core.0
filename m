Return-Path: <tristan.vanberkom@codethink.co.uk>
Received: from ducie-dc1.codethink.co.uk (ducie-dc1.codethink.co.uk
	[185.25.241.215])
	by mail.openembedded.org (Postfix) with ESMTP id 072A46FF5B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTP id 1031D461CB8;
	Wed, 27 Apr 2016 22:49:15 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at ducie-dc1.codethink.co.uk
Received: from ducie-dc1.codethink.co.uk ([127.0.0.1])
	by localhost (ducie-dc1.codethink.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rXA8eCgnbD0g; Wed, 27 Apr 2016 22:49:13 +0100 (BST)
Received: from think.local (modemcable077.52-176-173.mc.videotron.ca
	[173.176.52.77])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTPSA id 713D34602B4;
	Wed, 27 Apr 2016 22:49:12 +0100 (BST)
Message-ID: <1461793751.1952.157.camel@codethink.co.uk>
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2016 17:49:11 -0400
In-Reply-To: <AA0B3083-2B59-4902-AA1F-7326B9E8D7A2@gmail.com>
References: <1461617044-25526-1-git-send-email-tristan.vanberkom@codethink.co.uk>
	<1461617044-25526-3-git-send-email-tristan.vanberkom@codethink.co.uk>
	<C2525670-C153-4CFC-B911-0567821B899B@gmail.com>
	<1461688282.4356.31.camel@codethink.co.uk>
	<AA0B3083-2B59-4902-AA1F-7326B9E8D7A2@gmail.com>
Organization: Codethink LTD
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] Backporting binutils bug fix to the 2.25 branch
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
X-List-Received-Date: Wed, 27 Apr 2016 21:49:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-04-26 at 09:34 -0700, Khem Raj wrote:
> > On Apr 26, 2016, at 9:31 AM, Tristan Van Berkom <tristan.vanberkom@
> > codethink.co.uk> wrote:
> > 
> > On Mon, 2016-04-25 at 13:55 -0700, Khem Raj wrote:
> > > > On Apr 25, 2016, at 1:44 PM, Tristan Van Berkom
> > > > <tristan.vanberkom@
> > > > codethink.co.uk> wrote:
> > > > 
> > > > We fail to build webkit on aarch64 due to this binutils bug:
> > > > 
> > > >   https://sourceware.org/bugzilla/show_bug.cgi?id=19353
> > > > 
> > > > Applying patch which fixes this, stripped out changelog entry
> > > > from patch to make it apply without error.
> > > 
> > > 
> > > which branch are you proposing this for?
> > > we use 2.26 on master
> > 
> > We are using the jethro branch, sorry for leaving out that detail.
> > 
> 
> OK, add [jethro] to patch subject line then, so it gets attention of
> release maintainers.

Thanks for your guidance.

I've re-submitted this one to the list with [jethro] in the subject
line (this one is obviously jethro specific), I'm not sure if the other
two patches I sent apply to master at all - I will try to at least
verify if either of those issues are fixed in master.

Cheers,
    -Tristan


