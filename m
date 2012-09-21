Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TF3w8-0002Vh-Ko for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 16:10:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LDvkFo026019;
	Fri, 21 Sep 2012 14:57:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25778-02; Fri, 21 Sep 2012 14:57:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LDvbKx026013
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 21 Sep 2012 14:57:38 +0100
Message-ID: <1348235856.10108.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 21 Sep 2012 14:57:36 +0100
In-Reply-To: <cover.1348204894.git.sgw@linux.intel.com>
References: <cover.1348204894.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED REQUEST (v2) 00/22] Fixes for 1.3 RC2 (no cover letter)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 14:10:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-20 at 22:22 -0700, Saul Wold wrote:
> Richard,
> 
> This contains a set of fixes that have been tested against the
> build.
> 
> I have included the GDB update, which I know is late in the game,
> but I think it important tool to be updated.
> 
> I also included Wenzong's TMPDIR fix, if you read the chain of emails
> this seems to be the only way to fix this give the number of m4 macro
> files included and the fact that we really can't patch the host aclocal.

I merged this apart from the above fix which really needs to be made to
autotools.bbclass and shouldn't be difficult to fix there. I've sent a
separate email.

Cheers,

Richard




