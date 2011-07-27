Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm5WD-0008QT-9q for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:55:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6REpG3r030601
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 15:51:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30197-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 15:51:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6REpAGN030595
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 15:51:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E30244A.5030209@windriver.com>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
	<4E30244A.5030209@windriver.com>
Date: Wed, 27 Jul 2011 15:50:59 +0100
Message-ID: <1311778259.2344.384.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/4] base.bbclass: Add compatibility package name mapping handler
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
X-List-Received-Date: Wed, 27 Jul 2011 14:55:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 09:44 -0500, Mark Hatle wrote:
> On 7/27/11 9:29 AM, Richard Purdie wrote:
> > This means if PKGARCHCOMPAT_ARMV7A is set, "armv7a-vfp-neon" is renamed
> > to be "armv7a". Other compatibility mappings can be added as needed.
> 
> There are multiple armv7 cores without neon...  I think there might even be one
> or two custom cores w/o VFP.  (Yes I know this violates the core spec from ARM,
> but people do that all of the time.)

I know there are but for some distros in OE have established "armv7a"
with a specific meaning. This gives us some way of merging the tune code
yet defer fixing those conflicts which can then happen at a time of
their choosing.

Its assumed anyone enabling the option knows what it means (which
Angstrom does and is where the request came from).

FWIW I have just merged the tune changes and this workaround flag.

Cheers,

Richard



