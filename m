Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD7EE7D13A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:56:02 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id m10so7539608otp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kMnLIEv9iuIXwoQ9PgdXKwjbe0dBEb4ecb+dcqkT9FY=;
	b=pPCte7akVYfZ6B5FMYbykISQHpaMLT2HFiueczH26Ari0xfGZ4Rf7euzZXksQQYgEH
	UVjZEDo5z6ATjpQ+FEUI1OV2AGhmeSBiIlVBrsAKVNaBjpPrV4cLsRGSJDsYk5ULcqCv
	J543yiYCKZ7mnXP/Bba4HUbqkMU5K8Ecg1G3ju1N3U9xpn3UYyXHwDVSO8F8Kp/Q6qOd
	m8Qc5YhtX6+iqXpe/RC6NiEd8+H16DzAVyZvNbcFC8LuKiTnxGsvyb5DVumWr+MAjCiO
	Ry7jJRduxvhIcKoRVES9RWZ+HM6MFKUuA5hjqEjl7+CMaawd/S01GH6M9211lOzIkFeN
	iUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kMnLIEv9iuIXwoQ9PgdXKwjbe0dBEb4ecb+dcqkT9FY=;
	b=bRgUaeSTGIibIcSOM9k6upEQPUplN28oGOdc80d6+O3AvFo+WhLOzNLeUxbAGCeOGF
	Z51ajsR1rLdNdD+AK9Ysd1Ph/LO2AtKBQtmA7XCTKrXwtKOuZfvILtUUfUGRQY6t5bJm
	tigHGYgVvNo5GnBHdtYZRt3xFwQX3g3oZ+wKsNa8HRSlxG4JHM+R8fDhXl/LtlDnRI+I
	L9V2wDZbDE0HKSo4+zoUr1SwT4ejVZEif7gh4k94ypKv0gFx+RDbA+hzeFlEA2rXre7T
	GF5bMJGu9BxPnxjvvoGVVgMXT7/iqzyz+ph4UCpWw1SUFyuG8CxKqb8/9UNTlJi7yLNP
	zFUw==
X-Gm-Message-State: APjAAAVhbyQAH8x4ttMNi7NQXGoBQLSfRtLMV7ov6hkW/hlm5bQK5CR3
	u82Q7tg+hrsCAM6B6V9+EYP8D8N94hR2KsTNT1k=
X-Google-Smtp-Source: APXvYqwx2RfwSkJNzecIYoQ44IHT69CzPX/e+/QJ+ExOwyfWDHyZZSV/2LntNZOZjqf9S0wuj+zjyPmLxbueFOJXxmQ=
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr10306897otf.326.1553698563780;
	Wed, 27 Mar 2019 07:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
	<20190327140922.109867-7-alex.kanavin@gmail.com>
	<20190327144335.GC1598@jama>
In-Reply-To: <20190327144335.GC1598@jama>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Mar 2019 15:55:52 +0100
Message-ID: <CANNYZj_Uj7GmcT4JJ91hYcQO62xShRnEUitO9=_OZTnPvRQG4A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] llvm: update from 8.0.0rc2 to 8.0.0 final release
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
X-List-Received-Date: Wed, 27 Mar 2019 14:56:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2019 at 15:43, Martin Jansa <martin.jansa@gmail.com> wrote:
> Are you intentionally using d2298e74235598f15594fe2c99bbac870a507c59
> instead of the SRCREV of the annotated tag llvmorg-8.0.0?
>
> llvm-project $ git show-ref -d llvmorg-8.0.0
> 8474bc915331b2b7851fcad74f510803f0989b8b refs/tags/llvmorg-8.0.0
> d2298e74235598f15594fe2c99bbac870a507c59 refs/tags/llvmorg-8.0.0^{}
>
> I know that many projects don't use annotated tags, but if there is one
> it would be nice to use that (so that it's easier to verify that the
> SRCREV really matches with the tag).

I took the SRCREV from the github web interface:
https://github.com/llvm/llvm-project/releases

I'm not able to find the annotated tag ids there anywhere, so I simply
had no idea they exist.

Alex

