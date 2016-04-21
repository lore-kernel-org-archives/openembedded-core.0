Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 460AC62133
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 10:25:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so20465488wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 03:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:reply-to:subject:references:to:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=1ia8tbse7rFeuoKKp4yOMcTnI5RSAGfpBYePr9md1Pc=;
	b=HHbV98T/YhFsNph+CjD9sn597Lr+8GGsprWYxmdVL+Z+2EBRAYj+i9urBSXIdFGeqd
	rZzXYBgoMnZzDfopZtcb8RM6z6NDg7xy6RuezEnF6s7Yb7apZm8Y64ZLtCR9iV+4lBB3
	nwGtx0w6TffR8PdxX495oMnzvdaPDuXK3K8BA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:reply-to:subject:references:to:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=1ia8tbse7rFeuoKKp4yOMcTnI5RSAGfpBYePr9md1Pc=;
	b=Saqcjew2TgVCzce46smykZ41L3mX7eYURv3T6OldaRt5UEALeQX4I8kQJxPKL9EhBg
	5K9d6PI9K0P16rBshY3NqK/FOZAaYZElpWzIjGOzRd0gQ3GdalEWr0b4Q+r5E+nnWqTF
	ZkQrzqTR2OBZ/Hw9UpEPot/gQrGIEE+jp+4aM+bZzvT1BC8tz1BJq92wC7eVF16cI8Id
	DxKbchJ3gie6vidSBojsoQ9qtcmUBkeUNsQhzGWimcY3YHdUA/nsQ2yhJCg54xqxsSpQ
	jtUsATfOoAaX2xRNP3/mQ5BEXiU0p+zPSvNV3Qstdd5vo+1vve9zp9+4ZoC3qu8b5DUn
	768w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:reply-to:subject:references:to:cc:from
	:organization:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=1ia8tbse7rFeuoKKp4yOMcTnI5RSAGfpBYePr9md1Pc=;
	b=GXmm6H+QgPw8nQIbuDCmVxR4viYpDAabvMXhx1ID7Z9yltP2qOpUixJKKNNzBfnAok
	jlzGljsP6vp534/DnIQfuB07oF/PAzl3y0bqBtzBaCWAambt2OiXUnrEPH6p4AW4KWkv
	NU8vsKMHtxe5Glf7ldHOLuutFqBCdh49EAB6L3CAD/V7l/LHghzkI1kUqNwh5yWtla1A
	Bs2LY8Ul7n6qnlg/4u5V+EbYjEF9SlsBVTUFP2rBzOogBD1xlq7A7T8/qstORuF2Ekfk
	EGQ+LACAJcxDaF1GFv2Oi2ySHa8vhRqxlPCiY70UT4EhRZoPf73k2HSNZmDlmrQtphxE
	DHAw==
X-Gm-Message-State: AOPr4FV+gg86HiJDY2x3jhk+tDz2nKtPQpJY7eqP+7Cabf6CjL1GZtMxebdwUCRE+8zuTQ==
X-Received: by 10.194.189.231 with SMTP id gl7mr14435377wjc.129.1461234313317; 
	Thu, 21 Apr 2016 03:25:13 -0700 (PDT)
Received: from [10.20.105.60] (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	d1sm14113684wmh.18.2016.04.21.03.25.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2016 03:25:12 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
Reply-To: yannick.gicquel@iot.bzh
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
	<20160420194958.GP16135@denix.org> <20160420210331.GA3732@bill-the-cat>
To: Tom Rini <trini@konsulko.com>, Denys Dmytriyenko <denis@denix.org>
From: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Organization: IOT.bzh
Message-ID: <5718AA8E.80000@iot.bzh>
Date: Thu, 21 Apr 2016 12:25:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160420210331.GA3732@bill-the-cat>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH v2 1/4] u-boot: basic support of dtb append for verified boot
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
X-List-Received-Date: Thu, 21 Apr 2016 10:25:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



Le 20/04/2016 23:03, Tom Rini a écrit :
> On Wed, Apr 20, 2016 at 03:49:58PM -0400, Denys Dmytriyenko wrote:
>> On Wed, Apr 20, 2016 at 03:50:36PM +0200, Yannick Gicquel wrote:
>>> This introduces a new uboot-sign.class to support U-Boot verified boot.
>>>
>>> This part delivers the new class file, with related environment variables, and
>>> a basic prepend to do_install task which performs the concatenation of the
>>> u-boot-nodtb.bin and the device tree blob. The 'cat' command used
>>> overrides the u-boot.bin in both DEPLOYDIR & build dir to propagate the
>>> changes in later tasks (do_install, do_package, etc.)
>>>
>>> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
>>> ---
>>>   meta/classes/uboot-sign.bbclass    | 59 ++++++++++++++++++++++++++++++++++++++
>>>   meta/recipes-bsp/u-boot/u-boot.inc |  2 +-
>>>   2 files changed, 60 insertions(+), 1 deletion(-)
>>>   create mode 100644 meta/classes/uboot-sign.bbclass
>>>
>>> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
>>> new file mode 100644
>>> index 0000000..63a5181
>>> --- /dev/null
>>> +++ b/meta/classes/uboot-sign.bbclass
>>> @@ -0,0 +1,59 @@
>>> +# This file is part of U-Boot verified boot support and is intended to be
>>> +# inherited from u-boot recipe and from kernel-fitimage.bbclass.
>>> +#
>>> +# The signature procedure requires the user to generate an RSA key and
>>> +# certificate in a directory and to define the following variable:
>>> +#
>>> +#   UBOOT_SIGN_KEYDIR = "/keys/directory"
>>> +#   UBOOT_SIGN_KEYNAME = "dev" # keys name in keydir (eg. "dev.crt", "dev.key")
>>> +#   UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
>>> +#   UBOOT_SIGN_ENABLE = "1"
>>> +#
>>> +# As verified boot depends on fitImage generation, following is also required:
>>> +#
>>> +#   KERNEL_CLASSES ?= " kernel-fitimage "
>>> +#   KERNEL_IMAGETYPE ?= "fitImage"
>>> +#
>>> +# The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
>>> +#
>>> +# The tasks sequence is as below, using DEPLOY_IMAGE_DIR as common place to
>>> +# treat the device tree blob:
>>> +#
>>> +# u-boot:do_deploy -> virtual/kernel:do_assemble_fitimage -> u-boot:do_install
>>> +#
>>> +# For more details on signature process, please refer to U-boot documentation.
>>> +
>>> +# Signature activation.
>>> +UBOOT_SIGN_ENABLE ?= "0"
>>> +
>>> +# Default value for deployment filenames.
>>> +UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
>>> +UBOOT_DTB_BINARY ?= "u-boot.dtb"
>>> +UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
>>> +UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>>> +UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
>>> +UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
>>> +
>>> +#
>>> +# Following is relevant only for u-boot recipes:
>>> +#
>>> +
>>> +do_install_prepend_pn-u-boot () {
>> Why _pn-u-boot here? What if I have my own version of u-boot recipe?
> Oh good point, maybe this should be class-target instead of pn-u-boot
> (here and elsewhere) ?
>

Hi Tom, Denys, all,

I initially though that any custom u-boot recipes declares a 'PROVIDE += 
"u-boot"' and the bitbake "_pn-" syntax will append functions to u-boot 
recipes only. Unfortunately, i just checked and confirmed the appends 
functions are not called anymore when the u-boot recipe is not named 
"u-boot".
Using "class-target" is an interesting idea, but it looks like the 
kernel recipe is also part of this class (at least on my setup), thus it 
may not be reliable enough.

What about using the "PREFERRED_PROVIDER_u-boot" variable instead of 
static 'u-boot' string in the relevant places ?
A "do_install_prepend_pn-${PREFERRED_PROVIDER_u-boot}" is not valid, but 
it can be performed by adding tasks in the python function at EOF.

Something like:

-do_deploy_append_pn-u-boot () {
+do_before_uboot_deploy () {

[snip]

python() {
   if d.getVar('PN', True) == d.getVar('PREFERRED_PROVIDER_u-boot', True):
      bb.build.addtask('do_before_uboot_deploy', None, 'do_deploy', d)
}

Off course, it requires few changes in other places, but I hope you'll 
see the idea ? What do you think ?

Best regards,
Yannick

