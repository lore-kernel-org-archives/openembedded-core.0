Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA1A6D76E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 12:28:13 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VelAB-0002o0-DM; Fri, 08 Nov 2013 13:28:14 +0100
Message-ID: <1383913666.16718.97.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Ross Burton <ross.burton@intel.com>
Date: Fri, 08 Nov 2013 12:27:46 +0000
In-Reply-To: <1383912990-12718-1-git-send-email-ross.burton@intel.com>
References: <1383912990-12718-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.4.4-4+b1 
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
	Content preview:  On Fri, 2013-11-08 at 12:16 +0000,
	Ross Burton wrote: > Changing
	APPENDS wasn't causing syslinux to re-run,
	so add a manual dependency. [...]
	> +build_syslinux_cfg[vardeps] += "APPEND" [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] syslinux: add APPENDS to dependency list
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
X-List-Received-Date: Fri, 08 Nov 2013 12:28:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-08 at 12:16 +0000, Ross Burton wrote:
> Changing APPENDS wasn't causing syslinux to re-run, so add a manual dependency.

[...]

> +build_syslinux_cfg[vardeps] += "APPEND"

You mention APPENDS in the subject line and the commit message, but the
patch is actually adding APPEND (no 's').  Which is correct?

p.



