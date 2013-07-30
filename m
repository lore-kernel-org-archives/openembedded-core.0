Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA16B6B24D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:37:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2013 07:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="373481558"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2013 07:37:04 -0700
Message-ID: <51F7CF90.2080901@linux.intel.com>
Date: Tue, 30 Jul 2013 07:37:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
References: <1374842117-24504-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1374842117-24504-2-git-send-email-jukka.rissanen@linux.intel.com>
	<51F6392F.60004@mentor.com> <51F795A8.1060207@linux.intel.com>
In-Reply-To: <51F795A8.1060207@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] ofono: Add systemd support
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
X-List-Received-Date: Tue, 30 Jul 2013 14:37:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2013 03:30 AM, Jukka Rissanen wrote:
> On 29.07.2013 12:43, Muhammad Shakeel wrote:
>> On 07/26/2013 05:35 PM, Jukka Rissanen wrote:
>>>   do_install_append() {
>>> -  install -d ${D}${sysconfdir}/init.d/
>>> -  install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
>>> +    if
>>> ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>>> +        install -d ${D}${sysconfdir}/init.d/
>>> +        install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
>>> +    fi
>>>   }
>>>   PACKAGES =+ "${PN}-tests"
>> We won't need above 'sysvinit' check as we are trying to implement this
>> for all packages through systemd class. Please see this:
>> http://patches.openembedded.org/patch/54671/
>
> There is an issue here as I am using ofono.inc in separate ofono recipe
> where I do not have ofono init script.
> In that case I need to move the do_install_append() from ofono.inc to
> ofono_1.12.bb file in order to reuse the ofono.inc.
>
> I will send v2 after your patchset is committed.
>
This patchset is not getting committed as is, it's pending your address 
this issue and fixing the commit message of the 2nd patch enabling 
bluetooth, which was mentioned elsewhere.

The commit is wrong, it's not enabling bluetooth automatically, it's 
moving the code from .bb to .inc.

Thanks
	Sau!

>
> Cheers,
> Jukka
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

