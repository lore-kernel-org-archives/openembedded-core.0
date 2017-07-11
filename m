Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 392BC77E94
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 22:39:13 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z45so1559138wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 15:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2mXFP/sPcBLfqXsozN5GoQj8dv5aK4IlKD4Ff753vs4=;
	b=N/CSi2Xns3cFfSTlUcMNCsWUcmp8KZGqc4+Peo4rhkPERYGLrWKJhT/zsvyf/ZzH/m
	klK1lZ+flQL6rLuE/klgj1xmnQHM8CWHbEkF6zZ62tOJYp+fFQ9ndrPoZuMiHmfph/Rp
	ceUQ/gw/cTRdfdLmEYAZHlkHrs6CvD9f84IhEjDww+oEkTonIdSkH4MHQPAkMh3gUvs/
	PSAwf702PLZHk6EAx1gMD++VPDiHSZ5C71uu5VNDfBYt4XWowHqbOsnOL/qJ6EpN31KZ
	tkAQj2D1b0MS3/K1G8t88ZyXVVG/TsUA7J5y56DS4Sunz7BedIHAn4cuWbaZZczg9iDI
	yVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2mXFP/sPcBLfqXsozN5GoQj8dv5aK4IlKD4Ff753vs4=;
	b=m3tlq2bjiFZcHjMUMxR+jzyjmsUdnzxG4+ibR0bMn74OXH7lSxSNLkYq2iaojmPgMn
	J26p5UQnrWi9Cc5LhIktMw45ywrfbOs/tP9f9SfqXgcHtOdc+6WbrE8mvOys9/NNYuK5
	MHFQp92rEFh2n8D5I4fLhj5o8Vnbj8rZRV3Y47omgSl1dqxEapetBxGG3YCjayRwvm4E
	OdIDjM259mZo67/cGRFst1/iP63UOBEcK7FCz06i0X5TO3aYRM1fvdRQRMnc3hHdM7mS
	tgNUkhJ2rCuwny95LS/EezpBK8OYnCWvPgeNZfY01ry7F1TU0K2/gdFtaBMmP7pXM242
	C+Nw==
X-Gm-Message-State: AIVw110+TQdsW+3+tm9Zj/Xl5FYCOtiL5Qz592Fpc4kl5fQDgCmJJ8TZ
	VsEv1FFpO4KGC61Fk1z4Swh8MtkCpQ==
X-Received: by 10.80.145.198 with SMTP id h6mr3969290eda.108.1499812754898;
	Tue, 11 Jul 2017 15:39:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Tue, 11 Jul 2017 15:38:44 -0700 (PDT)
In-Reply-To: <CAC+thW3DG03wQZ8WCyvyPYk8HcRP1C-Cq3F77HxC3b1_q4RKeA@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
	<CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
	<CAMKF1srwg43QrxOGz7UrqmuQ5ptRNJzYC5p9GAcLN7Ldw0ynuA@mail.gmail.com>
	<CAC+thW3DG03wQZ8WCyvyPYk8HcRP1C-Cq3F77HxC3b1_q4RKeA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jul 2017 15:38:44 -0700
Message-ID: <CAMKF1so8kJk-L_zyJZOWR866K_hciQ4g4ujyMkyrLUZUq1kV3g@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Jul 2017 22:39:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 3:02 PM, Andrea Galbusera <gizero@gmail.com> wrote:
>
>
> Il 11 lug 2017 8:00 PM, "Khem Raj" <raj.khem@gmail.com> ha scritto:
>
> On Tue, Jul 11, 2017 at 1:34 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
>> On 11 July 2017 at 11:27, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>>
>>> On 11 July 2017 at 10:42, Jussi Kukkonen <jussi.kukkonen@intel.com>
>>> wrote:
>>>>>
>>>>> Exception: FileExistsError: [Errno 17] File exists:
>>>>>
>>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
>>>>> ->
>>>>>
>>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+3/3.22.16-r0/recipe-sysroot/usr/include/KHR/khrplatform.h'
>>>>
>>>>
>>>> /usr/include/KHR/khrplatform.h is the egl platform header file, provided
>>>> by both mesa and RPI userland. Does mesa end up in your gtk+3
>>>> recipe-sysroot
>>>> somehow?
>>>>
>>>> For clarity: this could be a bug but it is unlikely to be related to the
>>>> libepoxy change (it does not use or ship the actual header file).
>>>>
>>>
>>>
>>> Actually this was maybe fixed by Otavios upgrade to mesa 17.1.4 -- mesa
>>> accidentally shipped khrplatform.h even when egl was disabled (which is
>>> what
>>> mesa-gl in oe-core does).
>>>
>>
>> Sorry, I've not had enough  coffee. It was the other way round:
>> khrplatform.h is the platform header that mesa now thinks is needed
>> whether
>> egl is enabled or not -- so they've started installing it in any case from
>> 17.1.4 which means mesa-gl now provides khrplatform.h and thus conflicts
>> with userland.
>>
>> I don't know what the correct fix is yet, just wanted to correct my
>> original
>> wrong info.
>>
>
> Post an update to sync this header for userland package.
>
>
> Will this help solving the gtk+3 issue of mesa-gl and userland now both
> providing the same header and causing recipe-sysroot construction to fail?

No it certainly would not. But we can then decide who provides it, in
a easy way.

