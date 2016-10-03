Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 23BBA719CD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 16:55:53 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n66so10698487qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/yuL8FT6NXUzrnYg0fheo+QlOU2eM0J68IJglCwigoI=;
	b=HYkZhiwNsnwwoUD3O0M2fRxTVyK5S7tlszlcY39hDHiJV5/pDs3qXyuHIvMGP6FTXE
	6ohPRB9M906fQnt4vGS8tBl+LQZOZi7jAHOukZWkgVKO9lLtWrq55xpXZIndwG7eQvnF
	X2oGHqsb7uIMZdQOVY8Nc2A90Ls7fVgzrC77GJGzi4Ft6UiZ0nJuOaMdjza++1hZGzQQ
	LoYZXbVVCVhSdTqwni7NRKXnSPminMZR3oiGaPs7O9k5FpjsTklF7N1bT3LjwYKqXnjz
	HdvRADvMpzNCXCUqCksxxPJakV5R2mGA1q1KA6eM5IVt4m6IzMgY42+4xY0K+QKkAI3B
	FHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/yuL8FT6NXUzrnYg0fheo+QlOU2eM0J68IJglCwigoI=;
	b=JYkOdG2qq/AirVqeOXfISDHTmCF79zeS7M7V0i0dIoW6mv+uibb0s2qGzrfgvmQLq3
	XAZxA6l3gjam+/fI2ezlN/AMbI3odykQbbfC4Y9+JXJxdYgPCMZBZwwOyrvYc2gspnTN
	w2v2M2s558V4/qjl2cbdlsIqBt5Rr0O678xFr80VuLP3cIeCiaKD168hWuL6QfwLMpu8
	yKDRQMFgn/gUG7p2WAKuxWPA4ZjD9Ggk9/W55qlalVFVdtZk5cyaY6WrsiUPDV5+AfWJ
	S8gKEAdimVy8Q4P0quVFUm+2FEnRi2iZYu1hviCj/oeIF7TxIgO4lVAQa8tpF36nqXOo
	j23w==
X-Gm-Message-State: AA6/9RmxGqBu0hExzB+zv44gSI9dq9ToSG8OeBY1ks2n6Mi9e4IE287M0tMjG90ueB8QqHJ4gbTqrA3VTiEbNA==
X-Received: by 10.55.47.199 with SMTP id v190mr21704301qkh.45.1475513755366;
	Mon, 03 Oct 2016 09:55:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Mon, 3 Oct 2016 09:55:54 -0700 (PDT)
In-Reply-To: <CADkTA4MpPtH=-1sELLT9kO0ax-frVsagF5PjiccEZdMJ+DXduQ@mail.gmail.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
	<CAJTo0LacaDPQawfsK45GTwOVPohsxQN+e2FtZjEYvT91Ruxb5g@mail.gmail.com>
	<d5b8ad07-09f4-bb3e-46ed-3a93df33ba76@windriver.com>
	<CADkTA4OX5OYXTRaP_JxWhE6CNYq20LXA6e5X4OOEf9=7w3trew@mail.gmail.com>
	<CAJTo0LYmZcbyNDW-2smOhvgJv_xi=3mBjmVkrj+u0yYPwosEVA@mail.gmail.com>
	<CADkTA4MpPtH=-1sELLT9kO0ax-frVsagF5PjiccEZdMJ+DXduQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Oct 2016 12:55:54 -0400
Message-ID: <CADkTA4OTjXYScwAfUdjM8-LcRqbbX9g50OJ9ZAqfy+KDEF-nbQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated (and hopefully final) pull request
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
X-List-Received-Date: Mon, 03 Oct 2016 16:55:56 -0000
Content-Type: multipart/alternative; boundary=001a114f42e6400248053df8d1e9

--001a114f42e6400248053df8d1e9
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 3, 2016 at 12:07 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Oct 3, 2016 at 12:03 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>>
>> On 3 October 2016 at 16:57, Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>>
>>> Out of curiosity, what image type is this ?  built core-image-sato,
>>> kernel-dev for
>>> x86-64 and they all worked.
>>>
>>
>> net-tools (via core-image-full-cmdline -c populate_sdk) for
>> intel-corei7-64.
>>
>
>
> ok. I've reproduced the failure by building just that package, with any
> luck I can spin
> something for it in the next few minutes and then launch a full build of
> that image.
>
>
patch sent. I can now build net-tools, and I launched a full build of
core-image-full-cmdline.
The clock is ticking on me now .. but I'll be around for another hour to
monitor things.=

Bruce


> Bruce
>
>
>>
>> Ross
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114f42e6400248053df8d1e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 3, 2016 at 12:07 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n>On Mon, Oct 3, 2016 at 12:03 PM, Burton, Ross <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><=
div class=3D"gmail_extra"><span><br><div class=3D"gmail_quote">On 3 October=
 2016 at 16:57, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruc=
e.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div>Out of curiosity, what i=
mage type is this ? =C2=A0built core-image-sato, kernel-dev for</div><div>x=
86-64 and they all worked.</div><div></div></blockquote></div><br></span>ne=
t-tools (via core-image-full-cmdline -c populate_sdk) for intel-corei7-64.<=
/div></div></blockquote><div><br></div><div><br></div></span><div>ok. I&#39=
;ve reproduced the failure by building just that package, with any luck I c=
an spin</div><div>something for it in the next few minutes and then launch =
a full build of that image.</div><div><br></div></div></div></div></blockqu=
ote><div><br></div><div>patch sent. I can now build net-tools, and I launch=
ed a full build of core-image-full-cmdline.</div><div>The clock is ticking =
on me now .. but I&#39;ll be around for another hour to monitor things.=3D<=
/div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><div></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr"><span class=3D"m_7162174157508407152m_477088109713798=
7796HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><span><br><br clear=3D"all"><div><br></div>-- <br><div c=
lass=3D"m_7162174157508407152m_4770881097137987796gmail_signature" data-sma=
rtmail=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, fo=
r chaos and madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_7162174157508407152gmail_signature" data-smartmail=3D"gmail_signature=
">&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;</div>
</div></div>

--001a114f42e6400248053df8d1e9--
