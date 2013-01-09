Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tt0jp-0004g2-PI
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 19:51:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jan 2013 10:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,439,1355126400"; d="scan'208";a="244173916"
Received: from unknown (HELO [10.255.14.147]) ([10.255.14.147])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2013 10:35:44 -0800
Message-ID: <50EDB87F.2090205@linux.intel.com>
Date: Wed, 09 Jan 2013 10:35:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
	<50ED5100.7050508@intel.com>
In-Reply-To: <50ED5100.7050508@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/3] have input method modules cached at do-rootfs time
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
X-List-Received-Date: Wed, 09 Jan 2013 18:51:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2013 03:14 AM, Laurentiu Palcu wrote:
> Hi Saul,
>
> Any reason for not merging this patchset?
>
I thought there was a pending re-work of the grep/sed to awk per Ross's 
last email on the qemu.bbclass patch.  I will pull it into a MUT and test.

Sau!

> Thanks,
> Laurentiu
>
> On 12/20/2012 03:15 PM, Laurentiu Palcu wrote:
>> changes in v2:
>>   * added a new qemu.bbclass function that will return a string containing the
>>     command line needed to run a target binary through qemu at postinstall time;
>>   * use 'readelf -l' instead of 'readelf -a' for retrieving the dynamic loader
>>     path;
>>
>> from v1:
>> Hi
>>
>> This patchset will change the postinstall routine in gtk-immodules-cache.bbclass,
>> so it can run at do_rootfs time, and changes matchbox-keyboard recipe to use
>> the class.
>>
>> Thanks,
>> Laurentiu
>>
>> Laurentiu Palcu (3):
>>    qemu.bbclass: add qemu_run_binary() function
>>    gtk-immodules-cache.bbclass: allow for offline cache generation
>>    matchbox-keyboard: use the gtk-immodules-cache.bbclass
>>
>>   meta/classes/gtk-immodules-cache.bbclass           |   17 ++++++++++++++++-
>>   meta/classes/qemu.bbclass                          |   17 +++++++++++++++++
>>   .../matchbox-keyboard/matchbox-keyboard_git.bb     |   18 ++----------------
>>   3 files changed, 35 insertions(+), 17 deletions(-)
>>
>
>


