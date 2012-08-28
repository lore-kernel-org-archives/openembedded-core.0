Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6NkJ-000124-Pk
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 17:30:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Aug 2012 08:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,327,1344236400"; d="scan'208";a="138766014"
Received: from unknown (HELO [10.255.13.20]) ([10.255.13.20])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Aug 2012 08:18:13 -0700
Message-ID: <503CE135.60603@linux.intel.com>
Date: Tue, 28 Aug 2012 08:18:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1346162560-30905-1-git-send-email-constantinx.musca@intel.com>
	<503CCFB1.9070109@intel.com>
In-Reply-To: <503CCFB1.9070109@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] dpkg: upgrade to 1.16.8
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
X-List-Received-Date: Tue, 28 Aug 2012 15:30:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2012 07:03 AM, Constantin Musca wrote:
> On 08/28/2012 05:02 PM, Constantin Musca wrote:
>> autofoo.patch: removed
>>     - the patch is not used
>> check_version: adapted to the new version
>>     - adapt the linux-wrs kernel version, which has character '_'
>>     - remove the first-char-digit-check (as the 1.15.8.5 version does)
>> dpkg-deb-avoid-fflush.patch: removed
>>     - the patch is included in the new version
>> fix-timestamps.patch: added
>>     - the lutimes function doesn't work properly for all systems
>> ignore_extra_fields.patch: adapted to the new version
>> nochroot.patch: removed
>>     - the patch is not used
>> noman.patch: adapted to the new version
>> noupdalt.patch: removed
>>     - the patch is not used
>> perllibdir.patch: removed
>>     - in the new version PERL_LIBDIR will be set only if empty
>> preinst.patch: adapted to new version
>> removed-tar-no-timestamp.patch: added
>>     - the busybox-1.19.4 tar utility doesn't support
>> --warning=no-timestamp
>>


<snip>


> This is the dpkg 1.15.8.7 -> 1.16.8 package upgrade compiled on all
> architectures
> and tested using core-image-sato.
>
> Testing details:
> - built a system with PACKAGE_CLASSES = "package_deb"
> - installed/removed some packages using core-image-sato
> - tested basic dpkg commands
>
Did you test any package updating on the target machine?

Thanks

	Sau!


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


