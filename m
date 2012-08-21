Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T3m52-0001Rd-PM for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 12:53:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7LAewOd012371;
	Tue, 21 Aug 2012 11:40:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27999-08; Tue, 21 Aug 2012 11:40:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7LAemFs012365
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 21 Aug 2012 11:40:49 +0100
Message-ID: <1345545650.3907.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Date: Tue, 21 Aug 2012 11:40:50 +0100
In-Reply-To: <20120821085138.GA29885@mi.fu-berlin.de>
References: <502D12E2.4000808@windriver.com> <1345132684.14667.70.camel@ted>
	<20120817033209.GB19625@localhost> <1345196146.14667.84.camel@ted>
	<20120817100001.GA16621@localhost> <1345200782.26132.18.camel@ted>
	<20120817130151.GA1416@localhost> <20120817130517.GB1416@localhost>
	<50324E29.5060005@windriver.com> <20120821050825.GB27917@localhost>
	<20120821085138.GA29885@mi.fu-berlin.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 10:53:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-21 at 10:51 +0200, Henning Heinold wrote:
> On Tue, Aug 21, 2012 at 01:08:25PM +0800, Liang Li wrote:
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -190,6 +190,9 @@ kernel_do_install() {
> >  	for entry in $bin_files; do
> >  	        rm -f $kerneldir/$entry
> >  	done
> > +
> > +	# Fix SLNAG_INC for slang.h
> > +	sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
> Hm,
> 
> is this "-I=" a new special feature of gcc?
> 
> -I/usr/include/slang
> -I=/usr/include/slang

It means the path is relative to any sysroot. It wasn't around for the
first implementations of sysroot but came shortly thereafter. As long as
its gcc 3.4 onwards it should be fine iirc.

Cheers,

Richard



