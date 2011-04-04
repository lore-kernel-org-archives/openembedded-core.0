Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6jNs-0008AU-8B for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:59:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34Cvre7016175
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:57:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15963-06 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 13:57:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34Cvl1b016169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:57:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1301668619.git.tom_rini@mentor.com>
References: <cover.1301668619.git.tom_rini@mentor.com>
Date: Mon, 04 Apr 2011 13:57:43 +0100
Message-ID: <1301921863.24596.361.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Bring in and use patchdir
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
X-List-Received-Date: Mon, 04 Apr 2011 12:59:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-01 at 07:37 -0700, Tom Rini wrote:
> The following series brings in the 'patchdir' parameter from openembedded
> so that we can say that a patch needs to be applied in a subdir.  This
> allows us to re-write the db change for how we apply the arm patch to
> be just ';subdir=..' and in meta-oe and other layers will help a number
> of other patches be cleanly applied.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: trini/use-patchdir-for-nonstd-paths
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/use-patchdir-for-nonstd-paths
> 
> Thanks,
>     Tom Rini <tom_rini@mentor.com>
> ---
> 
> 
> Tom Rini (2):
>   patch.bbclass: allow importing patches into other dirs
>   db: Switch to patchdir rather than applying in do_configure

Merged to master, thanks!

Richard



