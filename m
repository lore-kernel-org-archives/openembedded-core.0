Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsCUW-0003XQ-J7 for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 14:39:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KCS9IR012127
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 13:28:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10396-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 13:28:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KCRxVR012121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 13:28:01 +0100
Message-ID: <1342787283.21788.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 13:28:03 +0100
In-Reply-To: <ly1uk67hna.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyk3xy7mlu.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20120720104117.GE3534@jama.jama.net> <1342782398.21788.7.camel@ted>
	<ly629i7inz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1342785890.21788.10.camel@ted>
	<ly1uk67hna.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Broken parallel build of gcc*
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
X-List-Received-Date: Fri, 20 Jul 2012 12:39:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 14:15 +0200, Enrico Scholz wrote:
> Richard Purdie
> <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> writes:
> 
> >> Is there a way to exclude such tasks from the signature handling?
> >
> > The easiest option is probably something like:
> >
> > do_rm_old_works[vardepexclude] = "PN"
> 
> I tried this but it is not really an option because there must be added
> a lot of completely unrelated variables:
> 
>  $ bitbake-diffsigs gcc-runtime*do_rm_old_work.sigdata* libgcc*do_rm_old_work.sigdata*
> 
>  Dependency on variable gcc_cv_collect2_libs was added
>  Variable CPPFLAGS value changed from  to ${TARGET_CPPFLAGS}
> 
> (none of these is used within do_rm_old_works).

Can you point me at a copy of the class your using and the full diffsigs
output please?

Thanks,

Richard



