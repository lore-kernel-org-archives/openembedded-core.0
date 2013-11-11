Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8D37F6D331
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 14:50:12 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1Vfso8-0006Q6-3Y; Mon, 11 Nov 2013 15:50:07 +0100
Message-ID: <1384181379.16718.153.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: ChenQi <Qi.Chen@windriver.com>
Date: Mon, 11 Nov 2013 14:49:39 +0000
In-Reply-To: <5280D037.1060607@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<74d67107ced2e10a00bc2ff9b84d42a7376fabae.1383974819.git.Qi.Chen@windriver.com>
	<1384038034.3798.46.camel@x121e.pbcl.net>
	<52804662.1090605@windriver.com>
	<1384170804.16718.135.camel@phil-desktop.brightsign>
	<5280D037.1060607@windriver.com>
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
	Content preview:  On Mon, 2013-11-11 at 20:40 +0800,
	ChenQi wrote: > Hi Phil, > > First of all,
	thank you for your careful review and explanation. > To
	conclude,
	you suggest modifying the init scripts and moving commands > around
	if needed, right? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] initscripts: add setup-commands.sh
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
X-List-Received-Date: Mon, 11 Nov 2013 14:50:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-11 at 20:40 +0800, ChenQi wrote:
> Hi Phil,
> 
> First of all, thank you for your careful review and explanation.
> To conclude, you suggest modifying the init scripts and moving commands 
> around if needed, right?

Well, I'm not sure that I'm necessarily suggesting any particular
change.  What I'm saying is that if we're going to try to solve the
split-/usr problem in oe-core (as opposed to Wind River just doing it in
their internal distro layers) then:

1. It needs to be done in a way that doesn't have any negative impact
for people who don't have a split /usr (or indeed who don't have /usr at
all)

2. The changes need to be presented as a coherent package with the
reasoning clearly explained.

3. We need to be clear that it's solving the "whole problem" (whatever
that might be) rather than just some part of it. 

> Could you please share your configuration so that when I make V2 I can 
> test the case of ${bindir} and ${base_bindir} being the same.
> (Currently I really can't build out an image with such configuration ... )

I think it should basically just be a case of setting:

prefix = ""
exec_prefix = ""
prefix_native = ""

in your distro configuration.

p.



