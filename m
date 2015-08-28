Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9C571633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 19:39:00 +0000 (UTC)
Received: by padhm10 with SMTP id hm10so16232371pad.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=1x+VLgDmVI3fgXkX8meRrQJTvzI58oK25BAVmUSlmsM=;
	b=CkpXetfx/A2fEBWWdS6rKirMAlQvEYcv80I6aali0G5tUFe98YNuhhGhw5S8JEcN8R
	OU4grsYRE36tLfk1uSZ8ITnypIFepwGSzaDREDIKv1C6DpSMZgR/h3YvM9PiaWQvDEYz
	22W7M8RqvpfOhMbykK7qqaTVmwQTCqEfMn5qI5mVAQl0kqDVLIAUoJFiioYAUdIpF9kh
	MvwrSD5T71DWmMvpUptBstIP+/lIpm24risiSTTt+ZEPBA4vkxK1O3wv+8V3/hqHCXlB
	ZRuooxSQnKS25EUOCSNnf3LprY9U/m1QiSoT2yrcxJfc/HK2ezr3G7YLXoUU4RJdztFZ
	xmoA==
X-Received: by 10.68.218.104 with SMTP id pf8mr17903150pbc.31.1440790741056;
	Fri, 28 Aug 2015 12:39:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:395f:c595:f90b:fbb3?
	([2601:202:4000:1239:395f:c595:f90b:fbb3])
	by smtp.googlemail.com with ESMTPSA id
	j4sm6589313pdk.9.2015.08.28.12.38.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 12:39:00 -0700 (PDT)
Message-ID: <55E0B8D1.3060908@gmail.com>
Date: Fri, 28 Aug 2015 12:38:57 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1440789168.git.akuster808@gmail.com>
	<20150828192034.GB2488@jama>
In-Reply-To: <20150828192034.GB2488@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/17] For Dizzy 1.7.3a
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
X-List-Received-Date: Fri, 28 Aug 2015 19:39:08 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Martin,

I rebased against dizzy-next.  It appears dizzy and dizzy-next are out
of sync.

I will rebase against dizzy.

- armin

On 08/28/2015 12:20 PM, Martin Jansa wrote:
> On Fri, Aug 28, 2015 at 12:16:04PM -0700, Armin Kuster wrote:
>> Please consider these addition changes for Dizzy 1.7.3
>>
>> The following changes since commit 86971b5d97645cdbf2e48c39f30afa7c44e81e81:
>>
>>   oeqa/bbtests: Fix to ensure DL_DIR is set (2015-07-26 07:59:00 +0000)
> 
> Some of these changes were already applied in dizzy, you should refresh
> your dizzy branch:
> 
> OE @ ~/openembedded-core $ git log origin/dizzy --oneline
> 4621675 grub-efi: Add backslash lost from previous commit
> ac135bd grub-efi: Use the backport patch from grub
> 8687b8b license_class: Fix choose_lic_set into incompatible license
> 5f50f90 dpkg: Fix tarfix.patch
> 386898a dpkg: Fix for Fedora22 and new versions of tar
> c58814c oeqa/bbtests: Fix to ensure DL_DIR is set
> e443498 oeqa/bbtests: Fix race over DL_DIR and SSTATE_DIR
> 
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>>   http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next
>>
>> Alejandro Hernandez (1):
>>   qemurunner: Improves checking for server and target IPs on qemus
>>     parameters
>>
>> Aníbal Limón (2):
>>   license_class: Fix choose_lic_set into incompatible license
>>   license_class: fix license.manifest shows LICENSE field differently to
>>     recipe
>>
>> Martin Jansa (2):
>>   connman-conf: fix SRC_URI_append
>>   license.bbclass: fix unexpected operator for LICENSE values with space
>>
>> Paul Eggleton (1):
>>   oeqa/utils/qemurunner: fix logging
>>
>> Petter Mabäcker (1):
>>   meta: set proper S value
>>
>> Richard Purdie (3):
>>   dpkg: Fix for Fedora22 and new versions of tar
>>   dpkg: Fix tarfix.patch
>>   grub-efi: Add backslash lost from previous commit
>>
>> Ross Burton (1):
>>   oeqa/QemuRunner: don't use bb for logging
>>
>> Saul Wold (1):
>>   grub-efi: Use the backport patch from grub
>>
>> Sona Sarmadi (4):
>>   bind9.9.5: CVE-2015-5477
>>   qemu: CVE-2014-7840
>>   qemu-vnc: CVE-2014-7815
>>   qemu-slirp: CVE-2014-3640
>>
>> Yi Zhao (1):
>>   oeqa/selftest: fix test_incremental_image_generation for changes in
>>     log output
>>
>>  meta/classes/license.bbclass                       | 18 +++---
>>  meta/lib/oeqa/selftest/buildoptions.py             | 11 ++--
>>  meta/lib/oeqa/utils/qemurunner.py                  | 73 ++++++++++++----------
>>  meta/recipes-bsp/alsa-state/alsa-state.bb          |  2 +
>>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
>>  meta/recipes-bsp/hostap/hostap-conf_1.0.bb         |  2 +
>>  meta/recipes-bsp/keymaps/keymaps_1.0.bb            |  2 +
>>  .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 +++++++++++++
>>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
>>  meta/recipes-connectivity/connman/connman-conf.bb  |  8 ++-
>>  .../ppp-dialin/ppp-dialin_0.1.bb                   |  2 +
>>  .../init-ifupdown/init-ifupdown_1.0.bb             |  2 +
>>  .../initrdscripts/initramfs-boot_1.0.bb            |  2 +
>>  .../initrdscripts/initramfs-framework_1.0.bb       |  2 +
>>  .../initrdscripts/initramfs-live-boot_1.0.bb       |  2 +
>>  .../initramfs-live-install-efi-testfs_1.0.bb       |  2 +
>>  .../initramfs-live-install-efi_1.0.bb              |  2 +
>>  .../initramfs-live-install-testfs_1.0.bb           |  2 +
>>  .../initrdscripts/initramfs-live-install_1.0.bb    |  2 +
>>  meta/recipes-core/initscripts/initscripts_1.0.bb   |  2 +
>>  .../systemd/systemd-systemctl-native.bb            |  2 +
>>  .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  2 +-
>>  meta/recipes-core/udev/udev-extraconf_1.1.bb       |  2 +
>>  meta/recipes-devtools/dpkg/dpkg/tarfix.patch       | 45 +++++++++++++
>>  meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |  1 +
>>  meta/recipes-devtools/opkg/opkg-collateral.bb      |  2 +
>>  .../recipes-devtools/qemu/qemu/CVE-2014-7840.patch | 57 +++++++++++++++++
>>  .../qemu/qemu/slirp-CVE-2014-3640.patch            | 48 ++++++++++++++
>>  .../qemu/qemu/vnc-CVE-2014-7815.patch              | 53 ++++++++++++++++
>>  meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  3 +
>>  .../run-postinsts/run-postinsts_1.0.bb             |  2 +
>>  .../shadow/shadow-securetty_4.2.1.bb               |  2 +
>>  .../xorg-xserver/xserver-xf86-config_0.1.bb        |  2 +
>>  .../modutils-initscripts/modutils-initscripts.bb   |  3 +
>>  meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb        |  2 +
>>  .../ptest-runner/ptest-runner_1.0.bb               |  2 +
>>  36 files changed, 361 insertions(+), 50 deletions(-)
>>  create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
>>  create mode 100644 meta/recipes-devtools/dpkg/dpkg/tarfix.patch
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch
>>
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

