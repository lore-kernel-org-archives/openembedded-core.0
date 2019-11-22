Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8850A7FC47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 00:11:17 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id c25so3629419vsp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vhc3BXeL/8WVNcM5800jE/ibJcuMeBvLYST6/lbdae0=;
	b=VNwfkm0LwDnofexWu0nbzRTpw858dhIMJHKalt2DZ2da88Whxz5MeOHHKzK8dRZYMK
	hc91hAWVxFyB/lFmrtmmod0VW5AjJFNoE3fJtDyZVFMvoj8uTzIoGb40GLTFNcwK/2th
	v3x5CNCO8pu47B7h7GPtSjaySIXy3LDLTHP+Rt/YKWkhA/lp+Z+xazm3IBqNkaNf3CI+
	4mzdRRy2geOunjljFtJG2S4GuwVq+UVtTsAu+jIm3AjxVrBS3HNHxWKQYwTgMhUWJiU/
	nhBL1wMvWtSH89vQt/DVVpIeoueJzZT26fdlrKBW9U3wytb9EelsYjLwrJl1rhH6ep89
	hFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vhc3BXeL/8WVNcM5800jE/ibJcuMeBvLYST6/lbdae0=;
	b=rqkKEc+jQc6FlrwKE6Pje3EjZYkEZAQ9d3ySRHbwLm2gvDAkCLT9rgay7s/JPYBPal
	aJAuqj5mq3OyscMNuwtjRE1seClcaYT2/SwWJz/T8ixq3Mi7ncCrO4Gxkk2Bf/J2IjBw
	oknd0I/JiC0is9ExW0WK5l7QcYgfg2FQvPbKdsgj3+3mTHJWe6UXOBDO+lzI9/P5tU3e
	YIosWaiZYGnkMnwOojN2u6ndmFRJ/OtsV4USQEx/VS573jFDnm9Ecq3feOr9XHFHneVJ
	ieB7UCGMF2bOY1H+8lMFgODeOIta4yjmxPq3qPf87t8bwileIUTnYXQmsFYjyw7ataVB
	L/5A==
X-Gm-Message-State: APjAAAXoW0C8Ghls4TArUVYczk+K7lIfyspCt6BOYsYXZPzTkvLV7KnM
	cQs3t9nAwTNQzxjwQ3+m7ugbaa9J6Pdi8lg7Q4tz7vEA
X-Google-Smtp-Source: APXvYqzRgiXLarWoWtE1n3AJd1NRnHvO+g0xhlmpuitCx6f4HUdIAKmqv5cyxLFi18raxzt3CODkmutL4JGtfi3lzmM=
X-Received: by 2002:a05:6102:677:: with SMTP id
	z23mr8256572vsf.130.1574381478080; 
	Thu, 21 Nov 2019 16:11:18 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
	<CAD0U-hKMtXR+tvpS45D9=+XqaZVZBs7jMm9U3Vk7r+mJuVW5-A@mail.gmail.com>
	<CAD0U-hJ96imEfDwAyMQyjvABmaNYxEexQWNvpHJr+wsNzpGSbw@mail.gmail.com>
	<CAJ86T=Ucx125+XdRrpnh64km1WypAyyc1fUN5pWbjXzmUSXu3g@mail.gmail.com>
	<CAD0U-h+RGNRr2omcsCdKkD7qsnbQiGqW3MzGc93ZtgmVXEagLA@mail.gmail.com>
	<CAP71WjyEBYf-XaaMGceZ_+78=vJKGT6=n_3HnRk_OXkZEBm8UQ@mail.gmail.com>
	<CAD0U-h+TuUCazHeoW_nHBwFSju2UYtBE8C0A_Vsw2F8BiktXNQ@mail.gmail.com>
In-Reply-To: <CAD0U-h+TuUCazHeoW_nHBwFSju2UYtBE8C0A_Vsw2F8BiktXNQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 21 Nov 2019 16:11:06 -0800
Message-ID: <CAJ86T=VMTrGj4VA-aERu+snGUpxew90bv=hCKqLaMR2L56vOFQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Nov 2019 00:11:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 5:53 AM Ryan Harkin <ryan.harkin@linaro.org> wrote:
> On Thu, 21 Nov 2019 at 13:39, Nicolas Dechesne <nicolas.dechesne@linaro.o=
rg> wrote:
>> On Thu, Nov 21, 2019 at 2:15 PM Ryan Harkin <ryan.harkin@linaro.org> wro=
te:
>> > On Wed, 20 Nov 2019 at 23:53, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>> >> On Wed, Nov 20, 2019 at 2:41 PM Ryan Harkin <ryan.harkin@linaro.org> =
wrote:
>> >> > On Wed, 20 Nov 2019 at 21:29, Ryan Harkin <ryan.harkin@linaro.org> =
wrote:
>> >> >>
>> >> >> I pulled the whole openssl dir from your repo, added the layer.con=
f changes to my layer.conf and rebuilt openssl and my image.
>> >> >>
>> >> >> Unfortunately, I still have no /usr/bin/openssl in my disk image. =
So I've added the RPROVIDES from Andre's in a vain attempt to get it to wor=
k:
>> >> >>
>> >> >> RPROVIDES_${PN} +=3D "openssl-bin"
>> >> >>
>> >> >> ... although I'm not hopeful it'll do the trick...
>> >> >
>> >> > It didn't work. Once thing that's puzzling me: where is the package=
 "openssl-bin"? I can only find references to it, but no package.
>> >>
>> >> The "openssl-bin" package is created by the openssl 1.1.x recipe.
>> >>
>> >> Adding "openssl-bin" to RPROVIDES in the openssl 1.0.2 recipe is a
>> >> solution for users who are switching from openssl 1.1.x back to 1.0.2
>> >> and have an image which is tries to include the new openssl-bin
>> >> package. I don't think that's what you are trying to do (?).
>> >
>> > Correct. I only tried it because the 1.0.2t recipe wasn't working.
>> >
>> > To be clear - I have /usr/bin/openssl in my image when using 1.0.2p fr=
om the Poky Sumo branch. When I add the 1.0.2t recipe to my own layer, open=
ssl builds without errors, but I don't get the binary.
>> >
>> >> If you are using openssl 1.0.2 then the openssl command line tool is
>> >> in the openssl package... so to include the openssl command line tool=
,
>> >> add the "openssl" package to your image.
>> >>
>> >> If you are using openssl 1.1.x then the openssl command line tool is
>> >> in the openssl-bin package... so to include the openssl command line
>> >> tool, add the "openssl-bin" package to your image.
>> >>
>> >> But anyway, in all cases, the way to debug what's going on isn't to
>> >> try random recipe changes and then rebuild the final image. Instead
>> >> you should build your chosen version of openssl, look in the
>> >> packages-split directory to see which package includes the openssl
>> >> command line tool and then add that package to your image.
>> >
>> > I don't have a packages-split. I was unaware of it, and reading the ma=
nual, it seems I should have one. But I don't. Running 'bitbake -e openssl =
| grep "PKGDEST=3D"' tells me I should have one, but there are no instances=
 in a directory called "packages-split" in my tmp dir.
>>
>> most likely because you are using rm_work.
>
> Yes, I am! Thanks, Nico.

It looks like Mark's openssl 1.0.2 recipe has added the openssl-bin
package (ie Mark's openssl 1.0.2 recipe behaves the same as the
openssl 1.1.x recipe).

My openssl 1.0.2 recipe keeps the original packaging rules (as they
were when openssl 1.0.2 was the default in oe-core).

