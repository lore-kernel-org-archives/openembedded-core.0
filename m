Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2FBDA61A45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 19:51:40 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Usehn-00031E-V9; Fri, 28 Jun 2013 21:51:40 +0200
Message-ID: <1372449088.28188.3.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 28 Jun 2013 20:51:28 +0100
In-Reply-To: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
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
X-List-Received-Date: Fri, 28 Jun 2013 19:51:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-28 at 12:23 -0700, Saul Wold wrote:
> This will allow for SECURITY_CFLAGS and SECURITY_LDFLAGS to be
> defined in the security_flags.inc and override the empty default.

Why can't security_flags.inc just append to CFLAGS and LDFLAGS
respectively, or some other set of variables that already exists?

Creating new variables in bitbake.conf does have a cost in terms of
parse time and memory footprint for every recipe.  If the variables are
referenced in ${CFLAGS} etc then it also adds an extra substitution
whenever CFLAGS is expanded.  The cost of those things isn't enormous,
but it isn't zero either and adding them isn't something that we should
do capriciously.

p.



