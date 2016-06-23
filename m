Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 905776010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 12:48:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jun 2016 05:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,516,1459839600"; d="scan'208";a="127250022"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2016 05:48:04 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1466503279-28937-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20160622144241.GA4153@jama>
	<CAJTo0Lar56vj6VOo097yhbTMtAx78PsS7kU3Yeh_7xb-XpBy0g@mail.gmail.com>
	<20160622150011.GB4153@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5cea0ca7-3b17-798a-8635-9b6f3cfb51fd@linux.intel.com>
Date: Thu, 23 Jun 2016 15:47:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160622150011.GB4153@jama>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: remove the extra dot from the recipe filename
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
X-List-Received-Date: Thu, 23 Jun 2016 12:48:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2016 06:00 PM, Martin Jansa wrote:

>>> WARNING: e2fsprogs-1.43-r0 do_packagedata: QA Issue: Package version for
>>> package e2fsprogs-locale-uk went backwards which would break package feeds
>>> from (0:1.43.-r0.1 to 0:1.43-r0.0) [version-going-backwards]
>>>
>>
>> Have you checked what opkg/rpm actually think about this?  Maybe the sanity
>> test is broken.
>
> No, but opkg-compare-versions from opkg-utils thinks the same:
>
> OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0:1.43-r0.0 \>\> 0:1.43.-r0.0
> OE @ ~/projects/opkg-utils $ echo $?
> 1
>
> Also note that EXTENDPRAUTO is reset to 0, because of PV change (which
> is saved by RPs PR bump).

Maybe we should just update e2fsprogs to 1.43.1 :)

Alex


