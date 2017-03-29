Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ABA1877CB2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 10:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2TAU8ZH006364; 
	Wed, 29 Mar 2017 11:30:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FnucC-QWyYXC; Wed, 29 Mar 2017 11:30:08 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2TAU68H006361
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Mar 2017 11:30:07 +0100
Message-ID: <1490783406.13980.310.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 Mar 2017 11:30:06 +0100
In-Reply-To: <alpine.LFD.2.20.1703290555150.2895@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703290548440.3733@uk63952.mitel.com>
	<alpine.LFD.2.20.1703290555150.2895@uk63952.mitel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: wanting to clarify HOSTTOOLS and HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 29 Mar 2017 10:30:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-29 at 05:56 -0400, Robert P. J. Day wrote:
> On Wed, 29 Mar 2017, Robert P. J. Day wrote:
> 
> > 
> >   again, trying to catch up with new developments, and i want to
> > make sure i understand these variables. as i read it (and i could
> > be
> > off-base), HOSTTOOLS represents a list of tools that *must* be
> > available one way or the other, and any tools listed there are
> > allowed to be symlinked from the tools available in PATH, is that
> > correct?
> > 
> >   OTOH, HOSTTOOLS_NONFATAL represents whitelisted tools that will
> > be
> > symlinked if they're there, but their absence is not fatal.

Correct. Perhaps you could send a patch to add these to the manual? :)

> >   i'm still not totally clear here ... and there is no mention of
> > these variables in the YP reference manual variables glossary.
>   oh, i think i asked this before as well ... how do these variables
> relate to ASSUME_PROVIDED? IIRC, ASSUME_PROVIDED is interpreted as "i
> have these utilities on my host, use them."

ASSUME_PROVIDED means that if something does DEPENDS += "x" and x is in
ASSUME_PRODIDED, bitbake won't try and build it or require a recipe for
it.

HOSTTOOLS is about filtering out tools from PATH for determinism.

Its unfortunate there is overlap between these but both are good things
to have in their own rights and I don't really see a way to automate it
in a 100% accurate way.

Cheers,

Richard



