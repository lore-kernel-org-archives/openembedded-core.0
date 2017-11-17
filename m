Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 53B75784D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 11:19:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2017 03:19:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,408,1505804400"; 
   d="scan'208";a="3744683"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga001.fm.intel.com with ESMTP; 17 Nov 2017 03:19:41 -0800
Date: Fri, 17 Nov 2017 13:20:22 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171117112021.GA8635@mbabyjoh-desk.ger.corp.intel.com>
References: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
	<1510315228-24186-5-git-send-email-maxin.john@intel.com>
	<CAJTo0LYRgX7EcL5vb234NV2pkDneHYACCyEySvYei6dCahWG9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYRgX7EcL5vb234NV2pkDneHYACCyEySvYei6dCahWG9w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] screen: upgrade to 4.6.2
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
X-List-Received-Date: Fri, 17 Nov 2017 11:19:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Thu, Nov 16, 2017 at 04:09:20PM +0000, Burton, Ross wrote:
>Breaks under MIPS, see https://bugzilla.yoctoproject.org/show_bug.cgi?id=12353.
>

Ack. will fix and resend it.

>Ross


>>On 10 November 2017 at 12:00, Maxin B. John <maxin.john@intel.com> wrote:
>>
>> 4.6.1 -> 4.6.2
>>
>> Removed backported patches:
>> 1. 0001-fix-for-multijob-build.patch
>> 2. 0002-comm.h-now-depends-on-term.h.patch
>>
>> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>>                                        ---
>> .../screen/0001-fix-for-multijob-build.patch       | 58 ----------------------
>> .../screen/0002-comm.h-now-depends-on-term.h.patch | 33 ------------
<snip>

Thanks & Regards,
Maxin

