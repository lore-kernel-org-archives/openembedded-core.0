Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id C7D22607BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 08:54:01 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so15017300pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=fQ18Dzuru788Xakb1alDkAfr6kl+oLDAOiz8ZSuENkg=;
	b=p7eY+13NUsuOaxsTa011Gj9pn0rTH7uXXjOaTdVdHPZ1rjIMHPp6brSdUyCjMKkfKq
	I0N2qKNrKW5TS+t8YvY49dBIsaeN3cLBW3UEa4lRAs/KkncJCd5JaHu25B4O+Mr/3r36
	dFHQ9SJ786Pw/avWJOyy6P1RI2z9/vh7DiQYVybkrFGjKgW8NLiJ7p9jfm4giG11n15Q
	b9CEqpc0iOAGa5m0pzWYtPscC70DUU/+BZxxbDN2szWCNb48WE1VvUuEu3rJM+nb0clX
	pirCDQwdwOc7tAdlCCqfkAh5BP9pezTU/PUAdDZIb+wZXx/S+Rbalac+goHoLjaDuC0q
	TCfA==
MIME-Version: 1.0
X-Received: by 10.70.91.104 with SMTP id cd8mr52637182pdb.94.1432025642772;
	Tue, 19 May 2015 01:54:02 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Tue, 19 May 2015 01:54:02 -0700 (PDT)
In-Reply-To: <59DAE1C4-3DB3-44B8-A036-927EBD67C212@gmail.com>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
	<CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
	<CAP9ODKqpnGVrBNh9PekyZJJBzRnjs9mfELM3afHTmT=0UDEegw@mail.gmail.com>
	<CALbNGRSnxG0ZmFH2sAFL0B3uEy3mi97t30fSnn2JCSyFLr9Pdg@mail.gmail.com>
	<CAP9ODKp1-e6oiv6oKUJ5aTPjYMBJL9YtF+16Gt=cooC+4LEdYw@mail.gmail.com>
	<CALbNGRQPU2ToHpwcD6GA+TOz4zS2sJV8dXgbZsufn=9Pg-Pn3Q@mail.gmail.com>
	<CAP9ODKo3MhRR_2OW4Xgg6GMkdV-ykD3AvrRRQU9n0pF1xqh4rQ@mail.gmail.com>
	<59DAE1C4-3DB3-44B8-A036-927EBD67C212@gmail.com>
Date: Tue, 19 May 2015 10:54:02 +0200
Message-ID: <CALbNGRTA-rPDinuWqDzdRK=jmY6wYJ_Li_NGCkoO52G-t+U1+A@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 May 2015 08:54:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 5:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On May 18, 2015, at 6:12 AM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
>>
>> On Mon, May 18, 2015 at 10:08 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Mon, May 18, 2015 at 2:50 PM, Otavio Salvador
>>> <otavio@ossystems.com.br> wrote:
>> ...
>>> overestimate please. Still what about angstrom + imx6qsabresd?
>>
>> No clue. I personally don't use Angstrom and I don't know what the
>> distro does. You can instrument the class code to see if you find
>> something useful and I can assist in how to address the issue. I just
>> don't have enough time to debug this myself.
>
> It has nothing to do with Angstrom, I checked meta-fsl-arm and here it go=
es
>
> conf/machine/imx6qsabresd.conf
> =E2=80=A6.
> SOC_FAMILY =3D "mx6:mx6q=E2=80=9D
> =E2=80=A6
>
> Then
>
> conf/machine/include/imx-base.inc
>
> =E2=80=A6.
> # Float-Point setting
> # handled by software
> # DEFAULTTUNE_mx6 ?=3D "cortexa9-neon"
> # handled by hardware
> DEFAULTTUNE_mx6 ?=3D "cortexa9hf-neon=E2=80=9D
> =E2=80=A6.
>
> Here you are saying all mx6 machines which don=E2=80=99t choose their DEF=
AULTTUNE are not thumb capable
> and hence =E2=80=98thumb=E2=80=99 does not get into TUNE_FEATURES
>
> IMO changing defaults for mx6 to use cortexa9t2hf-vfp-neon would be most =
close to h/w capabilities.
>
> and when we say my default instruction set is thumb then it errors out. O=
fcours one could argue
> that message could have been better but atleast it did not do the wrong t=
hing
>
Hi,

thanks very very much for support.

As you might guess TUNES are still a matter I do not yet understand -
please no comments :).

So to get build working again - also for variscite machine - I
commented out DEFAULTTUNE_mx6 in conf/machine/include/imx-base.inc.

Maybe somebody could jump in to get the combination of meta-fsl-arm /
meta-angstrom working with a proper fix?

Thanks again

Andreas

