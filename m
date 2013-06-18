Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 43021601AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 14:42:54 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uox7W-0005Jv-Jn; Tue, 18 Jun 2013 16:42:54 +0200
Message-ID: <1371566573.6580.59.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2013 15:42:53 +0100
In-Reply-To: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
References: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: magic libtool .la removal
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
X-List-Received-Date: Tue, 18 Jun 2013 14:42:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 15:31 +0100, Burton, Ross wrote:
> My proposal is that we integrate .la-removal into a core class.
> autotools.bbclass should cover 99% of instances as libtool is normally
> used in conjunction with auto*.  Have a variable, REMOVE_LIBTOOL_LA,
> which controls the behaviour post-install.

FWIW, I still have the patch from:

http://lists.openembedded.org/pipermail/openembedded-core/2012-October/069912.html

in my local tree and it seems to be working fine (although I don't have
any particular interest in libltdt so it's conceivable that this might
be broken).

Looking back at that old thread it seems that you asked me to split into
two patches, I said "ok", but apparently I never did anything further
about it.  It's possible I might have been put off by Paul not liking
the name or something, I don't really recall.

p.



