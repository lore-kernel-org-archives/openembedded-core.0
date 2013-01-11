Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TtgQ3-0007wM-0a
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 16:21:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2013 07:06:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,452,1355126400"; d="scan'208";a="275854173"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2013 07:06:02 -0800
Message-ID: <50F02BC8.6040101@intel.com>
Date: Fri, 11 Jan 2013 17:12:08 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<CAMKF1sow_bbU84+EYXR0hU_pbFxeR50c1ueWYWGqUnr6Swdy6g@mail.gmail.com>
	<50EE757E.5030006@intel.com>
	<CAMKF1sqJ6X6-Pb_r4B+S3va4SB8PLmeaCShB-PbQtP+_JwPqCw@mail.gmail.com>
In-Reply-To: <CAMKF1sqJ6X6-Pb_r4B+S3va4SB8PLmeaCShB-PbQtP+_JwPqCw@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Jan 2013 15:21:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01/10/2013 08:27 PM, Khem Raj wrote:
> On Thu, Jan 10, 2013 at 12:02 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>> On 01/09/2013 07:14 PM, Khem Raj wrote:
>>> On Tue, Jan 8, 2013 at 4:24 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>>>> As Ross suggested I've done the following changes to the previous set:
>>>> * added two patches (the first two) that address multiple init systems
>>>> support,\
>>>> as in shifting from default hardcoded sysvinit to something more generic
>>>> while
>>>> the default values still remains on sysvinit
>>>> * moved automatic setting of PREFERRED_PROVIDER_udev into
>>>> default_providers.inc
>>>> * removed ahavi-systemd since all it provided was service files; now
>>>> service files
>>>> are pulled in by avahi-daemon
>>>> * also rebased on master
>>>>
>>> btw. there has been more merges into meta-systemd in meta-openembedded
>>> since these patches were created I cant accertain
>>> that you picked those too but please redo this series so the history
>>> is a bit better for tracking purposes.
>> I've tried to get in sync with meta-openembedded until they upgraded systemd
>> to v196.
> hmm that would also explain the -lrt problem that Saul is seeing but I dont.
>

Not quite, the problem Soul is seeing is probably because he is using 
eglibc v2.17
I'm running a world build right now (with eglibc v2.16) and I don't see 
those problems.

>   I tried to upgrade but something changed in the latest version and
>> dbus-daemon didn't start anymore and because of that a few other services
>> depending on it. I spent some time debugging it but eventually I decided we
>> should go with the previous version and address the update after we merge.
>> More details about this at
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=1625
> but we have to fix it I think weather you merge it or not since I dont  expect
> us to stay at 195 forever and especially when folks who use meta-systemd
> are already using 196 we wont be able to discard meta-systemd.

It's not a question of fixing it or not, rather of when will we fix it. 
My approach was to have a buildable version
that is also stable at runtime and merge that into oe-core. The we will 
address systemd upgrade as a normal
package upgrate, since package upgrade is routine task anyway and we do 
it for all packages.
I also took a look over latest patches on meta-openembedded since 
systemd update, and there aren't that many changes that are relevant to 
oe-core. Any way I'll get back with a new separate branch for review 
(with systemd v196).

Radu


