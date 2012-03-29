Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDN25-0001Li-PG for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 23:37:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLSKQH005629;
	Thu, 29 Mar 2012 22:28:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04773-10; Thu, 29 Mar 2012 22:28:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLSAro005623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 29 Mar 2012 22:28:11 +0100
Message-ID: <1333056489.18082.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 22:28:09 +0100
In-Reply-To: <1333004316-6877-1-git-send-email-sledz@dresearch-fe.de>
References: <1333004316-6877-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH] docbook-utils-native: fix syntax problem in jw.in
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
X-List-Received-Date: Thu, 29 Mar 2012 21:37:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-29 at 08:58 +0200, Steffen Sledz wrote:
> Fix runtime error occurred e.g. with docbook-to-man calls:
> 
>   grep: character class syntax is [[:space:]], not [:space:]
>   grep: character class syntax is [[:space:]], not [:space:]
>   jw: There is no frontend called "/docbook/utils-0.6.14/frontends/docbook".
> 
> See also:
> 
>    <https://qa.mandriva.com/show_bug.cgi?id=61127>
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  .../docbook-utils/docbook-utils-0.6.14/re.patch    |   15 +++++++++++++++
>  .../docbook-utils/docbook-utils-native_0.6.14.bb   |    7 +++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
> 
> diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch b/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
> new file mode 100644
> index 0000000..1e53389
> --- /dev/null
> +++ b/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
> @@ -0,0 +1,15 @@


There is no header on this patch saying what the patch does, why, where
it came from or what its status is. Please resubmit with a header added:

https://wiki.yoctoproject.org/wiki/Contribution_Guidelines#Patch_Header_Recommendations

This is so when we look at the patch a year from now, we can understand
why its there.

Cheers,

Richard




