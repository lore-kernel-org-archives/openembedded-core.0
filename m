Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1D66B7D2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 18:12:19 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WHH3i-0002K4-Lg; Sat, 22 Feb 2014 19:12:18 +0100
Message-ID: <1393092730.2640.25.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Feb 2014 18:12:10 +0000
In-Reply-To: <FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
	<1393058961.5181.4.camel@ted>
	<FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software, running on the system "hetzner.pbcl.net", has
 identified this incoming email as possible spam.  The original message
 has been attached to this so you can view it (if it isn't spam) or label
 similar future email.  If you have any questions, see
 @@CONTACT_ADDRESS@@ for details.
 
 Content preview:  On Sat, 2014-02-22 at 01:31 -0800, Khem Raj wrote: > builds
    might work but they won’t run and yes so far IFUNC support is needed so
    it won’t work on non-x86 > architectures. One common runtime problem I
   am seeing is logind not being able to talk to dbus > across all architectures.
    I have pushed my latest rework to pull branch [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Sat, 22 Feb 2014 18:12:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2014-02-22 at 01:31 -0800, Khem Raj wrote:
> builds might work but they won’t run and yes so far IFUNC support is needed so it won’t work on non-x86
> architectures. One common runtime problem I am seeing is logind not being able to talk to dbus
> across all architectures. I have pushed my latest rework to pull branch

What is the problem with ifunc on non-x86?  As far as I know the
compiler, assembler, linker and ld.so for all reasonable architectures
support that nowadays (though prelink support is a bit patchy).  GCC
didn't have ifuncs enabled for some architectures until quite recently
but if that was the problem then you'd see compile-time failures.  So,
if it compiles then I can't think of any reason why it oughtn't to run.
Is this a uclibc thing?

p.



