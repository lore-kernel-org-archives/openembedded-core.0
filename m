Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E19D7321C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 20:32:19 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id d204so20995722oig.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2016 13:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=7vLg/4WxpC4fhAkuL7nqkQaBM3Aiu+Q6vNmMnoXBuZs=;
	b=naQtfFj+3LA0kE4AzADl2/W/YyW5VwjLLDheMRn8G55Ch0SeFg1Jz0PCQ/B14Zbyix
	tqPIbHU5HY21GPINGG4F2VxrJw6T2QjPpXRNVYZy8u8SMrSRmlX6zM7Scn4iF3pKRH57
	aFdlf6Eqyr9MZDaaUeXW7Mgx+aWVHLSQ7/DJnIino1ogFerJfW2QGAv+fSdLecFEMaFr
	2XJD1i7zIfAU+gjlrTy7K5KrlGQkAiy33Sfks/kqRZGqxXkyIuzr3H695fn2g92vkDrj
	Pd8GEi0fCzjnQiA7y+YAWLexWGfWOROXJYKDFYJ0XKP3ani122FXUOc8E8qD/ZmEcRRA
	JEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=7vLg/4WxpC4fhAkuL7nqkQaBM3Aiu+Q6vNmMnoXBuZs=;
	b=LZR+q6Hlb1J2DW5laHg3mYfarJINBeoab+MSM6IW5h8K/GEViu5N6GU5VQpgdTg50b
	9go3/I73D+mdqrDvphxJ2UMHkKXkm2+q7f++5oUZTCm4REkLt2R0aLFFrinxbJzux5Ua
	EgFEmeJGmpIA917wZ0YG/uOz2XrAdvOtQdDoZ4AfGdwj/fTapZLFwi9alukt99KQUH44
	gVNS1EZBSvfCKDV9hX7EaFBK02dKMSOD4mFej84qM7yp4pv+V3qdTMKjkXmfRMRn8y77
	XF5/V8t8XZY78tiiqBhNzwQFx5hM6aw08fT5x/3NewZiasDRSktBTNTP9S6Njm6HTE3K
	pUVQ==
X-Gm-Message-State: AEkoousd3Doqg7bJvQNwOsk/stOOeasye5OLgSmYfZz/bULGLRmy3ZDf/mujEhIcc5X0ZK25fbFijHhvw7lcGg==
X-Received: by 10.157.16.65 with SMTP id o1mr44910594oto.148.1470256340020;
	Wed, 03 Aug 2016 13:32:20 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.14.72 with HTTP; Wed, 3 Aug 2016 13:31:49 -0700 (PDT)
In-Reply-To: <CAKmqyKOviCTZBEnTXgSsWk2s+H6NJHAW490dPLkxy+Lz3Yuj2w@mail.gmail.com>
References: <1466023403-1976-1-git-send-email-alistair.francis@xilinx.com>
	<CAKmqyKOviCTZBEnTXgSsWk2s+H6NJHAW490dPLkxy+Lz3Yuj2w@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 3 Aug 2016 13:31:49 -0700
X-Google-Sender-Auth: _IZ5tSzTPYmSmistF4YewhkRznw
Message-ID: <CAKmqyKNKe=H+GA=EwT=b50vnWKp=K68XJCeiSd4M_UAdEOmF_A@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: qemuzynqmp: Add Linux boot support
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
X-List-Received-Date: Wed, 03 Aug 2016 20:32:20 -0000
Content-Type: text/plain; charset=UTF-8

Ping^2!

On Wed, Jul 27, 2016 at 11:02 AM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Ping!
>
> On Wed, Jun 15, 2016 at 1:43 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> Add support to direct boot Linux instead of just booting u-boot.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>  scripts/runqemu          | 3 +--
>>  scripts/runqemu-internal | 2 +-
>>  2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index de05035..d52ea15 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -350,8 +350,7 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
>>  QEMUZYNQ_DEFAULT_KERNEL=uImage
>>  QEMUZYNQ_DEFAULT_FSTYPE=cpio
>>
>> -# Default to booting u-boot as a direct Linux boot isn't supported yet.
>> -QEMUZYNQMP_DEFAULT_KERNEL=u-boot-qemuzynqmp.elf
>> +QEMUZYNQMP_DEFAULT_KERNEL=Image
>>  QEMUZYNQMP_DEFAULT_FSTYPE=cpio
>>
>>  setup_path_vars() {
>> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>> index ea1a307..ecc5e63 100755
>> --- a/scripts/runqemu-internal
>> +++ b/scripts/runqemu-internal
>> @@ -514,7 +514,7 @@ config_qemuzynqmp() {
>>      QEMU_NETWORK_CMD="-net nic -net nic -net nic -net nic -net user,net=10.10.70.0,dhcpstart=10.10.70.1,host=10.10.70.101"
>>      QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xlnx-ep108 -serial mon:stdio -dtb $DEPLOY_DIR_IMAGE/${QEMU_DTB}.dtb"
>>
>> -    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -tftp $DEPLOY_DIR_IMAGE"
>> +    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -initrd $ROOTFS"
>>  }
>>
>>  config_qemumicroblaze() {
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

