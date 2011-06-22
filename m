Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZVUe-0006Uh-8L for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 00:01:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MLw8H3009622;
	Wed, 22 Jun 2011 22:58:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09034-10; Wed, 22 Jun 2011 22:58:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MLvx9J009616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 22 Jun 2011 22:57:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <cover.1308777703.git.bruce.ashfield@windriver.com>
References: <cover.1308777703.git.bruce.ashfield@windriver.com>
Date: Wed, 22 Jun 2011 22:57:40 +0100
Message-ID: <1308779860.20015.100.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	koen@dominion.thruhere.net, saul.wold@intel.com
Subject: Re: [PATCH 0/2] linux-yocto: consolidated merge request
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
X-List-Received-Date: Wed, 22 Jun 2011 22:01:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 17:29 -0400, Bruce Ashfield wrote:
> Hi,
> 
> This pull request contains the first iteration of the
> base configuration changes discussed on the list about
> two weeks ago, and a common USB fix that was identified
> during the beagleboard refresh.
> 
>   94fa015 meta: add taskstats experimental feature group
>   4fb2ed5 meta: enable freezer support
>   88d619e meta: enable fuse and cuse as modules
>   f465827 meta: add namespaces + experimental configs
>   fbdd376 meta: add devtmpfs config group
>   b04f6d9 meta: re-enable cgroups options in the standard kernel
> 
> I've built the relevant qemu targets with the changes,
> and my sanity tests have all passed here.
> 
> cc: Koen Kooi <koen@dominion.thruhere.net>
> cc: Daren Hart <dvhart@linux.intel.com>
> 
> Cheers,
> 
> Bruce
> 
> 
> The following changes since commit 46378aec555f08f133bf601be01dacf4bd0b7f05:
>   Bruce Ashfield (1):
>         linux-yocto/meta-yocto: update SRCREVs for utrace merge

Merged to master (as soon as my push to the repo works), thanks.

Richard



