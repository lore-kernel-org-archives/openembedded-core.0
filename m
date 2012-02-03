Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RtMzQ-0003lD-W5 for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 18:32:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13HNpxu023120;
	Fri, 3 Feb 2012 17:23:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22464-08; Fri,  3 Feb 2012 17:23:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13HNjQZ023113
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 3 Feb 2012 17:23:46 GMT
Message-ID: <1328289831.17307.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 03 Feb 2012 17:23:51 +0000
In-Reply-To: <1328109632-3300-1-git-send-email-steve@sakoman.com>
References: <1328109632-3300-1-git-send-email-steve@sakoman.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH v6 0/3] libzypp: support signed repositories
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
X-List-Received-Date: Fri, 03 Feb 2012 17:32:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-01 at 07:20 -0800, Steve Sakoman wrote:
> The current libzypp implementation does not work with signed repositories.
> This patch series adds recipes for the required packages as well as the
> necessary runtime dependencies to libzypp.
> 
> Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled and
> a systemd based console image.
> 
> Changes from version 5 include feedback from Paul Menzel:
>  - add (initial recipe) to patch subject for libksba and gnupg
>  - add HOMEPAGE to libksba and gnupg
>  - use ${PV}/${P} in gnupg SRC_URI
>  - fix description/punctuation for libksba and gnupg
> 
> Steve Sakoman (3):
>   libksba: add 1.2.0 (initial recipe)
>   gnupg: add 2.0.18 (initial recipe)
>   libzypp: add missing runtime dependences on gzip and gnupg

Merged to master, thanks.

Richard



