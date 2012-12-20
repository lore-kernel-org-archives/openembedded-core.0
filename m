Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Tlc3A-0007vP-65
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 10:04:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Dec 2012 00:49:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,322,1355126400"; d="scan'208";a="260082726"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2012 00:49:34 -0800
Message-ID: <50D2D277.8070004@intel.com>
Date: Thu, 20 Dec 2012 10:55:19 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <50D1F76D.4070000@intel.com>
	<CAP9ODKoJMX6m6094W0f=o0OG6-kdrByLBAhNq_XU-Y7SSVqzyg@mail.gmail.com>
In-Reply-To: <CAP9ODKoJMX6m6094W0f=o0OG6-kdrByLBAhNq_XU-Y7SSVqzyg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Thu, 20 Dec 2012 09:04:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 12/19/2012 07:21 PM, Otavio Salvador wrote:
> On Wed, Dec 19, 2012 at 3:20 PM, Radu Moisan <radu.moisan@intel.com> wrote:
>> Hi guys,
>>      I have prepared a branch on poky-contrib (rmoisan/systemd) where I
>> pulled systemd from meta-openembedded. The goal is to merge this into
>> oe-core, so please take a look and give me your feedback on stuff that needs
>> work or things that I might have done wrong, so that I can prepare it for
>> merge.
>>      At this point core-image-minimal and core-image-sato both boot fine with
>> systemd. There still are a few warnings but not critical(at runtime), at
>> least in my opinion, you may want to take a look at those too.
>>      You can activate systemd by  DISTRO_FEATURES_INITMAN = "systemd"
> In this case, systemd is made *available* or used? Is it possible to
> have sysvinit image and another systemd?
it is used.

Radu


