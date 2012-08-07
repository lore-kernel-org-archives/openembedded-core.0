Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SykwO-00057I-H3 for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 16:39:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77ERaW0011906;
	Tue, 7 Aug 2012 15:27:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11410-07; Tue,  7 Aug 2012 15:27:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77ERTND011900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 15:27:30 +0100
Message-ID: <1344349652.9756.261.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 07 Aug 2012 15:27:32 +0100
In-Reply-To: <CADkTA4OZ3zMZE+4e6SS0THgqqoKBa8pnyPqSkMOnb7W3kLe_mg@mail.gmail.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<CADkTA4O8uTpJfjNL0bVw1+oJ2JrwWg++M4v5FK5pumN-npsNMw@mail.gmail.com>
	<1344348754.9756.256.camel@ted>
	<CADkTA4OZ3zMZE+4e6SS0THgqqoKBa8pnyPqSkMOnb7W3kLe_mg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <darren.hart@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
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
X-List-Received-Date: Tue, 07 Aug 2012 14:39:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 10:19 -0400, Bruce Ashfield wrote:
> On Tue, Aug 7, 2012 at 10:12 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2012-08-07 at 08:56 -0400, Bruce Ashfield wrote:
> >> Adding Richard.
> >>
> >> Richard: did this patch not fix the problem for you ? .. it fixes it here, and
> >> should replace the patch that you made earlier today .. this may have slipped
> >> through the cracks.
> >>
> >> I've never seen the perf slang failure, so I'm hesitant to take this
> >> patch, apply
> >> it and drop yours.
> >>
> >> Is there anyway that someone seeing this problem can test this patch ?
> >
> > Reproducing the problem is easy "sudo mkdir /usr/include/slang", then
> > build perf.
> 
> That's fine .. but if I take the existing patch, and drop the kernel
> temp one, would
> you take the change ? I'd rather not spend my time reproducing and fixing
> something to generate a patch that won't be taken :)

Which patch is "the existing patch"?

To be really clear, I'm not hacking around this issue, I do not
want /usr/include/slang in the compiler search path at all, ever.

Cheers,

Richard



