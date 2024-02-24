Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0845EC48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 13:50:43 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.18816.1708782641486794654
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Feb 2024 05:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [222.128.183.27])
	by gateway (Coremail) with SMTP id _____8Dxvuss9NlluBMRAA--.43483S3;
	Sat, 24 Feb 2024 21:50:37 +0800 (CST)
Received: from yetipc.zhcn.cc (unknown [222.128.183.27])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxX88r9Nllz9xAAA--.38408S2;
	Sat, 24 Feb 2024 21:50:35 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v1 0/1] change -march to loongarch64
Date: Sat, 24 Feb 2024 21:50:20 +0800
Message-ID: <20240224135021.1176433-2-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxX88r9Nllz9xAAA--.38408S2
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQAQCGXYV2QDCwBcsD
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 13:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196128

Now both gcc and clang all support -march=loongarch64, so we can use it.

Xiaotian Wu (1):
  change -march to loongarch64

 meta/conf/machine/include/loongarch/arch-loongarch.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.2


