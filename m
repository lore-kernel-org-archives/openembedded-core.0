Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RvXm3-00030y-K0
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 18:27:11 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Feb 2012 09:19:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="64901461"
Received: from shamshir.jf.intel.com (HELO [10.24.4.204]) ([10.24.4.204])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Feb 2012 09:19:05 -0800
Message-ID: <4F340007.5070203@linux.intel.com>
Date: Thu, 09 Feb 2012 09:19:03 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1328752455.git.josh@linux.intel.com>
	<c2bcdddcf16dceedafa8f96e6534e920ea036e15.1328752455.git.josh@linux.intel.com>
	<20120209032109.GA29491@sakrah.homelinux.org>
In-Reply-To: <20120209032109.GA29491@sakrah.homelinux.org>
Subject: Re: [PATCH 4/5] clutter: upgrade git recipe to reflect 1.8.4 tag
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
X-List-Received-Date: Thu, 09 Feb 2012 17:27:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/12 19:21, Khem Raj wrote:
>> -# the 1.8.2 tag
>> -SRCREV = "9041ea42655dfc1422ce88eab931382dd400d13a"
>> -PV = "1.8.2+git${SRCPV}"
>> +# the 1.8.4 tag
>> +SRCREV = "f2183fa8df3d173afbee09cc4230ab8f4e03f459"
>> +PV = "1.8.4git${SRCPV}"
>
> should this be 1.8.4+git${SRCPV} ?

Yes it should, thanks.

Updated patch pushed to the same repo/branch.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


