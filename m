Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0944A78829
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 00:07:20 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id o71-v6so470437vke.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 17:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CF43ONBNrw6TzYmj84roSzydpguFTxcnQUatC3POkIY=;
	b=N2Vqbv2flaOgWkf0YvN/aPiVFsvPU+zewFSUuTpl4G3yas0ipxHiQoSgebm0DR8uCO
	4TXMv7d7HVK8QcXatHdYEtHcVgY02C8dnfUcuJq9mUz3r5XqYm9QzdGOuDlSdxLPvOAw
	To6JzgyUfqF+CufZ3yC5FhX3CsQLdajlRZhd7kYItXCO+gVHtKQZ+Nj0SI/PJCXIDIIf
	QDvR5dKPtnl+INqQfPt73qoJfnMIAN/hyFEs8mU+yZqFxzK0Ks2xcMDXTY/6DmqkfSlG
	nyQMSVarQRAUZ3FAURDSXFllqSgn6Fz2zkvpjFTAGR1AO8tWHqCZsWW7vGkoidNb/g25
	S7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CF43ONBNrw6TzYmj84roSzydpguFTxcnQUatC3POkIY=;
	b=VdBhXOq7hWE5Lnv1EoUZdUQGxu61k3vl+5n98ZDGugUXezDecifQ+0Wob2/vg3GHry
	5cc2wVHFcpYjlLrafilLvCa9h1SllptyQqYf9YRYSS1eVWKH3M850IPbbTDCjSy+sQZe
	cRmPT2Y3Ge4cVtreWqIfYcEYml/fBOZZ2oau/+pyZTbk5IFZqNHkHzrwI7gOtSJ2inzb
	o1oG5sqSIvckb+Oz63iK5BRf78iYjFvt6jTp8I3mt6bsXz4jIOpH7vJZplGWZeb0vtTu
	7GU5gGsibLqY4Gfg9LBC5JPq2ootiSQdYtoFzl8xSAX2pQ//EZPzfc+n5hOdJsF+u0z0
	FK+A==
X-Gm-Message-State: APt69E1l7iPCpBWMRTkqXrvOVrCJUPejwTA9Uxtm4eg+wrgpKfEcrefN
	lV55YgNjFmazaoFmbDfzhGm0dJRP0IMeUR4rcZk=
X-Google-Smtp-Source: ADUXVKLOxPkk9NJ2ocFYGH7xPQLUfaRDAIXbNUniAOr8ejQvIVwIGtidtaqdvkpPtPV1pu+5iXux9Z3u7LhxLvQ7rf4=
X-Received: by 2002:a1f:e9c3:: with SMTP id
	g186-v6mr1693245vkh.194.1528848441922; 
	Tue, 12 Jun 2018 17:07:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 12 Jun 2018 17:07:21 -0700 (PDT)
In-Reply-To: <4A3CB614-C2DB-45B3-B28E-E91CAB654253@neuf.fr>
References: <20180609062628.32364-1-ayaka@soulik.info>
	<F1A6604B-E5BB-413F-B7AF-0EC7B85D5C12@dominion.thruhere.net>
	<002901d40230$0fa25690$2ee703b0$@neuf.fr>
	<ce3746c4-8919-2982-e5d9-060578057c70@windriver.com>
	<003401d40264$f548ef90$dfdaceb0$@neuf.fr>
	<16c1a187-66ef-dfb1-e8cc-4a63a75e947b@windriver.com>
	<CAJ86T=XPaV78aURUKY8bywmvD57hQacAfQ+jJ8ryf2pAYABYhw@mail.gmail.com>
	<4A3CB614-C2DB-45B3-B28E-E91CAB654253@neuf.fr>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 12 Jun 2018 17:07:21 -0700
Message-ID: <CAJ86T=Xu6VqBYzxNODmPk6amktXh0CfVtUceF5zdoD2RAp8g1w@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/4] Add tune for ARMv8 and some cortex processors
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
X-List-Received-Date: Wed, 13 Jun 2018 00:07:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2018 at 4:32 PM, Herve Jourdain <herve.jourdain@neuf.fr> wr=
ote:
> Hi Andre,
>
> I believe I did say always present on armv8 and armv7, I did not mean bef=
ore that.

Right. The point of considering older architecture levels was that IF
we were to drop support for armv4 (I'm not necessarily suggesting that
we do) then we could simplify the tuning files quite a lot, since then
every supported ARM core would support Thumb.

> Having separate tunes for thumb support was necessary on previous archite=
ctures where it was optional, but it persisted for architectures which made=
 thumb mandatory.
> I=E2=80=99m not even advocating removing the tune option for previous arc=
hitectures that would normally not require it, but I believe we should get =
rid of it for new ARM architectures.

We all seem to be strongly agreeing with each other :-)

BTW, I don't know how much history you've aware of from when this
topic has been discussed previously on the list (it's come up a few
times...). There are people who've created distros etc which do
actually rely on being able to define (for example) an armv7a machine
without Thumb support, even though such a thing doesn't actually
exist. So, as much as we might all agree that removing the option to
disable Thumb support for armv7a etc might be "the right thing to do",
in practice there are going to be people who object to it.

> Cheers,
> Herve
>
>> On 13 Jun 2018, at 04:39, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>>> On Tue, Jun 12, 2018 at 1:00 PM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>>>> On 6/12/18 10:49 AM, Herve Jourdain wrote:
>>>> Hi,
>>>>
>>>> So I agree with you about restricting to what gcc can support, that's =
actually my proposal (actually, probably a subset of what gcc can support).
>>>> So for armv8, gcc supports, as architectures: armv8-a, armv8.1-a, armv=
8.2-a, armv8.3-a, armv8.4-a.
>>>> Then, you can add the supported options with a "+" after the architect=
ure.
>>>> Options supported for armv8-a are: '+crc', '+simd', '+crypto', '+nocry=
pto', '+nofp'
>>>> Options supported for armv8.1-a are: '+simd', '+crypto', '+nocrypto', =
'+nofp'
>>>> Options supported for armv8.2-a and armv8.3-a are: '+fp16', '+fp16fml'=
, '+simd', '+crypto', '+dotprod', '+nocrypto', '+nofp'
>>>> Options supported for armv8.4-a are: '+fp16', '+simd', '+crypto', '+do=
tprod', '+nocrypto', '+nofp'
>>>>
>>>> As you can see, proposals for armv8-a, whether my previous one, the ne=
w one here, or even the one I have updated and used in production, just cap=
ture the existing complexity, and not add to it.
>>>> and support for armv8.1-a, armv8.2-a, armv8.3-a, armv8.4a will only ad=
d more options down the line.
>>>
>>> Sounds a lot like the above would be TUNE_FEATURES to me..  (even if we=
 don't
>>> necessarily define a tune that uses them -- if it's standard another la=
yer
>>> certainly could.)
>>>
>>>> Regarding fpu, gcc supports the following for armv8: fp-armv8, neon-fp=
-armv8, and crypto-neon-fp-armv8.
>>>>
>>>> Regarding cpu, I believe that the armv8 supported ones are: =E2=80=98c=
ortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99, =E2=80=98cortex-a53=E2=80=
=99, =E2=80=98cortex-a55=E2=80=99, =E2=80=98cortex-a57=E2=80=99, =E2=80=98c=
ortex-a72=E2=80=99, =E2=80=98cortex-a73=E2=80=99, =E2=80=98cortex-a75=E2=80=
=99.
>>>>
>>>> I personally would like to keep tuning for a specific CPU as much as p=
ossible (again I'm working closely with various ARM-based SoCs, so my opini=
on might be tainted).
>>>
>>> Thats a lot of options, but if we focus on TUNE_FEATURES, I think it's =
a bit
>>> more reasonable to support all of this.. (maybe that is what needs to b=
e done in
>>> the future as well for other architectures.. focus on the 'gcc' behavio=
r and
>>> generate TUNE_FEATURES matching the compiler.)
>>>
>>> I'd like Khem's opinion on how crazy of an idea that is.
>>>
>>>> One thing that could be done to simplify things would be to just use t=
he cpu, and add the options to it. Gcc supports adding options to the cpu.
>>>> '+nofp' for =E2=80=98cortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99=
, =E2=80=98cortex-a53=E2=80=99 and =E2=80=98cortex-a55=E2=80=99
>>>> '+crypto' for =E2=80=98cortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=
=99, =E2=80=98cortex-a53=E2=80=99, =E2=80=98cortex-a55=E2=80=99, =E2=80=98c=
ortex-a57=E2=80=99, =E2=80=98cortex-a72=E2=80=99, =E2=80=98cortex-a73=E2=80=
=99, =E2=80=98cortex-a75=E2=80=99
>>>>
>>>> That could simplify the tune settings, but would give less control tha=
n what we currently have.
>>>> As you might have guessed, I do put a specific emphasis on the crypto =
option, and on the neon option, which are the most interesting for armv8 in=
 my opinion.
>>>
>>> In the past 'crypto' options have only been assembly.. if that's change=
d it has
>>> definitely opened up a new facet in all of this work.
>>>
>>>> Regarding thumb, always adding it to the tune without creating specifi=
c variants with or without thumb makes sense, since the tune is normally ab=
out the SoC capabilities, and arv7 and armv8 both support it.
>>>> You can always select whether you want thumb or not by setting ARM_INS=
TRUCTION_SET appropriately at the distro level.
>>>
>>> Yes, that might be needed now that thumb is theoretically always suppos=
ed to be
>>> present.
>>
>> It's not _always_ present - it's missing for armv4 CPUs such as StrongAR=
M.
>>
>> However the option has been unnecessarily propagated into tuning files
>> for higher architecture levels where support for Thumb _is_ always
>> present.
>

