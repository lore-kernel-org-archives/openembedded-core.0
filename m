Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q0WJ3-0005fz-LN for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 10:49:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2I9lXw9004008
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2011 09:47:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03935-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2011 09:47:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2I9lPbv004002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2011 09:47:25 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110318035922.GA4083@sakrah.homelinux.org>
References: <20110318035922.GA4083@sakrah.homelinux.org>
Date: Fri, 18 Mar 2011 09:47:09 +0000
Message-ID: <1300441629.30423.2186.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: cleaning perl-native catch 22
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
X-List-Received-Date: Fri, 18 Mar 2011 09:49:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 20:59 -0700, Khem Raj wrote:
> Hi
> 
> Ubuntu 11.04 decided to put libc in /lib/`uname -m`-linux-gnu/ so
> perl-native failed and I patched it and all fine. But here is
> interesting thing. When perl-native failed (this is build from scratch)
> then I fixed it and as usual tried to do
> bitbake -c cleanall perl-native
> 
> and it started to build perl instead since I guess its a dependency for
> pseudo (may be) and pseudo is not build yet. So whats the way out here
> so is it a catch-22
> 
> So I had to delete the whole tmpdir

perl-native is not a dependency of pseudo-native...

Cheers,

Richard



