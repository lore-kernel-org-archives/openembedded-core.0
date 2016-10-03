Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 112F0719C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 16:06:59 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n66so10623064qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 09:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JxtqGMmPfY8zPO6kwWT6sCtFqHIhezGv9XsIKcw/fD0=;
	b=R1GaCrKYU1W484xhGlOeXwvEGtLgtuJWBpwR0enJWcV8Adipw3n+6i2xVa4gR2Kvz9
	r83Gk2lCM9OQGzN23cx3bGhaWKFxtgclaonVvprrtJj+bff77zMZ3OI5vPlXYyfwJCsD
	nJhRi4qZBXICgHwJDtpUhqX1G0beh/pmOA9US9+A+zYH5tGbnX+1kTU1Y4uIEWWVYPt5
	jqAQ45i8rR6TgEJVDYoXelJ2IvEb+gjfoc0wgD1CB7GwqX6ONFNi7ioEGXaD3LxEetpY
	/SaYE6aJlPqSJvsGXtpg1vSPxWhgl6SuM0Iqgq+SrZdsuLwj+j1RqRIjixZzLrQqA49w
	HgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JxtqGMmPfY8zPO6kwWT6sCtFqHIhezGv9XsIKcw/fD0=;
	b=FOF/hWRSxr55oANrlQXiEM+whRD+zpmZbsxKBMTw2Dl2rz8+xI7+hZ4/GPIc/fRyLz
	yECNoy/MnafUUZ4Winx0REo6oOKYh2pXH0jXAht7fzb5kpbFCtDmQnangzoaT76vv+S5
	0OhsY8nMEMjXi3HpyZi59bkiSlBN8CG9xm1mHGVWsC3Lq6dDRz5Gg+iUtxuGtnIe+bAB
	L3/TGhowhxVZDptg85Khsrjsdul7eDcGRkob635YJERtlgFx+eJrXM8IAs35cjjwQZqS
	SBcnrrKmPfbGG0//TGhFXQVQW42gLvxkuWTUrvuSl7xfy4bURSSlztUX2j2kOp4Z4N+k
	zcYQ==
X-Gm-Message-State: AA6/9RkN6rZyCmlU+h6ikxgj/vB5VyfCQX10iZd3Ety0M3jR7arFKCQctcbOJ/XCYLLf+giP2jcDo99ljxo1ow==
X-Received: by 10.55.138.66 with SMTP id m63mr21255081qkd.159.1475510821120;
	Mon, 03 Oct 2016 09:07:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Mon, 3 Oct 2016 09:07:00 -0700 (PDT)
In-Reply-To: <CAJTo0LYmZcbyNDW-2smOhvgJv_xi=3mBjmVkrj+u0yYPwosEVA@mail.gmail.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
	<CAJTo0LacaDPQawfsK45GTwOVPohsxQN+e2FtZjEYvT91Ruxb5g@mail.gmail.com>
	<d5b8ad07-09f4-bb3e-46ed-3a93df33ba76@windriver.com>
	<CADkTA4OX5OYXTRaP_JxWhE6CNYq20LXA6e5X4OOEf9=7w3trew@mail.gmail.com>
	<CAJTo0LYmZcbyNDW-2smOhvgJv_xi=3mBjmVkrj+u0yYPwosEVA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Oct 2016 12:07:00 -0400
Message-ID: <CADkTA4MpPtH=-1sELLT9kO0ax-frVsagF5PjiccEZdMJ+DXduQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 03 Oct 2016 16:07:01 -0000
Content-Type: multipart/alternative; boundary=94eb2c060f225af60e053df8224e

--94eb2c060f225af60e053df8224e
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 3, 2016 at 12:03 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 3 October 2016 at 16:57, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>> Out of curiosity, what image type is this ?  built core-image-sato,
>> kernel-dev for
>> x86-64 and they all worked.
>>
>
> net-tools (via core-image-full-cmdline -c populate_sdk) for
> intel-corei7-64.
>


ok. I've reproduced the failure by building just that package, with any
luck I can spin
something for it in the next few minutes and then launch a full build of
that image.

Bruce


>
> Ross
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c060f225af60e053df8224e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 3, 2016 at 12:03 PM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote"=
>On 3 October 2016 at 16:57, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Out of cu=
riosity, what image type is this ? =C2=A0built core-image-sato, kernel-dev =
for</div><div>x86-64 and they all worked.</div><div></div></blockquote></di=
v><br></span>net-tools (via core-image-full-cmdline -c populate_sdk) for in=
tel-corei7-64.</div></div></blockquote><div><br></div><div><br></div><div>o=
k. I&#39;ve reproduced the failure by building just that package, with any =
luck I can spin</div><div>something for it in the next few minutes and then=
 launch a full build of that image.</div><div><br></div><div>Bruce</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span class=
=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c060f225af60e053df8224e--
