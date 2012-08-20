Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T3OR3-0002RT-Ar
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 11:38:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2012 02:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="206248236"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2012 02:26:05 -0700
Message-ID: <50320338.8090203@intel.com>
Date: Mon, 20 Aug 2012 12:28:24 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1345448771-4656-1-git-send-email-radu.moisan@intel.com>
	<8627395.gapg0V4nHB@helios>
	<1345451321.24626.77.camel@x121e.pbcl.net>
	<1754598.kxQRJyreg5@helios>
In-Reply-To: <1754598.kxQRJyreg5@helios>
Subject: Re: [PATCH v2] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Mon, 20 Aug 2012 09:38:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 08/20/2012 11:31 AM, Paul Eggleton wrote:
> On Monday 20 August 2012 09:28:41 Phil Blundell wrote:
>> On Mon, 2012-08-20 at 09:25 +0100, Paul Eggleton wrote:
>>> On Monday 20 August 2012 09:18:17 Phil Blundell wrote:
>>>> On Mon, 2012-08-20 at 10:46 +0300, Radu Moisan wrote:
>>>>> @@ -97,6 +97,8 @@ do_prepare_config () {
>>>>>
>>>>>   		< ${WORKDIR}/defconfig > ${S}/.config
>>>>>   	
>>>>>   	sed -i -e '/CONFIG_STATIC/d' .config
>>>>>   	echo "# CONFIG_STATIC is not set" >> .config
>>>>>
>>>>> +	sed -i -e '/CONFIG_LSOF/d' .config
>>>>> +	echo "# CONFIG_LSOF is not set" >> .config
>>>>>
>>>>>   	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
>>>>>   	
>>>>>   		${S}/.config
>>>>>   	
>>>>>   	sed -i -e '${configmangle}' ${S}/.config
>>>> Why is this desirable?
>>> Well, the more appropriate question would be: could we not just update the
>>> defconfig and then make that change to it directly?
>>>
>>> (In case it isn't clear - lsof is being disabled because it was not
>>> enabled in the previous 1.19.4 version.)
>> Ah, I see.  In that case, yes, just updating the defconfig is the right
>> thing to do.  The patch above will, if I am understanding it correctly,
>> make it impossible (or at least quite hard) for any other layer to turn
>> CONFIG_LSOF back on.
> Good point, that would be undesirable.
Any suggestions on how to do that?

thanks,
radu


