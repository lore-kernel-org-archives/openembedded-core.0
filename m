Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 18F8E719DC
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jan 2017 09:37:01 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cQ9uL-00059H-Da; Sun, 08 Jan 2017 10:36:59 +0100
Message-ID: <1483868215.4360.185.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Patrick Ohly
	<patrick.ohly@intel.com>
Date: Sun, 08 Jan 2017 09:36:55 +0000
In-Reply-To: <1483829528.4367.142.camel@linuxfoundation.org>
References: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
	<1483737447.4360.180.camel@pbcl.net>
	<1483776414.4383.22.camel@intel.com>
	<1483783158.4360.182.camel@pbcl.net>
	<1483815653.4383.28.camel@intel.com>
	<1483829528.4367.142.camel@linuxfoundation.org>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rootfs-postcommands.bbclass: sort passwd entries
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
X-List-Received-Date: Sun, 08 Jan 2017 09:37:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2017-01-07 at 22:52 +0000, Richard Purdie wrote:
> On Sat, 2017-01-07 at 20:00 +0100, Patrick Ohly wrote:
> > 
> > On Sat, 2017-01-07 at 09:59 +0000, Phil Blundell wrote:
> > > 
> > > That sounds like a good idea.  And in that case, maybe it would
> > > be
> > > better to sort on uid rather than username?  That would preserve
> > > the
> > > "traditional" ordering in the file, i.e. root first.
> > I had thought about that, but then did not pursue that further
> > because
> > it would have made sorting quite a bit more complex (needs to know
> > about
> > line content, id not present in each file).
> > 
> > I can give it a try, though, if that's considered worth some
> > additional
> > complexity.
> 
> I think those functions can be python functions and this might not be
> too bad to write in python....

I'm not sure it's that complicated.  Maybe I'm overlooking something
obvious, but something like "sort -t: -k3n" seems like it ought to
suffice for sorting /etc/passwd and /etc/group on numeric id.

I didn't understand Patrick's comment about "id not present in each
file" though, maybe that's the key to the extra complexity.

p.


