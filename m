Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Slm51-0008Ov-Kj for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 21:14:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q62J3a89005465
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 20:03:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05228-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2012 20:03:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q62J3Tml005458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 20:03:31 +0100
Message-ID: <1341255815.23146.262.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jul 2012 20:03:35 +0100
In-Reply-To: <CAP9ODKpVfDG31Bh=gy0xgPCcGMbH4g-=CNrrE2TVc+RHnvp7EA@mail.gmail.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<1341207885-9463-3-git-send-email-paul.gortmaker@windriver.com>
	<CAP9ODKot3PDg5vkz76NwNgSsy+2tn_FB2-tvaYyc1WJzW3zjrQ@mail.gmail.com>
	<CABcZANm5d2gQ8kdEEbcgW-KD7Puy7jZrDu82m6dHq2vVj1uagA@mail.gmail.com>
	<CAP9ODKpVfDG31Bh=gy0xgPCcGMbH4g-=CNrrE2TVc+RHnvp7EA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv2 2/3] u-boot: make FILESDIR a shared setting.
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
X-List-Received-Date: Mon, 02 Jul 2012 19:14:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-02 at 13:42 -0300, Otavio Salvador wrote:
> On Mon, Jul 2, 2012 at 10:33 AM, Chris Larson <clarson@kergoth.com> wrote:
> > On Mon, Jul 2, 2012 at 4:24 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> >> On Mon, Jul 2, 2012 at 2:44 AM, Paul Gortmaker
> >> <paul.gortmaker@windriver.com> wrote:
> >>> The setting is the same in all recipes, so move it to
> >>> the shared settings in u-boot.inc
> >>>
> >>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> >>
> >> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> >
> > It shouldn't be using the old, legacy FILESDIR mechanism at all.
> 
> Indeed; grepping for it shows nothing.
> 
> This can be removed :-D

This isn't what Chris meant. BitBake handles FILESDIR, not the metadata
(and grepping bitbake will show a result).

I'm tempted to take the patch on the grounds that a single reference to
fix is probably easier than several other references. The replacement is
probably something like:

FILESPATH =. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"

We should really get on, replace the remaining references and complete
removal of FILESDIR.

Cheers,

Richard






