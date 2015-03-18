Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE8860034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 15:47:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 18 Mar 2015 08:43:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,423,1422950400"; d="scan'208";a="468977643"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.155])
	([10.219.4.155])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2015 08:39:39 -0700
Message-ID: <55099DF2.70809@linux.intel.com>
Date: Wed, 18 Mar 2015 09:46:58 -0600
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	Chen Qi <qi.chen@windriver.com>
References: <cover.1426670089.git.Qi.Chen@windriver.com>	<003afa4a3acb0670e6e3b9d3e12e9b276f03876c.1426670089.git.Qi.Chen@windriver.com>
	<5575166.bgVZKFq0RH@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <5575166.bgVZKFq0RH@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] rootfs.py: two changes regarding log checking
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
X-List-Received-Date: Wed, 18 Mar 2015 15:47:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul, Chen,

Days ago i sent a patchset for handle INCOMPATIBLE_LICENSE in manifest 
creation [1] that contains
a rewrite of license_manifest_creation from shell to python, i mean now 
these warnings appears.

Also i sent a similar patches like Chen's ones to avoid warnings 
[2][3],  You said (Paul) that packagegroups
should not have files, how we can address these case to avoid license 
warnings in packagegroups?

Cheers,
     alimon

[1] 
http://lists.openembedded.org/pipermail/openembedded-core/2015-March/102684.html
[2] 
http://lists.openembedded.org/pipermail/openembedded-core/2015-March/102683.html
[3] 
http://lists.openembedded.org/pipermail/openembedded-core/2015-March/102682.html

On 18/03/15 03:48, Paul Eggleton wrote:
> On Wednesday 18 March 2015 17:16:10 Chen Qi wrote:
>> 1. Extend the regular expression to also catch '^WRARNING:' in
>> _log_check_warn. Warnings from bb.note or bbnote begin with 'WARNING:'. So
>> if we decide to catch warnings at rootfs time, we should not ignore those
>> produced by the build system itself.
> FYI, I still have an unfinished patchset to ensure bbwarn calls from shell
> functions get piped through to BitBake's event system, with the result that
> such warnings actually get logged and displayed by the BitBake UI. (That
> doesn't mean this patch shouldn't go in in the mean time, though.)
>
> Cheers,
> Paul
>


