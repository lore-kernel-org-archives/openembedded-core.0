Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id EE97C6AC56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 14:35:26 +0000 (UTC)
Received: by wibgn9 with SMTP id gn9so107933990wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Apr 2015 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=rZjChPHO82BTuNROhr8HZhkTnpDWbGmg6I6dY8AsT6k=;
	b=W8WO7Qt3gIPOBi15q/TQNAO3VDYDCekhwkoVROPzh4tSKZteUH//Ow4iJRdvQMQrT0
	V2mv8xUO0ypeXzCnSR5oYf66RoB3U3mSs4hOevVW4qtnz4PM2+eOTjG2lRmbhzIfvYQV
	l6eHv/WYg3oe/TY3VYB1d1QCHv6V6had6cJ980RYPgONNIl3xxicKLrfXxTLKk0mTBrF
	AvDkdC628m4xd+3zaJXS1wrYJhptfZqQPCkQSiJXVwYNa2BMJ0AyKur1dp2ybxp6wo0D
	eGo873swYIgdMH8Guhq9uIBKzApjAQgzGDh9p72nR4BObw+ylmn812s7naK1agBAYtb0
	jpWg==
X-Received: by 10.180.102.228 with SMTP id fr4mr3917335wib.4.1427985327513;
	Thu, 02 Apr 2015 07:35:27 -0700 (PDT)
Received: from [10.41.0.24] (089144212024.atnat0021.highway.a1.net.
	[89.144.212.24])
	by mx.google.com with ESMTPSA id ga8sm7991624wib.11.2015.04.02.07.35.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Apr 2015 07:35:26 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <551D0FCB.5080603@huawei.com>
References: <1427882425-19536-1-git-send-email-zhengjunling@huawei.com>
	<34C00CB4-D932-4317-A2B6-E6C7346464A0@gmail.com>
	<551D0FCB.5080603@huawei.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 02 Apr 2015 16:35:21 +0200
To: Junling Zheng <zhengjunling@huawei.com>
Message-ID: <0D1A6BA1-78E2-4AA5-9DD0-6553A974B447@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uclibc: fix undefinition of '_dl_strchr' in libdl.a
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
X-List-Received-Date: Thu, 02 Apr 2015 14:35:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On April 2, 2015 11:45:47 AM GMT+02:00, Junling Zheng <zhengjunling@huawei.com> wrote:
>On 2015/4/2 14:42, Bernhard Reutner-Fischer wrote:
>> On April 1, 2015 12:00:25 PM GMT+02:00, Junling Zheng
><zhengjunling@huawei.com> wrote:
>>> The orign_path.patch introduced '_dl_strchr' into
>ldso/ldso/dl-elf.c,
>> 
>> Please fix the origin patch directly.
>> Thanks,
>> 
>Hi, Bernhard
>
>The orign_path.patch is backported from:
>
>http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html
>
>It's an individual. Should I still fix this patch directly?

Yes.
>
>BTW, should uclibc upstream need this patch to avoid the above problem
>too?

There currently is no in-tree user of these, so no.
$ORIGIN support is on my todo list..

>
>I had submitted a patch to the uclibc upstream, and expected your
>review:)

See above :)

Cheers,
>
>Thanks,
>
>Junling



