Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9653D61617
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:29:35 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VHYgp-0001zC-IG; Thu, 05 Sep 2013 14:29:35 +0200
Message-ID: <1378384174.6940.86.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 05 Sep 2013 13:29:34 +0100
In-Reply-To: <3518999.x3yV6XY4Eo@helios>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<20130905115913.GC17481@lpalcu-linux>
	<1378382840.6940.78.camel@phil-desktop.brightsign>
	<3518999.x3yV6XY4Eo@helios>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 12:29:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 07:19 -0500, Paul Eggleton wrote:
> I'm clearly missing something here. If we have a generic mechanism to run 
> postinstall scripts now, and "package-management" is not in IMAGE_FEATURES, 
> why do we need or want the package manager to be in control of running the 
> postinstalls?

We don't.  The postinsts should be getting run by run-postinsts.

I must admit I still don't entirely understand what the problem is that
Laurentiu is trying to fix with his patch, and the description in the
Yocto bugzilla remains opaque to me.  Can you clarify what exactly it is
that's currently going wrong?

p.



