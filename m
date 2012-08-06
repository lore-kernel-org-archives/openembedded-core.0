Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyOPg-0001Gr-65; Mon, 06 Aug 2012 16:36:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76EOMYp028538;
	Mon, 6 Aug 2012 15:24:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27818-05; Mon,  6 Aug 2012 15:24:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76EOEBc028532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 6 Aug 2012 15:24:15 +0100
Message-ID: <1344263058.9756.166.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 15:24:18 +0100
In-Reply-To: <20120806134521.GK3267@jama.jama.net>
References: <20120722104406.D46AB10330@opal>
	<20120725121811.GA20145@jama.jama.net>
	<20120806134521.GK3267@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bogdan Marinescu : autoconf: updated to 2.69
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
X-List-Received-Date: Mon, 06 Aug 2012 14:36:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-06 at 15:45 +0200, Martin Jansa wrote:
> On Wed, Jul 25, 2012 at 02:18:11PM +0200, Martin Jansa wrote:
> > On Sun, Jul 22, 2012 at 10:44:06AM +0000, git@git.openembedded.org wrote:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: effb75d42098b3e367d393215fd5d52a0191e954
> > > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=effb75d42098b3e367d393215fd5d52a0191e954
> > > 
> > > Author: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> > > Date:   Thu Jul 19 13:33:52 2012 +0300
> > > 
> > > autoconf: updated to 2.69
> > > 
> > > Tested with core-image-sato-sdk and lib32-core-image-sato-sdk.
> > > This update was done mainly because multilib builds failed on master with this error:
> > > 
> > > | autoreconf: running: aclocal -I /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/m4/ -I /poky/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/aclocal-copy/ -I /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/m4/ -I /poky/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/aclocal-copy/ --force --warnings=cross
> > > | aclocal: warning: unknown warning category 'cross'
> > > | configure.ac:18: error: Autoconf version 2.69 or higher is required
> > 
> > since this upgrade I see autom4te segfaulting when building webkit-efl
> > autom4te[8513]: segfault at 29e782688 ip 00007f7c52a96e23 sp 00007fff07731020 error 4 in Dumper.so[7f7c52a90000+8000]
> > 
> > webkit-efl build finishes fine and is usable afaik but someone would
> > expect tools like autoconf to behave better and not segfault.
> > 
> > This happens on 2 different builders each with different webkit-efl
> > version.
> 
> Nobody else have seen this in dmesg? It happens quite often and probably
> not only while building webkit-efl. Because I don't build webkit-efl so
> often:
> dmesg | grep -c "segfault at.*Dumper.so"
> 37
> 
> It could be related to perl as Dumper.so is part of perl install
> dev-lang/perl-5.16.0 (/usr/lib64/perl5/5.16.0/x86_64-linux-thread-multi/auto/Data/Dumper/Dumper.so)
> 
> Maybe inheriting perlnative in autoconf would solve that too.

autoconf-native *must* use the system perl. Trying to do anything else
will result in circular dependencies.

Cheers,

Richard



