Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RrpKS-0000LF-QM for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 12:23:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0UBFTLe022885
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 11:15:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22428-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 11:15:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0UBFJLm022878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 11:15:21 GMT
Message-ID: <1327922122.7807.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jan 2012 11:15:22 +0000
In-Reply-To: <59F89C99-2B25-4679-A565-B108ACAF1BFC@dominion.thruhere.net>
References: <1327847180-25415-1-git-send-email-ulf@emagii.com>
	<59F89C99-2B25-4679-A565-B108ACAF1BFC@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] mirrors.bbclass: Add new KERNELORG_MIRROR = ftp.sunet.se
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
X-List-Received-Date: Mon, 30 Jan 2012 11:23:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-01-29 at 16:35 +0100, Koen Kooi wrote:
> Op 29 jan. 2012, om 15:26 heeft Ulf Samuelsson het volgende geschreven:
> 
> > www.kernel.org is missing a lot of files.
> > Add the "ftp.sunet.se" mirror containing many missing files.
> 
> Since the files on kernel.org were removed because they might be
> compromised, why do we add a mirror that has kept the compromised
> files?

Its a valid question.

In our favour, we have checksums on all the SRC_URIs these days and I
look suspiciously at anyone changing then other than at version upgrade
time. We therefore have more protection in place than most for this kind
of problem.

Cheers,

Richard



