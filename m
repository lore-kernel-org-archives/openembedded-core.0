Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T2OFb-00006q-P5
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 17:14:15 +0200
Received: from [0.0.0.0] (unknown [67.171.188.207])
	(Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 818821EC71;
	Fri, 17 Aug 2012 08:02:17 -0700 (PDT)
Message-ID: <502E5CF8.5000703@windriver.com>
Date: Fri, 17 Aug 2012 08:02:16 -0700
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1345070782-4518-1-git-send-email-andy.ross@windriver.com>
	<1345070782-4518-2-git-send-email-andy.ross@windriver.com>
	<1345106385.7750.76.camel@x121e.pbcl.net>
	<502D314F.5010302@windriver.com> <1345199307.26132.13.camel@ted>
In-Reply-To: <1345199307.26132.13.camel@ted>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] insane.bbclass: Fix RPATH warning in the face of funny path strings
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
X-List-Received-Date: Fri, 17 Aug 2012 15:14:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2012 03:28 AM, Richard Purdie wrote:
> I suspect you need to look somewhere around:
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-devtools/libtool/libtool/fix-rpath.patch

Indeed.  Found that yesterday and am currently testing a fix.
Should be inbound within the hour.

Andy



