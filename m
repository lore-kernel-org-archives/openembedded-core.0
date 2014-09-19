Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 39BC970A0B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 22:05:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2014 14:58:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,557,1406617200"; d="scan'208";a="605605207"
Received: from jwendell-mobl1.amr.corp.intel.com (HELO [10.255.12.161])
	([10.255.12.161])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2014 15:05:02 -0700
Message-ID: <541CA88D.7010902@linux.intel.com>
Date: Fri, 19 Sep 2014 17:05:01 -0500
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1409320119-25825-1-git-send-email-net147@gmail.com>
	<CANwerB1ifwVuZdixcEpOBNeKX6C-o-p6Vr1fPZrZ1A33eBD_CA@mail.gmail.com>
In-Reply-To: <CANwerB1ifwVuZdixcEpOBNeKX6C-o-p6Vr1fPZrZ1A33eBD_CA@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] qemu: Explicitly disable libiscsi, its not in DEPENDS
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
X-List-Received-Date: Fri, 19 Sep 2014 22:05:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2014 02:45 AM, Jonathan Liu wrote:
> On 29 August 2014 23:48, Jonathan Liu <net147@gmail.com> wrote:
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index 2702986..472988d 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -26,7 +26,7 @@ SRC_URI_append_class-native = "\
>>       file://fix-libcap-header-issue-on-some-distro.patch \
>>       "
>>
>> -EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
>> +EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
>>
>>   EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
>>                                  "
>> --
>> 2.0.3
>>
>
> Ping.
>

Ok, I see what seems to have happened the patch is in OE-Core's Daisy 
branch but did not make the leap into Poky's Daisy brach along with a 
couple of other patches.  I am trying to reconcile this between my 
oecore/daisy-next and poky/daisy-next for testing.

Hope to have this straightened out next week.

Sau!
> Regards,
> Jonathan
>

