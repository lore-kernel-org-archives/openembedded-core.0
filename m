Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC9978282
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:51:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 23 Aug 2017 05:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,417,1498546800"; d="scan'208";a="1187300127"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2017 05:51:11 -0700
References: <e165f760-1c1e-1a5f-2fba-f8c293a16278@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Forwarded-Message-Id: <e165f760-1c1e-1a5f-2fba-f8c293a16278@intel.com>
Message-ID: <9f0302e4-4320-b985-e0b8-ebf3f7422aad@linux.intel.com>
Date: Wed, 23 Aug 2017 15:48:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e165f760-1c1e-1a5f-2fba-f8c293a16278@intel.com>
Subject: Re: long (never ending?) do_install for adwaita-icon-theme
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
X-List-Received-Date: Wed, 23 Aug 2017 12:51:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/22/2017 09:46 PM, Trevor Woerner wrote:
>> Do you have any kind of logs for when it happens?
> 
> 
> Unfortunately not, I'll try to keep some the next time it happens.
> 
> But I have a suspicion it might be related to a build failure. Earlier
> today I was doing a build which failed in a recipe that wasn't
> adwaita-icon-theme, nor related to it. When I checked on my build
> later I could see the tail of the error message from the failed
> recipe, but the overall build was still waiting for
> adwaita-icon-theme's do_install to finish (hours after the failure).
> 
> Maybe adwaita-icon-theme's do_install would have succeeded if
> everything had gone well? Maybe to reproduce, it might be necessary to
> time it such that another recipe fails while adwaita-icon-theme is
> building?

We can certainly revert my patch that speeds up the do_install(), but I 
would prefer not to do it blindly: it's much better to first firmly 
establish that the patch is indeed the reason for the never ending 
do_install (I can't imagine why, but it certainly could be). So please 
do try to get some logs, or a stable way to reproduce.

Alex

