Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVmZG-00013p-Ms for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 16:59:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUFqoa1001313
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:52:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00935-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:52:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUFqe7p001306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:52:41 GMT
Message-ID: <1322668369.17484.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 15:52:49 +0000
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/11] Clutter tidy-up and fixes
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
X-List-Received-Date: Wed, 30 Nov 2011 15:59:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 16:33 -0800, Joshua Lock wrote:
> All,
> 
> This is the third attempt at this series. Since the v2 I've:
> * Squashed the distro_tracking_fields changes together (Note: I'm claiming
> I maintain clutter* now).
> * Fixed clutter-box2d by dropping the extremely old clutter-box2d-1.6 and
> updating the clutter-box2_git recipe.
> 
> Note: Poky maintainers, without my RFC patch to drop the clutter bbappends this
> series will introduce failures at parse time for Poky.
> 
> Cheers,
> Joshua
> 
> The following changes since commit 177df2c51927f44e3536856f4604364b38695bc2:
> 
>   qt-mobility: Add missing patch (2011-11-29 14:36:09 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/clutter
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter
> 
> Joshua Lock (11):
>   multilib.conf: remove clutter-1.6 and add clutter-1.8
>   clutter: PROVIDES clutter-1.6
>   task-core-clutter: use clutter-1.8
>   mutter: switch to clutter-1.8 to satisfy dependency
>   clutter-*-1.6: drop clutter 1.6 recipes
>   cogl: add missing depends on libxcomposite
>   clutter: move STDDEPENDS to inc
>   clutter-box2d: Update git recipe
>   clutter-box2d: fix LICENSE field - LGPL-2.1
>   clutter-box2d: drop unbuildable clutter-box2d-1.6_0.10.0
>   distro-tracking-fields: update entries for clutter recipes

Merged to master, thanks.

Richard



