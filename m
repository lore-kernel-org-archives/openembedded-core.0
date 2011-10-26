Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RJ493-0001Z6-E9
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 16:07:53 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RJ43I-0000YN-6v; Wed, 26 Oct 2011 16:01:56 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2011 15:01:55 +0100
In-Reply-To: <CAKZ=5EUxO=fe+6p5qx4n5Y5_r1GQ+mokXOQhnuNgLbpx7Z4Heg@mail.gmail.com>
References: <1319505532-23199-2-git-send-email-julian.pidancet@gmail.com>
	<CAEsOVNfvkJkLPMCg=x7Yu3JFQSt2GuupkZgXOpj+YhwFZJZryg@mail.gmail.com>
	<CAKZ=5EUxO=fe+6p5qx4n5Y5_r1GQ+mokXOQhnuNgLbpx7Z4Heg@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1319637716.22985.368.camel@phil-desktop>
Mime-Version: 1.0
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] Give coreutils a chance to build the df utility
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
X-List-Received-Date: Wed, 26 Oct 2011 14:07:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-26 at 14:58 +0100, Julian Pidancet wrote:
> On Wed, Oct 26, 2011 at 2:59 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
> > On Mon, Oct 24, 2011 at 8:18 PM, Julian Pidancet
> > <julian.pidancet@gmail.com> wrote:
> >> +do_configure_prepend () {
> >> +        export fu_cv_sys_stat_statfs2_bsize=yes
> >
> > I'm asking out of curiosity.. why don't these go in meta/site/common instead?
> 
> To be honest, I ignored the very existence of this file. Is this
> globally applied to all the recipes ? Isn't there a risk of breaking
> other packages by doing this ?

A small risk, yes.  On the other hand, by hardcoding one particular
value in the recipe, there is a risk that it might be the wrong answer
for some target systems.  Whereas the site files are, intentionally,
target and OS specific.

p.




