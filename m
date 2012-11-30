Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TeP9j-00066B-Ew
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 12:53:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Nov 2012 03:39:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,191,1355126400"; d="scan'208";a="224716149"
Received: from unknown (HELO helios.localnet) ([10.252.123.9])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2012 03:39:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Date: Fri, 30 Nov 2012 11:38:59 +0000
Message-ID: <1932884.RUTkbRsFAt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <CAF6bG8fYO6Ent8JqYyfo+oqScYytWqbuYCRh=VyKS=c3zmtqGA@mail.gmail.com>
References: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
	<CAF6bG8fYO6Ent8JqYyfo+oqScYytWqbuYCRh=VyKS=c3zmtqGA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: update to upstream version 8.20
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
X-List-Received-Date: Fri, 30 Nov 2012 11:53:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 30 November 2012 13:14:57 Marko Lindqvist wrote:
> On 30 November 2012 13:08, Marko Lindqvist <cazfi74@gmail.com> wrote:
> > * License texts are identical to old, but old md5sum was
> > 
> >   erronously calculated from the beginning of the ls.c file, and
> >   not from the beginning of license text segment.
> 
> Google finds quite a lot of documentation/examples to use startline=x
> when it seems to be beginline=x which works. Judging from output of
> "grep -r startline openembedded-core", there are several other
> affected recipes. I can make patchset to replace those with
> "beginline" and corrent md5sums.

Whoops - turns out I've made this mistake in a number of recipes I submitted 
recently for meta-oe and meta-networking. I can correct those, but if you 
could fix the OE-Core ones that would be very much appreciated.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


