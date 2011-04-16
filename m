Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke@linux.intel.com>) id 1QAxLT-0004HA-Hs
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 06:42:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2011 21:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="910380743"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2011 21:39:32 -0700
Received: from [10.255.29.31] (kyu3-mobl3.ccr.corp.intel.com [10.255.29.31])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E04406A4482;
	Fri, 15 Apr 2011 21:39:28 -0700 (PDT)
Message-ID: <4DA91D82.3050103@linux.intel.com>
Date: Sat, 16 Apr 2011 12:39:30 +0800
From: Yu Ke <ke@linux.intel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1302846043.git.ke.yu@intel.com>	<38033f4ff7f7cd735acf7d2e11ba078f4c2aafb6.1302846043.git.ke.yu@intel.com>
	<4DA89F12.7040205@mentor.com>
In-Reply-To: <4DA89F12.7040205@mentor.com>
Subject: Re: [PATCH 4/9] mesa: upgrade to 7.10.2
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
X-List-Received-Date: Sat, 16 Apr 2011 04:42:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011/4/16 3:40, Tom Rini wrote:
> On 04/14/2011 10:44 PM, Yu Ke wrote:
>> From: Yu Ke<ke.yu@intel.com>
>>
>> - also remove the talloc-removal.patch because it is already
>>    included in this version
>> @@ -15,6 +14,6 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
>>   DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
> While we're in here, the mesa stuff needs python-native as a DEPENDS.
>

Good catch. Will add it.

Regards
Ke


