Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ri8m2-00088O-Dg
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 19:07:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2012 10:00:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="52872421"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jan 2012 10:00:24 -0800
Message-ID: <4F034238.8080105@linux.intel.com>
Date: Tue, 03 Jan 2012 10:00:24 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ED61F56.8050409@mlbassoc.com> <4F032916.6010604@mlbassoc.com>
In-Reply-To: <4F032916.6010604@mlbassoc.com>
Subject: Re: [PATCH] Alter order of file systems tried by mount
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
X-List-Received-Date: Tue, 03 Jan 2012 18:07:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2012 08:13 AM, Gary Thomas wrote:
> On 2011-11-30 05:19, Gary Thomas wrote:
>> The file /etc/filesystems is used by busybox 'mount' when
>> attempting to mount a file system when the type is not
>> specified. This change alters the order so that more
>> capable systems are tried first. Without this change, an
>> EXT3 system will mount as EXT2 which disables many of the
>> EXT3 features. With the change, EXT3 systems are mounted
>> properly.
>>
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> ---
>> .../recipes-core/base-files/base-files/filesystems | 8 ++++----
>> meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
>> 2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files/filesystems
>> b/meta/recipes-core/base-files/base-files/filesystems
>> index 2af6a7e..14f5abb 100644
>> --- a/meta/recipes-core/base-files/base-files/filesystems
>> +++ b/meta/recipes-core/base-files/base-files/filesystems
>> @@ -1,7 +1,7 @@
>> -minix
>> -fat
>> -vfat
>> -ext2
>> ext3
>> +ext2
>> +vfat
>> +fat
>> btrfs
>> +minix
>> *
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index 8f5313b..c860d70 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -1,7 +1,7 @@
>> SUMMARY = "Miscellaneous files for the base system."
>> DESCRIPTION = "The base-files package creates the basic system
>> directory structure and provides a small set of key configuration
>> files for the system."
>> SECTION = "base"
>> -PR = "r69"
>> +PR = "r70"
>> LICENSE = "GPLv2"
>> LIC_FILES_CHKSUM =
>> "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
>> SRC_URI = "file://rotation \
>
> What about this patch (now 1 month old, with no action or discussion)?
>
Looks like there were some comments between you and Stefan about adding 
ext4, so I was waiting for an updated version.

Sau!

> Thanks
>


