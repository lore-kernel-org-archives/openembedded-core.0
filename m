Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52142.1795434725220666752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 03:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DUeLewrY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb606491faso17578905e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 03:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795434723; x=1796039523; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+mF0VR8cp+kSqNJiRzCQn6BqEyGjoUnNcXH3a+UAJsU=;
        b=DUeLewrYrkV30B7xdZ/HdzX0IWHGLrVjqvaqtMQ7UlO3/JVPjsgosCrNNiLvodJYN9
         Kgs68t4HhTVcd30xP+JfW6U9fZAQFhBjfX+G0b2TsFq26P7tWVpltkUCHrWTOcOEdhvO
         c6TrweHn1qEhQjwqU/uRjAZoKOEn+Q6/lsMxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434723; x=1796039523;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mF0VR8cp+kSqNJiRzCQn6BqEyGjoUnNcXH3a+UAJsU=;
        b=pUiNk9fbB1zMzUlBgc6vzoHbr4cKdZdVQC495HwM1farACMj4yprrxi8z87v8Aaah1
         EUr1H00Frzx1v93q5LjT/7Gq+xEB/jn5giqKUnMTlp7XWxA/S7fn/7Q6OEAzvhEYJ7Rp
         BkM8g46/pWd89iwiIyjQhqrQ0hlO7MUTKTthzDcROGjtlIZVB3W4f4xcDcP6yHlTpwWs
         pA1ngZaGiVZAbwDJXrDyZvh1OYQWlG4xUBUMWOi1gBrVNyioz0g1TqwdovXiZWsrlylY
         79cHNKidRWNWUoS0pkIGUGg9VEa6xvlp/Pwf+yir1Vg5tVxSNw21ZVJ65DrIUOlKPsPd
         0ZQA==
X-Forwarded-Encrypted: i=1; AL+hErHbGdVmEr6xegOKRaQ93ykXD61wAbp4JOLk0pX1+HWC3CWAgmMbqNpPvlV7j0f3J5+O3q9nQ7xcMLXU3e9fZ8NkDA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9oSeEmRIutNiyOq3e13XuJLEWMB3t+HISxw74S5NA20yxWWXSZ
	TngkuAyVNH28hiPp3xxbIwXScL6cx/3aOzBZslRsWPRBbhqmVgrlm/DwXX6/cHglRJk=
X-Gm-Gg: AZFdTZc7s948U4rjnIGpTPRFMh8Bl3CMykxj21xGzD4A/RdijpjUZqeAvGU/s/wb/0P
	lYGBTT8gNx4rOG720GJH1kpCS/Y3renS6v4pJuh0OegSPnJO8XQ0btcoWqWe8OxpooYaVE4uHgs
	2F7HuRU37iXUdyAEir4WrlwP+iGdB+sPDReXBzDGk2GCVDe+OW95SSqfpgqXSwYBh4/qsZiJeAA
	CI09zdUo+W0ukhV9Ns4bfuduCjSmFjl6axFmtv5skiq1KGv29WbDpn8cpbZdWvIid8VYoeXKEeS
	MHi+LmTh4ZQjDQUJjJNt1iSQHCBR9vlbNCynvaLm5TWPQUKVctldXUufdTjxCt3/YV3l4wrPIip
	mpZ1NR0idnUJgczBrFNtIVmpEB67rGI+PXlrSlhzwjlOCsr+CtHuL0B9p/ulXhM5hiR3sW/e1fH
	J8+9viImZYPJIH+Bib4R2ZbDe5FUrSY7z875+O9d9aT8J3GQ1XkAZLNuP+GiUesps5h0kDVVNM7
	6auoR6MjxxTNfBVds+xN0uP1hDF0EOvl4OzElk4WQ3cEwUvY2zVLMUun6zoPoXatyF6hd65oDcP
	elrPOPnZ6/J1AB/Y5Yf7bIAsLNTAMy+C4EL7Bxzg2/69ekJvGRxthP5AJChM+TugB75MGZ7pm5I
	MWC4I0b9VQ5OKJA981Sc=
X-Received: by 2002:a05:600c:840d:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb88820cedmr236088405e9.22.1795434723291;
        Mon, 23 Nov 2026 03:52:03 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:dfb4:14bb:eea0:b8da? ([2001:8b0:aba:5f3c:dfb4:14bb:eea0:b8da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm306635895e9.12.2026.11.23.03.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:52:02 -0800 (PST)
Message-ID: <31494e4081f6b926ca92176156c33d1ac36f62b0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] staging: allow special handling of
 initial-recipes also for native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?J=F6rg?= Vehlow <joerg.vehlow@emlix.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2026 11:52:01 +0000
In-Reply-To: <dc59b7a4-34c2-43e8-a22a-21737b3eade4@emlix.com>
References: <20261119055929.3286725-1-joerg.vehlow@emlix.com>
	 <a16193f4de16a23bd5f89ec3ece8ee96de8a8ffa.camel@linuxfoundation.org>
	 <dc59b7a4-34c2-43e8-a22a-21737b3eade4@emlix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250906

On Mon, 2026-11-23 at 12:46 +0100, J=C3=B6rg Vehlow wrote:
> On 23.11.2026 12:39, Richard Purdie wrote:
> > On Thu, 2026-11-19 at 06:59 +0100, Joerg Vehlow via openembedded-core w=
rote:
> > > Sometimes a native recipe also needs bootstrapping (e.g. for ada,
> > > rust or go)
> > > -inital-native recipes are already handled different in bitbake.conf
> > > (both suffixes are stripped).
> > > During staging for the esdk these packages should also not be staged
> > > in the sysroot as they might conflict like libgcc-initial does.
> >=20
> > initial recipes are target/nativesdk only as far as I know. Where are
> > you seeing these -initial-native recipes? Our rust build process
> > doesn't have them, nor does go as far as I can tell?
>=20
> You are right, there is no recipe that currently produces initial-native=
=20
> packages. But we implemented ada and gprbuild support, which is a bit
> tricky, because like go and rust it uses ada and gprbuild to bootstrap.
> Ada is even more tricky, because it is not possible (at least not=20
> simple) to build a cross gcc with ada support using a different gcc=20
> version as the host compiler.
> For that reason we have a recipe, that fetches a prebuilt gcc with ada=
=20
> support (from alire) and uses that to build gcc-cross. By definition the=
=20
> recipe that fetches the prebuilt gcc is a native package, but also an
> inital package, hence initial-native.
> Fro gprbuild something similar applies, an initial version is build=20
> using the prebuilt gcc and that initial version then build the real=20
> gprbuild used for cross compilation. So we also have a=20
> gprbuild-initial-native recipe.
>=20
> For the esdk these native packages are not required and shouldn't be=20
> staged, just like other initial-packages.
>=20
> I hope that clarifies the use case, even if it does not apply to what
> openembedded is currently delivering.

Can you fix the commit message please and perhaps put more of this
detail in there?

It is a bit of a red flag when the commit message doesn't really match
what the code does, it also can cause problems in the future when
people look back at why something was done.

The other question this leads to, is whether this is a complete fix or
are there other changes needed to make "initial" support work better?

I really want to see the complete picture of how this is working before
we commit to supporting it.

Cheers,

Richard


