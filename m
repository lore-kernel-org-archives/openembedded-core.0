Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 23BAC71978
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 16:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u97GLlls024170; Fri, 7 Oct 2016 17:21:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XAmn9mrd3VAR; Fri,  7 Oct 2016 17:21:47 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u97GLgO3024166
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 7 Oct 2016 17:21:43 +0100
Message-ID: <1475857302.30475.640.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mark Hatle
	<mark.hatle@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 07 Oct 2016 17:21:42 +0100
In-Reply-To: <1475857189.30475.639.camel@linuxfoundation.org>
References: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<9c3c5cc4-02e0-4a95-c6f6-9a282701c240@windriver.com>
	<77aabb0f-ae71-2425-6a63-fabd27bed710@imgtec.com>
	<1475855318.30475.633.camel@linuxfoundation.org>
	<0e93c6bb-0b30-c203-5750-f470e2753f7c@imgtec.com>
	<1475857189.30475.639.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 0/9] Add MIPS release 6 ISA support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2016 16:21:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-10-07 at 17:19 +0100, Richard Purdie wrote:
> On Fri, 2016-10-07 at 17:07 +0100, Zubair Lutfullah Kakakhel wrote:
> > 
> > On 10/07/2016 04:48 PM, Richard Purdie wrote:
> > > 
> > > On Fri, 2016-10-07 at 12:53 +0100, Zubair Lutfullah Kakakhel
> > > wrote:
> > > What I will say though is that we really need to think about an
> > > "allmips", or "mipsarch" override, rather than all these
> > > duplicate
> > > lines for all mips variants. This is something we should fix
> > > early
> > > in
> > > the 2.3 cycle and should make some of this look a lot neater. It
> > > might
> > > be worth openening a bug for this in the bugzilla and assigning
> > > that to
> > > yourself, assuming you're happy to work on it?
> > The duplicate lines are bothersome indeed.
> > I'm happy to work on it. But I'm still a bit new to OE internals so
> > would
> > prefer a little direction regarding the best approach to take.
> Very roughly speaking, you'd add something like:
> 
> MACHINEOVERRIDES =. "mipsarch"

er, I do mean:

MACHINEOVERRIDES =. "mipsarch:"

Cheers,

Richard

