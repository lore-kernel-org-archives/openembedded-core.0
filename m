Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6EEC57D39C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 16:29:10 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e5so633840qtm.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 08:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qlC0FgeO+wG0Fs8CeFgQ4KB8kn8QF+MInUWYqAX1wrs=;
	b=mR80Nq7JRsw6Uweb/fASrUQH0pU+cwXpt9SIhAyKWuaPw46yaJcM6Dfq4pLtnN8Hkz
	gXXcLIDnwHj6qtO079aeNvPE8lpnZRuFzvBZaNZhUU4kNoqjoRt416OGVa+YO/GrP9OF
	IPmVbPABDxgicFKW+c4FN2Ext8wlLBiGW38txUP/Xv3AihYlwKc/tu91idmZNxGApA75
	BxA/r4PdAyqREWEYMHTrfgpE3RIqz5onoDs2eRa1MDiqUqWpf2TXKJS62UwyruNgDBr0
	Pa8O/YoQtsJOY0/NKi3WCnmmta6A/sEUYxx7Whb60ySa1wzY+iax3Nxivc9tYaMid45q
	fc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qlC0FgeO+wG0Fs8CeFgQ4KB8kn8QF+MInUWYqAX1wrs=;
	b=du7AChUttzsabYAsbI9/6Cs//3Ta6EW2BIuumwoV9Q32wwrnidjdA4yf3fcSHoGeLY
	9iy7nieo60vc3pKvbG/sk4dcrvIpjQadLfTg4sCK55jsHg4mODGJrAVedQtvzUN/vvvZ
	PqnYYaG2bA7nVPEwub5fWuQI1fK+ahKI3PD+VVRz76SI7N4myGLqq2ggaBlAEnPatFbT
	v2mCtUcT7A78Eih+Kr5u8FhwfFKhJSDaakDcgJSCldfXmJUqhDc52xBSLP/RY4wV/76d
	YL9XtJr37LS07tnTtTVr9SadDfHUPIhlkrTutJxi4gbmkR6e7Pni9yQyHWEMKy4p6fvC
	nKNQ==
X-Gm-Message-State: APjAAAUA2kmxfspFredarlfaBwXG1TSvqmZH8CITU62O8F7BS5qX1+tN
	Nzd+jl8hKEpYgZ1YVR+30mG9fZ7RTsnjOtvSbaM=
X-Google-Smtp-Source: APXvYqyu4XC0y7lPpki/ZWiWYOmDrbXLEdXQgF86HtHeN1Iz3QpH8yrNr6zWHia64vOe7wFhYHrVvZTgqO7GsBEPeyA=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr16853613qtj.80.1576340950840; 
	Sat, 14 Dec 2019 08:29:10 -0800 (PST)
MIME-Version: 1.0
References: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
	<699e48bc46b4e96c13393b2d61dbe366c3c88825.camel@linuxfoundation.org>
	<CANNYZj8u8ZkM1ZbbKnXpnUL8LtUwChAtJRi3pfsfeek3BzEa8Q@mail.gmail.com>
	<CALbNGRSHCS1B_SfjWuGVmgh9t+=A=jPFU5ZY4hnvz1rJCJbdMw@mail.gmail.com>
	<CANNYZj_-MimTZeueDybg87q=CrDGs5FTo07EH7DoBu-1gWjVxQ@mail.gmail.com>
In-Reply-To: <CANNYZj_-MimTZeueDybg87q=CrDGs5FTo07EH7DoBu-1gWjVxQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Dec 2019 08:28:44 -0800
Message-ID: <CAMKF1sry2H9eCDUvsNThpN8xRcsoxruV5kDonfmRj_uJtQ+H-Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>, Jon Mason <Jon.Mason@arm.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: 3.45 -> 3.47.1
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
X-List-Received-Date: Sat, 14 Dec 2019 16:29:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 7:21 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 13 Dec 2019 at 15:46, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>>
>> >> Fails on beaglebone:
>> >>
>> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/132=
7
>> >
>> >
>> > I had a look into this: the issue is that new versions of nss require =
hardware crypto capabilities on ARM (both 32 and 64 bit).
>> Do you have an link for this?
>
>
> Yes. We are using plain Makefiles to build (and not gyp), so the link is:
>
> https://github.com/nss-dev/nss/blob/4703a817f8b90cc3423620e5c7606bdbcedbc=
f2e/lib/freebl/Makefile#L782
>
>>
>> I think we should not do that because:
>>
>> Build log says:
>> | cc1: error: switch '-mcpu=3Dcortex-a8' conflicts with '-march=3Darmv8-=
a'
>> switch [-Werror]
>> | cc1: all warnings being treated as errors
>>
>> Nss sets '-march=3Darmv8-a'. Checked in their sources and found that
>> this is done in lib/freebl source path [1]. With latests sources from
>> gihub-shadow they introduced 'disable_arm_hw_aes' [1]. Have no idea if
>> 3.47.1 already supports that but we should use it as packageconfig.
>
>
> This option is only available with gyp, and not plain Makefiles unfortuna=
tely. And the way I read it,
> it's not actually possible to disable :-/
>

nss is used in quite a few apps, and disabling armv7a is not a good
option, plus hw crypto is only in armv8
thing.

> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

