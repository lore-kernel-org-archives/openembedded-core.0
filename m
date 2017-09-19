Return-Path: <matt@madison.systems>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9A098780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 11:47:28 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id l196so3414608lfl.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 04:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1OBDJpe0gXzUnJ/S2AYs9El5OHq5NO1tKiBGOvnjlfI=;
	b=s/fQvv4F+mBWiJp11tPo6gBbtHotDzWpu/XOfoJLCqfah0U2GaGCcRHvWcNhdpg3xV
	vb0cb+dNhRRHOhuQI2dV5Na43Wulfj0e8jqV4EflNGh7t27G7lvlujWoMPBzl3MiSeoM
	mOKyWZPcM64AxqHI+mkjfZ6hA56WL+5WMihVQhek2UqfsM4ujMw99Kn3Ks0a5WP8PCof
	7p5/hOVohOwIgoqT+cgUuhUBvDW3tabQL7aRgIReFnZZXlf7tiVGWA82C6Owuq+mmAmG
	Vcphx86sMoOQmSKySVJqUASclmtx+J6V/3CVxxNq5vU1t5Qs+ca9dm5UDm+lvmDY9syI
	836A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1OBDJpe0gXzUnJ/S2AYs9El5OHq5NO1tKiBGOvnjlfI=;
	b=MntIcw6e2Z07kiPHyguPGK57WGzDpMOUTrey5vf5eXQauFLYiENJhhh557+FYK+FxM
	d76Lpk0tVaBYPFW3CwfGeGJHHojJN0kYNgCftumDdpOvujqRlR40YqpWB/cYe8IIGgO+
	WXeM0Rm9em5Gfj/s49eVSS5W/UxXjeDicKxegqSRc9rfKZvQ07OXoFGQhpR8TlfhLMcq
	Qfra2qNV7nGyW6Fbdifdc0yI/94/9FqKcEnPIWsEG/sU82Cd9ZUCxOsXc2HY15Spkupr
	CZ1YNp2TUMrJP/8bry/QXKGMStM9ons2upSdQ/DwFfxKxyoY4ovz11e0Tt2khVavWO48
	7VyQ==
X-Gm-Message-State: AHPjjUgH0MZpRJacKZ9CK342iFDa1ruTuHN3pw/YyoF6ewetuavsWOJJ
	0n9+ieIOKtf4wZvcC2T0F2YSYaWvEQqO7gANSZ46fg==
X-Google-Smtp-Source: AOwi7QDutsvqpIh1KJ8XWPhbq438qwKFVSWimm4qQWwirJBZlWLUQaOzILxsIJDa23jFFruKu6lB1BdYw0xvMWLZhZk=
X-Received: by 10.25.16.87 with SMTP id f84mr491568lfi.172.1505821648909; Tue,
	19 Sep 2017 04:47:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.213.146 with HTTP; Tue, 19 Sep 2017 04:47:28 -0700 (PDT)
In-Reply-To: <CAMKF1spd-DuNQLT+iGCTVWDXcWzpsXyEGtUCeHFz953jF5e2Sg@mail.gmail.com>
References: <007BD92917A2324FA403BCF9A464CF84CF41E3E8@ALA-MBC.corp.ad.wrs.com>
	<20878500-1BB2-43F0-A6A5-087775FC0FAB@madison.systems>
	<b8a7eae3-2b65-e17d-efe0-f7efb113fd38@windriver.com>
	<CAMKF1spd-DuNQLT+iGCTVWDXcWzpsXyEGtUCeHFz953jF5e2Sg@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Tue, 19 Sep 2017 04:47:28 -0700
Message-ID: <CAGgRHJp27mt4P2pPRkJEQgoUnmD4VAbj83=dCSrZT=X=53NFEQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: go-runtime does not build for mips32r2 tune
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
X-List-Received-Date: Tue, 19 Sep 2017 11:47:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2017 at 4:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Sep 18, 2017 at 3:52 PM, Mark Hatle <mark.hatle@windriver.com> wr=
ote:
>> On 9/18/17 5:50 PM, Matt Madison wrote:
>>>
>>>> On 18 Sep 2017, at 2:11 PM, Slater, Joseph <joe.slater@windriver.com
>>>> <mailto:joe.slater@windriver.com>> wrote:
>>>>
>>>> This is the default tune for qemumips.  It appears that the problem do=
es not
>>>> occur for an oe-core checkout just before the split creating go-runtim=
e.
>>>>
>>>> Before the split, go-helloworld will build, but after the split it wil=
l not
>>>> because it needs go-runtime.
>>>
>>> There=E2=80=99s a TUNE_CCARGS_remove in go_1.9.bb to remove the =E2=80=
=98-march=3Dmips32r2=E2=80=99 flag
>>> that probably either needs to be moved to a .inc file or copied to
>>> go-runtime_1.9.bb.  Missed that when splitting out the runtime recipe.
>>
>> That seems wrong.  We should be using the TUNE_CCARGS, and -not- using t=
he
>> arguments that 'go' has decided must be right.
>>
>> Otherwise the optimizations may or may not be compatible... and if someo=
ne
>> selects different arguments, they won't get filtered.
>
> go supports mips32r1, and needs fpu or kernel FPU emulation enabled
> so using mips32r2 might be fine back when I was adding it to oe-core it
> did not work, things might be different with 1.9 release where mips
> support is complete in golang.

It's still mips32r1, though, and the go build tool explicitly adds
'-march=3Dmips32 -mabi=3D32' when invoking the C compiler for cgo.

-Matt

