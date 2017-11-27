Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 712AC782CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:21:16 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id p80so17574554vkd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 07:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jNr70/Qo7IwIE2WPKvIzcYNwHi+RqIUDg0Z2V2V349g=;
	b=ScquT28zj6icHf8hsftU1zNcaZ/ql2bSg6IhEnxuNubXWSxZ+jPcIMtnaByAB1DO6r
	cQRpy49Y9uRn9yryCujARXhd+M4ePiApLnTtVwjRK6go05aqbSDidiZo6HkB0a8Rtm6K
	0acSo2ylRgnSgRGDu8z22ksr0Thoa1F1jzCaV3Y4lnG9AghiC6GWRHLkJYSl7lqFhfpN
	1Cl0+g5Hunzf3aF7KXtkW5O+OQ5yla+XlTzY0wTIoM+28WYaHDs8FNmpZuzwsGyFyqp9
	cp4cI7xeX/PE00/fUdAvcMZ3QGNESIYd9Z/Xec6LNQ1p3snh7AwbCza0NKvRLWBAQn9H
	OqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jNr70/Qo7IwIE2WPKvIzcYNwHi+RqIUDg0Z2V2V349g=;
	b=QPqpharrryAml8ZQn4r1VaOUwmVE/pO3/5VKUm1bw2GYSCH4KLVDGkqcYnXMSYurp0
	ST+aWmAkZ5tAFIY92B8qO+45TMFy8zh2xIP3niZNJHyRpYT2WbOsI4/RRQUZ5Fu5niv6
	zihrB9zxfJTgNhaQA8gTuolp9STKhAqp6TzXLtWIslI05SYmUkgoubcfyjTORT7bkvO+
	kGsEyR0w9W76LYhjMcdCf3IBM8wghg70egBbiYz/1FTMdwSNequi5NZQgsLf6cvsTIoa
	WB9X+d4vk/IyeVdu7YMCc97R/KKTCvL9g12F1sz26p5PG9v9aPfGA6M/qhLFnabLvwsn
	6gSg==
X-Gm-Message-State: AJaThX7W8gZ1Oo9gW7R04zs8DYUeTmKXJ25glIOLi4veV3FQmYLGldGb
	lyBhuQ8RSTnnSivMFFgiEVjO+W2GYuOoOW1D0G8=
X-Google-Smtp-Source: AGs4zMaWB10Ky1Hv14iCGRAHoLy9fiBBcjNP2cxBZWYn3Z/5DPyqFy4ABb66Xr0eTYNU2BoqMhnvvC2ea6I/d4e4bG4=
X-Received: by 10.31.80.68 with SMTP id e65mr28171344vkb.175.1511796077341;
	Mon, 27 Nov 2017 07:21:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.72.130 with HTTP; Mon, 27 Nov 2017 07:20:56 -0800 (PST)
In-Reply-To: <f1a7d03a68bf628db677027d48281c55f2b8dfba.1477448814.git.hongxu.jia@windriver.com>
References: <cover.1477448814.git.hongxu.jia@windriver.com>
	<f1a7d03a68bf628db677027d48281c55f2b8dfba.1477448814.git.hongxu.jia@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 27 Nov 2017 08:20:56 -0700
Message-ID: <CABcZANms469xJTfjSuRbmZpjJFBMKrsoJZ_zeHzSvgtjakPLcw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] fontcache: fix fonts postinst failed
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
X-List-Received-Date: Mon, 27 Nov 2017 15:21:16 -0000
Content-Type: multipart/alternative; boundary="001a114e2ec029b188055ef874ef"

--001a114e2ec029b188055ef874ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2016 at 7:31 PM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> While instal liberation-fonts to image, the fonts postinst
> failed at do_rootfs time:
> -----------------------------------------------
> |WARNING: core-image-minimal-1.0-r0 do_rootfs: The postinstall intercept
> hook
> 'update_font_cache' failed (exit code: 139)! See log for details!
> |WARNING: core-image-minimal-1.0-r0 do_rootfs: The postinstalls for the
> following packages will be postponed for first boot: liberation-fonts
> -----------------------------------------------
>
> Since the following commit applied in oe-core
> -----------------------------------------------
> commit ce1e7fcc60276040477c1d5e3129e029bb9f204b
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Fri Sep 30 17:43:23 2016 +0100
>
>     allarch: Fixes to stop rebuilds when change multilibs
> -----------------------------------------------
> It assignes base_libdir=3D"/none" which caused fonts postinst failed at
> do_rootfs.
>
> The fonts postinst invoke qemu to update font cache which requires
> base_libdir arch relative(such as base_libdir=3D"/lib64").
>
> We refer what meta/conf/multilib.conf does, assign it with arch relative.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>


Without this, we get the mentioned warnings with every qemux86-64 or
intel-corei7-64 build using our external toolchain. Were there any
objections to merging this? It doesn=E2=80=99t seem as though it ever went =
in, but
this was a year ago now.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114e2ec029b188055ef874ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Oct 25, 2016 at 7:31 PM, Hongxu Jia <span dir=3D"l=
tr">&lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongx=
u.jia@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">While instal liberat=
ion-fonts to image, the fonts postinst<br>
failed at do_rootfs time:<br>
------------------------------<wbr>-----------------<br>
|WARNING: core-image-minimal-1.0-r0 do_rootfs: The postinstall intercept ho=
ok<br>
&#39;update_font_cache&#39; failed (exit code: 139)! See log for details!<b=
r>
|WARNING: core-image-minimal-1.0-r0 do_rootfs: The postinstalls for the<br>
following packages will be postponed for first boot: liberation-fonts<br>
------------------------------<wbr>-----------------<br>
<br>
Since the following commit applied in oe-core<br>
------------------------------<wbr>-----------------<br>
commit ce1e7fcc60276040477c1d5e3129e0<wbr>29bb9f204b<br>
Author: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
Date:=C2=A0 =C2=A0Fri Sep 30 17:43:23 2016 +0100<br>
<br>
=C2=A0 =C2=A0 allarch: Fixes to stop rebuilds when change multilibs<br>
------------------------------<wbr>-----------------<br>
It assignes base_libdir=3D&quot;/none&quot; which caused fonts postinst fai=
led at<br>
do_rootfs.<br>
<br>
The fonts postinst invoke qemu to update font cache which requires<br>
base_libdir arch relative(such as base_libdir=3D&quot;/lib64&quot;).<br>
<br>
We refer what meta/conf/multilib.conf does, assign it with arch relative.<b=
r>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;</blockquote><div><br></div><div>Without thi=
s, we get the mentioned warnings with every qemux86-64 or intel-corei7-64 b=
uild using our external toolchain. Were there any objections to merging thi=
s? It doesn=E2=80=99t seem as though it ever went in, but this was a year a=
go now.</div></div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<=
br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<=
br>Senior Software Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a114e2ec029b188055ef874ef--
