Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id C5AEC6BDE3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:39:10 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id t5so3299036ljk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 05:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sc2wa9lHswfCToTfCYGX1EwlYXmlYOm8U5wgmxS8M38=;
	b=EmGhuXnPvPvxbvprO9WdCRFASUHGboVpMAD49Me8vCZsmn+gVe7q/SqAVPepFWqGXt
	xRPqdLZR499VDLke+Nk1fJZQjq+Ck0rAX+G1gK9DmoyyMusNaGconixGQzM71HytHd+i
	w8urnIpOrF7y75JDiPUK+n2IUETxQHtZHscNGt3RSfnBsE0KFou5zGmRKNGEmKw5NiEJ
	30m1jwQ75q3a2tecynurRnFmdxNMKAyOkCLMc/JguNoandjFGSLWSI1cC/ObajesBBpl
	4yZYDeRtZyW2CR9+hk4h2H2KrBfEaBQqyNOqZ+GRaIeVDm0Km0zhdQSeK+Sq73xDqqQH
	50aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sc2wa9lHswfCToTfCYGX1EwlYXmlYOm8U5wgmxS8M38=;
	b=kyIi3spbyO6XsJWjL/adgq04ku6G+5OSF7XdznF9UKLQ8+9+w7egvjPjZ3Ze9x6W4y
	g8zbR6Ks4YaoP+7lhXhjn736XHgM0rdSQXuuxcwTz3qS8ZB+uwYmOqlwTlGcFvy8aZLh
	A7IFxcQ0j90QVIkgoivaKgsHDXdkujLK3cqpPo+4Wcvu2wmLtut8WmjZbR6e2aL20zQG
	L+g9yXSutT0kdCGhtX8pLW/jekZuzAa78oqCQU5riTn8XMp8mYRm6nqYRRs/kbji5vX5
	c5IOG6z/9AK8/H/Pr6aMJelg/49I4kwolRUtjDG/TMC+JLIs+7+kYw3R2AHfpIqAq032
	cFng==
X-Gm-Message-State: APjAAAWijgGL8mO3ZHEpa0dmiR3K9t+6QyyvR3dVth76onDgb1nH5EZL
	bXUK/8204SOUiGxwFJ1oVWt9QJ6fzoFDS9o5EGU5Qw==
X-Google-Smtp-Source: APXvYqxF9GDLvktNP6R4T5xrryszpewwXygKlF3QN8Ii9XJjjJQAA4Hu9fjkjrfe1zfWzBbW0SrhbGf8XlLM3bisCME=
X-Received: by 2002:a2e:898a:: with SMTP id c10mr7521481lji.177.1574343551113; 
	Thu, 21 Nov 2019 05:39:11 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
	<CAD0U-hKMtXR+tvpS45D9=+XqaZVZBs7jMm9U3Vk7r+mJuVW5-A@mail.gmail.com>
	<CAD0U-hJ96imEfDwAyMQyjvABmaNYxEexQWNvpHJr+wsNzpGSbw@mail.gmail.com>
	<CAJ86T=Ucx125+XdRrpnh64km1WypAyyc1fUN5pWbjXzmUSXu3g@mail.gmail.com>
	<CAD0U-h+RGNRr2omcsCdKkD7qsnbQiGqW3MzGc93ZtgmVXEagLA@mail.gmail.com>
In-Reply-To: <CAD0U-h+RGNRr2omcsCdKkD7qsnbQiGqW3MzGc93ZtgmVXEagLA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 21 Nov 2019 14:38:58 +0100
Message-ID: <CAP71WjyEBYf-XaaMGceZ_+78=vJKGT6=n_3HnRk_OXkZEBm8UQ@mail.gmail.com>
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Thu, 21 Nov 2019 13:39:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 2:15 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:
>
>
>
> On Wed, 20 Nov 2019 at 23:53, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Wed, Nov 20, 2019 at 2:41 PM Ryan Harkin <ryan.harkin@linaro.org> wro=
te:
>> > On Wed, 20 Nov 2019 at 21:29, Ryan Harkin <ryan.harkin@linaro.org> wro=
te:
>> >>
>> >> I pulled the whole openssl dir from your repo, added the layer.conf c=
hanges to my layer.conf and rebuilt openssl and my image.
>> >>
>> >> Unfortunately, I still have no /usr/bin/openssl in my disk image. So =
I've added the RPROVIDES from Andre's in a vain attempt to get it to work:
>> >>
>> >> RPROVIDES_${PN} +=3D "openssl-bin"
>> >>
>> >> ... although I'm not hopeful it'll do the trick...
>> >
>> > It didn't work. Once thing that's puzzling me: where is the package "o=
penssl-bin"? I can only find references to it, but no package.
>>
>> The "openssl-bin" package is created by the openssl 1.1.x recipe.
>>
>> Adding "openssl-bin" to RPROVIDES in the openssl 1.0.2 recipe is a
>> solution for users who are switching from openssl 1.1.x back to 1.0.2
>> and have an image which is tries to include the new openssl-bin
>> package. I don't think that's what you are trying to do (?).
>
>
> Correct. I only tried it because the 1.0.2t recipe wasn't working.
>
> To be clear - I have /usr/bin/openssl in my image when using 1.0.2p from =
the Poky Sumo branch. When I add the 1.0.2t recipe to my own layer, openssl=
 builds without errors, but I don't get the binary.
>
>>
>> If you are using openssl 1.0.2 then the openssl command line tool is
>> in the openssl package... so to include the openssl command line tool,
>> add the "openssl" package to your image.
>>
>> If you are using openssl 1.1.x then the openssl command line tool is
>> in the openssl-bin package... so to include the openssl command line
>> tool, add the "openssl-bin" package to your image.
>>
>> But anyway, in all cases, the way to debug what's going on isn't to
>> try random recipe changes and then rebuild the final image. Instead
>> you should build your chosen version of openssl, look in the
>> packages-split directory to see which package includes the openssl
>> command line tool and then add that package to your image.
>
>
> I don't have a packages-split. I was unaware of it, and reading the manua=
l, it seems I should have one. But I don't. Running 'bitbake -e openssl | g=
rep "PKGDEST=3D"' tells me I should have one, but there are no instances in=
 a directory called "packages-split" in my tmp dir.

most likely because you are using rm_work.

>
> Anyway, I'm giving up for now. I'll come back to another time... or more =
likely, get someone smarter than me to sort it out ;-)
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

