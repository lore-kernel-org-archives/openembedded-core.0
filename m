Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 716EB61F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 18:48:13 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VEOJJ-0007zi-PD; Tue, 27 Aug 2013 20:48:13 +0200
Message-ID: <1377629276.4083.101.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Aug 2013 19:47:56 +0100
In-Reply-To: <621ba27fe578346e2feae489fba4d576148299fc.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
	<621ba27fe578346e2feae489fba4d576148299fc.1377623208.git.raj.khem@gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/20] package_rpm.bbclass:Make the regexp less greedy
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
X-List-Received-Date: Tue, 27 Aug 2013 18:48:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-27 at 10:15 -0700, Khem Raj wrote:
> This causes issues when postinstalls have ERROR keywords
> its interpreted as error and image build is cancelled
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

As I mentioned before, "the regexp" isn't a very satisfactory
description of the locus for this change, given that the file contains
many regexps.  I'm also not entirely convinced that this patch really
makes the regexp "less greedy" in any meaningful way: it makes it less
prone to unintended matches, but that's a different issue to greediness.

p.



