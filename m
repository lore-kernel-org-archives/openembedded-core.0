Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SoKX6-0002G5-40
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 22:26:12 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 09 Jul 2012 13:15:00 -0700
Received: by pbbro8 with SMTP id ro8so19286684pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 13:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=GLNf1CKMePep6NKG7Z6b6IaCdl/BlfbRDwZjhFbVjJY=;
	b=kZcbO7V3rhRtkFjGHqcXhNxFWxiSgJT4dzNokGpXxHpWBrtxmHmjNczk6zUY5py0nI
	wMIUR+8Di8BKV4IkY8ptxf6GBRKGyC/loxvSMjn/JazdWZvyWolS7QYQCloxNizzrt05
	bdrJSH47rfcRI1bX/TPPoRTaRsBB1WtO+INB6bM8f2cxRJIZ5b9G/JKuhLSLQ++sxuiX
	l8tMK/QGCWQ0J2uWFOkIG8VdmxxfN7l1VS/N4Y5ANFDMPz/G8WM9MUMf6CNODvyafIRm
	ENXol3nR/e3/EK6Ac5Y9C6RrqOi8surkuc8Dir7LcKKy/oOZ3N0ZpSui+D8p0Y6F35k3
	zd8g==
Received: by 10.68.217.100 with SMTP id ox4mr62396206pbc.87.1341864900212;
	Mon, 09 Jul 2012 13:15:00 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id qd2sm28313315pbb.29.2012.07.09.13.14.56
	(version=SSLv3 cipher=OTHER); Mon, 09 Jul 2012 13:14:58 -0700 (PDT)
Message-ID: <4FFB3BB8.8020308@intel.com>
Date: Mon, 09 Jul 2012 13:14:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336522880.git.raj.khem@gmail.com>
	<2c51f2017955dff27ab68c1f4165309567864ee5.1336522880.git.raj.khem@gmail.com>
	<096c4f3ac2f83fc08064afcec5a05824bb96b94e.1336522880.git.raj.khem@gmail.com>
	<CAEsOVNfdHeAzs3ULW0UkMYCEjOptzSeBNYA=Bva9bJmEkVPp4g@mail.gmail.com>
In-Reply-To: <CAEsOVNfdHeAzs3ULW0UkMYCEjOptzSeBNYA=Bva9bJmEkVPp4g@mail.gmail.com>
X-Gm-Message-State: ALoCoQn49nGrNvKoN8gb2KecesXMXbmlpIwfdK7hJkK05Se9kv4PPNUk3udEd9ILpt3ChuEnIjrn
Subject: Re: [PATCH 3/3] xserver-xorg: Fix build on powerpc
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
X-List-Received-Date: Mon, 09 Jul 2012 20:26:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2012 08:58 AM, McClintock Matthew-B29882 wrote:
> Scott,
>
> Can you apply this patch to denzil branch of oe-core/poky? It fixes
> build errors for powerpc on gcc 4.6.4 as well.
>
> -M

Hi Matthew,

I've made a note of this and am going to try getting it into my 
sgarman/denzil-next-1.2.2 branch later today, after I sort out the merge 
issues I encountered last week with some other commits I'd like to include.

Scott

>
> On Tue, May 8, 2012 at 7:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 +++--
>>   .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 ++++++++++++++++++++
>>   2 files changed, 38 insertions(+), 4 deletions(-)
>>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
>> index f5fa629..6a86af4 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
>> @@ -1,10 +1,11 @@
>> -SRC_URI += "file://crosscompile.patch"
>> -
>>   # Misc build failure for master HEAD
>> -SRC_URI += "file://fix_open_max_preprocessor_error.patch"
>> +SRC_URI += "file://crosscompile.patch \
>> +            file://fix_open_max_preprocessor_error.patch \
>> +            file://gcc-47-warning.patch \
>> +           "
>>
>>   SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
>>   SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
>>
>> -PR = "r1"
>> +PR = "r2"
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
>> new file mode 100644
>> index 0000000..ed4eaac
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
>> @@ -0,0 +1,33 @@
>> +This patch fixes errors on powerpc like below
>> +
>> +| lnx_video.c: In function 'unmapVidMem':
>> +| lnx_video.c:472:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>> +
>> +Its in 1.12 branch
>> +
>> +http://cgit.freedesktop.org/xorg/xserver/commit/?h=server-1.12-branch&id=eb3377ffb8a7baa26c9831e56ed782d48b28fa71
>> +
>> +Upstream-Status: Backport
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Index: xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c
>> +===================================================================
>> +--- xorg-server-1.11.2.orig/hw/xfree86/os-support/linux/lnx_video.c    2012-05-01 06:32:34.186489019 -0700
>> ++++ xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c 2012-05-01 06:49:14.926537452 -0700
>> +@@ -469,11 +469,11 @@
>> + static void
>> + unmapVidMem(int ScreenNum, pointer Base, unsigned long Size)
>> + {
>> +-    memType alignOff = (memType)Base
>> +-      - ((memType)Base & ~(getpagesize() - 1));
>> ++    uintptr_t alignOff = (uintptr_t)Base
>> ++      - ((uintptr_t)Base & ~(getpagesize() - 1));
>> +
>> +-    DebugF("alignment offset: %lx\n",alignOff);
>> +-    munmap((caddr_t)((memType)Base - alignOff), (Size + alignOff));
>> ++    DebugF("alignment offset: %lx\n",(unsigned long)alignOff);
>> ++    munmap((void*)((uintptr_t)Base - alignOff), (Size + alignOff));
>> + }
>> +
>> +
>> --
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center




