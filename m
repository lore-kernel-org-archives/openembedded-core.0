Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 792FA6010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 17:05:24 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Zz6Ad-0007Fe-U3; Wed, 18 Nov 2015 18:05:24 +0100
Message-ID: <1447866323.1472.58.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Nov 2015 17:05:23 +0000
In-Reply-To: <20151118165158.GE2213@jama>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<e58d22785b2a1d629653c2f6ba32e26e4eb8ffa6.1447757562.git.Martin.Jansa@gmail.com>
	<1447864714.1472.54.camel@pbcl.net> <20151118165158.GE2213@jama>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 11/16] arch-armv7ve: add tune include for armv7ve and use it from cortexa7 and cortexa15
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
X-List-Received-Date: Wed, 18 Nov 2015 17:05:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-11-18 at 17:51 +0100, Martin Jansa wrote:
> On Wed, Nov 18, 2015 at 04:38:34PM +0000, Phil Blundell wrote:
> > On Tue, 2015-11-17 at 11:58 +0100, Martin Jansa wrote:
> > > * be aware that this -march value is available only in gcc-4.9
> > > and
> > >   newer:
> > >   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907
> > > 
> > 
> > Can you clarify why this is an improvement?  The previous patch
> > already
> > changed cortex-a15.inc to use -mcpu=cortexa15, which effectively
> > implies -march=armv7ve already (and works on all gcc versions) so
> > I'm
> > not entirely sure what this second patch really buys you.
> 
> Because -mcpu=cortexa15 and -march=armv7a conflict each other, so we
> either have to stop putting -march in default CCARGS or at least set
> compatible one like this patch does.

Ah right, got it.  I think it would be better to just stop passing 
-march= in cases where we are using -mcpu=.  It seems a bit silly to
create another huge maze of tune variables which all boil down to
essentially a no-op.

p.


