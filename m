Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RjAyr-00074X-6c for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 15:41:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06EXoTC021654;
	Fri, 6 Jan 2012 14:33:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21214-03; Fri,  6 Jan 2012 14:33:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06EXgw4021648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 6 Jan 2012 14:33:43 GMT
Message-ID: <1325860423.20759.122.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 06 Jan 2012 14:33:43 +0000
In-Reply-To: <CADkTA4PYbE4gw8Rmwn8Xg6Ns9zajCLKQWJHLWo7qxX8rNbvPsQ@mail.gmail.com>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
	<CADkTA4PYbE4gw8Rmwn8Xg6Ns9zajCLKQWJHLWo7qxX8rNbvPsQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] qemuppc: replace emulation of qemuppc
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
X-List-Received-Date: Fri, 06 Jan 2012 14:41:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 09:29 -0500, Bruce Ashfield wrote:
> On Thu, Jan 5, 2012 at 3:37 AM, Liming Wang <liming.wang@windriver.com> wrote:
> > Hi Richard,
> >
> > These patches are aimed to replace emulation of qemuppc from prep to mac99.
> > With this new emulation, qemuppc now supports framebuffer and the network
> > works well.
> >
> > The kernel config also needs modification and I will let Bruce to review the
> > patches.
> 
> I have the patches in my inbox now, I'm reviewing and merging them shortly.
> I'll pull these changes in to do some boot and runtime testing as well.
> 
> Richard/Saul: if it works better for coordination purposes, I can do the kernel
> part, take this into my tree as well and then send a single coordinated pull
> request when everything is known to work together.

Yes please.

The userspace bits look reasonable to me but they need to be in step
with the kernel changes. I'm looking forward to working framebuffer
support :)

Cheers,

Richard



