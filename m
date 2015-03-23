Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6E573BD4;
	Mon, 23 Mar 2015 17:14:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Mar 2015 10:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,453,1422950400"; d="scan'208";a="702910579"
Received: from bitbang.jf.intel.com ([10.7.201.37])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2015 10:14:58 -0700
Message-ID: <55104A11.50102@linux.intel.com>
Date: Mon, 23 Mar 2015 10:14:57 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, Jonathan Liu <net147@gmail.com>
References: <20150323112736.11E9B50553@opal.openembedded.org>
	<20150323164335.GB3904@jama>
In-Reply-To: <20150323164335.GB3904@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Jonathan Liu : systemd: fix firmware path to match linux-firmware
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Mar 2015 17:14:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2015 09:43 AM, Martin Jansa wrote:
> On Mon, Mar 23, 2015 at 11:27:36AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: d3fcfe346b3472170641d9194243c4bbe06b8585
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=d3fcfe346b3472170641d9194243c4bbe06b8585
>>
>> Author: Jonathan Liu <net147@gmail.com>
>> Date:   Mon Mar 23 22:18:46 2015 +1100
>>
>> systemd: fix firmware path to match linux-firmware
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/recipes-core/systemd/systemd_219.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
>> index 5ecdda9..f2d3c13 100644
>> --- a/meta/recipes-core/systemd/systemd_219.bb
>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>> @@ -112,7 +112,7 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>>                    --enable-split-usr \
>>                    --without-python \
>>                    --with-sysvrcnd-path=${sysconfdir} \
>> -                 --with-firmware-path=${rootlibdir}/firmware \
>> +                 --with-firmware-path=/lib/firmware \
>
> Is this false-possitive from QA check or is this change really ignored
> by systemd build?

Userspace firmware loading support was actually removed, but Jonathan added it 
back in:

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=814252efd028ec99a15303d9a551e950e49a6726
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=4bd886fb0081954879aaa2f574f3c7f6ced745d5

> NOTE: recipe systemd-1_219+gitAUTOINC+a88abde721-r0: task do_configure: Started
> WARNING: QA Issue: systemd: configure was passed unrecognised options: --with-firmware-path [unknown-configure-option]
> NOTE: recipe systemd-1_219+gitAUTOINC+a88abde721-r0: task do_configure: Succeeded
>
>>                  "
>>   # uclibc does not have NSS
>>   EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
>>
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
>
>


