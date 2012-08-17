Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2JRe-0000JC-Qq for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:06:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7H9sNAr007448
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 10:54:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06130-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 10:54:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7H9sGEu007442
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 10:54:17 +0100
Message-ID: <1345197255.26132.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 10:54:15 +0100
In-Reply-To: <71f45133289f617d85d0c9072ea3b4d584f5de67.1345135594.git.peter.seebach@windriver.com>
References: <cover.1345135594.git.peter.seebach@windriver.com>
	<71f45133289f617d85d0c9072ea3b4d584f5de67.1345135594.git.peter.seebach@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] base.bbclass: Work even when there's no PNBLACKLIST entries
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
X-List-Received-Date: Fri, 17 Aug 2012 10:06:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-16 at 11:50 -0500, Peter Seebach wrote:
> It turns out that the result of getVarFlags is not a list, it's
> a dict. So "getVarFlags(...) or []" does not reliably produce
> something with a .items. This escaped detection because our
> local build environment never ends up running builds without
> PNBLACKLIST entries.
> 
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>  meta/classes/base.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 840ddbc..acc3217 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -175,7 +175,7 @@ def preferred_ml_updates(d):
>  
>      versions = []
>      providers = []
> -    blacklists = d.getVarFlags('PNBLACKLIST') or []
> +    blacklists = d.getVarFlags('PNBLACKLIST') or {}
>      for v in d.keys():
>          if v.startswith("PREFERRED_VERSION_"):
>              versions.append(v)

Merged to master, thanks.

Richard



