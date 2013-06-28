Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF056A4E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 21:07:49 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UsftV-00038Q-P2; Fri, 28 Jun 2013 23:07:49 +0200
Message-ID: <1372453659.28188.22.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 28 Jun 2013 22:07:39 +0100
In-Reply-To: <51CDEFEF.2090801@linux.intel.com>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
	<1372449088.28188.3.camel@pb-ThinkPad-R50e>
	<51CDEFEF.2090801@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 v2] bitbake.conf: Add SECURITY_*FLAGS overridable definition
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
X-List-Received-Date: Fri, 28 Jun 2013 21:07:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-28 at 13:19 -0700, Saul Wold wrote:
> So, if I remember correctly there was issues with this because there are 
> a number of packages that have to modify specifically the security 
> related flags (see the list in security_flags.inc), the ordering/timing 
> of being able to due that correctly did not allow for setting it 
> directly in CFLAGS or TARGET_CFLAGS.

What exactly were the issues?  I can't think of any obvious reason why
it wouldn't work for security.inc to do:

SECURITY_CFLAGS = "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
SECURITY_CFLAGS_pn-curl = "-fstack-protector-all -pie -fpie"
CFLAGS += "${SECURITY_CFLAGS}"

p.



