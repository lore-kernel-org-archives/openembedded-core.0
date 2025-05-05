Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3428C3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 08:18:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.45279.1746433108225574918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 01:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PzBIYN3b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F07711FD42;
	Mon,  5 May 2025 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746433106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zEuscXBnB2clTvs/vH/7f1WjpuM5bPo9eC1s47HtZtE=;
	b=PzBIYN3bwRiRL1ka3ecYmUvWOT8/Hqkji3vpQRJt/is/cvhB9pMko4G/bjK6IUJhAqt0cF
	h7qCin67unnqtdN8i0ayUx3+mnq9r5etnh7JnOQZMCnO4+oDKLqugaKgZgc7dyy8tsKTd6
	VohUpTO7BnDUWHl8CyQej2PTkR1VNoPwVHKQq52G22UabaBFZpWft+FFs3Bivc4TnWuWWw
	NWq0BvIxZDK8wLPi/JiOkVd6MPULwfde7eRwu8KNS8rbD55KqVRfx8pKiB+JFvPfMbQxO2
	PV7JpEJnsB65c5HH0N3Ddxa05uqbggP7LgG6UYNxP/EFrptTRBEIY4BpjAxFjw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 May 2025 10:18:25 +0200
Message-Id: <D9O2V8V3WK87.2HZ8Q0QX1AL5W@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] gcc: Upgrade GCC to 15 release
Cc: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>,
 "Joshua Watt" <JPEWhacker@gmail.com>, <martin.jansa@gmail.com>,
 <richard.purdie@linuxfoundation.org>, "swat" <swat@lists.yoctoproject.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Anuj Mittal" <anuj.mittal@intel.com>, "Bruce Ashfield"
 <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250426233051.4169011-1-raj.khem@gmail.com>
 <aa23d298b8b9f09372b417efa00547e4a42d432f.camel@linuxfoundation.org>
 <CA+chaQchL+vr2WSLtvoxRLTeEVb0Rk3wsrAQ4tNYYAY5aRdncA@mail.gmail.com>
In-Reply-To: <CA+chaQchL+vr2WSLtvoxRLTeEVb0Rk3wsrAQ4tNYYAY5aRdncA@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeifedtudevvdehkeduteefledvjeekveevvddufeetgeevueevleejvddviedtvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgnhhurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprghnuhhjr
 dhmihhtthgrlhesihhnthgvlhdrtghomhdprhgtphhtthhopegsrhhutggvrdgrshhhfhhivghlugesghhmrghilhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrthhinhdrjhgrnhhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehsfigrtheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 08:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215992

On Tue Apr 29, 2025 at 12:10 PM CEST, Martin Jansa via lists.openembedded.o=
rg wrote:
> On Mon, Apr 28, 2025 at 10:54=E2=80=AFPM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>>
>> On Sat, 2025-04-26 at 16:30 -0700, Khem Raj via lists.openembedded.org
>> wrote:
>> > * Nios2 has been removed and aarch64/ilp32 is deprecated
>> > * Default C dialect is switched to C23
>> > * {0} initializer in C or C++ for unions no longer guarantees
>> > clearing of the whole union
>> > * Compile speed improvements with LTO
>> > * Vectorizer can support loops with early exists but it is limited to
>> > loops
>> >   with fixed vector lengths
>> >
>> > This is major release of gcc, the changes are noted [1]
>> >
>> > [1] https://gcc.gnu.org/gcc-15/changes.html
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> > v2: Drop musl headers ordering patch
>> > v3: Rebased patches
>>
>> We're getting much closer. My selftest-ed change nearly worked, I'll
>> try a new version of that. If that works, we have left:
>>
>> util-linux ptest regression:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1396
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1393
>>
>> meta-mingw failure in libiconv:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/1521
>>
>> meta-intel failure in intel-mediasdk and intel-media-driver:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/1389
>>
>> meta-virtualization in ipxe:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1402
>
> I'm seeing few more failures from meta-virtualization with gcc-15:
> http://errors.yoctoproject.org/Errors/Build/205175/
>
> I've sent fixes for ipxe, irqbalance and work around for libvmi, which
> leaves dev86 from meta-virtualization (where the repo from SRC_URI
> doesn't even exist anymore).
>
> Cheers,

Hi Anuj, Hi Bruce,

These patches have now been merged on master, so we had build failures
for a few days now on the said recipes.

mesa-intel:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/1426

meta-virt:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1439

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


