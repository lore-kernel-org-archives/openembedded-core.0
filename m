Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RZ6lK-0000DY-Ig
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 21:09:42 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Dec 2011 12:02:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="85530766"
Received: from unknown (HELO [10.255.13.9]) ([10.255.13.9])
	by orsmga002.jf.intel.com with ESMTP; 09 Dec 2011 12:02:50 -0800
Message-ID: <4EE2696A.3090605@linux.intel.com>
Date: Fri, 09 Dec 2011 12:02:50 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<b3e01cfa4f1561a77b07e3365459e9498d8c4585.1323286080.git.elizabeth.flanagan@intel.com>
	<1323437428.5309.154.camel@ted>
	<CAMKF1sp3MfaSGpAQMiafWxJw8VEv9_BNNVEpzzYcBQbsxpihdg@mail.gmail.com>
In-Reply-To: <CAMKF1sp3MfaSGpAQMiafWxJw8VEv9_BNNVEpzzYcBQbsxpihdg@mail.gmail.com>
Subject: Re: [PATCH 6/8] [YOCTO #1776] license: manifest and license path
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
X-List-Received-Date: Fri, 09 Dec 2011 20:09:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/12/11 11:57, Khem Raj wrote:
> On Fri, Dec 9, 2011 at 5:30 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> The above line is a bashism and is breaking builds with dash
>> as /bin/sh :(
> 
> I thought bashism was too deep in oe. I can certainly revert to using dash if
> thats no longer the case.

Richard made a concerted effort to enable Dash recently based on
feedback we received for the Yocto Project. I certainly think we should
strive to be POSIX shell compatible where possible.

Regards,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


