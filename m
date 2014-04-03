Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E423C6E446
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 13:49:06 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WVi0w-0007tJ-5q; Thu, 03 Apr 2014 15:49:06 +0200
Message-ID: <1396532945.5879.189.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 03 Apr 2014 14:49:05 +0100
In-Reply-To: <1696721.rgbfGmBHri@peggleto-mobl5.ger.corp.intel.com>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
	<533B7788.7000301@windriver.com> <1396526409.2910.86.camel@ted>
	<1696721.rgbfGmBHri@peggleto-mobl5.ger.corp.intel.com>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Thu, 2014-04-03 at 14:13 +0100,
	Paul Eggleton wrote: > Incidentally,
	I think maybe for 1.7 it's time we bumped OLDEST_KERNEL. What
	a > sensible minimum would be though I'm not sure. The minimum version
	for udev > 182 would be one choice,
	but I believe there are people still using
	older > kernels even than that. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Thu, 03 Apr 2014 13:49:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-04-03 at 14:13 +0100, Paul Eggleton wrote:
> Incidentally, I think maybe for 1.7 it's time we bumped OLDEST_KERNEL. What a 
> sensible minimum would be though I'm not sure. The minimum version for udev 
> 182 would be one choice, but I believe there are people still using older 
> kernels even than that.

What would be the advantages of bumping it up?

p.



