Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpD5w-0002Br-HU
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 07:37:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2011 22:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,321,1309762800"; d="scan'208";a="34736281"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Aug 2011 22:32:50 -0700
Message-ID: <4E3B8082.5010909@linux.intel.com>
Date: Thu, 04 Aug 2011 22:32:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
In-Reply-To: <ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
Cc: Koen Kooi <koen@openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime	dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Fri, 05 Aug 2011 05:37:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 10:28 PM, Koen Kooi wrote:
>
> Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende geschreven:
>
>> On 08/01/2011 04:08 AM, Koen Kooi wrote:
>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>>
>> But you did not test it against anything in oe-core, it has broken the build for connman-gnome and oprofileui, which use this bbclass.
>>
>> The oe-core gnome-icon-theme does not include this class.
>>
>> Please correct this.
>>
>>   Processing task-base-extended...
>> | error: Failed dependencies:
>> | 	hicolor-icon-theme is needed by tasks-0.19-r0.armv5te
>> | 	hicolor-icon-theme is needed by connman-gnome-0.5-r6.armv5te
>> | 	hicolor-icon-theme is needed by oprofileui-server-0.0+git1+0c3c32fa754c1d0b70e65767ea7048914f776396-r4.armv5te
>
> So you found broken metadata. If tasks, connman-gnome and oprofileui-server need hicolor-icon-theme, they should list it in their RDEPENDS_${PN}. That is a seperate issue than what I fixed in the bbclass

Koen, the gtk-icon-cache.bbclass did contain that RDEPENDS, which you 
removed, if you are going to modify bbclasses, you need to ensure that 
the recipes using them still work correctly.  Your fix broke others, 
please take the time to test against oe-core also.

(and yes we have all made changes that break other distros, there's no 
way test all, but this broke oe-core).

I look forward to a fix.

Thanks

Sau!


