Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzC6l-0003ls-Jo for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 19:03:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2EI1Jq5004822;
	Mon, 14 Mar 2011 18:01:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04524-05; Mon, 14 Mar 2011 18:01:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2EI1Bk8004816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 14 Mar 2011 18:01:12 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <AANLkTimM2W1XiRcSJxrXYQDDRd2Hyxg3YAqq_kBVheWK@mail.gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-4-git-send-email-raj.khem@gmail.com>
	<AANLkTiks0VSWcW4_54mQUv17ZQvb8+CsbWcsDkA_9ZA+@mail.gmail.com>
	<1299610396.602.104.camel@rex>
	<AANLkTim62_Vb=EumqASMY_ARCJkS8M7rTAUtpxnMR6gx@mail.gmail.com>
	<1299934200.1445.3023.camel@rex>
	<AANLkTimM2W1XiRcSJxrXYQDDRd2Hyxg3YAqq_kBVheWK@mail.gmail.com>
Date: Mon, 14 Mar 2011 18:01:06 +0000
Message-ID: <1300125666.30423.354.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 3/6] gcc: Statically link in support libraries e.g. libmpfr libgmp etc.
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
X-List-Received-Date: Mon, 14 Mar 2011 18:03:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-14 at 10:52 -0700, Khem Raj wrote:
> On Sat, Mar 12, 2011 at 4:50 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > If you look at the way the SDK toolchain works in Poky, it automatically
> > ships the versions of these libraries that it needs so we don't actually
> > have this problem.
> >
> 
> Yes thats one way of doing it and if you got it working this is fine
> but there were issues when referencing
> due to ORIGIN mucking. So this was better and cleaner than we link in
> this libs into binary itself.

The $ORIGIN stuff should be working just fine, have you checked this?

>   From
> my POV even this solution can be improved by adding the support libs
> to gcc build itself as sources
> then we dont need to muck with gcc build configury at all. I have been
> doing that for non OE related
> SDKs and has been best so far.

As I mention above, I do think we have a solution for this which is
working...

> > Also, looking at the patch again, was the first LDFLAGS change meant to
> > be in there, is that related or different to the shared/static
> > mpfr/mpc/gmp issue?
> 
> LDFLAGS are modified to get the LDFLAGS into gcc itself otherwise it
> would not honour
> the modified LDFLAGS to pass -static option.

Hmm, I'll look at the patch again as that didn't seem to be the only
LDFLAGS change but I could be wrong.

Cheers,

Richard



