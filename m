Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTiH2-0004HD-90 for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 00:00:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOMrZUG031675
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 22:53:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31011-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 22:53:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOMrReS031669
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 22:53:28 GMT
Message-ID: <1322175214.10928.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 22:53:34 +0000
In-Reply-To: <4ECC270B.7030401@linux.intel.com>
References: <1321568900-19406-1-git-send-email-msm@freescale.com>
	<4ECBFD16.3020406@linux.intel.com>
	<CAEsOVNczFsQBHND1ddr-oZW=HkAqoZnVsLQimViqcJD33HjDbw@mail.gmail.com>
	<4ECC270B.7030401@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] Remove EGLIBPARALLELISM from deps for EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 24 Nov 2011 23:00:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-22 at 14:49 -0800, Saul Wold wrote:
> On 11/22/2011 02:40 PM, McClintock Matthew-B29882 wrote:
> > On Tue, Nov 22, 2011 at 1:50 PM, Saul Wold<sgw@linux.intel.com>  wrote:
> >> When possible, please include the recipe or file you are changing as part of
> >> the patch subject.
> >>
> >> For example this would be:
> >>
> >> eglibc.inc: Remove EGLIBPARALLELISM from deps for EXTRA_OEMAKE
> >
> > Sorry. Shall I resubmit or will you handle this?
> >
> I will handle this time, should have added that in my email.

Merged to master with the tweaked subject from Saul.

Cheers,

Richard



