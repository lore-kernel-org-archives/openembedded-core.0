Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DD9D761EBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 16:01:49 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r53G6JTg027627; Mon, 3 Jun 2013 17:06:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id r330XN-CCfol; Mon,  3 Jun 2013 17:06:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r53G6GAG027619
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 3 Jun 2013 17:06:18 +0100
Message-ID: <1370275284.14887.408.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Date: Mon, 03 Jun 2013 17:01:24 +0100
In-Reply-To: <1370267962-23207-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1370267962-23207-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bdwgc: fix recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2013 16:01:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-06-03 at 16:59 +0300, Bogdan Marinescu wrote:
> bdwgc has version names that may or may not contain a revision
> (for example 7.2d or simply 7.2). The current recipe specifies
> the revision as a separate variable, which confuses the automatic
> version checker. This patch enables using the full version name
> as part of the recipe name.
> 
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  meta/recipes-support/bdwgc/{bdwgc_7.2.bb => bdwgc_7.2d.bb} |   10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>  rename meta/recipes-support/bdwgc/{bdwgc_7.2.bb => bdwgc_7.2d.bb} (91%)

I'm going to start getting more picky about these summaries as they're
not useful :(.

"fix recipe" tells me nothing about what this change actually does.
Please resent with a more better summary that related to what the change
does.

Cheers,

Richard


