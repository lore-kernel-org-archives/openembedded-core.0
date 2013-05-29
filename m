Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 493B660811
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 19:59:53 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UhmXH-00012Q-9y; Wed, 29 May 2013 21:59:51 +0200
Message-ID: <1369857580.6644.13.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 29 May 2013 20:59:40 +0100
In-Reply-To: <51A62D21.4010909@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-3-git-send-email-mark.hatle@windriver.com>
	<20130529155906.GO3192@jama> <51A62D21.4010909@windriver.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/21] Add directory information to the pkgdata files
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
X-List-Received-Date: Wed, 29 May 2013 19:59:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-29 at 11:30 -0500, Mark Hatle wrote:
> It's up to the tooling that are using these files to check if the directory 
> exists, if it does not -- then using bitbake -c patch <recipe> will create it. 
> (even in the sstate-cache case.)

I'm not sure whether checking that the directory exists is all that
safe; in the shared-sstate scenario I think it's conceivable that the
directory might exist but contain something else, or be unreadable due
to permissions, or disappear underneath you while you're using it.

And, of course, "bitbake -c patch ..." won't necessarily create the same
${S} that you got from pkgdata in that case, it will create it in your
local TMPDIR.

Also, the subject line for this patch (and several others from the batch
you just sent) is not in the right format.  Please see the guidelines on
the wiki.

p.



