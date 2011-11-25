Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTjNH-00072n-Sf for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 01:10:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP048KO032508
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:04:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31749-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:04:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP040Au032502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:04:01 GMT
Message-ID: <1322179446.10928.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 00:04:06 +0000
In-Reply-To: <1321569767-21633-1-git-send-email-msm@freescale.com>
References: <1321569767-21633-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] Add PATCHRESOLVE to excluded vars for generating sstate-cache
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
X-List-Received-Date: Fri, 25 Nov 2011 00:10:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-17 at 16:42 -0600, Matthew McClintock wrote:
> The method of resolving the patch should not effect the sstate-cache
> signature.
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> I'm not 100% sure about this one either - should we even generate
> sstate-cache at all if we have a scenario where we try to resolve
> a patch?
> 
>  meta/classes/patch.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Merged to master, thanks.

In answer to the question, there clearly shouldn't be a dependency on
this variable. We can depend on the variable even if the conditional
code using it doesn't actually use the code as the dependency analysis
doesn't account for conditional code paths.

Cheers,

Richard



