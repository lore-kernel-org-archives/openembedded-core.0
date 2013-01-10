Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TtDE1-0005B2-6D
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 09:11:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jan 2013 23:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,443,1355126400"; d="scan'208";a="244490680"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2013 23:55:41 -0800
Message-ID: <50EE757E.5030006@intel.com>
Date: Thu, 10 Jan 2013 10:02:06 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<CAMKF1sow_bbU84+EYXR0hU_pbFxeR50c1ueWYWGqUnr6Swdy6g@mail.gmail.com>
In-Reply-To: <CAMKF1sow_bbU84+EYXR0hU_pbFxeR50c1ueWYWGqUnr6Swdy6g@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 08:11:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01/09/2013 07:14 PM, Khem Raj wrote:
> On Tue, Jan 8, 2013 at 4:24 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>> As Ross suggested I've done the following changes to the previous set:
>> * added two patches (the first two) that address multiple init systems support,\
>> as in shifting from default hardcoded sysvinit to something more generic while
>> the default values still remains on sysvinit
>> * moved automatic setting of PREFERRED_PROVIDER_udev into default_providers.inc
>> * removed ahavi-systemd since all it provided was service files; now service files
>> are pulled in by avahi-daemon
>> * also rebased on master
>>
> btw. there has been more merges into meta-systemd in meta-openembedded
> since these patches were created I cant accertain
> that you picked those too but please redo this series so the history
> is a bit better for tracking purposes.
I've tried to get in sync with meta-openembedded until they upgraded 
systemd to v196. I tried to upgrade but something changed in the latest 
version and dbus-daemon didn't start anymore and because of that a few 
other services depending on it. I spent some time debugging it but 
eventually I decided we should go with the previous version and address 
the update after we merge. More details about this at 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=1625

Radu


