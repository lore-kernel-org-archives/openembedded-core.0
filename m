Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1T3koa-0001Ez-Jl
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 11:32:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7L9Jrxt020672
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2012 02:19:53 -0700 (PDT)
Received: from localhost (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 21 Aug 2012 02:19:52 -0700
Date: Tue, 21 Aug 2012 17:19:51 +0800
From: Liang Li <liang.li@windriver.com>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Message-ID: <20120821091951.GA17715@localhost>
References: <1345132684.14667.70.camel@ted> <20120817033209.GB19625@localhost>
	<1345196146.14667.84.camel@ted> <20120817100001.GA16621@localhost>
	<1345200782.26132.18.camel@ted> <20120817130151.GA1416@localhost>
	<20120817130517.GB1416@localhost> <50324E29.5060005@windriver.com>
	<20120821050825.GB27917@localhost>
	<20120821085138.GA29885@mi.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20120821085138.GA29885@mi.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Liang Li <liang.li@windriver.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 09:32:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 2012-08-21 16:51, Henning Heinold <heinold@inf.fu-berlin.de> wrote:
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
> 

Not something new/special feature of gcc, should be as old as
--sysroot, maybe more than 10 years elder I guess.

Cheers,
		Liang Li

> Bye Henning


