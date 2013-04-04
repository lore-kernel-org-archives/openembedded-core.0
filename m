Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UNjo4-0008HJ-7m
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 15:02:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Apr 2013 05:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,408,1363158000"; d="scan'208";a="313561256"
Received: from dell-desktop.rb.intel.com (HELO [10.237.105.59])
	([10.237.105.59])
	by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2013 05:45:04 -0700
Message-ID: <515D75D5.4020204@intel.com>
Date: Thu, 04 Apr 2013 15:45:09 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
	<1365006329-20964-3-git-send-email-radu.moisan@intel.com>
	<825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
In-Reply-To: <825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: enable multilib support
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
X-List-Received-Date: Thu, 04 Apr 2013 13:02:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 04/03/2013 08:58 PM, Koen Kooi wrote:
> Op 3 apr. 2013, om 18:25 heeft Radu Moisan <radu.moisan@intel.com> het volgende geschreven:
>
>> Use base_libdir in place of hardcoded /lib
>> Fixes [YOCTO #4096]
>>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>> meta/recipes-core/udev/udev.inc |    1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
>> index e358d2d..6fd0240 100644
>> --- a/meta/recipes-core/udev/udev.inc
>> +++ b/meta/recipes-core/udev/udev.inc
>> @@ -76,6 +76,7 @@ FILES_udev-utils = "${bindir}/udevadm"
>>
>> do_install_append () {
>> 	install -d ${D}${sysconfdir}/init.d
>> +	sed -i 's@/lib/udev@${base_libdir}/udev@g' ${WORKDIR}/init
>> 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
>> 	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
> NACK! The udev maintainers have been clear that it is always /lib/udev, even on 64 bit systems, so you're not fixing a problem, you're creating an extra one.

Koen, do you agree with this one?
http://patches.openembedded.org/patch/41167/

Radu


