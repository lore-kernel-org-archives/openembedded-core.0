Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyN1f-0006az-JE for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 15:07:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76CtWEi027931;
	Mon, 6 Aug 2012 13:55:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27818-01; Mon,  6 Aug 2012 13:55:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76CtNer027925
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 6 Aug 2012 13:55:24 +0100
Message-ID: <1344257725.9756.147.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 13:55:25 +0100
In-Reply-To: <1344205948.3541.2.camel@lenny>
References: <cover.1343964466.git.wenzong.fan@windriver.com>
	<9ed1d4d30aeac33273968b00c0b5afab059bbc0f.1343964466.git.wenzong.fan@windriver.com>
	<1344205948.3541.2.camel@lenny>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] gdk-pixbuf: fix parallel install issue
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
X-List-Received-Date: Mon, 06 Aug 2012 13:07:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-08-05 at 18:32 -0400, Colin Walters wrote:
> On Fri, 2012-08-03 at 11:30 +0800, wenzong.fan@windriver.com wrote:
> 
> > Make an explicit dependency to the libs install targets would fix this
> > issue.
> 
> I don't think Yocto should be running the 'make install' target with
> parallelism enabled; it's just going to be a source of major pain for
> small gain.  Historically Automake's install targets have had a lot of
> paralleism issues AIUI, even discarding modules which have custom
> install hooks.

We did used to steer clear of this but more recently tested it out and
with a few exceptions (which we disabled with PARALLEL_MAKEINST=""),
parallel make install seems to work fine and did give a small but
measurable speed-up (I'd have to look at the archives to remember what).

It helps that we use the latest automake everywhere and regenerate all
the makefiles ourselves.

So whilst I agree with this from a historical perspective, times so seem
to be changing and improving. If there are issues I do want to know
about and deal with them though.

Cheers,

Richard







