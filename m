Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DAA276B3F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 10:30:01 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2013 03:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,777,1367996400"; d="scan'208";a="275232752"
Received: from sorvi.fi.intel.com (HELO [10.237.72.152]) ([10.237.72.152])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 03:30:00 -0700
Message-ID: <51F795A8.1060207@linux.intel.com>
Date: Tue, 30 Jul 2013 13:30:00 +0300
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Muhammad Shakeel <muhammad_shakeel@mentor.com>
References: <1374842117-24504-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1374842117-24504-2-git-send-email-jukka.rissanen@linux.intel.com>
	<51F6392F.60004@mentor.com>
In-Reply-To: <51F6392F.60004@mentor.com>
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
X-List-Received-Date: Tue, 30 Jul 2013 10:30:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 29.07.2013 12:43, Muhammad Shakeel wrote:
> On 07/26/2013 05:35 PM, Jukka Rissanen wrote:
>>   do_install_append() {
>> -  install -d ${D}${sysconfdir}/init.d/
>> -  install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
>> +    if
>> ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>> +        install -d ${D}${sysconfdir}/init.d/
>> +        install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
>> +    fi
>>   }
>>   PACKAGES =+ "${PN}-tests"
> We won't need above 'sysvinit' check as we are trying to implement this
> for all packages through systemd class. Please see this:
> http://patches.openembedded.org/patch/54671/

There is an issue here as I am using ofono.inc in separate ofono recipe 
where I do not have ofono init script.
In that case I need to move the do_install_append() from ofono.inc to 
ofono_1.12.bb file in order to reuse the ofono.inc.

I will send v2 after your patchset is committed.


Cheers,
Jukka


