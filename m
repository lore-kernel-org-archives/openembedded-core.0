Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0849CC7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 09:55:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9368.1686650154988015488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 02:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61CC41FB;
	Tue, 13 Jun 2023 02:56:39 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 272D93F71E;
	Tue, 13 Jun 2023 02:55:54 -0700 (PDT)
Message-ID: <a87d5dd9-4128-6d02-eda2-c0c15f5a52fc@arm.com>
Date: Tue, 13 Jun 2023 10:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for
 write_image_test_data
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230517162906.2395999-1-peter.hoyes@arm.com>
 <F3C8EF1B-E5EA-4357-8977-1FCC0F5E553D@arm.com>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <F3C8EF1B-E5EA-4357-8977-1FCC0F5E553D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 09:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182706


On 23/05/2023 18:06, Ross Burton wrote:
> On 17 May 2023, at 17:29, Peter Hoyes via lists.openembedded.org <peter=
.hoyes=3Darm.com@lists.openembedded.org> wrote:
>> The testdata.json file generated as part of the rootfs postprocess
>> commands contains almost all Bitbake variables and is used by OEQA tes=
t
>> cases to inspect the build environment. However it is only regenerated
>> when the rootfs task is otherwise retriggered, complicating the proces=
s
>> of developing OEQA test cases.
> I=E2=80=99m about to run for dinner, but would it make more sense for t=
his function to be a separate task inside testimage.bbclass that happens =
after rootfs?  This will stop the explosion of variable dependencies caus=
ing rootfs to re-run.
>
> Ross

Thanks for the suggestion - I have implemented this for consideration in=20
https://lists.openembedded.org/g/openembedded-core/topic/patch_1_2/995017=
85

Peter


