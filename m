Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8A94871985
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 02:00:27 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id y42so9870810wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 18:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aqrFWTMqAxiHvlBdJF7OKZZ0ZqICnGp8lOOc4+m61t4=;
	b=bDCfaM3dQgX1a6SFfAx69d8tiNeb9QI50pkBLB7C1lyf0Hl/42d65W0akPVQ3UHKeM
	6GB7lZL12eXtZHWbf5535ioLkwLinUVCfk5Z6hAYNk47PKtnemiPzA0HT+hASjjzl4m0
	jENp8Yq8XajSt7ZtGzsrFYmatUNutBVDauWn3gRvAHGR+SNXylyhrFepY97M1BdEqF2k
	In4msdR5SCLCM4WteJbG2thiAx5gGT1lqQOkTQTV1s1VyEHmuygxnuWiOuAXTFlQqDG8
	O3As0ox9Y0M91T/TkCU8X2oF7Ys8L7OIJBMZ0twLSRwL/TgHWGobiuSEyF+tp08ca8B+
	OoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aqrFWTMqAxiHvlBdJF7OKZZ0ZqICnGp8lOOc4+m61t4=;
	b=Ovgi25jExaVcWZqwrejzMvBHBg2rrKrEeiJrhkIrlZBIdzAXl4t8J5QdCw030RQt1h
	tbNDp6bO82dfbtyR7uRZ99QkY5twQ2AmOqMxGgEnJRzvYRig6yJEL2QcDYQjSk+4CKbe
	JGsvdkwqlpCKPKoc7/CyDzgAlb55cxptlF1sp/4d5oNTzOA3li8Jg4aAfS5Sn54+KmhU
	RmvDEqqVLRbkdx6SFjQA9uR+ZN7vGNpmmEj4LdPR6ZvfOQ0hSNv4fclg9ZFi1AzWlThI
	bTKTxWYZLYP/18XP1QI+/dHsBHu42EoecsIhEBj41LlmLZPwmYpCqYw9tyUTKCqLeq9+
	+Sdw==
X-Gm-Message-State: AJaThX4USjJP0hZmZrLCquH0ND30HlUcatnvYZV5mXDROTdSzWUN2EP3
	sxiFW1jK8B2gM0I/P6ur47ls1ZBHXBnQBX2pCrE=
X-Google-Smtp-Source: AGs4zMZQ6KgBx7GXqqrPoMqkpBgjh52yNnfY585Uu28ld8kgH/S5+bnnOSIImkocIzgXYXmpSlDcZR+nVpyuSkKN+24=
X-Received: by 10.223.135.59 with SMTP id a56mr14135151wra.173.1511229628220; 
	Mon, 20 Nov 2017 18:00:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Mon, 20 Nov 2017 18:00:27 -0800 (PST)
In-Reply-To: <82397892-7190-ac1a-8aa4-128cb928e8f0@windriver.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
	<82397892-7190-ac1a-8aa4-128cb928e8f0@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 Nov 2017 18:00:27 -0800
Message-ID: <CAJ86T=VJo7d94DVxHGdhRLve8kjWNRSidMJfuxPxienV1MK3yA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: fix formatting IDE storage does not trigger "change" uevents
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
X-List-Received-Date: Tue, 21 Nov 2017 02:00:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2017 at 5:21 PM, Hongxu Jia <hongxu.jia@windriver.com> wrot=
e:
> On 2017=E5=B9=B411=E6=9C=8820=E6=97=A5 19:07, Burton, Ross wrote:
> On 17 November 2017 at 06:08, Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>>
>> +qemu by default emulates IDE and the linux-yocto kernel(s) use
>> +CONFIG_IDE instead of the more modern libsata, so disks appear as
>> +/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
>> +is deprecated.
>
> Can we fix our kernel and/or qemu configuration too?
>
> For qemu, RP have replace it with virtio, but it have the
> similar issue on virtualbox with IDE controller.

VirtualBox gives you the choice about whether to connect the HDD image
to a virtual IDE or SATA port.

ie VirtualBox isn't a reason to have our rootfs images continue to try
to support IDE.

> ...
> commit f59e729f98ef9b506b0cfdc415567e03ec87f2a9
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Tue Aug 22 22:58:02 2017 +0100
>
>     runqemu: Use virtio to mount cdrom drives
>
>     The IDE driver in the kernel is fragile and in 4.12 is causing
> backtraces.
>     To unblock 4.12 kernel merging use the virtio CD driver instead to mo=
unt
>     iso images which should be faster and more stable.
> ...
>
> //Hongxu
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

