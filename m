Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 26E847823D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:37:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2017 02:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,441,1496127600"; d="scan'208";a="293657727"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2017 02:37:55 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
	<20170724142818.44403-5-alexander.kanavin@linux.intel.com>
	<CAJTo0LbJvsviFJGW8k=Hgsr=kCgFhv7MX=wyjxYz2t23zkSQ1Q@mail.gmail.com>
	<CAMKF1so7BKN37KMUBDcDw9zHqZmO6YJuFpM8igAHo40QG_CkkQ@mail.gmail.com>
	<CAJTo0LbDLYh1vOOt6UqjbMpK86b5TuhcXRBqFz=EhzjEp0J1mA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <287709d4-1010-10fa-fd94-929e4c465e49@linux.intel.com>
Date: Mon, 31 Jul 2017 12:35:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbDLYh1vOOt6UqjbMpK86b5TuhcXRBqFz=EhzjEp0J1mA@mail.gmail.com>
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
X-List-Received-Date: Mon, 31 Jul 2017 09:37:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/28/2017 05:50 PM, Burton, Ross wrote:
> And libid3tag:
> 
> | compat.gperf:116:1: error: conflicting types for 'id3_compat_lookup' | 
> In file included from compat.gperf:37:0: | 
> ../libid3tag-0.15.1b/compat.h:36:26: note: previous declaration of 
> 'id3_compat_lookup' was here | struct id3_compat const 
> *id3_compat_lookup(register char const *, | ^~~~~~~~~~~~~~~~~
> 
> http://git.savannah.gnu.org/cgit/gperf.git/commit/?id=d519d1a821511eaa22eae6d9019a548aea21e6d3 
> is the upstream commit that breaks everything, because the API of the 
> generated files has changed.

Right. Should we just stop fighting with this, and put a 
RECIPE_NO_UPDATE_REASON into gperf? I'd rather not update gperf with 
this change reverted.

Alex

