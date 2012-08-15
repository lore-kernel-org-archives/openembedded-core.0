Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T1SdQ-0000fI-0y
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 03:43:00 +0200
Received: by eaad12 with SMTP id d12so273538eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 18:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kDvy1S36rhw+KXaLlQSu/aXmIDk1jvjdfbClWePBdt4=;
	b=y7CcTExDa5bMHnV3zg4A8S3SW/eySgD+AIsAgT8WBSMfVACpKwgp4KPP8w16sGn6sY
	A1mylZxN0+DL03fM5h2Av4di9leALsEsFWFo53C+kngQq5un5Rlvdx5BFIm8/AgKzu5j
	FxLmrVhaDDfq/FP6SH7ljz9O5i8uTv5JxId2RgfuqI8qg0apyFbY50gsg/OlCSC1dfQ2
	1n4fNv1WQnA3RVIjyCkZh1casHgJivXwEKMs7zWHmX3skfnZoZpEEF+W2CtY9A71i1K/
	4dHcc1Sbmm1hds5a3AsZJnlM569YxacukACKu/KRHxpsFTrg+UfFMYoWVFh5If7ivg4H
	vKRw==
Received: by 10.14.206.201 with SMTP id l49mr18840421eeo.3.1344994264571; Tue,
	14 Aug 2012 18:31:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.225.6 with HTTP; Tue, 14 Aug 2012 18:30:34 -0700 (PDT)
In-Reply-To: <502AF9CD.9020508@linux.intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
	<502AF9CD.9020508@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Aug 2012 18:30:34 -0700
Message-ID: <CAMKF1so9Eo8Dguak6uMmC9nZEFpD9mJGX_z3gnOc2xw0d7RntA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Enable EGL and GLES in x86 Mesa
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
X-List-Received-Date: Wed, 15 Aug 2012 01:43:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 14, 2012 at 6:22 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/13/2012 09:58 PM, Ross Burton wrote:
>>
>> Hopefully the final Mesa patch set.  First pulls in an essential fix to
>> PACKAGECONFIG, and then enables GLES and EGL using PACKAGECONFIG, based on
>> whether the MACHINE_FEATURES contains x86.
>>
> Ross,
>
> Sorry not quite yet, there seems to be an issue with this patch set:
> (found with and arm and world builds)
>
>> | arm-poky-linux-gnueabi-gcc  -march=armv5te  -marm -mthumb-interwork
>> -mtune=arm926ej-s
>> --sysroot=/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/sysroots/qemuarm
>> -c -I../../../../include -I../../../../src/gbm/main  -O2 -pipe -g
>> -feliminate-unused-debug-types -Wall -Wmissing-prototypes -std=c99
>> -fno-strict-aliasing -fno-builtin-memcmp -O2 -pipe -g
>> -feliminate-unused-debug-types  -fPIC   -D_GNU_SOURCE -DPTHREADS
>> -DHAVE_POSIX_MEMALIGN -DUSE_XCB -DUSE_XSHM -DGLX_USE_TLS -DPTHREADS
>> -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DHAVE_ALIAS -fvisibility=hidden
>> -DDEFAULT_DRIVER_DIR=\"/usr/lib/dri\"   driver_name.c -o driver_name.o
>> | In file included from gbm_driint.h:37:0,
>> |                  from driver_name.c:34:
>> | ../../../../include/GL/internal/dri_interface.h:51:17: fatal error:
>> drm.h: No such file or directory
>> | compilation terminated.
>> | In file included from gbm_dri.c:40:0:
>> | ../../../../include/GL/internal/dri_interface.h:51:17: fatal error:
>> drm.h: No such file or directory
>> | compilation terminated.

drm/drm.h should come from kernel-headers I wonder if its included
correctly or not.


