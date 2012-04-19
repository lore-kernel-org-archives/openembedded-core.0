Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKolu-0003xU-Md for openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 12:39:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3JATgWu012680;
	Thu, 19 Apr 2012 11:29:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10906-05; Thu, 19 Apr 2012 11:29:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3JATXOn012674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 19 Apr 2012 11:29:36 +0100
Message-ID: <1334831377.5336.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: niqingliang@insigma.com.cn, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Apr 2012 11:29:37 +0100
In-Reply-To: <1334821781.1256.63.camel@localhost.localdomain>
References: <1334821451.5336.6.camel@ted>
	<1334821781.1256.63.camel@localhost.localdomain>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] qemu: Backport a patch to solve SSE2 instruction emulation issues
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
X-List-Received-Date: Thu, 19 Apr 2012 10:39:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-04-19 at 15:49 +0800, Ni Qingliang wrote:
> why not update to qemu-1.0.1 ?

That requires a bit more work and is not suitable for a point release.
We do need to update in the 1.3 cycle but that is a lot more work and
will happen later. I think this is therefore a reasonable way to fix the
bug in question.

Cheers,

Richard



