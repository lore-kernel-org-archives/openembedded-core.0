Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QTsTq-0006Wr-2q for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 11:21:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p579IQVi016413;
	Tue, 7 Jun 2011 10:18:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15745-10; Tue,  7 Jun 2011 10:18:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p579IFYt016407
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Jun 2011 10:18:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DEDAEBE.8080404@linux.intel.com>
References: <4DE56B0D.4020209@intel.com> <4DE87AD1.1050004@linux.intel.com>
	<4DE8EE32.9060905@windriver.com>	<1307115801.2529.350.camel@phil-desktop>
	<BANLkTi=n+MNMu+EY0F5Hh3OqVe7Ex7CCQg@mail.gmail.com>
	<4DEDAEBE.8080404@linux.intel.com>
Date: Tue, 07 Jun 2011 10:18:11 +0100
Message-ID: <1307438291.15712.16.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Tue, 07 Jun 2011 09:21:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-06 at 21:53 -0700, Darren Hart wrote:
> On 06/03/2011 08:47 AM, Chris Larson wrote:
> > Heh, I used to have a personal branch where I dropped those, and also
> > removed the unnecessary NOTE: prefix. I think its a given that
> > something that doesn't indicate a warning or an error is simply
> > informative :) The problem with dropping those messages is for
> > postprocessing scripts, which may well want/need to know when a task
> > completes, not just when it starts. Still, yet another case of
> > something we could drop as long as we log it. We need to add a main
> > bitbake execution log that captures everything, including debug
> > messages, whether the user specifies -D or not.
> 
> In most systems, running with -D implies not only greater verbosity, but
> also reduced performance. I haven't checked, but I expect that is the
> case with bitbake as well. I don't think we want to enable all of -D and
> log it by default.

I'm not sure the performance hit of this would be that great to be
honest, particularly if we localised the output to the tasks and didn't
hit the IPC mechanism for all the messages. It certainly could be
valuable to have more robust logfiles on disk so that when things do
break we can dive into them and get full debug info rather than the
current partial info.

The main cost would be increased disk space but disks are cheap
comparatively and the IO is minor compared to other things we do...

Cheers,

Richard





