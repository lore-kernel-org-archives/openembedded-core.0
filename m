Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id EB16660017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 11:20:20 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id i17-v6so5713077otl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+vn6xGIISDDdIRDo9g65zL10ZmPWw5+WyRQ0pDoMutQ=;
	b=WsRS4SFE3hcle+e9UOKl9ecC/3xJ04O3bvyynlMTwCyP/UzDLEFtqi+uMsqnjHrR+r
	zTq7FWuOaFdGHgspelq3wyvPv+i2GH35oDuxJXNPtbCxy2mR9EqfMSvriyL7oERxd/Ms
	ST3XVLwgjJLXE9u0UdSZr8v78KPRZn802pvSqGJUoPm5NYR/UdMGkSstJ+RqaofIviR7
	sttW6Ca5pGHjphThJMcxYYQm26b5nax/YQsKzZ7eSB/mitvihO/NYHdKHM4Um0J8kym2
	MV6D/wtHpntxNIN2v0tuDS8LamyZhDGZQs3UUsQI6eZQVca5g1LvpTb1LiGz1MNpEWaD
	H/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+vn6xGIISDDdIRDo9g65zL10ZmPWw5+WyRQ0pDoMutQ=;
	b=X22wa2IkAFW1Q3MgM+YtY/9ckjLdBTsVId1gramMMm1R6tQDeHNX5VQTUAlVuYUN2A
	Qbeh6QWdHH9EEvbGPp5sf9LdRDsjWSFFuDauiL/gN6RoI6jEpBMjqGiOXI1q4CN4Cft+
	bGPcF1T/zuESgFENbcC4Yb+cXnNgQ4nG9743Zawgvg6cNnZDp9y0SgTa9fBGIRmGan4Z
	Pzj3omKx6RZECV4q9W1i/byc86QFDO17EgLlyDTBEi6Rzyq/H2j25BvWplUJQFIG5heg
	w3cwc+DJS2CbpN3MPEhdusc/y8o/DoD+jacDQLOk8jc8TfXnrumukxo9LzOC4ttritpJ
	Mrqw==
X-Gm-Message-State: APt69E2ANGZ4ZuLH+YcyvgtuEehHgvEk07yLUHAtSDAgYnYU3oQ1v2rK
	LrIeT2ecNKcq1XdWVvEsVKP+bDbR2aRd52NRPws=
X-Google-Smtp-Source: AAOMgpe7tKk8xx0wDwtlQF4qSrVtmnmzZgWFPxCAfbwzz6yPLJpcrPNjwDo9LmxQw1Vys9Ksk+85YJQcvSIC0nWdZ1Y=
X-Received: by 2002:a9d:3a24:: with SMTP id
	j33-v6mr5365587otc.358.1530184821899; 
	Thu, 28 Jun 2018 04:20:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 04:20:21
	-0700 (PDT)
In-Reply-To: <CA+chaQd7LE8y7-xzsPTa0CYS9bq-94MwGE=hFbtgz3odkq-d0g@mail.gmail.com>
References: <969ccd61-7a03-a81f-c36f-04c5d806d3e2@windriver.com>
	<CA+chaQd7LE8y7-xzsPTa0CYS9bq-94MwGE=hFbtgz3odkq-d0g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Jun 2018 13:20:21 +0200
Message-ID: <CANNYZj8ta8T25nAvb6tuaxx-==+j3DPCApXnA5JizihT5husJQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] How to deal allarch packages in dependency chain for multilib rootfs?
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
X-List-Received-Date: Thu, 28 Jun 2018 11:20:21 -0000
Content-Type: text/plain; charset="UTF-8"

Maybe the better thing to do would be to name the packages in the
first place in such a way that openssl is a 32 bit package, and
lib64-openssl is the 64 bit one. Then any noarch package would pull in
the correct version automatically. Is that not possible somehow?

Alex

2018-06-28 13:13 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> In our build I've removed the openssl runtime dependency
> (RDEPENDS_${PN}_remove = "openssl"), because we pull the right version of
> openssl (lib32-openssl in our case) to the image elsewhere.
>
> On Thu, Jun 28, 2018 at 10:48 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>>
>> Hi all,
>>
>> When build 32 bits rootfs with 64 bits bsp, if an allarch/noarch package
>> is installed to lib32 rootfs, it causes
>> unexpected 64 bits packages which is required by the allarch package
>> installed to lib32 rootfs.
>>
>> Take ca-certificates as example. ca-certificates rdepends on openssl, so
>> if ca-certificates is installed to image,
>> 64 bits package openssl will be installed too no matter what the rootfs
>> is. But only 32 bits openssl package should
>> be installed to 32 bits rootfs.
>>
>> There are 2 ways to fixed the issue.
>>
>> 1 expand allarch/noarch packages with multilib. So if add ca-certificates
>> to image, lib32-ca-certificates will be
>>    installed to 32bits rootfs. And then also the dependency lib32-openssl
>> is installed. That is what we expected.
>>
>> 2 expand DEPENDS/RDEPENDS of allarch/noarch packages with a prefix
>> 'noarch-' when multilib is enabled. So then
>>    ca-certificates requires 'noarch-openssl'. And make both lib32-openssl
>> and openssl provides 'noarch-openssl'.
>>    When do_rootfs, there is only one rpm repo 'oe-rootfs-repo' now. We
>> will create repos with different priorities
>>    according to different archs/subdirectories. For 32 bits image, make 32
>> bits rpm repo has  higher priority, so lib32-openssl
>>    will be installed to 32 bits rootfs rather than 64bits.
>>
>> I know these 2 ways are not perfect, but only possible ways I have in mind
>> to solve the problem.
>>
>> Any comment or suggestion is greatly appreciated. Thanks a lot.
>>
>> --
>> Regards,
>> Neil | Kai Kang
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

