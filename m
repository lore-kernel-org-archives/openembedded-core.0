Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2E371AD8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 10:14:54 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b189so609025wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 03:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BFr8RnXW7Bkp9ybDapsD3ORlQXDZoCNugkJ5UyNqKHE=;
	b=JJibwE2OPo9srPckPbwxvzmIGHAQCa9Fn8DdvE+GSzxVTh9/sf8TDXmdKqMwurQ6Pw
	OyUOvgpFKNi/aFcHna5lZuKpAjiOisWo1njsWhX1gyOunz/5lU3wKvZVZWsf4vgWz1/u
	i1aAC5GBU4q3J0VpjqLJUWeiPcUwYIsr94oOHvphV2M+Vrrwf0CsQfeXN6QK5BnE/44N
	S6mvFTmx4gQ2zL14lSxyIs54kH45uMehXooUBF0tYRumm7BD/+j/ACMBQSFZpDPzcT6p
	uDG54GTNsNX9/BKpwTud+jMX2LNkyIMW8cZMpfFq7jccveRH46HIG9YD+FFvEytRvqb1
	JT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BFr8RnXW7Bkp9ybDapsD3ORlQXDZoCNugkJ5UyNqKHE=;
	b=GSw21gsuLRZGAEuxz0BjJOEqqWa9W2efN4qGjPE9BGvBXHkbVRZGea9fERuB2bLq8H
	srv6ckFnSkE9Ewf6T8lSrkkX4Awm+5cndfziJc2gGdcMbzd1ICTb9rD3SjV5o0hFWaYq
	bUJy/6x5Lk0rTWAG/vIF0IXU+4zao2vH4Xs+M30gAUv+PIBTU465pEQyfY5YBHmH0xRA
	fP18QaAPDp9GKt4v6Y1/okxWSPu/kuLuXdwraEM8NwmM+dCHAlb7Y9QwlHBNWmJvklty
	RWJrgPAxqt9eKsHS/zDJDOU9AkJhMX00lM2nkiPbp21pfhNkWw938U9lXGymHHHWOZoN
	CHwQ==
X-Gm-Message-State: AHPjjUigILUNo7lclmIfFz+RCFjd2wPNKRRzu8/OHsE/Cecku9C22iHJ
	7Z4Ew2bH5ILw8v73XsOfnxFlW4lkVKLV5C15F58=
X-Google-Smtp-Source: AOwi7QAPJ1mO7jwZho5+ueX/9CqPL5WTBJdjqwR45TkyouA3u3k851HhIhi6LrGqIEcqMWdmkTz5b3rGsES/6F/ra/U=
X-Received: by 10.80.201.138 with SMTP id w10mr9194112edh.56.1506680095906;
	Fri, 29 Sep 2017 03:14:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.142.236 with HTTP; Fri, 29 Sep 2017 03:14:54 -0700 (PDT)
Received: by 10.80.142.236 with HTTP; Fri, 29 Sep 2017 03:14:54 -0700 (PDT)
In-Reply-To: <CAJTo0LZTrRnhgFRhK3=GxVfzrT5H7p-k=Untwq9T+KWTrpyMQA@mail.gmail.com>
References: <20170929094702.5334-1-francescogiancane8@gmail.com>
	<CAJTo0LZTrRnhgFRhK3=GxVfzrT5H7p-k=Untwq9T+KWTrpyMQA@mail.gmail.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Fri, 29 Sep 2017 12:14:54 +0200
Message-ID: <CAEQ58siT6Lw_W9Oe60v125ZZak2UXQ0L-R4PvaHAz6NKRi_-vA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [openembedded-core][PATCH] xorg-xserver: fix building of the package when different virtual/egl provider are selected
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
X-List-Received-Date: Fri, 29 Sep 2017 10:14:55 -0000
Content-Type: multipart/alternative; boundary="f4030438d438e81f0f055a514b71"

--f4030438d438e81f0f055a514b71
Content-Type: text/plain; charset="UTF-8"

Hi Ross,
Thank you for your clarification. I double checked the recipes before
asking for the patch,  and I found out that Mesa provides both virtual/egl
and virtual/libegl; searching through the layers I did not find any recipe
depending on libegl but only on egl. Incidentally, userland from
meta-raspberrypi provided only egl, and that was the final confirmation.

Given that assumptions, if you can surely tell that libegl is the correct
dependency name form of libEGL, I will be happy with rejection of the patch
and contact meta-raspberrypi maintainers directly.

Thank you,

Francesco Giancane

Via Paolo Braccini 46, 10141 Torino (TO)

+393933920466

Il 29 set 2017 12:05, "Burton, Ross" <ross.burton@intel.com> ha scritto:

> On 29 September 2017 at 10:47, Francesco Giancane <
> francescogiancane8@gmail.com> wrote:
>
>> -PACKAGECONFIG[glamor] = "--enable-glamor,--disable-gla
>> mor,libepoxy,libegl"
>> +PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy,egl"
>>
>
> userland is in the wrong here, not mesa or xorg.
>
> The policy is that there are generalised names (libgles, libegl) and they
> should either be used by BSPs directly, or RPROVIDED.  Mesa generates
> libgles1-mesa libegl-mesa etc, and they RPROVIDE libegl libegl1.
>
> Ross
>

--f4030438d438e81f0f055a514b71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Ross,=C2=A0<div dir=3D"auto">Thank you for your clarif=
ication. I double checked the recipes before asking for the patch,=C2=A0 an=
d I found out that Mesa provides both virtual/egl and virtual/libegl; searc=
hing through the layers I did not find any recipe depending on libegl but o=
nly on egl. Incidentally, userland from meta-raspberrypi provided only egl,=
 and that was the final confirmation.=C2=A0</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Given that assumptions, if you can surely tell that lib=
egl is the correct dependency name form of libEGL, I will be happy with rej=
ection of the patch and contact meta-raspberrypi maintainers directly.=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you,=C2=A0<br>=
<br><div data-smartmail=3D"gmail_signature" dir=3D"auto">Francesco Giancane=
<br><br>Via Paolo Braccini 46, 10141 Torino (TO)<br><br>+393933920466</div>=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">Il 29=
 set 2017 12:05, &quot;Burton, Ross&quot; &lt;<a href=3D"mailto:ross.burton=
@intel.com">ross.burton@intel.com</a>&gt; ha scritto:<br type=3D"attributio=
n"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">On 29 September 2017 at =
10:47, Francesco Giancane <span dir=3D"ltr">&lt;<a href=3D"mailto:francesco=
giancane8@gmail.com" target=3D"_blank">francescogiancane8@gmail.com</a>&gt;=
</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">-PACKAGECONFIG[glamor] =3D &quot;--enable-glamo=
r,--disable-gla<wbr>mor,libepoxy,libegl&quot;<br>
+PACKAGECONFIG[glamor] =3D &quot;--enable-glamor,--disable-gla<wbr>mor,libe=
poxy,egl&quot;<br></blockquote><div><br></div><div>userland is in the wrong=
 here, not mesa or xorg.</div><div><br></div><div>The policy is that there =
are generalised names (libgles, libegl) and they should either be used by B=
SPs directly, or RPROVIDED.=C2=A0 Mesa generates libgles1-mesa libegl-mesa =
etc, and they RPROVIDE libegl libegl1.</div><div><br></div><div>Ross=C2=A0<=
/div></div></div></div>
</blockquote></div></div>

--f4030438d438e81f0f055a514b71--
