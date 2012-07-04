Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SmRgo-0007u9-5L
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 17:40:26 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SmRW9-0002c9-75
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 17:29:25 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jul 2012 16:29:24 +0100
In-Reply-To: <20120704150005.GD1817@windriver.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<4FF33085.1070703@linux.intel.com>
	<20120704141259.GA1817@windriver.com>
	<20120704150005.GD1817@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1341415765.20265.30.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCHv2 0/3] u-boot recipe updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2012 15:40:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-04 at 11:00 -0400, Paul Gortmaker wrote:
> I've found Richard's comments [looking in OE archive and not poky
> helped] and will test what he proposed to replace FILESDIR.  But I still
> think it extremely worthwhile if some fine tuning to the mailing list(s)
> can be done to address what I mentioned below.

Can you be more specific about what you think should be changed?  If I
look at the message of yours that I'm replying to, it has:

Return-Path: <openembedded-core-bounces@lists.openembedded.org>
Received: from linuxtogo.org ([188.40.83.200]) by hetzner.pbcl.net with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.72) (envelope-from <openembedded-core-bounces@lists.openembedded.org>) id 1SmR3u-0002an-JT for pb@pbcl.net; Wed, 04 Jul 2012 17:00:14 +0200
Received: from localhost ([127.0.0.1]) by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <openembedded-core-bounces@lists.openembedded.org>) id 1SmREX-0006Iq-NQ; Wed, 04 Jul 2012 17:11:13 +0200
Received: from mail1.windriver.com ([147.11.146.13]) by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <Paul.Gortmaker@windriver.com>) id 1SmREW-0006Ih-OQ for openembedded-core@lists.openembedded.org; Wed, 04 Jul 2012 17:11:13 +0200

[...]

From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Message-id: <20120704150005.GD1817@windriver.com>
Cc: openembedded-core@lists.openembedded.org

which all seems in order.  Which part do you think is wrong?

> > On a related note, is it possible to fix the mailing list so that it
> > does not strip To/Cc information and Message-ID strings?  [I'd have to
> > check -- maybe it is (also) inserting a needless Reply-To: header that
> > messes things up.]
> > 
> > Further, without a proper Message-ID, it breaks patchworks, so Richard's
> > comments should be here:

p.




