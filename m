Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RtLmW-0001Ow-HW
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 17:14:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Feb 2012 08:06:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102930330"
Received: from unknown (HELO [10.255.14.238]) ([10.255.14.238])
	by azsmga001.ch.intel.com with ESMTP; 03 Feb 2012 08:06:37 -0800
Message-ID: <4F2C060D.6050405@linux.intel.com>
Date: Fri, 03 Feb 2012 08:06:37 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1328226197.git.sgw@linux.intel.com>
	<FD054A27-BFF7-4E6B-83EA-2B57375CED13@dominion.thruhere.net>
In-Reply-To: <FD054A27-BFF7-4E6B-83EA-2B57375CED13@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 00/14] Self-Hosted Fixes and Package Updates
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
X-List-Received-Date: Fri, 03 Feb 2012 16:14:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2012 12:05 AM, Koen Kooi wrote:
>
> Op 3 feb. 2012, om 00:47 heeft Saul Wold het volgende geschreven:
>
>> Richard,
>>
>> This is a patch of updates and self-host-image fixes.
>> I also added the gnupg version that is gplv2 to go along
>> with the libzypp changes from Steve.
>>
>> Sau!
>>
>> The following changes since commit 70e1226e8c10bf07d6c7b1e13d745ad603f2ec73:
>>
>>   meta-yocto/local.conf.sample.extended: add LICENSE_FLAGS_WHITELIST section (2012-02-02 22:04:54 +0000)
>>
>> are available in the git repository at:
>>   git://git.openembedded.org/openembedded-core-contrib sgw/updates
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates
>>
>> Saul Wold (14):
>>   task-self-hosted: add disk partitioning tools
>>   task-self-hosted: add python-pkgutil since it's required
>>   self-hosted-image: add package management for correct installation
>>   openssl: Update to 1.0.0g
>>   openssl: Update to 0.9.8t (gplv2)
>>   gnutls: Update to 2.12.16
>>   rxvt-unicode: Update to 9.15
>>   gnupg: Add gplv2 version 1.4.7
>>   file: Update to version 5.10
>>   libidn: Update to 1.24
>>   libdrm: Update to 2.4.30
>>   xinit: Update to 1.3.2
>>   xf86-input-keyboard: Update to 1.6.1
>
> Isn't xf86-input-evdev the preferred input solution nowadays?
>

Looks like keyboard is still used by x86 and x86-64, but edev is also in 
there, so some investigation will be required.

Thanks for pointing that out.

Sau!

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


