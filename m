Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0zC9-0006nD-60 for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 18:44:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OHaBT8009782;
	Fri, 24 Feb 2012 17:36:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09722-01; Fri, 24 Feb 2012 17:36:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OHa2kM009775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 24 Feb 2012 17:36:03 GMT
Message-ID: <1330104962.8430.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 17:36:02 +0000
In-Reply-To: <CAEsOVNe0Fe5qyzYWK3Tf5P1=oYMnB3n-LoOVdE5bk-EkHdPf3A@mail.gmail.com>
References: <1330088135.32006.14.camel@ted>
	<CAEsOVNe0Fe5qyzYWK3Tf5P1=oYMnB3n-LoOVdE5bk-EkHdPf3A@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: Using external source trees with OE-Core
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
X-List-Received-Date: Fri, 24 Feb 2012 17:44:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-24 at 16:55 +0000, McClintock Matthew-B29882 wrote:
> We do something very similar to this currently. I've pushed what we
> are using here:
> 
> https://github.com/mattsm/meta-fsl-local-sdk
> 
> It would be nice to consolidate all the required bits upstream... =)

I would warn you that there is code in there that is clearly
inappropriate for OE-Core.

It would also explain that bug report you sent me which referenced
"do_populate_sysroot_post" and I asked what local modifications you had
and you said "none" ;-).

Does the patch in this thread take care of your needs regarding the
srctree and clean classes?

For cleanobjs, I can see advantages in merging something like that into
the core...

Cheers,

Richard



