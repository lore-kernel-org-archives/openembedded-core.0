Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4B4y-0000Mk-Cm for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 15:34:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MDMUpu003480;
	Wed, 22 Aug 2012 14:22:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03272-03; Wed, 22 Aug 2012 14:22:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MDMKEW003474
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 22 Aug 2012 14:22:21 +0100
Message-ID: <1345641741.3907.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 14:22:21 +0100
In-Reply-To: <CAJTo0LYycw59N9tO1i0q5NtTLjUgxwdPRTLQrcZWL7hgaQbmYA@mail.gmail.com>
References: <CAMKF1srvBZzMTbN-iOqEjitgSjFOK_Cpd0B94HjWm1z7s-0-iQ@mail.gmail.com>
	<1345285875.27428.27.camel@ted>
	<CAMKF1srJ1w94g2rgu8FvZdmHLK-4t=GSj9OtSAncuquK6oNhjw@mail.gmail.com>
	<1345339639.24626.62.camel@x121e.pbcl.net>
	<CAMKF1sp5vLaO68jx-wmmrFDaTjbBczSJ3uLf8oAZPwkpmhZr_g@mail.gmail.com>
	<CAJTo0LYycw59N9tO1i0q5NtTLjUgxwdPRTLQrcZWL7hgaQbmYA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>, and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Patches
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
X-List-Received-Date: Wed, 22 Aug 2012 13:34:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-22 at 08:47 +0100, Burton, Ross wrote:
> On 22 August 2012 01:21, Khem Raj <raj.khem@gmail.com> wrote:
> > May be it will be nicer to create one meta
> > package which installs
> > all prerequisites not only chrpath/patchelf and maintain that ourselves
> > this could be nicer since then user only installs
> >
> > apt-get install make-my-host-compile-oe package on ubuntu and similar
> > for others.
> 
> I used to maintain one of these for Debian years ago, and it did help a lot.

These days I'd much rather just ship a tarball with all the bits needed
contained therein. Since we can self-host and we have the nativesdk
infrastructure, this shouldn't be hard and it would work on any distro.

Cheers,

Richard



