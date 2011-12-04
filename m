Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXASA-0002EC-Cx; Sun, 04 Dec 2011 12:41:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB4BZ8kH014429;
	Sun, 4 Dec 2011 11:35:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14294-01; Sun,  4 Dec 2011 11:35:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB4BYw9c014408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 4 Dec 2011 11:34:59 GMT
Message-ID: <1322998509.25960.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 04 Dec 2011 11:35:09 +0000
In-Reply-To: <20111204112019.GB4871@rhein.zuhause.netz>
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
	<4ED54C2B.2060505@emagii.com> <4ED66835.3050400@intel.com>
	<4ED793E2.5070205@emagii.com> <4EDA80A2.5070303@emagii.com>
	<20111204112019.GB4871@rhein.zuhause.netz>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@lists.openembedded.org, ulf@emagii.com
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Sun, 04 Dec 2011 11:41:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-12-04 at 12:20 +0100, Henning Heinold wrote:
> On Sat, Dec 03, 2011 at 09:03:46PM +0100, Ulf Samuelsson wrote:
> > Have made some further tests with the same machine, but now running
> > Ubuntu 11.04 x64
> > 
> > bitbake console-image
> > 
> >     PARALLEL_TASKS        BB_NUMBER_TASKS        BUILD TIME
> >     2                                  2
> > 1:24:16
> >     4                                  4
> > 0:48:22
> >     6                                  6
> > 0:45:00
> >     24                                24
> > C++ compiler fails with --sysroot problem
> >         after ~2200 out of 2400 tasks.
> > 
> > 
> > 
> > BR
> > Ulf
> 
> Hi Ulf,
> 
> can you try the attached patch if it solves the problem?

Can someone please explain to me how this would fix the problem?

If this were the issue shouldn't it either always work or always fail?

I'm worried that even if this does "fix" the problem, there is a deeper
issue lurking somewhere :(

Cheers,

Richard



