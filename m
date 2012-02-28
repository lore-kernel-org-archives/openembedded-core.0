Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S2NEx-00009O-OO for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 14:37:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1SDSmeL017940;
	Tue, 28 Feb 2012 13:28:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17732-03; Tue, 28 Feb 2012 13:28:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1SDSdkW017934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 28 Feb 2012 13:28:40 GMT
Message-ID: <1330435722.9185.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 28 Feb 2012 13:28:42 +0000
In-Reply-To: <20120228124103.GC3910@jama.jama.net>
References: <20120228122416.D2CF210332@opal>
	<20120228124103.GC3910@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Yi Zhao : lsbtest: Add recipe for LSB tests and automate test
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
X-List-Received-Date: Tue, 28 Feb 2012 13:37:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-28 at 13:41 +0100, Martin Jansa wrote:
> On Tue, Feb 28, 2012 at 12:24:16PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: b9ef6b8022a40bab83e8eb29e5fcde0886cf2988
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=b9ef6b8022a40bab83e8eb29e5fcde0886cf2988
> > 
> > Author: Yi Zhao <yi.zhao@windriver.com>
> > Date:   Fri Feb 24 14:51:28 2012 +0800
> > 
> > lsbtest: Add recipe for LSB tests and automate test
> > 
> > The recipe is used for LSB tests. The script LSB_Test.sh does the following things:
> > - setup LSB testing environment
> > - download LSB rpm packages with list file packages_list from remote
> > - install the packages
> > - execute LSB testing with profile file session
> > - collect the results
> > 
> > Install packages_list and session files into ${D}/opt/lsb-test.
> > 
> > [YOCTO #1567]
> > 
> > ---
> > 
> >  meta/recipes-extended/lsb/lsbtest/LSB_Test.sh   |  510 +++++++++++++++++++++++
> >  meta/recipes-extended/lsb/lsbtest/packages_list |   50 +++
> >  meta/recipes-extended/lsb/lsbtest/session       |  194 +++++++++
> >  meta/recipes-extended/lsb/lsbtest_1.0.bb        |   37 ++
> 
> S=${WORKDIR}
> 
> This breaks parsing with new strict quoting, will send patch for that,
> but be more carefull next time :).

I ran into this and some others so I've pushed fixes for them.

Cheers,

Richard



