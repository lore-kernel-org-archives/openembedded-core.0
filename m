Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A28A76F64A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 18:26:22 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WLzTP-00016x-VW; Fri, 07 Mar 2014 19:26:21 +0100
Message-ID: <1394216779.6805.36.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Andrey Belous <abelous@broadcom.com>
Date: Fri, 07 Mar 2014 18:26:19 +0000
In-Reply-To: <AC63B68CC9C36B4FBF9FD4FEEFE754AA20DAA367@SJEXCHMB06.corp.ad.broadcom.com>
References: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
	<1393969384.4151.5.camel@e130.pbcl.net>
	<AC63B68CC9C36B4FBF9FD4FEEFE754AA20DAA367@SJEXCHMB06.corp.ad.broadcom.com>
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
	Content preview: Fair enough. I also agree that these variables should
	at least
	be consistent, and if we're assigning everything else with ?= then there
	seems no reason for that one provider to be treated specially. So I
	think your patch is fine,
	though it might be a good idea to re-send it with a less
	messed up commit message if you didn't already do that. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
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
X-List-Received-Date: Fri, 07 Mar 2014 18:26:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fair enough.  I also agree that these variables should at least be
consistent, and if we're assigning everything else with ?= then there
seems no reason for that one provider to be treated specially.  So I
think your patch is fine, though it might be a good idea to re-send it
with a less messed up commit message if you didn't already do that.

p.

On Tue, 2014-03-04 at 21:55 +0000, Andrey Belous wrote:
> Hi Phil,
> I have prebuild uclibc library that I would like to use, without that change I cannot force to use my prebuild library
> 
> -Andrey
> 
> -----Original Message-----
> From: Phil Blundell [mailto:pb@pbcl.net] 
> Sent: Tuesday, March 04, 2014 4:43 PM
> To: Andrey Belous
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
> 
> On Tue, 2014-03-04 at 15:40 -0500, Andrey Belous wrote:
> > -PREFERRED_PROVIDER_virtual/libc = "uclibc"
> > +PREFERRED_PROVIDER_virtual/libc ?= "uclibc"
> 
> Why would you be including tclibc-uclibc.inc if you don't want to use
> uclibc?
> 
> p.
> 
> 



