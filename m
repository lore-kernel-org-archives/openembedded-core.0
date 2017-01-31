Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6071771E43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 20:24:11 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id k15so245847173qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qXwFk+XpRH1Y05d3SZ2J1HSYJ2V6n/sLKkikritMTEQ=;
	b=Y0uVJPvIg5kDOsnKHQbIag+qGbw3PwT38QfzZBuJWm6U6m9I35cC9TIDxKb/SJSWr4
	jv+bMA0JIx2CQjNjgyjYSleYj/MVeOkNZjCIhzu5ZXK0Hrfz/TmpXorpZqjLlRAkmz9J
	OYQWge4l7U80VsmXxT0m+aggMa11sOviunlm8je1pJq7+ToQWK3B41o96ITEiEOfPE3p
	Xl2pN8UttAtbFrpCGefkZSD5eoaUfbuGBX9NrsS+9YzBApSaklAJHTORSq4HJ3dCUkAh
	CJnGnvIEz+IF+Ud1leG83attPhwOKouQQUEcwwPZV4p7JwiUXZyqKQuyw9fTtX/Ks2gv
	MxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qXwFk+XpRH1Y05d3SZ2J1HSYJ2V6n/sLKkikritMTEQ=;
	b=mPzrJSUnTS4Hoc3Pw/tcap0GCefrPkY6SKsdVenlVHazOvA/Zz5WqdIJN5MQTePCLQ
	S0wSt2LMv3ONDVfjtJtYbXQDDgimgIwG3Ved8zdqMKJEi3zp514sYMIawcEJ0bPoakWg
	u+mjas4KSr6V9gun0LA7/1EY6kkZmTNxrmihU32K5uawptah10rb6etfDnly8UFx/GvZ
	/Wrrd5Me39sVnJRUQ3jZKh8JMcG0vwfdzDii3hVTIFbB5KWLb0jg2LodP6rZ/5atER33
	U9hWluTUTTpwa06TyP47vdh2YGF/8w5BYRSrtFk+E82JIIZKcNCvKochFVtwJIj0iCj9
	c/Yw==
X-Gm-Message-State: AIkVDXKMw0o3r+AlmGVVUo74Cd5K90S9+FGhdIamVwU/1LJeGpRqQSbSOYTH6HI9gSclbiOux5XlxctPEYejxN58
X-Received: by 10.200.45.247 with SMTP id q52mr29289890qta.197.1485894252292; 
	Tue, 31 Jan 2017 12:24:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 31 Jan 2017 12:23:51 -0800 (PST)
In-Reply-To: <20170131171049.GA3273@jama>
References: <20170131171049.GA3273@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Jan 2017 20:23:51 +0000
Message-ID: <CAJTo0LYAkjsJ2bJSzsVTWTxdVaNnN1_aSehw=uueF=EK+cLdEw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-01-31
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
X-List-Received-Date: Tue, 31 Jan 2017 20:24:13 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf0150732054769b798

--001a1139cdf0150732054769b798
Content-Type: text/plain; charset=UTF-8

On 31 January 2017 at 17:10, Martin Jansa <martin.jansa@gmail.com> wrote:

>     * openembedded-core/meta/recipes-connectivity/wpa-
> supplicant/wpa-supplicant_2.6.bb:do_compile
>
    * openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.16.bb:do_configure
>      * openembedded-core/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb:
> do_configure


Already fixed in master.

    * openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:
> do_configure
>     * openembedded-core/meta/recipes-extended/cups/cups_2.2.1.bb:
> do_configure
>

Fixed locally, will send patches shortly.

    * openembedded-core/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb:
> do_compile
>
    * openembedded-core/meta/recipes-devtools/qemu/qemu_2.7.1.bb:
> do_configure

    * openembedded-core/meta/recipes-kernel/latencytop/latencytop_0.5.bb:
> do_compile


These were a very odd explosion in the sysroot code, no idea what happened
here...  would be interested to see if they replicate.

Ross

--001a1139cdf0150732054769b798
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 31 January 2017 at 17:10, Ma=
rtin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div id=3D"gmail-:50u" class=3D"gmail-a3=
s gmail-aXjCH gmail-m159f582b3a791b09">=C2=A0 =C2=A0 * openembedded-core/me=
ta/<wbr>recipes-connectivity/wpa-<wbr>supplicant/wpa-supplicant_2.6.<wbr>bb=
:do_compile<br></div></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex">=C2=A0 =C2=A0 * openem=
bedded-core/meta/<wbr>recipes-devtools/rpm/rpm_5.4.<wbr>16.bb:do_configure<=
br>=C2=A0 =C2=A0 =C2=A0* openembedded-core/meta/<wbr>recipes-support/atk/at=
-spi2-<wbr>atk_2.22.0.bb:do_configure</blockquote><div><br></div><div>Alrea=
dy fixed in master.</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rg=
b(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:=
50u" class=3D"gmail-a3s gmail-aXjCH gmail-m159f582b3a791b09">
=C2=A0 =C2=A0 * openembedded-core/meta/<wbr>recipes-devtools/pkgconfig/<wbr=
>pkgconfig_git.bb:do_configure<br>=C2=A0 =C2=A0 * openembedded-core/meta/<w=
br>recipes-extended/cups/cups_2.<wbr>2.1.bb:do_configure<br></div></blockqu=
ote><div>=C2=A0</div><div>Fixed locally, will send patches shortly.</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D"gmail-:50u" class=3D"gmail-a3s gma=
il-aXjCH gmail-m159f582b3a791b09">
=C2=A0 =C2=A0 * openembedded-core/meta/<wbr>recipes-graphics/pong-clock/<wb=
r>pong-clock_1.0.bb:do_compile<br></div></blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=C2=
=A0 =C2=A0 * openembedded-core/meta/<wbr>recipes-devtools/qemu/qemu_2.<wbr>=
7.1.bb:do_configure</blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex">=C2=A0 =C2=A0 * openembedd=
ed-core/meta/<wbr>recipes-kernel/latencytop/<wbr>latencytop_0.5.bb:do_compi=
le</blockquote><div><br></div><div>These were a very odd explosion in the s=
ysroot code, no idea what happened here... =C2=A0would be interested to see=
 if they replicate.</div><div><br></div><div>Ross</div></div></div></div>

--001a1139cdf0150732054769b798--
