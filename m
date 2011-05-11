Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QKDRl-0008TJ-7E for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 19:43:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BHendL022745;
	Wed, 11 May 2011 18:40:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22628-03; Wed, 11 May 2011 18:40:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BHeiIG022739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 11 May 2011 18:40:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BANLkTintvgFGKUUUdvq2M7Q=m+gYuzs2-A@mail.gmail.com>
References: <4DCAB609.8030601@linux.intel.com>
	<BANLkTintvgFGKUUUdvq2M7Q=m+gYuzs2-A@mail.gmail.com>
Date: Wed, 11 May 2011 18:40:37 +0100
Message-ID: <1305135637.30391.455.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches, Darren Hart <dvhart@linux.intel.com>,
	oe-core layer <openembedded-core@lists.openembedded.org>, Otavio,
	"poky@yoctoproject.org" <poky@yoctoproject.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: RFC: create-pull-request / send-pull-request updates
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
X-List-Received-Date: Wed, 11 May 2011 17:43:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-11 at 10:01 -0700, Khem Raj wrote:
> On Wed, May 11, 2011 at 9:15 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> >
> > Thoughts/Comments?
> >
> 
> I would suggest to alter the process a bit and get rid of the scripts
> completely. Patches are sent to mailing list for review once reviewed
> the final patches are
> sent as git pull-request. It would simplify things.

I'd argue that it doesn't. It just means the requests come in different
formats, sometimes with key pieces of information missing which means
the people trying to handle the requests (like me) get frustrated.

I find it easiest to deal with requests that have come through those
scripts.

Cheers,

Richard



