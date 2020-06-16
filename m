Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.7200.1592301052993857134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 02:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49mNk135j9z5tlB;
	Tue, 16 Jun 2020 11:50:49 +0200 (CEST)
Date: Tue, 16 Jun 2020 11:50:48 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] busybox: udhcpc: fix IPv6 support when using udhcpc
Message-ID: <20200616095048.im6minhd7qsjc65d@qschulz>
References: <20180514144415.40730-1-stefan@agner.ch>
 <20200113145729.amwegnpvnp2kb3ut@qschulz>
 <20200120123246.o5abx73ehcoqbbim@qschulz>
 <4e98fdb7ff73df6804e58f2f4339c816@agner.ch>
 <059aa62b-1c45-50a3-5d58-40f2646247ad@gmail.com>
 <20200121092341.bgb2elaqey75egjp@qschulz>
 <CAMKF1spxORPSqDJuD2RWLFNXs8pHZSDQtVgzp+xcb3w2tC3htQ@mail.gmail.com>
 <20200122100655.eenl3tcnhj4kkcda@qschulz>
MIME-Version: 1.0
In-Reply-To: <20200122100655.eenl3tcnhj4kkcda@qschulz>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Wed, Jan 22, 2020 at 11:06:55AM +0100, Quentin Schulz wrote:
> > > The reason why I didn't bother to send a patch to busybox before pinging
> > > on this patch was that we're already different from the upstream simple.script
> > > so it didn't make sense to me to add the Upstream-Status: pending or
> > > something on the patch (in some ways, since it's patching the file
> > > directly and not adding a patch in SRC_URI). Anyway, digressing. Do you
> > > want a patch to be sent to busybox ML (or PR or whatever they use)
> > > before taking this patch?
> > >
> > 
> > I think the problem this patch fixes is generic and somewhere the
> > script OE has is also derived from
> > that example, so while the patch in itself is enough for OE, it would
> > be better if it was in upstream too
> > perhaps one less thing to worry about when we cherry pick changes from
> > upstream script in future.
> > 
> 
> Agreed, I'll put it on my TODO-list. If I do not send an answer on this
> mail with the link to the PR or patch in the next week, anyone, please ping me.
> 

*cough* Took a bit more *cough* than a week *cough*

http://lists.busybox.net/pipermail/busybox/2020-June/088028.html

Quentin
