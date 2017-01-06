Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B5A366093A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 21:17:32 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cPbtC-0007eJ-D3; Fri, 06 Jan 2017 22:17:31 +0100
Message-ID: <1483737447.4360.180.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Patrick Ohly <patrick.ohly@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Jan 2017 21:17:27 +0000
In-Reply-To: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
References: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 06 Jan 2017 21:17:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-01-05 at 16:38 +0100, Patrick Ohly wrote:
> The /etc passwd files in a rootfs consist of the default entries from
> base-passwd plus anything that gets added by preinst scripts or
> extrausers.bbclass.
> 
> The execution order of preinst scripts is not perfectly
> deterministic,
> or at least unrelated changes caused it to change in a
> non-deterministic way, resulting in irrelevant changes in the order
> of
> passwd entries.
> 
> Such re-ordering is bad for reproducible builds and file-based update
> mechanisms like swupd which work best if changes are as minimal as
> possible.
> 
> To achieve that, the files get sorted in a post-processing command,
> enabled by default.

Won't the numeric UIDs still be non-deterministic, though?  If the goal
is reproducible builds then it doesn't sound as though this quite fixes
the problem.

p.


