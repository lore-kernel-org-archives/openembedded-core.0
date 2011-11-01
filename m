Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RLClc-0001BK-U5
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 12:44:34 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Nov 2011 04:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="69735662"
Received: from unknown (HELO helios.localnet) ([10.252.121.93])
	by orsmga002.jf.intel.com with ESMTP; 01 Nov 2011 04:38:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <saul.wold@intel.com>
Date: Tue, 01 Nov 2011 11:38:20 +0000
Message-ID: <1388094.7IhedMLMWb@helios>
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <246C79CF-C5FA-4F86-AEEA-7734181C0594@dominion.thruhere.net>
References: <cover.1319576293.git.scott.a.garman@intel.com>
	<4EAEC2CE.400@intel.com>
	<246C79CF-C5FA-4F86-AEEA-7734181C0594@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] distro_tracking_fields: updates for sudo, mtools, grep, and openssh
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
X-List-Received-Date: Tue, 01 Nov 2011 11:44:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> Op 31 okt. 2011, om 16:46 heeft Saul Wold het volgende geschreven:
> > On 10/31/2011 02:08 AM, Paul Eggleton wrote:
> >> I'd been meaning to ask this before - is there a good reason for not
> >> being consistent and using the same format for all date fields in
> >> this file?> 
>
> > Maybe I am missing your comment, is that what I not suggested in my
> > comment above?  All date formats in the distro_tracking_fields should
> > be in the MMM DD, YYY format.

Right, I was really commenting on the previous state of the file which seemed 
to have one style for one field and another for the others. Apologies for the 
mixup, however...

On Monday 31 October 2011 17:05:24 Koen Kooi wrote:
> Can we please use a format that makes sense for non-americans as well? E.g.
> YYYY/MM/DD or DD/MM/YYYY or plain ISO (2011-10-31T17:04:31+01:00) 
> without the hours? Anything that doesn't put days in between months and
> year.

I definitely agree with this. ISO date format (or at the very least, numerical 
YYYY-MM-DD) would make much more sense to me.

Cheers,
Paul


