Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3D26565D19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:34:45 +0000 (UTC)
Received: by padbw4 with SMTP id bw4so59156611pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 01:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=sJRSSUBUcLIIlOU7xB8bN/xpWWrk4hrdhtLdN5tUtbQ=;
	b=t+rPni3Q2u8GLQDjl+YEYdCG8N9pOVrJb/hMRYER8l6YVXzIhSkdWC9tZZL/WwCnx0
	4vdJomYQjw0EoxYbkgYfT2WfQD/QrBOu45UCJI/mnn+oyV4+0s68+rprL/1e9ywrBMWr
	m4NDgQKOh+0N4VjcD2xplxFybDe9HrP38ve8fHxDjpbuRQjvtK9pxhBt7h1WeHlYxx0T
	p2fC1YCePsaVSFYiZv3z3OL5D0g1HM42/JraQCth27QiHUanicajBcNOWPWK7yMuX4/s
	HZIuQcDBqUmZtqFCLj0Au4dISeIjaOAdUTODXK4oaHW2cx89a/D1DRwJS873Ikzqwb6a
	zCjQ==
MIME-Version: 1.0
X-Received: by 10.68.205.67 with SMTP id le3mr62461861pbc.94.1432110887091;
	Wed, 20 May 2015 01:34:47 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Wed, 20 May 2015 01:34:46 -0700 (PDT)
In-Reply-To: <CALbNGRTA-rPDinuWqDzdRK=jmY6wYJ_Li_NGCkoO52G-t+U1+A@mail.gmail.com>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
	<CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
	<CAP9ODKqpnGVrBNh9PekyZJJBzRnjs9mfELM3afHTmT=0UDEegw@mail.gmail.com>
	<CALbNGRSnxG0ZmFH2sAFL0B3uEy3mi97t30fSnn2JCSyFLr9Pdg@mail.gmail.com>
	<CAP9ODKp1-e6oiv6oKUJ5aTPjYMBJL9YtF+16Gt=cooC+4LEdYw@mail.gmail.com>
	<CALbNGRQPU2ToHpwcD6GA+TOz4zS2sJV8dXgbZsufn=9Pg-Pn3Q@mail.gmail.com>
	<CAP9ODKo3MhRR_2OW4Xgg6GMkdV-ykD3AvrRRQU9n0pF1xqh4rQ@mail.gmail.com>
	<59DAE1C4-3DB3-44B8-A036-927EBD67C212@gmail.com>
	<CALbNGRTA-rPDinuWqDzdRK=jmY6wYJ_Li_NGCkoO52G-t+U1+A@mail.gmail.com>
Date: Wed, 20 May 2015 10:34:46 +0200
Message-ID: <CALbNGRSeZ7CZtbJd2U6iGu+ARgT3hi9CdC5xO7iwwipk89D=4A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: trouble related to oe-core update
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
X-List-Received-Date: Wed, 20 May 2015 08:34:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 10:54 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, May 19, 2015 at 5:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On May 18, 2015, at 6:12 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>>>
>>> On Mon, May 18, 2015 at 10:08 AM, Andreas M=C3=BCller
>>> <schnitzeltony@googlemail.com> wrote:
>>>> On Mon, May 18, 2015 at 2:50 PM, Otavio Salvador
>>>> <otavio@ossystems.com.br> wrote:
>>> ...
>>>> overestimate please. Still what about angstrom + imx6qsabresd?
>>>
>>> No clue. I personally don't use Angstrom and I don't know what the
>>> distro does. You can instrument the class code to see if you find
>>> something useful and I can assist in how to address the issue. I just
>>> don't have enough time to debug this myself.
>>
>> It has nothing to do with Angstrom, I checked meta-fsl-arm and here it g=
oes
>>
>> conf/machine/imx6qsabresd.conf
>> =E2=80=A6.
>> SOC_FAMILY =3D "mx6:mx6q=E2=80=9D
>> =E2=80=A6
>>
>> Then
>>
>> conf/machine/include/imx-base.inc
>>
>> =E2=80=A6.
>> # Float-Point setting
>> # handled by software
>> # DEFAULTTUNE_mx6 ?=3D "cortexa9-neon"
>> # handled by hardware
>> DEFAULTTUNE_mx6 ?=3D "cortexa9hf-neon=E2=80=9D
>> =E2=80=A6.
>>
>> Here you are saying all mx6 machines which don=E2=80=99t choose their DE=
FAULTTUNE are not thumb capable
>> and hence =E2=80=98thumb=E2=80=99 does not get into TUNE_FEATURES
>>
>> IMO changing defaults for mx6 to use cortexa9t2hf-vfp-neon would be most=
 close to h/w capabilities.
>>
>> and when we say my default instruction set is thumb then it errors out. =
Ofcours one could argue
>> that message could have been better but atleast it did not do the wrong =
thing
>>
> Hi,
>
> thanks very very much for support.
>
> As you might guess TUNES are still a matter I do not yet understand -
> please no comments :).
>
> So to get build working again - also for variscite machine - I
> commented out DEFAULTTUNE_mx6 in conf/machine/include/imx-base.inc.
>
> Maybe somebody could jump in to get the combination of meta-fsl-arm /
> meta-angstrom working with a proper fix?
>
> Thanks again
>
Would like to get a solution for this and see 2 ways to go in imx-base.inc:

1. allow thumb:
<snip>
# Float-Point setting
# handled by software
# DEFAULTTUNE_mx6 ?=3D "cortexa9t-neon"
# handled by hardware
DEFAULTTUNE_mx6 ?=3D "cortexa9thf-neon"
</snip>

2. if thumb2 is not allowed (why?):
<snip>
# Float-Point setting
# handled by software
# DEFAULTTUNE_mx6 ?=3D "cortexa9-neon"
# handled by hardware
DEFAULTTUNE_mx6 ?=3D "cortexa9hf-neon"
ARM_INSTRUCTION_SET =3D "arm"
</snip>

Opinions?

Andreas

