Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF007561F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jul 2015 11:38:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jul 2015 04:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,405,1432623600"; d="scan'208";a="740482219"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.8.80])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2015 04:38:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: akuster808 <akuster808@gmail.com>
Date: Sat, 04 Jul 2015 12:38:55 +0100
Message-ID: <1548004.RNEmCtHdiu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.6-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <5597048E.40401@gmail.com>
References: <cover.1435497302.git.akuster808@gmail.com>
	<20150703070716.GA21416@ad.chargestorm.se>
	<5597048E.40401@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Sat, 04 Jul 2015 11:38:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Armin,

On Friday 03 July 2015 14:54:22 akuster808 wrote:
> On 07/03/2015 12:07 AM, Anders Darander wrote:
> > * akuster808 <akuster808@gmail.com> [150702 19:05]:
> >> The current version of nettle 2.7 has one file that is GPL v3.
> >> mini-gmp.*
> >> 
> >> so the license for 2.7 should be updated IMHO. So wont that put us in the
> >> same boat as the upgrade?
> > 
> > Ouch, that's no good!
> > 
> > Ideally, we should look at that file and see for how long it's been part
> > of nettle. If it's just for a short time, maybe we could go back to a
> > point in time just prior to the inclusion (or license change) of that
> > file.
> 
> this file has been in nettle for two years. It was introduced with th
> 2.7 release.  Parts of that file are pulled from the gmp project.
> 
> > Has it been like this for far too long, well, then we either have to see
> > what impact this has on non-GPLv3 builds...
> 
> Does "Lesser" GPLv3 count? Looked a the file again and 'Lesser' is near
> the beginning of the paragraph before 'version 3'.
> 
> Does this change things for nettle 2.7?

Well, at minimum for our purposes LGPLv3 (or LGPLv3+?) needs to be added to 
LICENSE in the nettle recipe (with &). Whether or not someone chooses to 
exclude that license in their configuration through INCOMPATIBLE_LICENSE is a 
completely separate matter (and that is, as you allude to, a distinct license 
from GPLv3).

I just think it's something that upstream ought to be noting in their license 
statement, because they don't appear to be at the moment.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

