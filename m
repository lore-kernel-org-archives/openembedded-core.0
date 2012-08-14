Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1Foz-0008TK-KT
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:02:05 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Aug 2012 04:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="200612663"
Received: from unknown (HELO [10.255.12.219]) ([10.255.12.219])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2012 04:49:57 -0700
Message-ID: <502A3B64.5050503@linux.intel.com>
Date: Tue, 14 Aug 2012 14:49:56 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <502A3A26.5090008@mlbassoc.com>
	<1344944787.23275.384.camel@phil-desktop>
In-Reply-To: <1344944787.23275.384.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: wpa-supplicant & EAP-TLS
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
X-List-Received-Date: Tue, 14 Aug 2012 12:02:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2012 02:46 PM, Phil Blundell wrote:
> On Tue, 2012-08-14 at 05:44 -0600, Gary Thomas wrote:
>> Does anyone know why the recipe for wpa_supplicant is using gnutls
>> and not the default OpenSSH for TLS services?  It seems that gnutls
>> is somehow broken and EAP-TLS does not work with this configuration.
>> Changing wpa_supplicant to use the OpenSSH libraries makes EAP-TLS
>> work fine.
>>
>> Would a patch to make this change be entertained?  or should I just
>> keep it in my own layer?
>
> I don't think a patch to just flip the default would be a good idea.  A
> patch to make it be a DISTRO_FEATURE, on the other hand, would be
> excellent.
>
+1

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


