Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DC3C636CC
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 07:17:08 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.5509.1675408622921689799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 23:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [10.2.9.245])
	by gateway (Coremail) with SMTP id _____8Dxh+nntNxjlEINAA--.21654S3;
	Fri, 03 Feb 2023 15:16:55 +0800 (CST)
Received: from code-server.gen (unknown [10.2.9.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOXltNxjUm4oAA--.45244S2;
	Fri, 03 Feb 2023 15:16:53 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: chenjiping@loongson.cn,
	zhuqizheng@loongson.cn,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v2 0/5] Add support for LoongArch
Date: Fri,  3 Feb 2023 07:16:11 +0000
Message-Id: <20230203071615.3501674-1-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtOXltNxjUm4oAA--.45244S2
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQALCGPbp+8UTAABsr
X-Coremail-Antispam: 1Uk129KBjvJXoW7WFyUuF4kZryrJw17CFy8Krg_yoW8uF4fpa
	97Zr1rGr1rGr93Aa97A345WrW5W3Z2g342gF1fWw40krWqkr1UXr1IkryqqFy5Xw1DtFy0
	qr95Gw13W3W8ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
	zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
	aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 07:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176708

LoongArch is a new architecture, already supported by linux-6.1, gcc-12, I want to add support to openembedded.

These patch sets add basic support, and it can run cross-compile on on x86_64.
The next step is to add support for yocto repositories, such as yocto-kernel-cache.

Please review these patches, thanks.

v1->v2:
- remove loongarch64 from local.conf.sample.
- update commit message for uboot.

Xiaotian Wu (5):
  base: add support for loongarch64
  linux: add loongarch64 support
  binutils: disable gold on loongarch64
  loongarch: disable seccomp from default feature
  uboot: add a loongarch64 entry

 meta/classes-recipe/kernel-arch.bbclass       |  2 ++
 meta/classes-recipe/siteinfo.bbclass          |  4 +++
 .../distro/include/default-distrovars.inc     |  3 ++
 meta/conf/machine-sdk/loongarch64.conf        |  2 ++
 .../include/loongarch/arch-loongarch.inc      |  7 ++++
 .../include/loongarch/qemuloongarch.inc       | 35 +++++++++++++++++++
 .../include/loongarch/tune-loongarch.inc      | 13 +++++++
 meta/conf/machine/qemuloongarch64.conf        | 11 ++++++
 meta/lib/oe/elf.py                            |  2 ++
 meta/recipes-bsp/u-boot/u-boot-tools.inc      |  1 +
 meta/recipes-devtools/binutils/binutils.inc   |  5 +--
 meta/recipes-devtools/meson/meson_1.0.0.bb    |  2 ++
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  4 ++-
 meta/site/loongarch64-linux                   | 11 ++++++
 scripts/lib/wic/canned-wks/qemuloongarch.wks  |  3 ++
 scripts/runqemu                               |  4 ++-
 18 files changed, 107 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/machine-sdk/loongarch64.conf
 create mode 100644 meta/conf/machine/include/loongarch/arch-loongarch.inc
 create mode 100644 meta/conf/machine/include/loongarch/qemuloongarch.inc
 create mode 100644 meta/conf/machine/include/loongarch/tune-loongarch.inc
 create mode 100644 meta/conf/machine/qemuloongarch64.conf
 create mode 100644 meta/site/loongarch64-linux
 create mode 100644 scripts/lib/wic/canned-wks/qemuloongarch.wks

-- 
2.39.1


