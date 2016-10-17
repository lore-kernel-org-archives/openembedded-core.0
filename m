Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id F263D719A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:09:42 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id z190so239763539qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 08:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eCFmYsn2vhpsyqxAdsfiFWmgNcBKUS3rFTJEGpHdRSY=;
	b=J2Sm3ZsvCDOvK49Vi+sw+zY6rmjaLsL04nwReBjr/t5n5wctQh83iO41VQKGW5y2y/
	k/VwkXsEX6uiiCvK+7rc2sRQyFHebejO8I33k4URmjq/CUebEusb99o+Rd5EEDx8J72h
	xpQwP+D5j1I7tivAXf/gK+I1so8kfEVWfKEr4P39iS2bPE1cXIFize6Xv2Fwoj0tq/1I
	HmOZ68w8+KYtv0TKJFyDEZQAifHQQhH/kJMf5JZ6eW57dFwFHJKlQZkPu56UYtIL8MSt
	PA+88+OnwyoF6YpzibLHMlimSypVLfXvmVopcZvTqYJWCRWSb8zKY0hykD8//GdhdPXL
	wguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eCFmYsn2vhpsyqxAdsfiFWmgNcBKUS3rFTJEGpHdRSY=;
	b=GYV2lSGlqpvdHvwFqahp4Xlif8oC5YYaEVbGvoMxAYtYPkVgH1msupJWs/QD6126a4
	z2VwZ+Ia5E7yyYjrny3nKAY2x1vm2qEgzgPEGD2RZVtT74tN813kyaa/BkXaMiOr9my4
	9Hkl6Mz/7uZSN6oMVeWGPmX8OW/Jn/0bmbjQbsLR+c+lZsFGkW9vMyPiJG8W6e1CO017
	DcNjCF34h/81y6GrryZmpzZjUmhJRgrrplxB3k/lsrz3dNF5GAf1iMgm0G0cKEkrUnMp
	0z0oV/K668XPTCn4d5p42WO5+JQBtNjmqJuzErhnDccYvytupxj4a6zUV8DwGEcsTKGN
	l2qQ==
X-Gm-Message-State: AA6/9RkCkI1v/7AuSzXJUxA2gYakrW8ZUfoGgo0qvZr4SspNDPlu58okJLC/RJhUzD6O4YNv1xt6vgp8MOPnWA==
X-Received: by 10.55.138.129 with SMTP id m123mr3906063qkd.159.1476716981818; 
	Mon, 17 Oct 2016 08:09:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Mon, 17 Oct 2016 08:09:41 -0700 (PDT)
In-Reply-To: <44095a65-4aab-648f-5538-08b02f58bee7@siemens.com>
References: <44095a65-4aab-648f-5538-08b02f58bee7@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Oct 2016 11:09:41 -0400
Message-ID: <CADkTA4PHxV6uoUXiGRm7PfPP_sqs8G_9Uxg6wqsB++xKSOp=uw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: The future of qemuarm
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
X-List-Received-Date: Mon, 17 Oct 2016 15:09:43 -0000
Content-Type: multipart/alternative; boundary=94eb2c074b1a22a49f053f10f7c7

--94eb2c074b1a22a49f053f10f7c7
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 17, 2016 at 7:18 AM, Pascal Bach <pascal.bach@siemens.com>
wrote:

> Hi
>
> I read several discussions about lifting the default qemuarm target to
> armv7 or higher.
> On the mailinglist and on the internet I also found several mentions about
> machines qemuarmv7 and qemuarma8, but I didn't find any working machine
> configs for them.
>
> What are the planes here?
>
> Is the goal to increase the default to a higher arm version?
>
> Is there a bsp layer for other qemuarm variants (cortex-a8, ...)?
>

Whatever we replace it with has to be part of linux-yocto and the meta data
that is
carried there, so it can be used for the sanity/smoke test machine for arch
arm.

As such, it has to be feature compatible (network capabilities, disk boot,
etc) with
the existing arm versatile 926ejs platform

There have been newer variants for ages, but since there's been no
compelling
reason to upgrade, I continue to carry the existing platform support along
to the
new kernels. (In fact, I've had a qemuarma9 around for nearly 3 years now,
but
it lacked some disk controller support).

From the kernel point of view, updating the platform doesn't have any big
benefits,
but for userspace it could shake out issues with toolchains and
instructions, so
there is a gain to be had there.

If someone is motivated, I'm happy to help work on an update to the core
qemuarm
platform .. it just has to meet the criteria above.

Cheers,

Bruce


>
> Regards
> Pascal
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c074b1a22a49f053f10f7c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 17, 2016 at 7:18 AM, Pascal Bach <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:pascal.bach@siemens.com" target=3D"_blank">pascal.bach@siemen=
s.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi<br>
<br>
I read several discussions about lifting the default qemuarm target to armv=
7 or higher.<br>
On the mailinglist and on the internet I also found several mentions about =
machines qemuarmv7 and qemuarma8, but I didn&#39;t find any working machine=
 configs for them.<br>
<br>
What are the planes here?<br>
<br>
Is the goal to increase the default to a higher arm version?<br>
<br>
Is there a bsp layer for other qemuarm variants (cortex-a8, ...)?<br></bloc=
kquote><div><br></div><div>Whatever we replace it with has to be part of li=
nux-yocto and the meta data that is<br></div><div>carried there, so it can =
be used for the sanity/smoke test machine for arch arm.<br><br></div><div>A=
s such, it has to be feature compatible (network capabilities, disk boot, e=
tc) with<br></div><div>the existing arm versatile 926ejs platform<br></div>=
<div><br></div><div>There have been newer variants for ages, but since ther=
e&#39;s been no compelling <br></div><div>reason to upgrade, I continue to =
carry the existing platform support along to the<br></div><div>new kernels.=
 (In fact, I&#39;ve had a qemuarma9 around for nearly 3 years now, but <br>=
</div><div>it lacked some disk controller support).<br></div><div><br></div=
><div>From the kernel point of view, updating the platform doesn&#39;t have=
 any big benefits,<br></div><div>but for userspace it could shake out issue=
s with toolchains and instructions, so<br></div><div>there is a gain to be =
had there.<br></div><div><br></div><div>If someone is motivated, I&#39;m ha=
ppy to help work on an update to the core qemuarm<br></div><div>platform ..=
 it just has to meet the criteria above.<br><br></div><div>Cheers,<br><br><=
/div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards<br>
<span class=3D"HOEnZb"><font color=3D"#888888">Pascal<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--94eb2c074b1a22a49f053f10f7c7--
