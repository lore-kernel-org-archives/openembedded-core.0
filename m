Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QCK6n-0006L5-Uu for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 01:13:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3JNB5nO009791
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:11:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09080-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:11:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3JNAviY009785
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:10:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1303253280.git.josh@linux.intel.com>
References: <cover.1303253280.git.josh@linux.intel.com>
Date: Wed, 20 Apr 2011 00:10:45 +0100
Message-ID: <1303254645.5518.294.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2 0/3] Fix and update clutter-1.6
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
X-List-Received-Date: Tue, 19 Apr 2011 23:13:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-04-19 at 15:49 -0700, Joshua Lock wrote:
> From: Joshua Lock <josh@linux.intel.com>
> 
> Same as the v1 patch set only with an extra patch to update to the latest
> release in the Clutter 1.6 stable series.
> 
> With a recent patchset I changed clutter to depend on a json-glib recipe then
> promptly didn't include that recipe in the patch series - apologies.
> 
> Further I've removed a patch from the 1.6 recipe which is no longer required.
> 
> Finally, Clutter 1.6.14 - hurrah!
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: josh/clutter
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter
> 
> Thanks,
>     Joshua Lock <josh@linux.intel.com>
> ---
> 
> 
> Joshua Lock (3):
>   json-glib: new recipe required by clutter
>   clutter-1.6: drop no longer required patch
>   clutter-1.6: update to 1.6.14

Merged to master, thanks.

Richard



