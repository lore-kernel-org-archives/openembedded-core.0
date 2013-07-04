Return-Path: <holger@moiji-mobile.com>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id 996A361663
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 05:34:06 +0000 (UTC)
Received: from sangmingze-mail.local (91-65-247-193-dynip.superkabel.de
	[91.65.247.193])
	by mail.sysmocom.de (Postfix) with ESMTPSA id CBBF91F28D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 05:33:22 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>) id 1UucB7-0002AR-SO
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Jul 2013 07:34:01 +0200
Date: Thu, 4 Jul 2013 07:34:01 +0200
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130704053401.GA25335@xiaoyu.lan>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Using OpenEmbedded for customized builds
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
X-List-Received-Date: Thu, 04 Jul 2013 05:34:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Good Morning,

we have a basic product and build the images for it using
OpenEmbedded. Some customers require the installation of
additional packages, or even the modification of some of
the installed ones. The current approach would be to build
one VM per customer but that doesn't really scale.

I think somehow I want to end up with having my base/generic
buuld and a way to put additional ipk's into a customer 
directory. So something likes this:

  base-build/tmp/deploy/ipk/
                            armv5te/
                            machine/
                            customer1/
                                      armv5te/
				      ...
                            customer2/
                                      armv5te/
                            customer3/

or

  base-build/tmp/...
 
  customer1-build/tmp/deploy/ipk/...

In both cases the customer should only include the packages
that were built for the customer. All the 'base' packages should
be taken/used from the base built. I could indicate for which
customer I build by setting an environment variable?

For a corner case, e.g. if I change the SRCREV and re-build with
a customer flag set, this package should still go to the customer
directory.

Can this be already modeled? Do you have any idea how this could
be done?


holger

