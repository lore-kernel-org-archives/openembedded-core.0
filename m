Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Ri8sL-0008MZ-I3
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 19:14:17 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 41B0AF8120E; Tue,  3 Jan 2012 11:06:58 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 107B6F8120B;
	Tue,  3 Jan 2012 11:06:57 -0700 (MST)
Message-ID: <4F0343C1.8080407@mlbassoc.com>
Date: Tue, 03 Jan 2012 11:06:57 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED61F56.8050409@mlbassoc.com> <4F032916.6010604@mlbassoc.com>
	<4F034238.8080105@linux.intel.com>
In-Reply-To: <4F034238.8080105@linux.intel.com>
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
X-List-Received-Date: Tue, 03 Jan 2012 18:14:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-01-03 11:00, Saul Wold wrote:
> On 01/03/2012 08:13 AM, Gary Thomas wrote:
>> On 2011-11-30 05:19, Gary Thomas wrote:
>>> The file /etc/filesystems is used by busybox 'mount' when
>>> attempting to mount a file system when the type is not
>>> specified. This change alters the order so that more
>>> capable systems are tried first. Without this change, an
>>> EXT3 system will mount as EXT2 which disables many of the
>>> EXT3 features. With the change, EXT3 systems are mounted
>>> properly.
>>>
>>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>>> ---
>>> .../recipes-core/base-files/base-files/filesystems | 8 ++++----
>>> meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
>>> 2 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/base-files/base-files/filesystems
>>> b/meta/recipes-core/base-files/base-files/filesystems
>>> index 2af6a7e..14f5abb 100644
>>> --- a/meta/recipes-core/base-files/base-files/filesystems
>>> +++ b/meta/recipes-core/base-files/base-files/filesystems
>>> @@ -1,7 +1,7 @@
>>> -minix
>>> -fat
>>> -vfat
>>> -ext2
>>> ext3
>>> +ext2
>>> +vfat
>>> +fat
>>> btrfs
>>> +minix
>>> *
>>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> b/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> index 8f5313b..c860d70 100644
>>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> @@ -1,7 +1,7 @@
>>> SUMMARY = "Miscellaneous files for the base system."
>>> DESCRIPTION = "The base-files package creates the basic system
>>> directory structure and provides a small set of key configuration
>>> files for the system."
>>> SECTION = "base"
>>> -PR = "r69"
>>> +PR = "r70"
>>> LICENSE = "GPLv2"
>>> LIC_FILES_CHKSUM =
>>> "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
>>> SRC_URI = "file://rotation \
>>
>> What about this patch (now 1 month old, with no action or discussion)?
>>
> Looks like there were some comments between you and Stefan about adding ext4, so I was waiting for an updated version.

OK, I'll add that and send a new patch once I can test it.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


