Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 22DFE6A880
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 16:00:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2013 09:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="344023125"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2013 09:00:37 -0700
Message-ID: <51DED6A4.60007@linux.intel.com>
Date: Thu, 11 Jul 2013 09:00:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1373540849.git.Qi.Chen@windriver.com>
	<6391172.XjBtrIKksh@helios>
In-Reply-To: <6391172.XjBtrIKksh@helios>
Cc: qingtao.cao@windriver.com, Paul Eggleton <paul.eggleton@linux.intel.com>,
	"Rifenbark, Scott M" <scott.m.rifenbark@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/3] Add a method for image level user/group configuration
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
X-List-Received-Date: Thu, 11 Jul 2013 16:00:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2013 05:49 AM, Paul Eggleton wrote:
> Hi Qi,
>
> On Thursday 11 July 2013 19:11:36 Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> This patchset mainly does two things:
>> 1. code refactor to avoid code duplication
>> 2. add a method for image level user/group configuration
>>
>> The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:
>>
>>    meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib ChenQi/user_group_settings
>>
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/user_group_set
>> tings
>>
>> Chen Qi (3):
>>    userbase.bbclass: add a new bbclass
>>    useradd.bbclass: code refactor
>>    usersettings.bbclass: add a new bbclass
>>
>>   meta/classes/useradd.bbclass      |  103 ++---------------
>>   meta/classes/userbase.bbclass     |  230
>> +++++++++++++++++++++++++++++++++++++ meta/classes/usersettings.bbclass |
>> 48 ++++++++
>>   3 files changed, 290 insertions(+), 91 deletions(-)
>>   create mode 100644 meta/classes/userbase.bbclass
>>   create mode 100644 meta/classes/usersettings.bbclass
>
> In terms of naming I'd rather see the base class be called useradd_base to
> match the naming of similar existing classes. For the new class, I'm not sure
> usersettings is really an appropriate name, perhaps something like
> "useradd_real" or "useraccount" or something else that more accurately reflects
> what it is for?
>

I think this is a better approach than what you had orignally.

I agree the naming is not correct currently, useraccount or maybe 
extrausers, also when you rename the class the USER_GROUP_SETTING should 
also be renamed to reflect that, something like EXTRA_USERS_PARAMS or 
USER_ACCOUNT_PARAMS to match the class name.

You also need to provide full documentation on this new variable, please 
send details to Scott Rifenbark.


> Cheers,
> Paul
>

