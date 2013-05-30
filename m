Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id DF82C60959
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 10:46:17 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ui0N6-000239-6I; Thu, 30 May 2013 12:46:16 +0200
Message-ID: <1369910774.8846.26.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 30 May 2013 11:46:14 +0100
In-Reply-To: <1369864751.14887.258.camel@ted>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-19-git-send-email-mark.hatle@windriver.com>
	<1369861845.14887.232.camel@ted> <51A672E5.3060000@windriver.com>
	<1369864751.14887.258.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 18/21] Fix problems expanding the IMAGE_INSTALL package groups
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
X-List-Received-Date: Thu, 30 May 2013 10:46:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-29 at 22:59 +0100, Richard Purdie wrote:
> Fair enough. Can we at least match the pattern do_split_packages uses,
> i.e.:
> 
> PACKAGES_DYNAMIC = "^${PN}-lib.*"
> 
> I'm a little paranoid about adding wildcards like ${PN}-* as the
> potential for namespace problems is not insignificant, particularly if
> you know the horrible things bitbake does with this behind the
> scenes :/.

Does it really need to be dynamic at all?  I don't think the list of
libraries installed by ncurses varies all that much (apart from WIDEC
on/off), and nor is it overwhelmingly large.  It doesn't seem like it
would be all that hard to arrange for the right stuff to be added to
PACKAGES at parse time, in which case this whole problem would just go
away.

p.



