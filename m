Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id C397C60034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 11:19:42 +0000 (UTC)
Received: by ykba4 with SMTP id a4so135692272ykb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 03:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uivNjZfvt90kivmyPlv+ogwNrUDdkfM+GTSbwMyncWI=;
	b=O02FBSoNqN0ymbuJtCpJwnWM0vTQM2KNM+yCYO9+MbkPANE0RDv9vVpCJnYGrnubt4
	Xt2hAmGvjOPx8ZDuRPxCwIVNnnXe7w3HzOtpSsAnVOT+dr3wbNcAflfgUtcYBa90OY05
	wqnc7+vXyfQnt27OFfYJxVtYBm/jQrFBldpZ8coUTUQLohJuPjPXDXSXtckTbMmCA2og
	BSuIwhc4mEbf/CC1Nnx8CNGa7oiL1W/WPiF3aElaN8/vdlvxgzvsFAnyVNc76XwSGq86
	efiUXacnMkawWh4Xc/su1Xc+CYj300VGWcsnK4DblGvW6hx55G4/QJs5uI2sIZugdRvs
	aR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=uivNjZfvt90kivmyPlv+ogwNrUDdkfM+GTSbwMyncWI=;
	b=j/eELOUaYoUS3J15WE1+5e7LB0/Hr54de3ZfqGr4LArQg6WIiuHdYQi2tSuoI5WWGx
	eCD+lRL1R0PyAMLK2gwlXni3nkG/Yj+7JE2C2G3zzynzSyLndPCKNH+68bVEcSgu7N3d
	9AiaYvlnNXrIeEVr16d4C4TdINbsTyE5k0Zot3MhZIfeSiFg2pt/KIKxNGop9EaNJhxN
	W9GwgPACMwhA43NO4UHTCiosif78RZcuoSt8+CEtt8PM5IX7pfmnyDTX5ON+3TeBHm0/
	Ypbw/yOa3B0aDSUEiZyiUK4E4z77mGmjcyyT3N5o4HRtn3LWOogIAny2VXJZheKUY/Q8
	+OkQ==
X-Gm-Message-State: ALoCoQm3+PuJT/rMlMzxZ7pGP9rpKDMmCW2FHV1bIU3j+lyVQlmYVRDT2U47cMeRcZQG/xNQrWzs
MIME-Version: 1.0
X-Received: by 10.129.36.11 with SMTP id k11mr15779953ywk.2.1446463182459;
	Mon, 02 Nov 2015 03:19:42 -0800 (PST)
Received: by 10.129.148.132 with HTTP; Mon, 2 Nov 2015 03:19:42 -0800 (PST)
In-Reply-To: <64198.10.252.141.62.1446154407.squirrel@linux.intel.com>
References: <CAFoFrHaiWeGDoRqDAqnKdKy30d+NihfsrvgT4z06F+8OZV0ApA@mail.gmail.com>
	<CAFoFrHZEFPucHjumrwKE4zs+n8EjcE3hJC_k2SotcrUwr6fphw@mail.gmail.com>
	<64198.10.252.141.62.1446154407.squirrel@linux.intel.com>
Date: Mon, 2 Nov 2015 16:49:42 +0530
Message-ID: <CAFoFrHbL3_yH9vn9gdDqQQ-hRrAtYOJoNRoVKPiXxdmPA15Erw@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: randy.e.witt@linux.intel.com
Cc: Matt Fleming <matt.fleming@intel.com>, "Neri,
	Ricardo" <ricardo.neri@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>,
	"luv@lists.01.org" <luv@lists.01.org>
Subject: Re: luvOS yocto based project - "hvc0" respawning too fast
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
X-List-Received-Date: Mon, 02 Nov 2015 11:19:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi Randy,

Thank you very much.

On 30 October 2015 at 03:03,  <randy.e.witt@linux.intel.com> wrote:
> Hi Naresh,
>
>> +OE core ML
>>
>> On 27 October 2015 at 16:17, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>>> Hi Randy,
>>>
>>> The luvOS project is based on luv-yocto frame work.  I have built the
>>> luvOS project for AArch64 architecture using qemuarm64.conf machine
>>> configuration file and boot the luvOS image on QEMU machine (used
>>> latest QEMU git repository image i.e. qemu-system-aarch64 QEMU
>>> v2.4.50)
>>>
>>> I am facing the following issue on the console "INIT: Id "hvc0"
>>> respawning too fast: disabled for 5 minutes"
>>>
>
> The easiest way for you to get around this without creating your own image
> is to probably mimc what runqemu does. (which is the expected consumer of
> the qemu images)
>
> If you add "-device virtio-serial-device -chardev null,id=virtcon -device
> virtconsole,chardev=virtcon" to the qemu commandline, this will add the
> second serial port.

Excellent.  Above suggestion works for me ..:)  Now I am able to see
the hvc devices

root@qemuarm64:~#
root@qemuarm64:~# ls /dev/ttyAMA0
/dev/ttyAMA0
root@qemuarm64:~# ls /dev/hvc*
/dev/hvc0  /dev/hvc2  /dev/hvc4  /dev/hvc6
/dev/hvc1  /dev/hvc3  /dev/hvc5  /dev/hvc7
root@qemuarm64:~#

Regards
-Naresh

>>> ...
>>> .....
>>>     [-] kernel-efi-warnings
>>>       [+] EFI_BOOT_SERVICES_*_illegal_access... passed
>>>
>>> Ran 3 testsuites and 64 unittests, 53 passes, 15 fails, 3 skipped.
>>>
>>> Linux UEFI Validation Distribution 2.0-dev qemuarm64 ttyAMA0
>>>
>>> INIT: Id "hvc0" respawning too fast: disabled for 5 minutes
>>> Linux UEFI Validation Distribution 2.0-dev qemuarm64 ttyAMA0
>>>
>>> qemuarm64 login: root
>>> root@qemuarm64:~#
>>> root@qemuarm64:~#
>>>
>>>
>>> Can you please let me know how did you tested this patch on QEMU and
>>> what are the parameter's you have passed for command line ? Can you
>>> please help me to overcome from the above issue ?
>>>
>>> I am using following script to launch the QEMU -
>>> https://wiki.linaro.org/LEG/Engineering/luvOS#How_to_test_luvOS_image_on_QEMU
>>> and I can see the below patch introduced the hvc0
>>>
>>> [nareshbhat@Lenovo luv-yocto]$ git show
>>> f44e043c752470b1ed4d22f3732dc0b362f83fd9
>>> commit f44e043c752470b1ed4d22f3732dc0b362f83fd9
>>> Author: Randy Witt <randy.e.witt@linux.intel.com>
>>> Date:   Thu Aug 27 19:42:43 2015 -0700
>>>
>>>     qemuarm64.conf: Make the second serial console /dev/hvc0
>>>
>>>     Since the qemu for aarch64 must use a virtual console for the second
>>>     serial port rather than emulating actual hardware, make sure the
>>> correct
>>>     device is specified so that a tty is actually started.
>>>
>>>     (From OE-Core rev: 5b720a69f0d181ab2de6032a6e3f5a0ee4a14302)
>>>
>>>     Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>
>>> diff --git a/meta/conf/machine/qemuarm64.conf
>>> b/meta/conf/machine/qemuarm64.conf
>>> index 7bbdad7..8459d0f 100644
>>> --- a/meta/conf/machine/qemuarm64.conf
>>> +++ b/meta/conf/machine/qemuarm64.conf
>>> @@ -9,4 +9,4 @@ MACHINE_FEATURES = ""
>>>
>>>  KERNEL_IMAGETYPE = "Image"
>>>
>>> -SERIAL_CONSOLES = "38400;ttyAMA0 38400;ttyAMA1"
>>> +SERIAL_CONSOLES = "38400;ttyAMA0 38400;hvc0"
>>> [nareshbhat@Lenovo luv-yocto]$
>>>
>>>
>>> Thanks and Regards
>>> -Naresh
>>
>

