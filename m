Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6XD0-0008Vo-PG for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 02:32:10 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M0X4im015288 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 01:33:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R2NvHf8DlzBK
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 01:33:04 +0100 (BST)
Received: from [10.251.10.153] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M0M66C015069
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 01:33:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 01:26:48 +0100
In-Reply-To: <30E0E33D-A811-4023-8977-4CA73C4656E6@dominion.thruhere.net>
References: <4E7A3D3A.1030007@balister.org> <4E7A3E4C.6080206@windriver.com>
	<30E0E33D-A811-4023-8977-4CA73C4656E6@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316651210.13622.0.camel@ted>
Mime-Version: 1.0
Subject: Re: Fetch failure for source at kernel.org
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
X-List-Received-Date: Thu, 22 Sep 2011 00:32:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-21 at 21:49 +0200, Koen Kooi wrote:
> Op 21 sep. 2011, om 21:43 heeft Mark Hatle het volgende geschreven:
> 
> > On 9/21/11 2:38 PM, Philip Balister wrote:
> >> I'm finally trying to get started with oe-core. I'm using a setup 
> >> created with the setup-script created by Koen. Everything looks ok until 
> >> it tried to build cpufrequtils. The recipe tries to fetch the source 
> >> from a git repo at kernel.org. Obviously, the fetch fails.
> >> 
> >> What is odd, in the "good old days" I would expect this config to fall 
> >> back and use the Angstrom source mirror, but apparently this is not the 
> >> case with oe-core.
> >> 
> >> Is this a bug or a feature? If this is a bug, is there a plan to fix it? 
> >> If it is a feature, how are we supposed to do builds if servers go away? 
> >> What do we do about GPL compliance?
> > 
> > This is a feature, as people did not want oe-core tied to a given mirror.
> 
> This is the "OE core doesn't generate versioned git tarballs" problem
> people keep talking about. I know I can edit each and every recipe to
> add ';rebasable=true', but I'd like a global solution before the GPL
> police starts looking at the angstrom source mirrors.

Is this a versioned tarball problem or just the tarballs not being
generated at all?

Are you setting BB_GENERATE_MIRROR_TARBALLS?

Cheers,

Richard




