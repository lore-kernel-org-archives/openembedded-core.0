Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3E69B6F5DF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 17:56:39 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WLcX8-0007ro-SX; Thu, 06 Mar 2014 18:56:39 +0100
Message-ID: <1394128597.24424.269.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Thu, 06 Mar 2014 17:56:37 +0000
In-Reply-To: <a0c82119ec77c1ad5c8b6a7dc941a96eaeba3fe7.1394124934.git.tom.zanussi@linux.intel.com>
References: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
	<a0c82119ec77c1ad5c8b6a7dc941a96eaeba3fe7.1394124934.git.tom.zanussi@linux.intel.com>
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
	Content preview:  On Thu, 2014-03-06 at 11:09 -0600,
	Tom Zanussi wrote: > Without
	lttng-modules, lttng-tools etc don't make sense either so > exclude them
	as well. This isn't entirely true;
	one can quite happily use the ust tracers
	without the modules. I've no idea why ust is disabled on aarch64
	either. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] lttng-modules: Exclude arm
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
X-List-Received-Date: Thu, 06 Mar 2014 17:56:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-03-06 at 11:09 -0600, Tom Zanussi wrote:
> Without lttng-modules, lttng-tools etc don't make sense either so
> exclude them as well.

This isn't entirely true; one can quite happily use the ust tracers
without the modules.  I've no idea why ust is disabled on aarch64
either.

p.



