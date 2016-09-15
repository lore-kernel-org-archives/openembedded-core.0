Return-Path: <pb@pbcl.net>
X-Greylist: delayed 2305 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Sep 2016 10:45:37 UTC
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 62ED573289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 10:45:37 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:415e:be8d:192b:f78f] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1bkTZY-0006BF-0W; Thu, 15 Sep 2016 12:07:12 +0200
Message-ID: <1473934030.3329.337.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Sujith H <sujith.h@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 11:07:10 +0100
In-Reply-To: <1473922370-4325-1-git-send-email-sujith.h@gmail.com>
References: <1473922370-4325-1-git-send-email-sujith.h@gmail.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>
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
X-List-Received-Date: Thu, 15 Sep 2016 10:45:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-09-15 at 12:22 +0530, Sujith H wrote:
> From: Fahad Usman <fahad_usman@mentor.com>
> 
> This change help fix the warning message:
> 
> x264/r2491+gitAUTOINC+c8a773ebfc-r0/packages-
> split/x264/usr/lib/libx264.so.144' has relocations in .text [textrel]
> 
> Adding textrel to INSANE_SKIP resolves this issue.

This is a poor commit message.  Adding textrel to INSANE_SKIP prevents
the check from being done, so it is fairly self-evident that it will
suppress the corresponding warning message.  Please add an explanation
of why this is an appropriate thing to do, i.e. why the textrels are
present and why you can't get rid of them by other means.

In particular please clarify whether you want to do this because the
textrels are absolutely unavoidable for some reason on your
architecture, or just because you think this is a good trade-off for
performance.  If the latter then I think the change probably belongs in
a distro or BSP layer not in oe-core.

p.


