Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id DD3AC781F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 14:37:57 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t70so10231076wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tbyxwpCDaJVqtHR6wx5Hk/6BjU5pgwz+CyRujy/X3vI=;
	b=oEOXBkapeXgzFAa8VXcGu2rjsMI7t8qIiq8mYpwpfKnLKvLiekvfxZDxrNce93VzXm
	eLDfXMVpU2EKCtj2+QcjjIHQXHMZpfBUelhnf2j/Aw2KRX6MQMRXV8E0H+Gdms30/I9V
	eR0TKkB5ZN3GbUTMwlBtc3FgYJgyABamjHVOpTmvhnzQqjInDWydRh5tHJLG4LygRmF8
	PE4KQbDYPtUgqL6rmiRHDeULmdhXkFeQiG5+3tl/yPmVqQVI8JfBZyEyKwr7nLIqKOYy
	0T9NTUtGoL8gTMqNkD0DKriookNIQO165tWID9KuM0BxFBvl509h94ckm48CUxIApn+/
	0gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tbyxwpCDaJVqtHR6wx5Hk/6BjU5pgwz+CyRujy/X3vI=;
	b=uJeUVIIHQvH8zAVcbkzEdjrDpZ8Slf7LC8586UkQlUxdmo50jgYX+By7IsADTePNlt
	+pej9cXVehpMW9zJ3EMnFHa53NCsWPUAKV30XfuKemyeEweQ6a4i/akwQD8dqhNkVCEH
	mi0mz7wr2RB9Bb2ODmErWZd9XAWbzM2eT7OgnLRCd96HSYBSYMSwUWtyex/+Bq+prFP5
	Lag7lFy0Gx4L361XlEE9weE1aJ375lH4+5lqYpQxkNMKxQKWlzl4flewZFxBV9lP1Sku
	uTqFT7AD4apy0pi3lFbXhuVuEh1/Oqn02e1VCC1oLzKQouHvX8M2K4T7QPjxdXat8NUL
	EoGQ==
X-Gm-Message-State: AIVw111pOdmFvh+7H8J8qrPoEy+XpmmGcGa2ySFaYaoDPeLoD2ucQEjn
	wugtQbzd8WLtzBC5aH/V8kTun8yPVQ==
X-Received: by 10.80.129.4 with SMTP id 4mr7014188edc.120.1500043078629; Fri,
	14 Jul 2017 07:37:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.152.228 with HTTP; Fri, 14 Jul 2017 07:37:58 -0700 (PDT)
In-Reply-To: <CAJTo0LaCKdRVNvM05SfTimEYLspPsTdVam2-P9jPRc98M22+tA@mail.gmail.com>
References: <1500008435-6588-1-git-send-email-changhyeok.bae@gmail.com>
	<CAMKF1soBnvJf=aB3TN28_Mrh1+jeBF9BO0+xUfv2UAjgeuXVpQ@mail.gmail.com>
	<CAJTo0LaCKdRVNvM05SfTimEYLspPsTdVam2-P9jPRc98M22+tA@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Fri, 14 Jul 2017 23:37:58 +0900
Message-ID: <CACrLJgAghcR3SZJVsS6T8EYrGyPvvWhiwaLgsQbE6x_qicqZLA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Namhyung Kim <namhyung@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uftrace: Add recipe
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
X-List-Received-Date: Fri, 14 Jul 2017 14:37:58 -0000
Content-Type: multipart/alternative; boundary="94eb2c05f194d97dde055447fe40"

--94eb2c05f194d97dde055447fe40
Content-Type: text/plain; charset="UTF-8"

Ok. Thanks for your comment.

I'll send this patch to meta-oe.

Thanks
Changhyeok

2017-07-14 23:16 GMT+09:00 Burton, Ross <ross.burton@intel.com>:

>
> On 14 July 2017 at 14:35, Khem Raj <raj.khem@gmail.com> wrote:
>
>> perhaps meta-oe is better place fot now. Will it support mips/ppc in
>> future
>>
>
> Agreed.
>
> Ross
>
>


-- 
Thanks
Changhyeok

--94eb2c05f194d97dde055447fe40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok. Thanks for your comment.<div><br></div><div>I&#39;ll s=
end this patch to meta-oe.</div><div><br></div><div>Thanks</div><div>Changh=
yeok</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2=
017-07-14 23:16 GMT+09:00 Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On 14 July 2017 =
at 14:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div id=3D"m_352376257574936280:1f1" class=3D"m_35237=
6257574936280a3s m_352376257574936280aXjCH m_352376257574936280m15d4150a38d=
6470e">perhaps meta-oe is better place fot now. Will it support mips/ppc in=
 future<br></div></blockquote><div><br></div></span><div>Agreed.</div><span=
 class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>Ross=C2=A0</d=
iv></font></span></div><br></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Th=
anks<div>Changhyeok</div></div></div>
</div>

--94eb2c05f194d97dde055447fe40--
