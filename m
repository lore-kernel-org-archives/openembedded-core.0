Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC3E7FE44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:02:52 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id c24so8568054qtp.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gzqdkXuXkTa6eT2u1DIcK1QwKv66PUCTZZJWiWFyaZk=;
	b=eYl+tyK7Hnv7d0EXiYc0cLiqMEcwkBO/JL7O4RyLJE1F/wUVKOLJTHP71z3mFZEQ1g
	Byn+w6Y5QVg5Pt4/rObLe6+BOxaZ6zTbpCluzzw6/9UBmS/WTmIGV/AGfVRwcZP0vJUy
	256u8WMGRaqSfqImG1KpUvuU6roI9swyG1pMpkQ/Fz3tWesCFmlJ/Kn3l5Xpa+bsD/tx
	Ms9ThYYn2y426CY7pQnxsqQMWqwaP8CRL02fXhwQoETiE8O2atG135OrvBRvXNcGdwwz
	4SQIZxWPf7ZDYikhwQPzXpmwzvIhqd0Gv88uJODZ55rbvkb0JlvIBxmMlvzstFZ6OTwQ
	otqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gzqdkXuXkTa6eT2u1DIcK1QwKv66PUCTZZJWiWFyaZk=;
	b=VZzrGAdaRAG2yWu6Pp9Szme+2sqaZ4F/4lpja4iLAgMboXJYDcVXWceJC5pexgQzx/
	2xTqLlrG9ZFE3j/DYOrMi5odGf4Abq62GRrgWP53RQ2noes6t7mlZSRlTssKT0zaT/iT
	gbfbU3CW1Orf5AxeVtjsoyMc162D/B6jgANrNerU2bfBazBm1qf0heCD0S3fmYEDhke0
	Vv9VacvyK27HrR9Ph9LlGKYC1lBNfDMA3ya1ztNRIYASy1ne6HCytLwGo3N5y6o8tnrv
	xnrTe5TsaI5wCXAVsdqbgvz3hz2kM9leijmSj6gk6ZE0EDNdsWllkV14AYW36iJJ3s/G
	7/+g==
X-Gm-Message-State: APjAAAVm4Jko8VrXGmOyPWUJ8yBhIfscrHqH5gTdTdCRKg58QbxafHZ1
	Ho7Whenh/UHks5kIAScwzRTKsVykzwjOKTHkWJw=
X-Google-Smtp-Source: APXvYqyl7d21QFsklY8EMfQnJGCn5EAPXgzrDSefMzElvOlSS8ggjXHilUXEAuVWigeWl9AOLTUIHcVsxm4EbPAl4BE=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr17991065qtq.53.1580158972868; 
	Mon, 27 Jan 2020 13:02:52 -0800 (PST)
MIME-Version: 1.0
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
	<20200127141908.84922-7-alex.kanavin@gmail.com>
	<CAMKF1sooYU9dr5nkmgoW0cPjd3L_QJYtQBUMOpJAABTJ=mqrzA@mail.gmail.com>
	<CANNYZj8Ak0gFwAnupcWJ9eDXP6_hV2hT0u0E4pastRMt+QanZQ@mail.gmail.com>
In-Reply-To: <CANNYZj8Ak0gFwAnupcWJ9eDXP6_hV2hT0u0E4pastRMt+QanZQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 13:02:25 -0800
Message-ID: <CAMKF1sp39i6szYyZJe7gyhVyU-jJ+ABX2dboZz7DevjN5DZ5Fw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] core-image-sato-sdk-ptest: use 2G of RAM
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
X-List-Received-Date: Mon, 27 Jan 2020 21:02:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 12:56 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This is only used on x86_64 and arm64 by the autobuilder, so we should be fine.
>

OK. lets set this for those two architectures for now. The image can
be built beyond Autobuilders for
other arches as well. Perhaps this setting is a candidate for auto.conf on AB

> Alex
>
> On Mon, 27 Jan 2020 at 21:54, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, Jan 27, 2020 at 6:20 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Particularly, 1G wasn't enough for lttng-tools ptests as
>> > half of that went to /tmp, and lttng-tools needs more.
>> >
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
>> > index 7490b773d2e..58c257c49fb 100644
>> > --- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
>> > +++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
>> > @@ -16,4 +16,5 @@ IMAGE_OVERHEAD_FACTOR = "1.0"
>> >  IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
>> >
>> >  # ptests need more memory than standard to avoid the OOM killer
>> > -QB_MEM = "-m 1024"
>> > +# also lttng-tools needs /tmp that has at least 1G
>> > +QB_MEM = "-m 2048"
>>
>> perhaps we need to be cautious here and check if all qemu machines can
>> support 2G emulation.
>>
>> > --
>> > 2.17.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

