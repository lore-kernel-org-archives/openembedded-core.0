Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNQ7x-0000k0-Qm for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 16:57:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3QElPV6004148
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 15:47:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02915-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 15:47:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3QElJ4L004142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 15:47:20 +0100
Message-ID: <1335451639.20130.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Apr 2012 15:47:19 +0100
In-Reply-To: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Thu, 26 Apr 2012 14:57:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-25 at 16:31 -0700, Khem Raj wrote:
> Hello
> 
> Now that release is almost out of door. I would like some eyes on the
> gcc-4.7 work
> and mips64 architecture support that I have done meanwhile
> 
> I have made sure that gcc-4.6 still keeps working and I have patches
> for gcc-4.5 too
> for meta-oe too. I have repeatedly built core-image-sato and
> core-image-minimal for uclibc/eglibc
> but more coverage would be nicer.
> 
> The patches are posted here
> 
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc
> 
> I would appreciate any feedback or testing on this

I had a look through the patch series. I've posted an altered version of
the class override patch. I've pulled the gcc 4.7 part into master-next,
have get gcc 4.7 as the default and am running it though the
autobuilder. That should see how we stand with our usual regression
tests.

I didn't add in the kmod or mips64 bits yet as I wanted to test one
thing at a time.

Cheers,

Richard



