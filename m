Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Sp2Ey-0004PR-9I
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 21:06:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6BIt96J011769
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Jul 2012 11:55:09 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 11 Jul 2012 11:55:08 -0700
Date: Wed, 11 Jul 2012 13:54:55 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120711135455.72b90a06@wrlaptop>
In-Reply-To: <1342028210.11939.35.camel@ted>
References: <cover.1342022120.git.peter.seebach@windriver.com>
	<22e5e5adc39fb855badc6d1260fbd4b30d966530.1342022120.git.peter.seebach@windriver.com>
	<1342023149.11939.22.camel@ted> <20120711113333.76632780@wrlaptop>
	<1342028210.11939.35.camel@ted>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package.bbclass: Allow overriding of debugedit starting path
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
X-List-Received-Date: Wed, 11 Jul 2012 19:06:24 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 11 Jul 2012 18:36:50 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> It should all use 4 space for python functions. There is however a
> twist which is due to the way we handle _prepend and _append. Those
> prepends and appends have whitespace too and I seem to remember
> issues with whitespace matching.
> 
> Yes, this is horrible. This is why that file hasn't been touched for
> whitespace though.

noooooooo

That hurts so much.

Okay, crazy thought.  Imagine that we were to make a modified parser,
with the following behavior:

Whenever reading a python function, count the indentation of the first
line (N), then replace every N spaces of indentation with 4 spaces.

If this worked, it would make it possible to start fixing stuff.

DISCLAIMER:  Due to Reasons, I have slept about 15 minutes out of the
last day, also I'm sick. When I say "crazy thought", I do not kid.

Anyway:  Anyone have other thoughts/comments on the possible starting
path fixup? I am pretty sure that it is sufficient for all real cases,
with the one exception being prebuilts where the debug path names are
unreasonably short.  (I theorize that a more advanced debugedit could
be written which could handle those by rewriting files.  I nominate
someone else to try to actually do it.)

My initial theory that I'd need to be able to specify the destination
path evaporates with the realization that we can always move source
files to whatever path we want them in; it's just that it's nicer for
everyone if the debug source files are always in the standard locations,
give or take, no matter how they were built.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


