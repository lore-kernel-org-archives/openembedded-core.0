Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0486260034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 02:16:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2J2G5Bk024341
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Mar 2015 19:16:05 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 18 Mar 2015 19:16:05 -0700
Message-ID: <550A3162.6050701@windriver.com>
Date: Thu, 19 Mar 2015 10:16:02 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>, Paul
	Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1426670089.git.Qi.Chen@windriver.com>	<003afa4a3acb0670e6e3b9d3e12e9b276f03876c.1426670089.git.Qi.Chen@windriver.com>
	<5575166.bgVZKFq0RH@peggleto-mobl.ger.corp.intel.com>
	<55099DF2.70809@linux.intel.com>
In-Reply-To: <55099DF2.70809@linux.intel.com>
X-Originating-IP: [128.224.162.236]
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
X-List-Received-Date: Thu, 19 Mar 2015 02:16:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 03/18/2015 11:46 PM, Aníbal Limón wrote:
> Hi Paul, Chen,
>
> Days ago i sent a patchset for handle INCOMPATIBLE_LICENSE in manifest 
> creation [1] that contains
> a rewrite of license_manifest_creation from shell to python, i mean 
> now these warnings appears.
>
> Also i sent a similar patches like Chen's ones to avoid warnings 
> [2][3],  You said (Paul) that packagegroups
> should not have files, how we can address these case to avoid license 
> warnings in packagegroups?
>

Hi Alimon,

Paul suggested to skip checking if the package contains no file, because 
in such case the license is not relevant as long as the final image is 
concerned.
I will send out a new patchset using the above approach.

Best Regards,
Chen Qi

> Cheers,
>     alimon
>
> [1] 
> http://lists.openembedded.org/pipermail/openembedded-core/2015-March/102684.html
> [2] 
> http://lists.openembedded.org/pipermail/openembedded-core/2015-March/102683.html
> [3] 
> http://lists.openembedded.org/pipermail/openembedded-core/2015-March/102682.html
>
> On 18/03/15 03:48, Paul Eggleton wrote:
>> On Wednesday 18 March 2015 17:16:10 Chen Qi wrote:
>>> 1. Extend the regular expression to also catch '^WRARNING:' in
>>> _log_check_warn. Warnings from bb.note or bbnote begin with 
>>> 'WARNING:'. So
>>> if we decide to catch warnings at rootfs time, we should not ignore 
>>> those
>>> produced by the build system itself.
>> FYI, I still have an unfinished patchset to ensure bbwarn calls from 
>> shell
>> functions get piped through to BitBake's event system, with the 
>> result that
>> such warnings actually get logged and displayed by the BitBake UI. (That
>> doesn't mean this patch shouldn't go in in the mean time, though.)
>>
>> Cheers,
>> Paul
>>
>
>
>


