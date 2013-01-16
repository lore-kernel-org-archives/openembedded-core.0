Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TvRwI-00006x-4w for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 13:17:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GC2V55023858;
	Wed, 16 Jan 2013 12:02:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20832-03; Wed, 16 Jan 2013 12:02:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GC2ODZ023851
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 16 Jan 2013 12:02:25 GMT
Message-ID: <1358337744.8129.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marko Lindqvist <cazfi74@gmail.com>
Date: Wed, 16 Jan 2013 12:02:24 +0000
In-Reply-To: <cover.1358250908.git.cazfi74@gmail.com>
References: <cover.1358250908.git.cazfi74@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/12] Prepare recipes for automake-1.13 (batch #3)
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
X-List-Received-Date: Wed, 16 Jan 2013 12:17:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-01-15 at 13:57 +0200, Marko Lindqvist wrote:
> As more and more packages seem to have automake-1.13 related problems,
> it's becoming clear that I cannot fix world alone. I'm about to fix
> packages in openembedded-core the way I've been doing, but for supporting
> unfixed packages in other layers it would make sense to patch our
> version of automake-1.13 to still support AM_CONFIG_HEADER (the most
> common problem by far). We can drop that patch once most of the world
> has been updated to versions that work without.

Agreed, this does sound like the sensible way to go for us for now. I
appreciate the work you're doing on this!

Cheers,

Richard



