Return-Path: <akuster808@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 980DA76D6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:59:27 +0000 (UTC)
Received: by igbuu8 with SMTP id uu8so47302591igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=dsh3AlTajuQM3Kq/jVUuAMQaHIzro7A1b1hFmnNx5rw=;
	b=gBf2vrAdRECFv4pHEQKAdALMPITeOd0GKJWw7Q2CONnYVxH82hCziNvaQJEZrQ0i3g
	Bxw/fQ9ygyoOf/py1/xanp/ytdDV0nwOpJNnK7bjk0XWEUhbIWr1nnV04gsGfV9k4ruL
	oa0YIUMFyEsfb22VXbDI305E+sT9hNhMk3FXjtoz6+OljTjK539VP28vEpfTNGNJJfa3
	XBwBKLiIPap9aNYoIARTn+LoxHMBpA7slyBcGZeYq0HSf4Sp7fQAsvWXr/IiFqWqAr7y
	IoRjFkq6EV6uCrrHPRKIPAaILdZxTIG1JqI9QgxrxgRw15mS5SQreJbaLXKZG4zky7fs
	KcZg==
X-Received: by 10.50.55.73 with SMTP id q9mr12543471igp.11.1441029567180;
	Mon, 31 Aug 2015 06:59:27 -0700 (PDT)
Received: from [10.22.11.207] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	ir3sm10811539igb.12.2015.08.31.06.59.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 06:59:26 -0700 (PDT)
Message-ID: <55E45DBD.7040505@gmail.com>
Date: Mon, 31 Aug 2015 06:59:25 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <cover.1440790956.git.akuster808@gmail.com>
	<55E15167.4040302@linux.intel.com>
In-Reply-To: <55E15167.4040302@linux.intel.com>
Subject: Re: [PATCH 00/15] For Dizzy 1.7.3a v2
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
X-List-Received-Date: Mon, 31 Aug 2015 13:59:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 08/28/2015 11:29 PM, Saul Wold wrote:
> 
> Hi Armin,
> 
> I added the bitbake patch to my sgw/dizzy branch and threw it against
> the Autobuilder.
> 
> There where a few failures, some of which may be expected, others need
> more investigation:
> 
> arm64
> mip64
>  - I don't think that dizzy had support for those yet.

Those two are not officially listed. mip64 code was there but not
included in builds or tested. Some Arm64 exited.

http://downloads.yoctoproject.org/releases/yocto/yocto-1.7.2/machines/qemu/

> 
> 
> deb-non-deb
>  - did these ever work for dizzy?

don't know.

- armin
> 
> wic
>  - New build target
> 
> It's still finishing up right now.
> 
> Sau!
> 
> 
> On 08/28/2015 12:44 PM, Armin Kuster wrote:
>> Rebased against Dizzy this time.
>>
>> Please consider this changes for Dizzy 1.7.3
>>
>> The following changes since commit
>> 137f52ac3a3cf6dc9eed27178c37e9ce235341d8:
>>
>>    grub-efi: Add backslash lost from previous commit (2015-08-20
>> 21:42:31 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>>    http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next
>>
>> Alejandro Hernandez (1):
>>    qemurunner: Improves checking for server and target IPs on qemus
>>      parameters
>>
>> Aníbal Limón (1):
>>    license_class: fix license.manifest shows LICENSE field differently to
>>      recipe
>>
>> Martin Jansa (2):
>>    connman-conf: fix SRC_URI_append
>>    license.bbclass: fix unexpected operator for LICENSE values with space
>>
>> Paul Eggleton (1):
>>    oeqa/utils/qemurunner: fix logging
>>
>> Petter Mabäcker (1):
>>    meta: set proper S value
>>
>> Richard Purdie (3):
>>    runqueue: Add message to explain the problem if diffsigs multiple
>>      tasks don't exist
>>    fetch2: Extend mirroruri handlling
>>    sstate: Use SSTATE_DIR for FILESPATH
>>
>> Ross Burton (1):
>>    oeqa/QemuRunner: don't use bb for logging
>>
>> Sona Sarmadi (4):
>>    bind9.9.5: CVE-2015-5477
>>    qemu: CVE-2014-7840
>>    qemu-vnc: CVE-2014-7815
>>    qemu-slirp: CVE-2014-3640
>>
>> Yi Zhao (1):
>>    oeqa/selftest: fix test_incremental_image_generation for changes in
>>      log output
>>
>>   bitbake/lib/bb/fetch2/__init__.py                  |  1 +
>>   bitbake/lib/bb/runqueue.py                         |  2 +
>>   meta/classes/license.bbclass                       | 15 ++---
>>   meta/classes/sstate.bbclass                        |  4 +-
>>   meta/lib/oeqa/selftest/buildoptions.py             | 11 ++--
>>   meta/lib/oeqa/utils/qemurunner.py                  | 73
>> ++++++++++++----------
>>   meta/recipes-bsp/alsa-state/alsa-state.bb          |  2 +
>>   meta/recipes-bsp/hostap/hostap-conf_1.0.bb         |  2 +
>>   meta/recipes-bsp/keymaps/keymaps_1.0.bb            |  2 +
>>   .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 +++++++++++++
>>   meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
>>   meta/recipes-connectivity/connman/connman-conf.bb  |  8 ++-
>>   .../ppp-dialin/ppp-dialin_0.1.bb                   |  2 +
>>   .../init-ifupdown/init-ifupdown_1.0.bb             |  2 +
>>   .../initrdscripts/initramfs-boot_1.0.bb            |  2 +
>>   .../initrdscripts/initramfs-framework_1.0.bb       |  2 +
>>   .../initrdscripts/initramfs-live-boot_1.0.bb       |  2 +
>>   .../initramfs-live-install-efi-testfs_1.0.bb       |  2 +
>>   .../initramfs-live-install-efi_1.0.bb              |  2 +
>>   .../initramfs-live-install-testfs_1.0.bb           |  2 +
>>   .../initrdscripts/initramfs-live-install_1.0.bb    |  2 +
>>   meta/recipes-core/initscripts/initscripts_1.0.bb   |  2 +
>>   .../systemd/systemd-systemctl-native.bb            |  2 +
>>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  2 +-
>>   meta/recipes-core/udev/udev-extraconf_1.1.bb       |  2 +
>>   meta/recipes-devtools/opkg/opkg-collateral.bb      |  2 +
>>   .../recipes-devtools/qemu/qemu/CVE-2014-7840.patch | 57
>> +++++++++++++++++
>>   .../qemu/qemu/slirp-CVE-2014-3640.patch            | 48 ++++++++++++++
>>   .../qemu/qemu/vnc-CVE-2014-7815.patch              | 53
>> ++++++++++++++++
>>   meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  3 +
>>   .../run-postinsts/run-postinsts_1.0.bb             |  2 +
>>   .../shadow/shadow-securetty_4.2.1.bb               |  2 +
>>   .../xorg-xserver/xserver-xf86-config_0.1.bb        |  2 +
>>   .../modutils-initscripts/modutils-initscripts.bb   |  3 +
>>   meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb        |  2 +
>>   .../ptest-runner/ptest-runner_1.0.bb               |  2 +
>>   36 files changed, 318 insertions(+), 50 deletions(-)
>>   create mode 100644
>> meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
>>   create mode 100644
>> meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
>>   create mode 100644
>> meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch
>>

