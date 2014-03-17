Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id A10A56F799
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 16:11:40 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id b6so5453189yha.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=0k2tztRFiUdhrrKdd9ay4QVQC+89KdamgIlBklPkAbM=;
	b=gWAsYpPwsdpBk6is4KasXpVxv3dzc1ewXRPmg4RJkkxWPj2XM5UtxIZWjF9i/EIlNt
	PE9oWZk6jqEGwmIjliVX78ZZy8Y/P0buYkaWAM+MCcRZVDqnCKeRLlyeE0ZJtnpi7XwT
	W44Cxnm64yPlPO56cSDtm4x8EgnkZRFJ54Lke+ZyyqW4Y/60Uaq8vNBISOlLdwLc7zoB
	Q5HCsHK37ljOZU/GiS5KzzIgCFHHnTSo0b/8ulvNCicjZjFLyV3+xAkFyajD/6/1+SNA
	RCpyf+M74bKiSFhMDC5kva+Xpjk/TBJdeKdrfCTgvPPXwP6IUsbNTRYHS8xkbVG24/8k
	ndTA==
MIME-Version: 1.0
X-Received: by 10.236.118.212 with SMTP id l60mr11700582yhh.78.1395072701363; 
	Mon, 17 Mar 2014 09:11:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 17 Mar 2014 09:11:41 -0700 (PDT)
In-Reply-To: <CANFVK7_uz3pr=WTdjqg8eXnfQzCSPnvaQq+kymud=YTj-8AV9g@mail.gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<CAP9ODKoAeOS46F4LqnaMGfJ_5QJKo=vnnRLOgHU0sRC4imRz3Q@mail.gmail.com>
	<CANFVK7_uz3pr=WTdjqg8eXnfQzCSPnvaQq+kymud=YTj-8AV9g@mail.gmail.com>
Date: Mon, 17 Mar 2014 13:11:41 -0300
X-Google-Sender-Auth: tUAj7h7xB0n-_mtZ7v7Sh1qWIag
Message-ID: <CAP9ODKqVPgoyH_XveWsJugSyHfBd0q0cccKWD2wkTMg7dKJd-Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Jo=E3o_Henrique_Freitas?= <joaohf@gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Mon, 17 Mar 2014 16:11:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Joao,

On Mon, Mar 17, 2014 at 12:47 PM, Jo=E3o Henrique Freitas
<joaohf@gmail.com> wrote:
> On Mon, Mar 17, 2014 at 11:53 AM, Otavio Salvador <otavio@ossystems.com.b=
r>
> wrote:
>>
>> So this allows you to include 'a directory' as source of a partition
>> to be created, right?
>
>
> Yes.
>
>>
>>
>> If my understand is right, I like the feature. My only concern is
>> people overusing it and adding contents which are not 'tracked' in the
>> build system in a product release which seems attractive when we first
>> think about it but cause some management, tracking and authenticity
>> check problems in long term.
>>
>>
>> I don't know how to better address this from wic perspective. Usually
>> we end doing multiple images as part of the build process for those
>> special cases and I don't know how wic could be 'told' about those
>> secondary rootfs existence.
>>
>
> I agree that this could be a problem. I will start to think a way to pass
> --image param. Like this:
>
>  part /standby --source rootfs --image=3Dcore-image-xpto \
>
>      --ondisk sda --fstype=3Dext3 --label secondary --align 1024
>
> So, wic could check it and add management, tracking, authenticity.
>
> Do you have any suggestion?

No, I don't. I think passing an image helps a lot.

We've been not using wic at O.S. Systems as we've not been working in
PC-style (EFI and BIOS) boards for a while. We started some discussion
with Tom about how to better flexibilize wip so we can also use it for
ARM based systems and extend it by BSP basis but didn't find time to
work on this yet.

It is nice to see more people involved with it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

