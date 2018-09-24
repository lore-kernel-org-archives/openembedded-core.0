Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 17B0B79101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:46:07 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x16-v6so11842289ljd.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hm0nFixOQ/A7d9tcYNpgKX2ua75MCZxYwNu4EQs5s0E=;
	b=VLeMpK+xyUTKv3eeuIhjjk/IKC3XDZynY/dwRYtknYSWQrtLMvsYlp1lfNMM/E3Hsw
	B9XTeOofg0JKHinixIsf6UUydhKxd2XxjYARRqEdu3Kc8Afgu+7AaFJI+6jDo2eTBhC/
	GC18Nux5eclNGbwQ4e9g058PyMF1iUqUFsKSxKXSNkOROFqsr2VrwezDH+opSLmEcAUG
	ChzT0dyKOGUNF9bcRhntRqPAhq1NS5Lua6w2NZtmJhL8BUZEBWlEvezXLKFTonJvJo0Z
	SGujzQCWcHCWUVJ7R5CST5wFzUpGuwqe72a8V/WEk3fMe1w81tWt4jy354FnCiH9ZGiB
	dXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hm0nFixOQ/A7d9tcYNpgKX2ua75MCZxYwNu4EQs5s0E=;
	b=TXfDAJIJoR9C66PgD0hyOR6e+dp4LPm+oOpaLGndUPZHU0DU2iYa5J5sbARvc64IRx
	u3yHReuuJe/U6Ebv3NWk6OXRxCHNdKwAverGYkR9MtI/5nMjD4x0xjmZW3flVomrv0lQ
	tPBZOeZOgFvBDgv2V5BcwyW7vsG1WBPwE7MTBaYQJuP0mPx/UMWWZd2ahAd+GGfqKd/g
	jSZpEtWDC32LGNTy0ukONbaVyv/1VIoqo8cl64aIJnUhZyVfxqw7YFAmmloEv/B8jJhy
	sZkq2Hu2/GeroTHZSDsfHtF549wlYTp0iorvyUciM3CfmpSK5z8MUjOg5bJW9yzhsI2Y
	qvKw==
X-Gm-Message-State: ABuFfoi8+n+ye2ULymPu5RX/cqlx0HQyM/Dmj+szcFSBXpMy3Dv3upUZ
	dah+vOVxfl/rt9RObbrHxccX6sjAx8408+L5eh4=
X-Google-Smtp-Source: ACcGV62+L2OVJd4ihj7ne6A5TH3iienbphvsqyPD6EikhF9sK7CMUJBZifBxm3r06xNpLoQtEqD9mduX0bbFrNlRO3Q=
X-Received: by 2002:a2e:3a0c:: with SMTP id
	h12-v6mr3159866lja.67.1537796768169; 
	Mon, 24 Sep 2018 06:46:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Mon, 24 Sep 2018 06:46:07
	-0700 (PDT)
In-Reply-To: <aeea3a8ffd2dac5f295e4357a3058505546fa1dd.camel@linuxfoundation.org>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
	<36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
	<20180924134234.GK9430@hiutale>
	<aeea3a8ffd2dac5f295e4357a3058505546fa1dd.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Sep 2018 09:46:07 -0400
Message-ID: <CADkTA4MfAESbzUV99QR8gCWLaC-R18wuR8fTbS7aWaZWzhttYA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 13:46:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 24, 2018 at 9:44 AM,  <richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2018-09-24 at 13:42 +0000, Mikko.Rapeli@bmw.de wrote:
>> On Mon, Sep 24, 2018 at 02:38:36PM +0100, richard.purdie@linuxfoundat
>> ion.org wrote:
>> > I was replying from the perspective of how this should work in
>> > general.
>> > I agree that for this to work with a kernel recipe we do need the
>> > change that started this thread and that is probably a reasonable
>> > thing
>> > to do.
>>
>> Good, then my patch is not going in the wrong direction.
>>
>> Remaining problem is if file overwrites will be detected or not so
>> that
>> accidental overrides of files in linux-libc-headers from kernel
>> recipes
>> should not be possible...
>
> That is a general problem and the core sstate code shouldn't let that
> happen these days so I think that is already covered?

Yep, it should be covered. I was just looking for confirmation.

Can everyone have a look at:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5305

And confirm that it can be closed by this .. ? I suggested my approach
in that bug, but it
never went anywhere at the time.

Bruce

>
> Cheers,
>
> Richard



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

