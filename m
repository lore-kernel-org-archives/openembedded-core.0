Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id CD1786D01E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:59:54 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1Vipad-0006ev-9B; Tue, 19 Nov 2013 18:59:55 +0100
Message-ID: <1384883994.23724.120.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mike Crowe <mac@mcrowe.com>
Date: Tue, 19 Nov 2013 17:59:54 +0000
In-Reply-To: <20131119174944.GB13018@mcrowe.com>
References: <20131119173725.GA13018@mcrowe.com>
	<1384882665-26840-1-git-send-email-mac@mcrowe.com>
	<1384882665-26840-2-git-send-email-mac@mcrowe.com>
	<CADkTA4MQF4be4RO0vm=a2Rv404M9sjK6ZFE7V0hV_gDBX5hvMQ@mail.gmail.com>
	<20131119174944.GB13018@mcrowe.com>
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
	Content preview:  On Tue, 2013-11-19 at 17:49 +0000,
	Mike Crowe wrote: > On
	Tuesday 19 November 2013 at 12:41:40 -0500,
	Bruce Ashfield wrote: > > What
	issue was this causing for you ? The scripts are native,
	and hence > > should
	just be using the build machines compiler, linker and don't need > > the
	kernel args. > > > > So I'm not convinced that we need this patch,
	without
	seeing a tangible > > issue that was triggered. > > Well, for us v2.6.39
	appears to be using the target compiler for > something. At least,
	I get a lot of: [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel.bbclass: Call make with correct variables in kernelscripts_sstate_postinst
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
X-List-Received-Date: Tue, 19 Nov 2013 17:59:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-19 at 17:49 +0000, Mike Crowe wrote:
> On Tuesday 19 November 2013 at 12:41:40 -0500, Bruce Ashfield wrote:
> > What issue was this causing for you ? The scripts are native, and hence
> > should just be using the build machines compiler, linker and don't need
> > the kernel args.
> > 
> > So I'm not convinced that we need this patch, without seeing a tangible
> > issue that was triggered.
> 
> Well, for us v2.6.39 appears to be using the target compiler for
> something. At least, I get a lot of:

I did "make V=1 scripts" in a kernel devshell and it seems to be using
the cross-compiler to build scripts/mod/empty.o.  It's not entirely
obvious that this file actually needs to be in the sysroot, but it seems
that patching the kernel to prevent it getting built would be a bit of a
maintenance headache.

p.



