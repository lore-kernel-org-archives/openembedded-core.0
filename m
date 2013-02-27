Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@linux.intel.com>) id 1UAnL2-00063Z-K1
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 21:10:53 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Feb 2013 11:54:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,750,1355126400"; d="scan'208";a="207009347"
Received: from unknown (HELO [10.255.12.240]) ([10.255.12.240])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Feb 2013 11:54:29 -0800
Message-ID: <1361994869.2588.1.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 27 Feb 2013 13:54:29 -0600
In-Reply-To: <CAHUNapTgiR2uAo6uD+R32-wxUj=Eja58vZ+gCwFemvpsd8Kqyw@mail.gmail.com>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
	<CAHUNapTgiR2uAo6uD+R32-wxUj=Eja58vZ+gCwFemvpsd8Kqyw@mail.gmail.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] add libaudit and enable 'perf trace'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 20:10:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-27 at 13:10 -0500, Trevor Woerner wrote:
> On Wed, Feb 27, 2013 at 10:00 AM,  <tom.zanussi@linux.intel.com> wrote:
> > 'perf-trace' is a new perf subcommand available in the 3.8 kernel -
> > this patchset enables it.
> 
> Out of curiosity, from where can I find the recipe(s) for a 3.8 kernel?
> 
> My meta/recipes-kernel/linux/ only includes:
>     linux-dummy.bb
>     linux-yocto-dev.bb
>     linux-yocto-rt_3.0.bb
>     linux-yocto-rt_3.2.bb
>     linux-yocto-rt_3.4.bb
>     linux-yocto-tiny_3.2.bb
>     linux-yocto-tiny_3.4.bb
>     linux-yocto_3.0.bb
>     linux-yocto_3.2.bb
>     linux-yocto_3.4.bb
> 

The 3.8 kernel recipes were posted last night and haven't been merged
yet, so you'd have to apply them yourself..

Tom

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




