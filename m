Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5A18D772C3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 21:08:36 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aR4fE-0004DX-KG; Wed, 03 Feb 2016 22:08:36 +0100
Message-ID: <1454533708.7421.61.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 03 Feb 2016 21:08:28 +0000
In-Reply-To: <CAMKF1srGn-maJcvPLQSV6Xz7RgU4N1Jipr+Oc9AH_B1xsj-UQw@mail.gmail.com>
References: <56B0AE88.3090103@siemens.com> <1454446338.7421.45.camel@pbcl.net>
	<46DD8494-2C7E-44B8-8793-12228FD56738@gmail.com>
	<1454532510.7421.54.camel@pbcl.net>
	<CAMKF1sqevO99mD2V1xxZEa7--LX9vctuFebLc59fOej3xnjkhA@mail.gmail.com>
	<1454533078.7421.57.camel@pbcl.net>
	<CAMKF1srGn-maJcvPLQSV6Xz7RgU4N1Jipr+Oc9AH_B1xsj-UQw@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default value for FULL_OPTIMIZATION
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Feb 2016 21:08:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-02-03 at 12:59 -0800, Khem Raj wrote:
> in systems of  this age it should be yet.

Sorry, I didn't really understand that comment.

For what it's worth, as a very quick and fairly unscientific comparison,
I did "time make -j4" in a glibc tree and got:

real	1m38.812s
user	4m6.420s
sys	0m23.148s

and then I cleaned the tree and did "time make -j4 CFLAGS='-O2 -g
-pipe'" and got:

real	1m37.299s
user	4m21.420s
sys	0m27.304s

I'm not sure these results are statistically significant but on this
very limited evidence it certainly doesn't look like -pipe is providing
any transformational benefits.  The real time has gone down a tiny bit,
which suggests that -pipe is giving some extra parallelism, but the
system and user time have both actually gone up in the second case. 

p.



