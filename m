Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVNRL-0002uB-Vk for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 14:09:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATD30VT013382;
	Tue, 29 Nov 2011 13:03:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13247-02; Tue, 29 Nov 2011 13:02:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATD2ple013376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Nov 2011 13:02:51 GMT
Message-ID: <1322571778.3166.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 13:02:58 +0000
In-Reply-To: <20111129123027.GF7441@jama.jama.net>
References: <1322521031-26849-1-git-send-email-msm@freescale.com>
	<CAEsOVNfRuMJfh3HW-6=0ivjngv+e8Dxk7fKo_ySUSgB4EYDrLg@mail.gmail.com>
	<1322569564.3166.1.camel@ted> <20111129123027.GF7441@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] eglibc-initial: Ensure symlinks point to the correct location when built from sstate cache
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
X-List-Received-Date: Tue, 29 Nov 2011 13:09:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 13:30 +0100, Martin Jansa wrote:
> On Tue, Nov 29, 2011 at 12:26:04PM +0000, Richard Purdie wrote:
> > If the sstate files are installed into a sysroot from the sstate cache,
> > the directory to the main sysroot can change and the symlinks aren't
> > adjusted to account for this. This is a problem specific to the toolchain
> > bootstrap process. This patch adds up a function to recreate the
> > symlinks, hence ensuring they always point at the correct location.
> 
> Similar issue is IMHO in python and apr (and probably more)
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012149.html

Its similar but not that similar. The toolchain sysroots are special in
that the bootstrap one needs to refer to the non-bootstrap one via
symlinks.

The path references you mention above should be detected by the sstate
relocation code and fixed up automatically. It sounds like the search
and replace expressions we're using aren't catching every reference we
need to which is a different problem.

Cheers,

Richard



