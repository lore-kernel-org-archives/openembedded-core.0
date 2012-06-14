Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfGX2-0007KQ-S4
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 22:20:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Jun 2012 13:10:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156489431"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by azsmga001.ch.intel.com with ESMTP; 14 Jun 2012 13:10:01 -0700
Message-ID: <4FDA4519.5090003@linux.intel.com>
Date: Thu, 14 Jun 2012 13:10:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Phil Blundell <philb@gnu.org>
References: <cover.1339701375.git.sgw@linux.intel.com>
	<5a1646b267619919186d5b12e59207d3251cf2dd.1339701375.git.sgw@linux.intel.com>
	<1339703681.3339.116.camel@x121e.pbcl.net>
	<1339703886.3339.118.camel@x121e.pbcl.net>
In-Reply-To: <1339703886.3339.118.camel@x121e.pbcl.net>
Subject: Re: [Consolidated Pull 13/17] curl: enable ssl support
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
X-List-Received-Date: Thu, 14 Jun 2012 20:20:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2012 12:58 PM, Phil Blundell wrote:
> On Thu, 2012-06-14 at 20:54 +0100, Phil Blundell wrote:
>> On Thu, 2012-06-14 at 12:27 -0700, Saul Wold wrote:
>>> +DEPENDS = "zlib gnutls openssl"
>>
>> Do you really want both gnutls and openssl simultaneously?  That seems a
>> bit excessive.  What exactly is openssl bringing here that gnutls
>> doesn't do?
>
> Also, if you really do want this, it ought to be a DISTRO_FEATURE and/or
> PKG_CONFIG option.  Aside from the issue of binary bloat, OpenSSL brings
> a pile of licensing grief that a lot of folks may not want.
>
Ah, I tried to figure out why openssl was not in the first place, now I 
understand better.  How's this as a comprise, go back to pure gnutls for 
the target, but have the native only use openssl to allow secure git 
fetches, which is what triggered this in the first place.

Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


