Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2CFCF6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jan 2017 09:59:22 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cPnmR-00011p-VR; Sat, 07 Jan 2017 10:59:22 +0100
Message-ID: <1483783158.4360.182.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Sat, 07 Jan 2017 09:59:18 +0000
In-Reply-To: <1483776414.4383.22.camel@intel.com>
References: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
	<1483737447.4360.180.camel@pbcl.net>
	<1483776414.4383.22.camel@intel.com>
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
X-List-Received-Date: Sat, 07 Jan 2017 09:59:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2017-01-07 at 09:06 +0100, Patrick Ohly wrote:
> 
Yes, but there's already a solution for that problem:
> useradd-staticids.bbclass
> 
> I was assuming that someone who wants identical files is already
> using
> that. Should it be mentioned in a comment next to the new feature?

That sounds like a good idea.  And in that case, maybe it would be
better to sort on uid rather than username?  That would preserve the
"traditional" ordering in the file, i.e. root first.

p.


