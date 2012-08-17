Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1T2MQR-0005tE-KV
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:17:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7HD5IM5014577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Aug 2012 06:05:18 -0700 (PDT)
Received: from localhost (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 17 Aug 2012 06:05:18 -0700
Date: Fri, 17 Aug 2012 21:05:17 +0800
From: Liang Li <liang.li@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120817130517.GB1416@localhost>
References: <1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<20120814021712.GB25748@localhost> <502D12E2.4000808@windriver.com>
	<1345132684.14667.70.camel@ted> <20120817033209.GB19625@localhost>
	<1345196146.14667.84.camel@ted> <20120817100001.GA16621@localhost>
	<1345200782.26132.18.camel@ted> <20120817130151.GA1416@localhost>
MIME-Version: 1.0
In-Reply-To: <20120817130151.GA1416@localhost>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Liang Li <liang.li@windriver.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 17 Aug 2012 13:17:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 2012-08-17 21:01, Liang Li <liang.li@windriver.com> wrote:
> On 2012-08-17 18:53, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2012-08-17 at 18:00 +0800, Liang Li wrote:
> > > I am totally confused, you mentioned 'general kernel do_install', I
> > > assume it's oe-core kernel.bbclass concept. Then you mentioned 'get
> > > the fix upstream in the mainline kernel', how could that happen?
> > > 
> > > We are discussing about the solution to 'fix the compile warning to
> > > error' stuff that triggered by the '-I/usr/include/slang', right?
> > 
> > Yes.
> > 
> > >  We do not necessarily have to change recipe to fix it since the issue
> > > is not introduced by the recipe, the hard coded '-I/usr/include/slang'
> > > in the Makefile cause the issue, we can fix the root cause by kernel
> > > patch(other than just comment the line out). I see your previous patch
> > > to kernel, by comment out the '-I/usr/include/slang' line in the
> > > Makefile, is the same behavior, but we won't have the change(comment
> > > out -I.. in Makefile) upstream to mainline, right?
> > 
> > I am suggesting that firstly, someone send a patch to the mainline
> > kernel which changes -I/usr/include/slang to -I=/usr/include/slang in
> > that Makefile.
> > 
> > Secondly, I'm suggesting that we add a line to kernel_do_install() in
> > kernel.bbclass which does a sed on the Makefile as installed into
> > $kerneldir which changes -I/usr/include/slang to -I=/usr/include/slang.
> > 
> > We can then drop the patch I added to the linux-yocto kernels.
> > 
> > This is all that should be needed, it should fix all the issues people
> > have reported in a way that is acceptable to everyone.
> > 
> 
> Ah, I see what you mean now. But we have push acceptable kernel patch

Sorry, I mean 'we can ...' instead of 'we have ...', just typo.


