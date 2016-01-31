Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D5487770E0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:41:16 +0000 (UTC)
Received: from [212.183.132.77] (helo=e130)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aPzkB-0001V7-47; Sun, 31 Jan 2016 22:41:15 +0100
Message-ID: <1454276439.7421.28.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Sun, 31 Jan 2016 21:40:39 +0000
In-Reply-To: <1454264875-15715-1-git-send-email-paul.gortmaker@windriver.com>
References: <1454264875-15715-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] git: add site_perl to packaged files to fix QA install error
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
X-List-Received-Date: Sun, 31 Jan 2016 21:41:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-31 at 13:27 -0500, Paul Gortmaker wrote:
>  FILES_${PN}-perltools += " \
>      ${PERLTOOLS} \
>      ${libdir}/perl \
> +    ${libdir}/site_perl \
>      ${datadir}/perl \

It seems a bit wrong for git (or any other package) to be installing
itself into site-perl.  That path is meant to be for stuff installed
locally via cpan, right?

So, rather than patching the FILES to accept site-perl I think it would
be better to find out why git is suddenly putting stuff there and stop
it.  For what it's worth, I just built git from oe-core master and
didn't see this problem so it's possible that the breakage is being
caused by something outside oe-core itself.

p.



