Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9592C786F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 00:48:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b189so6969264wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 16:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=NJ9ASA6HgQawVo2y7XRk+ZTA9x5VctVxdq85tddyI9Y=;
	b=JN0seIwKrSTnvQneLaDEaSDHLMKfUokJyaexd5+nku/bl+gQTFTw3wGtK1MBEMPyrr
	kesh4wXzQw6qfcjNTde2zG7qAzWdBZEGWIxlYY7YmpK/uX+a6njk9qc2N2oRi5/HJ4+v
	AVRefrF3iNqM2y3E8dP22Ascu2EarzDxkPCikAfnNNBgKwmCtMON92jo++PHUPa9srT9
	ZWlEbftY/7fgnmDzv/p3ZpCoE9YBUQPPyQrI02E/sW5CKRwRqlHtfJtxGfgnDPiSoyq+
	00JxmmBMRtcSzDMnWsz0OLI5q3EVL6XaIsbi5z48RqfWR1D6Tv9AmfbAh4v55/7HgPDg
	UIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=NJ9ASA6HgQawVo2y7XRk+ZTA9x5VctVxdq85tddyI9Y=;
	b=hrqwGXpd+VMYG0obP///rLChq+15vxrArjyjp9AyDwM+a6de3IFHxJlbtWiqGx3DLj
	FVoismVTbyz/tmnCsZDw+mnDQrgqGpi4IuXWBtU1gAcGlYZrg4SFPRBQ94th+xOxZC6Y
	AjRXDOhoC7UA9l/Oac/pbVSPNkFrUGjJX62j93gNKjyjguQSalDrtsUeh3W6MJ2pfdKq
	WIZWtfIaDISTbNJRDPd+WDDOXntnZx0YWM4HvEakesuzA4NwWt1OH8P+TEUdPYVDDhP6
	D4xfKsIWOkP0SSgr6LZsKHV6DG3XXENouvDzI/mi2daqzyJGLJQcOXJmnyjCWQmfksc2
	fNBQ==
X-Gm-Message-State: AJaThX4DeNn5gKpakx2y5BshMC45MKyN/SVZR7ztlZfhtrcDAeEx1Aol
	EoRu7+EnzgcYXKks6iD2/5iaw1JNO0cDUCU6J7g=
X-Google-Smtp-Source: AGs4zMbaxQlsK4VcArhPKjFGWJRU4ctRwLGfNY8ITHAPw4AvwWV5O0yhRvEd6kykCHaI6QMxeWtIyHvZWC24UOzJzjM=
X-Received: by 10.28.166.193 with SMTP id p184mr2451637wme.6.1511311683028;
	Tue, 21 Nov 2017 16:48:03 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.147.11 with HTTP; Tue, 21 Nov 2017 16:47:32 -0800 (PST)
In-Reply-To: <CAJTo0LaSzXV=8qMZecM6QBPnhWiT-+bNnjL26YUgR+hdPkAE2Q@mail.gmail.com>
References: <20171012233202.1281-1-alistair.francis@xilinx.com>
	<20171012233202.1281-2-alistair.francis@xilinx.com>
	<CAJTo0LaSzXV=8qMZecM6QBPnhWiT-+bNnjL26YUgR+hdPkAE2Q@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 21 Nov 2017 16:47:32 -0800
X-Google-Sender-Auth: lLzbFJQqKMnMTQvUwBkDtmEQwrg
Message-ID: <CAKmqyKMPTYg0jS3EeqLHWv_UN0zPjF=RdMyt5qpwBkju4-1bxw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Ben Levinsky <ben.levinsky@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] runqemu: Allow the user to override the device tree option
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
X-List-Received-Date: Wed, 22 Nov 2017 00:48:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 14, 2017 at 4:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Doesn't actually work if DEVICE_TREE is not set but QB_DTB is:
>
> Traceback (most recent call last):
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/scripts/runqemu",
> line 1277, in main
>     config.check_and_set()
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/scripts/runqemu",
> line 692, in check_and_set
>     self.check_dtb()
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/scripts/runqemu",
> line 624, in check_dtb
>     cmd_match = "%s/%s" % (deploy_dir_image, dtb)
> NameError: name 'deploy_dir_image' is not defined

Ah! I don't know how that slipped through.

Fixed in v3. Thanks for looking at the patch.

Alistair

>
> Ross
>
> On 13 October 2017 at 00:32, Alistair Francis <alistair.francis@xilinx.com>
> wrote:
>>
>> Update the runqemu script to allow the user to specify a device tree
>> to boot when calling runqemu.
>>
>> This involves creating a seperate check_dtb() function incase the user
>> has specified 'none' for the kernel but still wants a device tree.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Reviewed-by: Ben Levinsky <ben.levinsky@xilinx.com>
>> Cc: Ben Levinsky <ben.levinsky@xilinx.com>
>> ---
>>  scripts/runqemu | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index c3719a86f7..1be6db0eea 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -69,6 +69,7 @@ Usage: you can run this script with any valid
>> combination
>>  of the following environment variables (in any order):
>>    KERNEL - the kernel image file to use
>>    ROOTFS - the rootfs image file or nfsroot directory to use
>> +  DEVICE_TREE - the device tree blob to use
>>    MACHINE - the machine name (optional, autodetected from KERNEL filename
>> if unspecified)
>>    Simplified QEMU command-line options can be passed with:
>>      nographic - disable video console
>> @@ -178,6 +179,7 @@ class BaseConfig(object):
>>          self.env_vars = ('MACHINE',
>>                          'ROOTFS',
>>                          'KERNEL',
>> +                        'DEVICE_TREE',
>>                          'DEPLOY_DIR_IMAGE',
>>                          'OE_TMPDIR',
>>                          'OECORE_NATIVE_SYSROOT',
>> @@ -579,7 +581,7 @@ class BaseConfig(object):
>>                  raise RunQemuError("Can't find OVMF firmware: %s" % ovmf)
>>
>>      def check_kernel(self):
>> -        """Check and set kernel, dtb"""
>> +        """Check and set kernel"""
>>          # The vm image doesn't need a kernel
>>          if self.fstype in self.vmtypes:
>>              return
>> @@ -608,6 +610,15 @@ class BaseConfig(object):
>>          if not os.path.exists(self.kernel):
>>              raise RunQemuError("KERNEL %s not found" % self.kernel)
>>
>> +    def check_dtb(self):
>> +        """Check and set dtb"""
>> +        # Did the user specify a device tree?
>> +        if self.get('DEVICE_TREE'):
>> +            self.dtb = self.get('DEVICE_TREE')
>> +            if not os.path.exists(self.dtb):
>> +                raise RunQemuError('Specified DTB not found: %s' %
>> self.dtb)
>> +            return
>> +
>>          dtb = self.get('QB_DTB')
>>          if dtb:
>>              cmd_match = "%s/%s" % (deploy_dir_image, dtb)
>> @@ -678,6 +689,7 @@ class BaseConfig(object):
>>          self.check_rootfs()
>>          self.check_ovmf()
>>          self.check_kernel()
>> +        self.check_dtb()
>>          self.check_biosdir()
>>          self.check_mem()
>>          self.check_tcpserial()
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

