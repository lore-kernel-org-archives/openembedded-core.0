Return-Path: <ka6sox@gmail.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id BFE617865F;
	Tue, 16 Jan 2018 03:57:47 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id u62so3273623ita.2;
	Mon, 15 Jan 2018 19:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=82sJ9c0xvLXvltD6fnPM4MNYoURttfjEKhqOkrOD/Dc=;
	b=Vhw8rTVAlRNraDCLcW9THXnB8FflXwROdSaAlvcPO4+3yjvMbeiVVQkqJW2a8EFaWs
	pOfTaglyeNIZzGJnaBFC+03MME0etCPNwurnMIB4fyRvdFPmuKYbEJhXWjuA7PaPmUjG
	qFg9oykOyUzT5AVV1HfGpc+K4qIUtg9Kpx928LikRVIiQm8XKTxA4Ws495SDNguBVAKr
	c+eNCbXeoNMnnsZsVvG8ZD5tM/nFYeONHAL9n0KYgAZODVqEtyQurA0C8dQNTfIBaEel
	HeSNb82+fp+BhIf4Hajk+tXvBla0LTuIC0O40WjfiT1Hj19vD35h7p5GrxGM3hmWVFIf
	+mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=82sJ9c0xvLXvltD6fnPM4MNYoURttfjEKhqOkrOD/Dc=;
	b=n114AwmOFjcW6h/NqkIE3+OJr9CxLTlD2d3bXScWBxKgARFfO+Fi3G8KdRgChKEzna
	mx24R0pBZ9/dm69r+mYm6+i9iAPZA4Q9B1PXcpa+4tW2QU6YExCXgrfhgXN51atMTyPB
	Q3kQ2DJjGVL7F0DFsI53hGM784djiWz7AK9yxlklQP/BUIy+an2eR0Kct2RAkIPijVio
	RflOGhwPs25iQdrJ66elYQEkR1hVuFZrQQWBBjUz+rZnN0xH7A6UqrCkTZKlGm4hQOKe
	opt05BojUOd4yNyg8NGRCcnMiBxi/Bh34bhoRKu4W7Qm70E+urNoFjhOGdXhBA9VvJrZ
	vaJA==
X-Gm-Message-State: AKwxytfF23V6kuAwZZ0WkRiUi5+RdMptKmaNv26f9m4/IYitMafF9m9M
	ZgKfJGnUAd6lhEuvTCfZ7Y7vmZSEL4g8PNXA2qA=
X-Google-Smtp-Source: ACJfBos6kS8CuHmhi9RIrajtghoFAIQExEVDMLdhADOfgDzYdXxYPXiNWr8CzSmc/blC/P7Sq8l5ldL+KaZt5i7c6cE=
X-Received: by 10.36.28.20 with SMTP id c20mr17135227itc.142.1516075068990;
	Mon, 15 Jan 2018 19:57:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.36.26.5 with HTTP; Mon, 15 Jan 2018 19:57:48 -0800 (PST)
In-Reply-To: <CAGAf8Lws8HfvDvMvdpgXyTvKaVpmf5a1UUTbBc2OrTpw=mgPNA@mail.gmail.com>
References: <137d31ae-329e-53ff-f495-259168b787d5@balister.org>
	<CAGAf8Lws8HfvDvMvdpgXyTvKaVpmf5a1UUTbBc2OrTpw=mgPNA@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
Date: Mon, 15 Jan 2018 19:57:48 -0800
Message-ID: <CAHQecY5FEt0jMY97Cfq7tR4KAETqied0t3zfFgXw=J5YBSz53A@mail.gmail.com>
To: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
Subject: Re: [yocto] OpenEmbedded developer meeting Sunday before ELC in Portland
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
X-List-Received-Date: Tue, 16 Jan 2018 03:57:48 -0000
Content-Type: multipart/alternative; boundary="001a1144b54af0a9b90562dcbb1e"

--001a1144b54af0a9b90562dcbb1e
Content-Type: text/plain; charset="UTF-8"

What time...a number of us are headed up from SCaLE sunday morning to ELC...

its only about 2.5hrs to get there but early will leave a number of us late.

T

On Mon, Jan 15, 2018 at 3:41 PM, Zoran Stojsavljevic <
zoran.stojsavljevic@gmail.com> wrote:

> > March 11, 2108, Portland
>
> I guess, by this date yocto community will experience release 24.7 or
> similar... If?! ;-)
>
> Zoran
> _______
>
> On Mon, Jan 15, 2018 at 11:30 PM, Philip Balister <philip@balister.org>
> wrote:
>
>> We are setting up an OpenEmbedded developer meeting on the Sunday before
>> ELC. More information to follow, I just wanted to make sure everyone had
>> the date before making ELC travel arrangements.
>>
>> March 11, 2108, Portland
>>
>> Philip
>> --
>> _______________________________________________
>> yocto mailing list
>> yocto@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/yocto
>>
>
>
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>
>

--001a1144b54af0a9b90562dcbb1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What time...a number of us are headed up from SCaLE sunday=
 morning to ELC...<div><br></div><div>its only about 2.5hrs to get there bu=
t early will leave a number of us late.</div><div><br></div><div>T</div></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jan 15=
, 2018 at 3:41 PM, Zoran Stojsavljevic <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:zoran.stojsavljevic@gmail.com" target=3D"_blank">zoran.stojsavljevic@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"ltr"><div><div>&gt; March 11, 2108, Portland<br><br></div>I guess, by this=
 date yocto community will experience release 24.7 or similar... If?! ;-)<b=
r><br></div>Zoran<br>_______<br></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote"><span class=3D"">On Mon, Jan 15, 2018 at 11:30 PM, Phi=
lip Balister <span dir=3D"ltr">&lt;<a href=3D"mailto:philip@balister.org" t=
arget=3D"_blank">philip@balister.org</a>&gt;</span> wrote:<br></span><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><span class=3D"">We are setting up an OpenEmbedded=
 developer meeting on the Sunday before<br>
ELC. More information to follow, I just wanted to make sure everyone had<br=
>
the date before making ELC travel arrangements.<br>
<br>
March 11, 2108, Portland<br>
</span><span class=3D"m_2291923091251816416HOEnZb"><font color=3D"#888888">=
<br>
Philip<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
______________________________<wbr>_________________<br>
yocto mailing list<br>
<a href=3D"mailto:yocto@yoctoproject.org" target=3D"_blank">yocto@yoctoproj=
ect.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/yocto" rel=3D"noreferrer=
" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listinfo/yocto</a><=
br>
</font></span></font></span></blockquote></div><br></div>
<br>--<br>
______________________________<wbr>_________________<br>
yocto mailing list<br>
<a href=3D"mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/yocto" rel=3D"noreferrer=
" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/yocto</a><=
br>
<br></blockquote></div><br></div>

--001a1144b54af0a9b90562dcbb1e--
