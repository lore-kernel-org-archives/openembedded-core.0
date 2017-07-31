Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF9C78406
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:43:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6V9hbD2030697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 31 Jul 2017 10:43:38 +0100
Message-ID: <1501494217.18633.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Jul 2017 10:43:37 +0100
In-Reply-To: <287709d4-1010-10fa-fd94-929e4c465e49@linux.intel.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
	<20170724142818.44403-5-alexander.kanavin@linux.intel.com>
	<CAJTo0LbJvsviFJGW8k=Hgsr=kCgFhv7MX=wyjxYz2t23zkSQ1Q@mail.gmail.com>
	<CAMKF1so7BKN37KMUBDcDw9zHqZmO6YJuFpM8igAHo40QG_CkkQ@mail.gmail.com>
	<CAJTo0LbDLYh1vOOt6UqjbMpK86b5TuhcXRBqFz=EhzjEp0J1mA@mail.gmail.com>
	<287709d4-1010-10fa-fd94-929e4c465e49@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 31 Jul 2017 10:43:38 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] gperf: upgrade to 3.1
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
X-List-Received-Date: Mon, 31 Jul 2017 09:43:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-07-31 at 12:35 +0300, Alexander Kanavin wrote:
> On 07/28/2017 05:50 PM, Burton, Ross wrote:
> > 
> > And libid3tag:
> > 
> > > 
> > > compat.gperf:116:1: error: conflicting types for
> > > 'id3_compat_lookup' | 
> > In file included from compat.gperf:37:0: | 
> > ../libid3tag-0.15.1b/compat.h:36:26: note: previous declaration of 
> > 'id3_compat_lookup' was here | struct id3_compat const 
> > *id3_compat_lookup(register char const *, | ^~~~~~~~~~~~~~~~~
> > 
> > http://git.savannah.gnu.org/cgit/gperf.git/commit/?id=d519d1a821511
> > eaa22eae6d9019a548aea21e6d3 
> > is the upstream commit that breaks everything, because the API of
> > the 
> > generated files has changed.
> Right. Should we just stop fighting with this, and put a 
> RECIPE_NO_UPDATE_REASON into gperf? I'd rather not update gperf with 
> this change reverted.

It does feel like upstream screwed up and should really sort this out.
Do you know what upstream plan to do (if anything)?

Cheers,

Richard

