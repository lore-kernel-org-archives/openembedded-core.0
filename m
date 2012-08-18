Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2gV1-00056M-LF for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 12:43:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7IAVN9a016847;
	Sat, 18 Aug 2012 11:31:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14548-02; Sat, 18 Aug 2012 11:31:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7IAVEw1016841
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 18 Aug 2012 11:31:15 +0100
Message-ID: <1345285875.27428.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Aug 2012 11:31:15 +0100
In-Reply-To: <CAMKF1srvBZzMTbN-iOqEjitgSjFOK_Cpd0B94HjWm1z7s-0-iQ@mail.gmail.com>
References: <CAMKF1srvBZzMTbN-iOqEjitgSjFOK_Cpd0B94HjWm1z7s-0-iQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Replacing chrpath with patchelf
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
X-List-Received-Date: Sat, 18 Aug 2012 10:43:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-08-18 at 00:17 -0700, Khem Raj wrote:
> Hi,
> 
> I have a patchset that replaces use of chrpath with patchelf. Patchelf can
> resize the ELF headers to accomodate larger RPATHs
> 
> The branch is posted here
> 
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/patchelf
> 
> Please test it out and let me know if you see any issues

chrpath is something we require users to install on the system they're
building on. The reason is that we need to relocate the native recipes
and you can't do that without chrpath. You can't build chrpath without
building a native recipe you need to stage to change its own RPATH. 

Now there are a variety of ways we can deal with this but we need to
think it through.

At the very least such a change would need to adjust all the
documentation about the prerequisites.

I'm not actually sure we need to deal with larger RPATHs in the real
world either. There are some bugs we're finding now the call is failing
but they're not turning out to be due to that.

Cheers,

Richard



