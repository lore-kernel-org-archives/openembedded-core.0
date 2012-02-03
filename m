Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RtNaN-0004wD-3f for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 19:10:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13GpqYk022691;
	Fri, 3 Feb 2012 16:51:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22119-08; Fri,  3 Feb 2012 16:51:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13GpidA022684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 3 Feb 2012 16:51:45 GMT
Message-ID: <1328287910.16474.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 03 Feb 2012 16:51:50 +0000
In-Reply-To: <1328122541-27434-2-git-send-email-bruce.ashfield@windriver.com>
References: <1328122541-27434-1-git-send-email-bruce.ashfield@windriver.com>
	<1328122541-27434-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: chris_larson@mentor.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/patch: optionally return non-patch sources
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
X-List-Received-Date: Fri, 03 Feb 2012 18:10:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-01 at 13:55 -0500, Bruce Ashfield wrote:
> commit:
> 
>   patch.bbclass: abstract out logic that determines patches to apply
> 
> gives the ability for other clases to emit series files for use outside
> of a build system, or even within the build system. There are sometimes
> elements on the SRC_URI that while not directly applicable to patching,
> can be related to patching the package. For example, the yocto kernel
> class would like to know about these other source items on the SRC_URI
> to locate out of tree kernel features.
> 
> This change keeps the default behaviour of returning patches, but adds the
> ability to request that non-patch results be returned.  Additional filtering
> within the non-patch category, is left up to the caller of the routine.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/patch.bbclass |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



