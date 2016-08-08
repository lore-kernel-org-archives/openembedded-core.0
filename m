Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id B538A77158
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 17:26:48 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id a101so5934681oic.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 10:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=+pF566OWKYCr8Th59/90QbsM72XWsOVU87tgl8hS5KY=;
	b=EJ5JSuaiTuivJoUpS9nhrJamTAVhK5EEaz0X5f+Nl67sfviZUT/PQqg9SagBfOA62D
	eXphhrojuhrc3iB8/HGJWPbF/C5RWK6tDdimXCFDLJztw8/S++seuqJZcqjXTYSJ8hrp
	i0fG1XjS5xVGMl+G8rdjq48p4UhlGl0zU3XrPMqxQCcOJ+qKunBb06+ZmJPyqypwC51l
	+Cb9VhcRL1L1t31eo4lhAd4912o5dfAorZcg9emAqCz59A4C4NEAyyvPSnvhD7ZtVZBn
	0Nju9iUIWBcTaOHCkZyyI+ulJIFgaXbJJTHwi1t/w9nI/szot3OYWVszK4eRf4AD/zyT
	X/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=+pF566OWKYCr8Th59/90QbsM72XWsOVU87tgl8hS5KY=;
	b=Ec8FTCXtdVC9fOT5YiEoF4lLfoAvGjauhxChVqAfnyPV/qOuyMaI4g2gljLNZhgyyV
	V+xN7GaZOPON9ttSNzQzV9DMYCrd6x5K0EhO6819aFmOsnrQHCXTIOp+o+q9Gvxlzo/2
	nr6pglz3YLumC1/Ji4OVKYbQwvd01g9vaIpyQUsWPmPABOUqaqJPGgGlau2Ca9MjJ3VV
	+TofWNDfYNlKtx0bPi4oKoV/u+GVHqXRVJm9nR/f1x6+aGCiELVJAuksN78mdBxRd3Ex
	oY/85vZc4Msn3sZoEw0zx9/IhYcApwTa6Z8THbIqIqXTYY4uomGUbE1a+mLXPSVk9QbD
	P8Hg==
X-Gm-Message-State: AEkooutnZPtDzx2ohYpv59udaUtmIuE7KSth0AXj+45xmYjDKUx0tFt1L9yBGTXZGgv01EfMjcUpPqfHwS0R0Q==
X-Received: by 10.157.24.105 with SMTP id t38mr52246192ott.109.1470677209062; 
	Mon, 08 Aug 2016 10:26:49 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.14.72 with HTTP; Mon, 8 Aug 2016 10:26:18 -0700 (PDT)
In-Reply-To: <CAJTo0LaD0Rj5O+mJYvv0JbFnjeFUiD_S55MAkMdN9X8J-cuJ1Q@mail.gmail.com>
References: <1466023403-1976-1-git-send-email-alistair.francis@xilinx.com>
	<CAKmqyKOviCTZBEnTXgSsWk2s+H6NJHAW490dPLkxy+Lz3Yuj2w@mail.gmail.com>
	<CAKmqyKNKe=H+GA=EwT=b50vnWKp=K68XJCeiSd4M_UAdEOmF_A@mail.gmail.com>
	<CAJTo0LaD0Rj5O+mJYvv0JbFnjeFUiD_S55MAkMdN9X8J-cuJ1Q@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Aug 2016 10:26:18 -0700
X-Google-Sender-Auth: 0u1fxb2WtdRkTSra-DI51knCdcU
Message-ID: <CAKmqyKN9+5n_BpQeMNCcfaj=-c-rjfq+2otdQUaEGgsc_AhtNA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Mon, 08 Aug 2016 17:26:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 8, 2016 at 6:37 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Sorry, staged in my branch now.

Great! Thanks

Alistair

>
> Ross
>
> On 3 August 2016 at 21:31, Alistair Francis <alistair.francis@xilinx.com>
> wrote:
>>
>> Ping^2!
>>
>> On Wed, Jul 27, 2016 at 11:02 AM, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>> > Ping!
>> >
>> > On Wed, Jun 15, 2016 at 1:43 PM, Alistair Francis
>> > <alistair.francis@xilinx.com> wrote:
>> >> Add support to direct boot Linux instead of just booting u-boot.
>> >>
>> >> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> >> ---
>> >>  scripts/runqemu          | 3 +--
>> >>  scripts/runqemu-internal | 2 +-
>> >>  2 files changed, 2 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/scripts/runqemu b/scripts/runqemu
>> >> index de05035..d52ea15 100755
>> >> --- a/scripts/runqemu
>> >> +++ b/scripts/runqemu
>> >> @@ -350,8 +350,7 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
>> >>  QEMUZYNQ_DEFAULT_KERNEL=uImage
>> >>  QEMUZYNQ_DEFAULT_FSTYPE=cpio
>> >>
>> >> -# Default to booting u-boot as a direct Linux boot isn't supported
>> >> yet.
>> >> -QEMUZYNQMP_DEFAULT_KERNEL=u-boot-qemuzynqmp.elf
>> >> +QEMUZYNQMP_DEFAULT_KERNEL=Image
>> >>  QEMUZYNQMP_DEFAULT_FSTYPE=cpio
>> >>
>> >>  setup_path_vars() {
>> >> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>> >> index ea1a307..ecc5e63 100755
>> >> --- a/scripts/runqemu-internal
>> >> +++ b/scripts/runqemu-internal
>> >> @@ -514,7 +514,7 @@ config_qemuzynqmp() {
>> >>      QEMU_NETWORK_CMD="-net nic -net nic -net nic -net nic -net
>> >> user,net=10.10.70.0,dhcpstart=10.10.70.1,host=10.10.70.101"
>> >>      QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xlnx-ep108 -serial
>> >> mon:stdio -dtb $DEPLOY_DIR_IMAGE/${QEMU_DTB}.dtb"
>> >>
>> >> -    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -tftp
>> >> $DEPLOY_DIR_IMAGE"
>> >> +    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -initrd
>> >> $ROOTFS"
>> >>  }
>> >>
>> >>  config_qemumicroblaze() {
>> >> --
>> >> 2.7.4
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

