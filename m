Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0yPD-0005iK-1k for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 17:54:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OGjdxK008953
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:45:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08819-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:45:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OGjUCE008946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:45:31 GMT
Message-ID: <1330101931.7512.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 16:45:31 +0000
In-Reply-To: <cover.1330025248.git.paul.eggleton@linux.intel.com>
References: <cover.1330025248.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] psplash improvements v2
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
X-List-Received-Date: Fri, 24 Feb 2012 16:54:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 19:30 +0000, Paul Eggleton wrote:
> Implements the psplash changes as discussed on the mailing list [1] and
> by the TSC [2].
> 
> [1] http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg13800.html
> [2] http://lists.linuxtogo.org/pipermail/tsc/2012-January/000330.html
> 
> Since v1 I've done away with the additional script and integrated .png
> conversion into the recipe (optional) as well as used alternatives to
> allow selecting the psplash at runtime. I also decided against renaming
> the default header file as it would break existing bbappends.
> 
> Note for meta-yocto there is a corresponding change that should be
> applied at the same time which I will send out shortly.
> 
> (No changes since the RFC except for rebasing on top of current master.)
> 
> 
> The following changes since commit 55f72b98f606c1554eb6edd151292ffdfddf1384:
> 
>   texi2html: Fix for multilib (2012-02-22 23:01:45 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/oe-psplash
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oe-psplash
> 
> Paul Eggleton (2):
>   psplash: use OpenEmbedded logo
>   psplash: allow building multiple splash executables

Merged to master, thanks.

Richard



