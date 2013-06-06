Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 448966A5A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 21:02:05 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UkhJt-0006W4-24; Thu, 06 Jun 2013 23:02:05 +0200
Message-ID: <1370552518.4141.10.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 06 Jun 2013 22:01:58 +0100
In-Reply-To: <51B0EEA9.1030903@linux.intel.com>
References: <1370027758-22849-1-git-send-email-dv@pseudoterminal.org>
	<51B0BE87.8010807@linux.intel.com>
	<51B0C431.3040505@pseudoterminal.org>
	<51B0EEA9.1030903@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] GStreamer 1.0 recipes
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
X-List-Received-Date: Thu, 06 Jun 2013 21:02:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-06-06 at 13:18 -0700, Saul Wold wrote:
> But back to the orignal question, is the gstreamer 1.0 an upgrade path 
> for 0.10 or a completely new gstreamer?  Is there an upgrade path? If 
> so, then the packaging needs to reflect that.

I think what you're really asking is "is gstreamer 1.0 ABI-compatible
with 0.10?" and the answer to that question is no.  Binaries compiled
against 0.10 will need recompiling to use 1.0 so RPROVIDES would make no
sense, and the two libraries are parallel installable so RCONFLICTS is
not necessary either.  In any case, using RPROVIDES/RCONFLICTS for
libraries is sometimes slightly tricky in the presence of the debian
autonamer, and is generally something that ought to be left to those
distros that care about it rather than trying to solve the problem in
oe-core.

But all this is largely orthogonal to the question of whether or not we
want to keep both versions in OE-Core.  There does exist some precedent
for that: we have both gtk2 and gtk3, and we also have multiple versions
of (at least) linux, pseudo and gcc already.

p.



