Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id A58E7780AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:34:44 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id q24so9577842ioh.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 03:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5OMn690oaLcP6cuZfbn0Rosac9Cqj0RzW+Ju/st29As=;
	b=n7nrn965xTB0/j38lyxcKpD1zsNTRTDLm671adYqxhl5ZFI7KSzI0bddw6nHr2vqym
	etrzYppRaNwPoyFToly9GFUjzSbUEZ++EWXVDa+nthY+tvPe6ToMBX2c1l6lK9fTkIwt
	O8VRR9z4kb4qEukAteJNeGwAY5emaAT9UTsHe8jkjFYMY79LZPrSTXV8HnMkbLS0L4pZ
	/yQlHr8Tk+tl2lATjbEY/ohR9HZOSw4WJYEBFNyc/aL02/QSCKdeO8nmNdzFh7KhJbYU
	En8HWG6uDQTZ7mq3VXn5KZzUv9/dikz6Dhe6ONIyx51bn8+BZAGFNSe0prJhaFvw3qVr
	9SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5OMn690oaLcP6cuZfbn0Rosac9Cqj0RzW+Ju/st29As=;
	b=ZGApyzkKSuHJKBWQ8V0gDUFrgivunmVKATVZ3stc9y6GmOHJmaokgVlIDlrgc9Hm82
	NvdDhR+13K2DuFmna/L47xsSsmtUmXqiWqidDttEuTxC9/QLtWlpK0W01osP9G3f1yDm
	EkTG1XkizgUsngU+qIzdYBg13XUaT4CSogrP57peTLteg5yqh2XRuMXZZXATtklDbH5+
	iCrq+vvMKOouDbKF8JpC1/Gxx05KWeEJ1FN8YCINDz9OEPfyqum/HvhjSvK3zaxOGZQN
	08twcgZrkWZqRcPREWzwbpjScb5NRm/9uD3UpgxCeCcBWbeewGtU/3LeN/LTilvcAZa2
	+wmg==
X-Gm-Message-State: APf1xPCkD5o7qFhSReHWLuud3u7CxGStPHAYcFqaXh0BBE69pTnKTCln
	6cDcT4uCh6reR1akSFKd9Hk10jLSbO8/7yAgsJQZVA==
X-Google-Smtp-Source: AG47ELvUVcFZ5oh/mk6qzvjMI33vCxgWAhA2gDtt6My9RjZi90Q3zTSfEjltJsq0u0oYRNHS3njgtotzcyfsygCZHr0=
X-Received: by 10.107.6.139 with SMTP id f11mr12086866ioi.23.1519644885474;
	Mon, 26 Feb 2018 03:34:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Mon, 26 Feb 2018 03:34:25 -0800 (PST)
In-Reply-To: <20180226075447.GA8270@mbabyjoh-desk.ger.corp.intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
	<1519029438-11092-2-git-send-email-maxin.john@intel.com>
	<CAMKF1spVFhwnV2v4+O0KV-+9+a66HSK9eWyYzdJK142TZ1rXGQ@mail.gmail.com>
	<20180226075447.GA8270@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Feb 2018 11:34:25 +0000
Message-ID: <CAJTo0LaBDD9_uw19tF3J7Rg=Ua5QZEJrtgAVVHzMK_-+A58rnA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/27] pkgconf: upgrade to version 1.4.2
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
X-List-Received-Date: Mon, 26 Feb 2018 11:34:44 -0000
Content-Type: multipart/alternative; boundary="001a113eeaea957a4b05661be5b9"

--001a113eeaea957a4b05661be5b9
Content-Type: text/plain; charset="UTF-8"

Whoops, I thought the upgrade was safe without the rest of the series.

Khem, are you using pkgconf instead of pkg-config then?

Ross

On 26 February 2018 at 07:54, Maxin B. John <maxin.john@intel.com> wrote:

> Hi Khem,
>
> On Sun, Feb 25, 2018 at 11:18:58PM -0800, Khem Raj wrote:
> > This is regressing kmod builds
> >
> > ERROR: kmod-25+gitAUTOINC+aca4eca103-r0 do_package: QA Issue: kmod:
> > Files/directories were installed but not shipped in any pack
> > age:
> >
> > /mnt/a/oe-build/build/tmp/work/aarch64-bec-linux/kmod/
> 25+gitAUTOINC+aca4eca103-r0/recipe-sysroot/usr/share/bash-
> completion/completions/kmod
> >
> > as you can see its stll carrying the sysroot prefix into DESTDIR
> >
> > and this is how kmod is asserting for bash-completion dir
> >
> > with_bashcompletiondir=$($PKG_CONFIG --variable=completionsdir
> bash-completion)
> >
> > it was working fine with 1.4.0
>
> Good catch. This patch has removed the work-around that we had to make
> pkgconf build compatible with freedesktop.org's pkg-conf in wrappers like:
>
> > > -            unset PKG_CONFIG_SYSROOT_DIR
>
> Without the associated kmod fix, this will fail as above. I will revert
> those wrapper changes till we decide to go with pkgconf or not.
>
> > On Mon, Feb 19, 2018 at 12:36 AM, Maxin B. John <maxin.john@intel.com>
> wrote:
> > > pkgconf improved compatibility with freedesktop.org pkg-config.
> > > So, we don't need to unset PKG_CONFIG_SYSROOT_DIR in wrappers.
> > >
> > > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > > ---
> > >  meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in         | 4
> +---
> > > -            unset PKG_CONFIG_SYSROOT_DIR
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113eeaea957a4b05661be5b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Whoops, I thought the upgrade was safe without the rest of=
 the series.<div><br></div><div>Khem, are you using pkgconf instead of pkg-=
config then?</div><div><br></div><div>Ross</div></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On 26 February 2018 at 07:54, Maxin B.=
 John <span dir=3D"ltr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=
=3D"_blank">maxin.john@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi Khem,<br>
<span class=3D""><br>
On Sun, Feb 25, 2018 at 11:18:58PM -0800, Khem Raj wrote:<br>
&gt; This is regressing kmod builds<br>
&gt;<br>
&gt; ERROR: kmod-25+gitAUTOINC+aca4eca103-<wbr>r0 do_package: QA Issue: kmo=
d:<br>
&gt; Files/directories were installed but not shipped in any pack<br>
&gt; age:<br>
&gt;<br>
&gt; /mnt/a/oe-build/build/tmp/<wbr>work/aarch64-bec-linux/kmod/<wbr>25+git=
AUTOINC+aca4eca103-r0/<wbr>recipe-sysroot/usr/share/bash-<wbr>completion/co=
mpletions/kmod<br>
&gt;<br>
&gt; as you can see its stll carrying the sysroot prefix into DESTDIR<br>
&gt;<br>
&gt; and this is how kmod is asserting for bash-completion dir<br>
&gt;<br>
&gt; with_bashcompletiondir=3D$($PKG_<wbr>CONFIG --variable=3Dcompletionsdi=
r bash-completion)<br>
&gt;<br>
&gt; it was working fine with 1.4.0<br>
<br>
</span>Good catch. This patch has removed the work-around that we had to ma=
ke<br>
pkgconf build compatible with <a href=3D"http://freedesktop.org" rel=3D"nor=
eferrer" target=3D"_blank">freedesktop.org</a>&#39;s pkg-conf in wrappers l=
ike:<br>
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset PKG_CONFIG_SYSRO=
OT_DIR<br>
<br>
Without the associated kmod fix, this will fail as above. I will revert<br>
those wrapper changes till we decide to go with pkgconf or not.<br>
<span class=3D""><br>
&gt; On Mon, Feb 19, 2018 at 12:36 AM, Maxin B. John &lt;<a href=3D"mailto:=
maxin.john@intel.com">maxin.john@intel.com</a>&gt; wrote:<br>
&gt; &gt; pkgconf improved compatibility with <a href=3D"http://freedesktop=
.org" rel=3D"noreferrer" target=3D"_blank">freedesktop.org</a> pkg-config.<=
br>
&gt; &gt; So, we don&#39;t need to unset PKG_CONFIG_SYSROOT_DIR in wrappers=
.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@int=
el.com">maxin.john@intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/pkgconf/<wbr>pkgconf/<a href=3D"http:=
//pkg-config-esdk.in" rel=3D"noreferrer" target=3D"_blank">pkg-config-esdk.=
in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 +---<br>
</span>&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset PKG_CONFI=
G_SYSROOT_DIR<br>
<br>
Best Regards,<br>
Maxin<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a113eeaea957a4b05661be5b9--
