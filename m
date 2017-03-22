Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 620D877A9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 12:14:48 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id v127so155961337qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=etnWqiuctso/PNwIlTbBWKJxvUt8prqFQzJDXeEZSo0=;
	b=gcPHFv9ILb3lPzHuJWZtRCHDkf+u1B5BOOrYZFqoJGeWZBvB+mr2SlrW3b3+shYtYT
	IpjZZxxxEldHTaauaSEGmBM/OwozPRHlMg1pPn9NFODC3Yd6ken8dv0uEyZyU4z5t7pI
	Srn1V3d7mYKn9t6gjsBLbanK25nKuPBwvQNkOust1vz6qR+Qyi+yPLc4zYqLIQYooLtb
	yjr9ZxIz9b0YxxBl33K/zjwdRU3jN0EMM1GzuuybNiaQQCGtibjpAZIlUzwC1meCkS4H
	dC1NkzmHEVH7Gkgto8Tf8lhiHfJQLCyUWa5SNgHnWwP9nKV5aFjz+x9jdFX7qOc2j+Wk
	VxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=etnWqiuctso/PNwIlTbBWKJxvUt8prqFQzJDXeEZSo0=;
	b=nFuqiv7jrb/nvLlyx0/lJrMNmEL3PHDeFjay5tUZKNUx+cKseYyXZvCu7DABeee9ia
	QRjFheHeTqTclzhAcnsxTjxI9jzJ8U9VR8xZohPYm6nD+Mu+dU2zdoRv/KxX7slbdqc4
	G0o/V8mQnnLIauiKe8EgkHfzw5Uazm3SYTjewMZwrY6IpM205n8BE4ihFLk2+6IwqnZw
	VAzY0V2I1oNj/pkM6/OR1rOpbICCjd81Wwmlq23zzfTG+3W0WPvMNoMU60suwVJmEizj
	EurlGlx3vm6hLr5IIkNjI6EwkR0EGRpl13NoJUEEC3TD04c5qTndz7mg/zEkzSFymk63
	2EJg==
X-Gm-Message-State: AFeK/H0dbJXnsObq3gJ7qnsdtlrlHq89tqp3BAEhQZrBV/tXihIUDgIPDzeiU7IXehunxkrf0+4RaDuxuNFoCw==
X-Received: by 10.55.174.6 with SMTP id x6mr37570954qke.318.1490184889757;
	Wed, 22 Mar 2017 05:14:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Wed, 22 Mar 2017 05:14:49 -0700 (PDT)
In-Reply-To: <CAJTo0LaNwjnEvRRYrXwP6DJptvHc0Cm6E2QZyVEKsk1xLVoNJA@mail.gmail.com>
References: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
	<CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
	<CADkTA4Oj1mC+CMoT=DJAzsDtmCnm6TdZAO_xVFhujg+3kiwWVw@mail.gmail.com>
	<CAJTo0LaNwjnEvRRYrXwP6DJptvHc0Cm6E2QZyVEKsk1xLVoNJA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 22 Mar 2017 08:14:49 -0400
Message-ID: <CADkTA4NhsEnk1j=_i3ahu2Lt23t802wn7yfyb5-fK9K3XAdM_Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: design question: should layer.conf contain "PREFERRED_VERSION" settings?
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
X-List-Received-Date: Wed, 22 Mar 2017 12:14:49 -0000
Content-Type: multipart/alternative; boundary=94eb2c06404e010002054b50b563

--94eb2c06404e010002054b50b563
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 22, 2017 at 8:02 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 22 March 2017 at 11:57, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>> So where are they supposed to be specified ? Surely not a separate distro
>> .conf ? and most
>> certainly not in local.conf ... I've always been unsure of where the
>> right place to specify
>> versions like that.
>>
>
> If it were my layer I'd have an .inc file that set all the preferred
> versions where the defaults don't work, that the user would have to include
> in their distro.
>

Aha. Kind of like the old versions file that used to float around.

Seems reasonable (if a bit less automatic than someone like me who wants ..
to use the layer like a black box)

Luckily I have push access to that layer, so I can make a change like that
;)

One final question, is it considered a design option to set those versions
triggered off an IMAGE or DISTRO
feature ? i.e. in anonymous python .. or is that already too late in the
parsing/resolution process ?

Bruce




>
> Ross
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c06404e010002054b50b563
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Mar 22, 2017 at 8:02 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote"=
>On 22 March 2017 at 11:57, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>So where are=
 they supposed to be specified ? Surely not a separate distro .conf ? and m=
ost</div><div>certainly not in local.conf ... I&#39;ve always been unsure o=
f where the right place to specify=C2=A0</div><div>versions like that.</div=
><div></div></blockquote></div><br></span>If it were my layer I&#39;d have =
an .inc file that set all the preferred versions where the defaults don&#39=
;t work, that the user would have to include in their distro.</div></div></=
blockquote><div><br></div><div>Aha. Kind of like the old versions file that=
 used to float around.</div><div><br></div><div>Seems reasonable (if a bit =
less automatic than someone like me who wants .. to use the layer like a bl=
ack box)</div><div><br></div><div>Luckily I have push access to that layer,=
 so I can make a change like that ;)</div><div><br></div><div>One final que=
stion, is it considered a design option to set those versions triggered off=
 an IMAGE or DISTRO</div><div>feature ? i.e. in anonymous python .. or is t=
hat already too late in the parsing/resolution process ?</div><div><br></di=
v><div>Bruce</div><div><br></div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><span class=3D"HOEnZb"><font color=3D=
"#888888"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c06404e010002054b50b563--
