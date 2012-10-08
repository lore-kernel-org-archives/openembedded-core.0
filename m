Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TL90u-0000hZ-Uk
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 10:48:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Oct 2012 01:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,551,1344236400"; d="scan'208";a="202859445"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 08 Oct 2012 01:35:28 -0700
Message-ID: <5072904F.8060007@intel.com>
Date: Mon, 08 Oct 2012 11:35:27 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <20121003114821.8D16410375@opal>
	<20121006162136.GA24453@jama.jama.net>
	<CAMKF1spAUgXTptMAdXe=utSRap2_xc6ULuLMA7=QdX0ewis6BQ@mail.gmail.com>
In-Reply-To: <CAMKF1spAUgXTptMAdXe=utSRap2_xc6ULuLMA7=QdX0ewis6BQ@mail.gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : qemu: add wrapper for qemu-mips binary
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
X-List-Received-Date: Mon, 08 Oct 2012 08:48:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/06/2012 09:13 PM, Khem Raj wrote:
> On Sat, Oct 6, 2012 at 9:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>>> +# IMPORTANT: This piece needs to be removed once the root cause is fixed!
>>> +do_install_append() {
>>> +     create_wrapper ${D}/${bindir}/qemu-mips \
>>> +             QEMU_RESERVED_VA=0x0
>>> +}
>>> +# END of qemu-mips workaround
>>
>> What about checking if mips is in QEMU_TARGETS before doing this?
>>
> 
> or simply for check for existence of qemu-mips before creating the wrapper
> 
>> Right now this breaks all distros without mips in QEMU_TARGETS.
Sorry, I totally missed this. :| What about adding a simple check in the
create_wrapper script itself? We create the wrapper only if the target
binary exists. It sounds better this way and the user does not
necessarily have to remember to check for the binary existence before
creating the wrapper.

I'll prepare a patch.

Thanks,
Laurentiu
>>
>> Cheers,


