Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 6537A605C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:17:46 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:add2:5f9f:9657:48e0] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1bmdf0-000800-RR; Wed, 21 Sep 2016 11:17:47 +0200
Message-ID: <1474449466.15186.2.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: sujith h <sujith.h@gmail.com>
Date: Wed, 21 Sep 2016 10:17:46 +0100
In-Reply-To: <CADyYWLm2xZrc4PGUo4fpFjf+Lb7Wuz457DWzdnTRRFn9HwNDjw@mail.gmail.com>
References: <1473922370-4325-1-git-send-email-sujith.h@gmail.com>
	<1473934030.3329.337.camel@pbcl.net>
	<CADyYWLm2xZrc4PGUo4fpFjf+Lb7Wuz457DWzdnTRRFn9HwNDjw@mail.gmail.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: add textrel to INSANE_SKIP to skip the warning
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
X-List-Received-Date: Wed, 21 Sep 2016 09:17:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-09-21 at 13:44 +0530, sujith h wrote:
> 
> The above mentioned functions are part of .S files.

OK.  In that case, please just mention in the commit message that you
can't easily get rid of the TEXTRELs because they are coming from
assembler source files that would (I assume) need significant
modifications to work as PIC.  I think that's fine.

thanks

p.


