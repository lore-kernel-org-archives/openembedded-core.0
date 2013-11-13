Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 961AF6D75A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 11:36:06 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgYjU-0008E6-8F; Wed, 13 Nov 2013 12:36:07 +0100
Message-ID: <1384342539.12863.9.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 13 Nov 2013 11:35:39 +0000
In-Reply-To: <5282BB6D.1040506@linux.intel.com>
References: <1383954150-59537-1-git-send-email-kirgene@gmail.com>
	<5282AEB6.3060706@linux.intel.com>
	<1384300388.3828.36.camel@x121e.pbcl.net>
	<5282BB6D.1040506@linux.intel.com>
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
	Content preview:  On Tue, 2013-11-12 at 15:36 -0800,
	Saul Wold wrote: > This
	is why I wanted to understand the orignal failure,
	so using > PACKAGECONFIG sounds reasonable,
	I think we have had a case in the past > where we even
	allowed for a non-default PACKAGECONFIG point outside of > oe-core (I
	can't remember which one it was now). [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Yevhen Kyriukha <kirgene@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] curl: build with c-ares library support.
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
X-List-Received-Date: Wed, 13 Nov 2013 11:36:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-12 at 15:36 -0800, Saul Wold wrote:
> This is why I wanted to understand the orignal failure, so using 
> PACKAGECONFIG sounds reasonable, I think we have had a case in the past 
> where we even allowed for a non-default PACKAGECONFIG point outside of 
> oe-core (I can't remember which one it was now).

I think having c-ares in oe-core would be a splendid plan, actually.
But I don't think that making curl use it by default is a good idea.

p.



