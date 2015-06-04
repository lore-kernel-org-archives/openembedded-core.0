Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EE802734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 20:41:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jun 2015 13:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,554,1427785200"; d="scan'208";a="582310514"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.173])
	([10.219.4.173])
	by orsmga003.jf.intel.com with ESMTP; 04 Jun 2015 13:41:01 -0700
Message-ID: <5570B839.60800@linux.intel.com>
Date: Thu, 04 Jun 2015 15:42:33 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1433443273.git.anibal.limon@linux.intel.com>
	<814ba904a75c25027560113d0317fbc092e9d8b7.1433443273.git.anibal.limon@linux.intel.com>
	<CAJTo0Laqurme0RPGf7AQ1b5P-esYmwW48nA=VfzHtcfq8i1DmQ@mail.gmail.com>
	<CAJTo0LayZb_bgeiM0EQqjNb-kNPhX=4BxLj-+tJkp576=bTCww@mail.gmail.com>
In-Reply-To: <CAJTo0LayZb_bgeiM0EQqjNb-kNPhX=4BxLj-+tJkp576=bTCww@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/4] distrodata: Use Python CSV instead of did by hand
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
X-List-Received-Date: Thu, 04 Jun 2015 20:41:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

Comments below,

     alimon

On 04/06/15 15:08, Burton, Ross wrote:
> On 4 June 2015 at 21:06, Burton, Ross <ross.burton@intel.com> wrote:
>
>> So whereas before the SRC_URI field in checkpkg.cvs generally just listed
>> the first entry (the main source) it now lists the entire of SRC_URI.
>> Presumably this bug fix is desired behaviour?
No i made a mistake here thanks for notice, sending v3...
> Also fields that used to say "None" are now empty.  Again, this seems like
> a fix to me, although it changes behaviour.
Yes it changes the behavior but it is right to me also.
>
> Ross
>


