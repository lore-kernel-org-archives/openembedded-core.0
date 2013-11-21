Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 63CB861637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 12:40:23 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VjTYT-0001sX-Vv; Thu, 21 Nov 2013 13:40:22 +0100
Message-ID: <1385037621.23724.149.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: ChenQi <Qi.Chen@windriver.com>
Date: Thu, 21 Nov 2013 12:40:21 +0000
In-Reply-To: <528DFB88.5080404@windriver.com>
References: <1385017169-22068-1-git-send-email-mark.hatle@windriver.com>
	<1385035973.23724.146.camel@phil-desktop.brightsign>
	<528DFB88.5080404@windriver.com>
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
	Content preview:  On Thu, 2013-11-21 at 20:24 +0800,
	ChenQi wrote: > The purpose
	is to disable bind in a read-only file system by default. > But if user
	really wants it,
	they can set this value to 'yes'. I'm still struggling a bit to
	understand the reasoning here. Why would you install bind in the first
	place if you didn't want it to be enabled? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] bind: add support for read-only rootfs
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
X-List-Received-Date: Thu, 21 Nov 2013 12:40:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-21 at 20:24 +0800, ChenQi wrote:
> The purpose is to disable bind in a read-only file system by default.
> But if user really wants it, they can set this value to 'yes'.

I'm still struggling a bit to understand the reasoning here.  Why would
you install bind in the first place if you didn't want it to be enabled?

p.


