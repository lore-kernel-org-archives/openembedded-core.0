Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1761560053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 08:47:34 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x190so21895487vka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=WfD2km8w+tM8yYY5qe26HGB9AFTy9XPnBTN1g4L3aAY=;
	b=bwokK15wo0gE7VVPRti5i0U3mpRgzPO3QgM5xVXtd0IIw6loV16Wr0jjUmva+tiCK0
	iVjjQTfqbdcvOQqzj6BXvAT5A1UsuPb+xv6hqjKQzMYNELZ2kT0axhkPYRttB+GWuiaX
	IlR+1h8b5P63i0dGvd3+9PHShwOvFAqNq8/gCGf8IhRKNTzJQmGl6HQH7hR7Nybil5Fs
	gn3pVGkn2LhsqBjmMuPK6ge/yRQOVdOKOyDtFPD8EY+SYiKQGPA7wB1bdRClN/nA7AFW
	PXIFzp9XBzIweOvgMrru7Mrl65/PFHXZdkB8TU7P8Z+1Qd6C19Hya9pYe8fHpSp3yLvA
	S4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=WfD2km8w+tM8yYY5qe26HGB9AFTy9XPnBTN1g4L3aAY=;
	b=faCm2w/gYIuiTZRgWEZv6TZntEFU9UbxkviMbMojLwKyxE9Vaz4x2pumzdCPcPPOYH
	7RXpSezbVxl4D/5nhEnxedQos1mLo6PEiCFfoV27nCG1iyG5u24SO3YyKrRpsI7tqPlh
	ZE+Gg0hlk+9H3KGWXYxGL/CPHDhpLttoPwnMj0HALnC2vffNa/Wup2dCAcvpl4K3aZkH
	fyevj2I2fm01kIhbjXgA+ctf8wzp6EKwvpztgLCKwBXi02HPiFEuNMY9IqJwsMmxXLRv
	UFMlXNQW6L0gHiwarZQecmUUxQT5nUsxVEIxvw91a2WcIF+XIef6+FFB6Lrly6GNsPQW
	Y+pg==
X-Gm-Message-State: AOPr4FXoMmN73g1xkVWdieKQbZmKMJs2bJjKtzEjM/LECeeL6HwXLpVVdwQOWsLFafJO+HJ9GonKbhFQkp7BIA==
MIME-Version: 1.0
X-Received: by 10.159.36.15 with SMTP id 15mr4963886uaq.48.1460969255103; Mon,
	18 Apr 2016 01:47:35 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Mon, 18 Apr 2016 01:47:34 -0700 (PDT)
In-Reply-To: <57149B89.2090607@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
Date: Mon, 18 Apr 2016 10:47:34 +0200
Message-ID: <CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 08:47:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 10:32 AM, Hongxu Jia <hongxu.jia@windriver.com> wro=
te:
> On 04/18/2016 04:23 PM, Andreas M=C3=BCller wrote:
>>
>> On Mon, Apr 18, 2016 at 10:11 AM, Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>>
>>> On 04/18/2016 04:09 PM, Andreas M=C3=BCller wrote:
>>>>
>>>> Has anybody tried remote debugging with this patch applied? For me the
>>>> source files are no more found and I think this patch looks
>>>> suspicious...
>>>
>>>
>>> What's your build steps?
>>>
>> Don't understand your question I guess. I build by bitbake <image> with
>>
>> INHIBIT_SYSROOT_STRIP =3D "1"
>>
>> and set sysroot to build sysroot - see [1].
>>
>> [1]
>> http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118=
635.html
>
>
> Do you install *-dbp pkgs to your image? In the following example, we use
> gdb to
> debug gzip.
Ehm dbg packages?? No - I just want remote debugging
>
> Test steps:
>
> 1. vim local.conf
> ------
> IMAGE_INSTALL_append =3D " gdb gcc gzip"
> EXTRA_IMAGE_FEATURES_append =3D " dbg-pkgs"
> ------
>
> Currently, The ${S} locates in 'work-shared' dir could not generate sourc=
es
> (such as gcc),
> and ${S} located in WORKDIR works (such as above gzip).
OK no problem - the application I wanted to debug is qt5-creator. This
has worked in the past.
>
> And now I start a new building to verify the suspicious you report.
>
> //Hongxu
>
>>
>> Andreas
>
I cannot check further at the moment: At work currently I have jethro
which debugs fine. The machine with which I detected the issue is at
home close to master.

Andreas

