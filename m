Return-Path: <zhangjialing@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BD9C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 03:27:07 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.22646.1685590025406751497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 20:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zhangjialing@loongson.cn)
Received: from loongson.cn (unknown [10.20.42.22])
	by gateway (Coremail) with SMTP id _____8AxBvEGEHhkzisDAA--.7121S3;
	Thu, 01 Jun 2023 11:27:02 +0800 (CST)
Received: from [10.20.42.22] (unknown [10.20.42.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxBMUGEHhkK3+DAA--.18366S3;
	Thu, 01 Jun 2023 11:27:02 +0800 (CST)
Message-ID: <bc4d7f51-af80-3edc-c468-0c9cf24a5833@loongson.cn>
Date: Thu, 1 Jun 2023 11:27:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH][pseudo] Move __*xstat* and __xmknod functions
 to new subport 'old__x'
Content-Language: en-US
From: =?UTF-8?B?5byg5a625bKt?= <zhangjialing@loongson.cn>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, mark.hatle@amd.com,
 openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
References: <20230531030126.5837-1-mark.hatle@amd.com>
 <6bce2f73-ae0b-56f9-799e-e4ba947f38bb@kernel.crashing.org>
 <ba7a8598-1b49-a6ff-36ba-a11f097d3250@loongson.cn>
In-Reply-To: <ba7a8598-1b49-a6ff-36ba-a11f097d3250@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxBMUGEHhkK3+DAA--.18366S3
X-CM-SenderInfo: x2kd0wxmldzxtqj6z05rqj20fqof0/1tbiAQAIB2R154BmgAAJsX
X-Coremail-Antispam: 1Uk129KBjvdXoWrKF1fCF4fAr4ftrW7GF4UArb_yoWfArg_Zw
	47GF4kAF1DXrWDJw4Dtwn8Xr9rtr48tF1rGrnru3Zruw1UXFW5X3WSqw1rX3WUtrW5Jr1x
	KF4DAr1rKr15tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	97kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZF
	pf9x07URa0PUUUUU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 03:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182044

Hi mark

I have build and make test this code on loongarch64 machine . It can 
work and the make test is passed

```

[zhang@localhost pseudo]$ make test
./run_tests.sh -v
test-acl: Passed.
test-chroot: Passed.
test-chroot-symlink: Passed.
test-cp-setuid: Passed.
test-dir-move: Passed.
test-env_i: Passed.
test-execl: Passed.
test-fcntl: Passed.
test-fstat: Passed.
test-openat: Passed.
test-pseudo_disable-fork-env_i: Passed.
test-pseudo_disable-fork: Passed.
test-pseudo_unload-fork-env_i: Passed.
test-pseudo_unload-fork: Passed.
test-reexec-chroot: Passed.
test-relative-from-root: Passed.
test-rename-fstat: Passed.
couldn't allocate absolute path for 'null'.
test-statx: Passed.
test-tclsh-fork: Passed.
test-umask: Passed.
test-xattr: Passed.
21/21 test(s) passed.

```

在 2023/6/1 10:53, 张家岭 写道:
> build and test this.


