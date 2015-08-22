Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9BCAB73E11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 10:48:16 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so33630699wic.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 03:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=A7XJkQEZ4CEu9L4oxMKvYkbY0xHpOcg1r27rNUNnVME=;
	b=IZlk08M4jrOXvYMBWQajFajgW+SWvN38f5lA863rZz+TLz2X4hicwKKXeOWbfKOFj6
	63opc2FGCU3tCV/SSmyEvPHsHm5JLbluge8OCkI/Iwft/+blc8qVj0X6vn0V0xGvNtd6
	EDal2H2/zxUF2s8aRGVkqaT3xrrZgYkIJf5D13FQdzXxSrNhP9sDyt/Lp0w7d8CzRS5U
	lUz3gcE4Y6HZw3QeGS838tX8NR0mgUSbGqpO3U3F+HSB7XnkrImToS6iUrT582dKARhT
	sx4BUMVN3i+sFugc0fyLigT8EeRzo1F7KpjWxaMYdh257B6r5pQZ0BRm1xKGMLXXPskK
	JHUQ==
X-Gm-Message-State: ALoCoQmFQ+Fq5xpGNgykxvvgkDULDJclzybgeLW6fZ0PpmqwRPDev+7RAjCeVzoemKH7eUPRuxZR
X-Received: by 10.194.57.19 with SMTP id e19mr25351629wjq.152.1440240496181;
	Sat, 22 Aug 2015 03:48:16 -0700 (PDT)
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com.
	[209.85.212.174]) by smtp.gmail.com with ESMTPSA id
	kb1sm13863771wjc.24.2015.08.22.03.48.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Aug 2015 03:48:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wijp15 with SMTP id p15so38025083wij.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 03:48:14 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.73.13 with SMTP id h13mr13423519wiv.79.1440240494716;
	Sat, 22 Aug 2015 03:48:14 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Sat, 22 Aug 2015 03:48:14 -0700 (PDT)
In-Reply-To: <1440234522.12105.283.camel@linuxfoundation.org>
References: <1440193082-508-1-git-send-email-otavio@ossystems.com.br>
	<2ADD7CA4-0184-4D54-9E0B-8A58ACB51DC1@gmail.com>
	<CAP9ODKrEBfBH-+Z2VYg3qG5Bpi7aDozn6F1Z9r7MP3qC8Zs+RQ@mail.gmail.com>
	<F5709C6C-5297-49D4-B2BD-931B59837210@gmail.com>
	<1440234522.12105.283.camel@linuxfoundation.org>
Date: Sat, 22 Aug 2015 07:48:14 -0300
Message-ID: <CAP9ODKrUt6S=NC2CCre2y3hC3fKpGD=PvAnWtAJyO3di+O0-1Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Rename 'BRANCH' variable to 'SRC_BRANCH' for clearness
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
X-List-Received-Date: Sat, 22 Aug 2015 10:48:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2015 at 6:08 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2015-08-21 at 23:03 -0700, Khem Raj wrote:
>> > On Aug 21, 2015, at 2:58 PM, Otavio Salvador <otavio.salvador@ossystem=
s.com.br> wrote:
>> >
>> > On Fri, Aug 21, 2015 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >>> On Aug 21, 2015, at 2:38 PM, Otavio Salvador <otavio@ossystems.com.b=
r> wrote:
>> >>>
>> >>> The 'BRANCH' variable name has no explicit relation with the
>> >>> SRC_URI. Using 'SRC_BRANCH' makes it more obvious and easier to
>> >>> identify.
>> >>
>> >> Look good to me, just may be avoid =E2=80=98_=E2=80=99 and call it SR=
CBRANCH
>> >
>> > I did this initially but looking at how it looks in the source code,
>> > it seems SRC_BRANCH makes easier to spot the relation with SRC_URI. So
>> > I took the second.
>>
>> since bitbake use =E2=80=98_=E2=80=99 as a override separator, its less =
confusing if variables don=E2=80=99t have underscore in them
>> for future collision.
>
> Names with '_' in them might look better but there is a small price to
> pay for it in that bitbake then has to track whether "BRANCH" is an
> override. Obviously it does this in many cases already (e.g. URI from
> SRC_URI) but when you've looked at what the datastore actually has to do
> to keep the system working, you start to lean against creating more work
> for it.
>
> I continue to believe we should probably find a better syntax for
> overrides. If someone had a good alternative, it would probably be worth
> the pain of switching...
>
> I'm not saying we shouldn't take the above patch here, just that this is
> something which does have a cost and all the uses do mount up
> significantly.

So we should consider renaming SRC_URI for SRCURI. ;-)

I am Ok sending it as SRCBRANCH but it does looks less obvious for news com=
ers.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

