Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SuLVe-0004zO-2O
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 12:41:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2012 03:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171673771"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 03:29:48 -0700
Message-ID: <50111C7C.8080904@intel.com>
Date: Thu, 26 Jul 2012 13:31:24 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
	<50110B50.3030900@intel.com>
	<446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
In-Reply-To: <446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 10:41:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

the build issue was solved by RPROVIDES, while PROVIDES did not fix the 
build or influence the error in any way.

Radu

On 07/26/2012 12:51 PM, Koen Kooi wrote:
> Op 26 jul. 2012, om 11:18 heeft Radu Moisan het volgende geschreven:
>
>> What's the point of PROVIDES += dbus-x11, it build fine without it (I'm not questioning the correctness of this, just want to understand the need for it).
> This morning you said:
>
> "it does not build, it complains about nothing providing dbus-x11"
>
> That's what the PROVIDES is for.
>


