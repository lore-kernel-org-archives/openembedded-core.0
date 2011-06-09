Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QUmkh-0005AP-CP
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 23:26:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2011 14:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,343,1304319600"; d="scan'208";a="12181395"
Received: from miles.jf.intel.com (HELO [10.7.199.151]) ([10.7.199.151])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2011 14:23:34 -0700
Message-ID: <4DF139D6.3070508@intel.com>
Date: Thu, 09 Jun 2011 14:23:34 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1307058256.git.scott.a.garman@intel.com>	<f9c2ad2b00c9fd52962ee7689a809b2b17e4f735.1307058256.git.scott.a.garman@intel.com>
	<5D76A268-DA2B-4F5A-BDE0-79211C403B0F@dominion.thruhere.net>
In-Reply-To: <5D76A268-DA2B-4F5A-BDE0-79211C403B0F@dominion.thruhere.net>
Subject: Re: [PATCH 3/7] base-passwd: populate the target sysroot with passwd/group/login.defs
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
X-List-Received-Date: Thu, 09 Jun 2011 21:26:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2011 01:50 PM, Koen Kooi wrote:
>
> Op 3 jun 2011, om 01:50 heeft Scott Garman het volgende geschreven:
>
>> The passwd, group, and login.defs files in the target sysroot will
>> be used when recipes create custom user and group permissions in
>> their packages.
>>
>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>> ---
>> .../base-passwd/base-passwd-3.5.22/login.defs      |  386 ++++++++++++++++++++
>
> I'm now getting tons and tons of the following when using shadow:
>
> [  900.349395] grpconv[682]: unknown configuration item `FAILLOG_ENAB'
> [  900.357391] grpconv[682]: unknown configuration item `LASTLOG_ENAB'
> [  900.364196] grpconv[682]: unknown configuration item `OBSCURE_CHECKS_ENAB'
> [  900.371734] grpconv[682]: unknown configuration item `PORTTIME_CHECKS_ENAB'
> [  900.381042] grpconv[682]: unknown configuration item `QUOTAS_ENAB'
> [  900.387878] grpconv[682]: unknown configuration item `MOTD_FILE'
> [  900.394256] grpconv[682]: unknown configuration item `FTMP_FILE'
> [  900.400634] grpconv[682]: unknown configuration item `NOLOGINS_FILE'
> [  900.407348] grpconv[682]: unknown configuration item `ENV_HZ'
> [  900.413452] grpconv[682]: unknown configuration item `PASS_MIN_LEN'
> [  900.420104] grpconv[682]: unknown configuration item `SU_WHEEL_ONLY'
> [  900.426849] grpconv[682]: unknown configuration item `CRACKLIB_DICTPATH'
> [  900.433929] grpconv[682]: unknown configuration item `PASS_CHANGE_TRIES'
> [  900.441040] grpconv[682]: unknown configuration item `PASS_ALWAYS_WARN'
> [  900.448028] grpconv[682]: unknown configuration item `CHFN_AUTH'
> [  900.454376] grpconv[682]: unknown configuration item `ENVIRON_FILE'
>
>
> which seems to be related to the login.defs change.

What context is this happening in? Runtime, or during a buildstep?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


