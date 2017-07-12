Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8272877972
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:11:54 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z45so3048066wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 22:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C+BwsVE/ZlBY5GKY0RxfPCJPVdI6wnu3787w6k79+PA=;
	b=TF8mgOYxJCgylGhJHl1SX/7BCU7MrgS4Z7TBHeIQQcc3x8KrQrqE5GxKrpeYmAVen1
	bW4d+KPOWnJc9n8tlVDR/9MQW8bIl83Fj86gvoQ9BRuEu0Z+pkjujEnODJAFSa3qrMJo
	sB7oshhFWc472DMVdg5cYpP/3xQv+mML7e1MotdySLAH21cjXwsjjjZqkRgBcZu6JPlH
	PdbFCXGB27cX7O6Jk5GatxNOEb8Dd/OnpSnatWyXI6XHO/eaonjyMd23ZAIa62fD55vB
	OAx5F+mW5XnT/mJTjsOagSPHKC0KdJHElBkhPn7bWl161//upm/xOlW3OonLYMFM2TdW
	rlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C+BwsVE/ZlBY5GKY0RxfPCJPVdI6wnu3787w6k79+PA=;
	b=kulbno/Yo0cAvliDyyCEJDY8N15iSUW2nmeBd4DI25gBJl6RkNGcIS1T4z9C6TAZOb
	f3L9KSVG9pkog7Wfxh9rAQPL7dDtoIxeNXhPoQony/s8KlffqU1ODDiMwn76O1Jh0Lj/
	2w0AbAbficc2E12/8yNzlPxrAEfAOdJm4Ye7DADOkCNz/7QntmT85oKg9U9nVDpGqzsW
	H2CgLgBaJHK5nTXW+s1hWj5gercRYn/m9m9c8SfCcj5VdK/EDudnTGmsui1tLgdzHVGw
	T8OnGEMaUlDVblbzM87ByMpN4m3A6nM4UQmczrAXcm2PtugJqFmAy8LT1ht23GdcoGoG
	chuw==
X-Gm-Message-State: AIVw112UTv0lFTK/oES7Yu0u6sZu1SJmClxKJLK5OgzKguidApR9obhv
	+5VnDNjLt5J1bROHG6twyF9ZL+jWZg==
X-Received: by 10.80.144.5 with SMTP id b5mr4833003eda.24.1499836315338; Tue,
	11 Jul 2017 22:11:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Tue, 11 Jul 2017 22:11:24 -0700 (PDT)
In-Reply-To: <CAC+thW0yRO-=x_Of7vF6n9RxiqSUcpzGdVhFndwKSmfg+4JSNQ@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
	<CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
	<CAMKF1srwg43QrxOGz7UrqmuQ5ptRNJzYC5p9GAcLN7Ldw0ynuA@mail.gmail.com>
	<CAC+thW3DG03wQZ8WCyvyPYk8HcRP1C-Cq3F77HxC3b1_q4RKeA@mail.gmail.com>
	<CAMKF1so8kJk-L_zyJZOWR866K_hciQ4g4ujyMkyrLUZUq1kV3g@mail.gmail.com>
	<CAC+thW0yRO-=x_Of7vF6n9RxiqSUcpzGdVhFndwKSmfg+4JSNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jul 2017 22:11:24 -0700
Message-ID: <CAMKF1sqe6wH+HfWLvzfYV=Ozg0YYDzfF9eRrUGGn98EB8f2bQA@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libepoxy: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Wed, 12 Jul 2017 05:11:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 9:56 PM, Andrea Galbusera <gizero@gmail.com> wrote:
> On Wed, Jul 12, 2017 at 12:38 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Jul 11, 2017 at 3:02 PM, Andrea Galbusera <gizero@gmail.com>
>> wrote:
>> >
>> >
>> > Il 11 lug 2017 8:00 PM, "Khem Raj" <raj.khem@gmail.com> ha scritto:
>> >
>> > On Tue, Jul 11, 2017 at 1:34 AM, Jussi Kukkonen
>> > <jussi.kukkonen@intel.com> wrote:
>> >> On 11 July 2017 at 11:27, Jussi Kukkonen <jussi.kukkonen@intel.com>
>> >> wrote:
>> >>>
>> >>> On 11 July 2017 at 10:42, Jussi Kukkonen <jussi.kukkonen@intel.com>
>> >>> wrote:
>> >>>>>
>> >>>>> Exception: FileExistsError: [Errno 17] File exists:
>> >>>>>
>> >>>>>
>> >>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
>> >>>>> ->
>> >>>>>
>> >>>>>
>> >>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+3/3.22.16-r0/recipe-sysroot/usr/include/KHR/khrplatform.h'
>> >>>>
>> >>>>
>> >>>> /usr/include/KHR/khrplatform.h is the egl platform header file,
>> >>>> provided
>> >>>> by both mesa and RPI userland. Does mesa end up in your gtk+3
>> >>>> recipe-sysroot
>> >>>> somehow?
>> >>>>
>> >>>> For clarity: this could be a bug but it is unlikely to be related to
>> >>>> the
>> >>>> libepoxy change (it does not use or ship the actual header file).
>> >>>>
>> >>>
>> >>>
>> >>> Actually this was maybe fixed by Otavios upgrade to mesa 17.1.4 --
>> >>> mesa
>> >>> accidentally shipped khrplatform.h even when egl was disabled (which
>> >>> is
>> >>> what
>> >>> mesa-gl in oe-core does).
>> >>>
>> >>
>> >> Sorry, I've not had enough  coffee. It was the other way round:
>> >> khrplatform.h is the platform header that mesa now thinks is needed
>> >> whether
>> >> egl is enabled or not -- so they've started installing it in any case
>> >> from
>> >> 17.1.4 which means mesa-gl now provides khrplatform.h and thus
>> >> conflicts
>> >> with userland.
>> >>
>> >> I don't know what the correct fix is yet, just wanted to correct my
>> >> original
>> >> wrong info.
>> >>
>> >
>> > Post an update to sync this header for userland package.
>> >
>> >
>> > Will this help solving the gtk+3 issue of mesa-gl and userland now both
>> > providing the same header and causing recipe-sysroot construction to
>> > fail?
>>
>> No it certainly would not. But we can then decide who provides it, in
>> a easy way.
>
>
> I may be in the need to craft something locally to unbreak building with
> current master... Could you please shed some light on how this should be
> done then? Is this a matter of completely removing either mesa-gl or
> userland from gtk+3 deps or a more selective change to avoid the clash in
> recipe-sysroot?

Firstly, determine where this file belongs to. If it is part of
egl/gles then it should go to userland, otherwise it should be
provided by mesa when using userland for graphics

