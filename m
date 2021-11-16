Return-Path: <devendra.tewari@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1C3C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 18:17:39 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.382.1637086658438831479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 10:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kADBc/0x;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: devendra.tewari@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id i9so21510384qki.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 10:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=InDwFRXz6wvcx1jt1nI9V8/ecxN7kc/tKjk6PhSs23g=;
        b=kADBc/0xnavlMiUZgH88OuusNgSNWT7aszktP1rOt3+/Xuz2gMAT3cXscphUSP1oY3
         ODvkwu/G1nkrJ/CS1vkeJeEmtpB2rsKCmVAY5Sl1gTMRZgtLo3YS3ABlwjNjExMObg/L
         BQ80mn6Trlz5b7kM079YsH3bIlJf2Ps2K4V9lCJKAodAzCo8Pd2ODWciT6ZWQbqU6hiW
         EX4du6/O5thh5ohsOhVBAfCOHWEfC+a7fsoXj5GsKgahEMehXgiQllt11E4TcBcqavDD
         h8u4cPmkEQEvYAuRJs/CaLALXFwC8EaddVjpTS2lH//QduFnEhnH82Aa6+vppOh3sp7V
         OnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=InDwFRXz6wvcx1jt1nI9V8/ecxN7kc/tKjk6PhSs23g=;
        b=g/6juF5ZtLElcVJYFCCkEsLk7NuGmW1mPNNlJYWpzgKBEyl9hgdMuY0bOJVOVtcYUf
         kzA5HBBbQLr/F6LR9IBFiZg7SvNnGKaTrYgVPqodpEtLdm+I24ypsRfAg4QjipeBkNZ5
         xiAp2jn5e5C4NHDSa7EIHO1S5lo3k8sTsMZgwc1kk+B7zWMoZ0WY0/W55Rkz6h8k4g3h
         Sa46Kw4TIfWh4NfYJJy2km/VcTb5W+swzJxO34qUPOXBS7RUP8SpKhGEQ80EhHvYDxoL
         xZ2rAWqvgkpz4Lr8MYN6WHT4jZ38zasV8BeAjfFxADVd87ZAZvcmWUT2MzhOHof04cys
         RK9A==
X-Gm-Message-State: AOAM532nhfBiRaBeYYp9ghXgxsSQDYkMbnyLHVlBe2CbzxwSaLpL6F1M
	yPiHOREzT4OsmONOqYMingRemJxs4Wm2GQ==
X-Google-Smtp-Source: 
 ABdhPJwlvcbLLvkrAJ6gISt5XRTrdjeuABiBjE7oAtTdF0njRs6RyATS+Mc533jRdOMBaOTDyy6z/Q==
X-Received: by 2002:ae9:edd3:: with SMTP id
 c202mr7872812qkg.274.1637086657499;
        Tue, 16 Nov 2021 10:17:37 -0800 (PST)
Received: from smtpclient.apple ([187.59.247.30])
        by smtp.gmail.com with ESMTPSA id
 bm35sm8068200qkb.86.2021.11.16.10.17.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Nov 2021 10:17:37 -0800 (PST)
From: Devendra Tewari <devendra.tewari@gmail.com>
Message-Id: <8CE95620-93AA-4B0C-B20E-3A5E3ECC0E06@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E04A2005-4977-49B0-BA83-0A927885C0A0"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [oe] [meta-oe] android-tools: Add flag to enable adbd service
 (#147)
Date: Tue, 16 Nov 2021 15:17:32 -0300
In-Reply-To: 
 <CAH1Ww+SPR6j1_SV-=Ev+XOgHsUismWxGXHPx6_RHwP-W3AJ9Bw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Khem Raj <raj.khem@gmail.com>
To: Daniel Gomez <daniel@qtec.com>
References: 
 <CAH1Ww+SPR6j1_SV-=Ev+XOgHsUismWxGXHPx6_RHwP-W3AJ9Bw@mail.gmail.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 18:17:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158370


--Apple-Mail=_E04A2005-4977-49B0-BA83-0A927885C0A0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Daniel,

> Em 16 de nov. de 2021, =C3=A0(s) 11:49, Daniel Gomez <daniel@qtec.com> =
escreveu:
>=20
> =EF=BB=BFHi Devendra and Khem,
>=20
> I'd like to ask about the 'recent' commit you integrated in the
> android-tools recipe a few months ago:
> =
http://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-devto=
ols/android-tools/android-tools_5.1.1.r37.bb?id=3D4271cc28279b79140fc6bbde=
32c9110aec8d1d86
>=20
> Basically, you are adding a postprocess rootfs command to the $PN-adbd
> package to include the '/var/usb-debugging-enabled' file in your
> rootfs image or not using the 'ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd
> +=3D' line.
> I wonder if this is a new feature or perhaps an error, as I'm trying
> to implement it in dunfell and it does not work as expected. Should
> this work also in dunfell? Are the rootfs postprocess commands
> executed inside the recipe?

I verified it at the time (on master pre hardknott) with rpi-sdimg image =
type (from meta-raspberrypi) set in IMAGE_FSTYPES. Later, I tried to get =
it to work with wic / bmap image fs type but haven=E2=80=99t been able =
to.

> Well, what I'm trying to do is to include a configuration file for the
> dropbear recipe based on the IMAGE_BASENAME so I can include different
> files depending on the image at recipe level. It works fine if I move
> everything to the image recipe:
>=20
> meta-qtec-distro/recipes-core/dropbear $ cat dropbear_%.bbappend
> dropbear () {
>    touch ${IMAGE_ROOTFS}${sysconfdir}/file1
> }
>=20
> dropbear2 () {
>    touch ${IMAGE_ROOTFS}${sysconfdir}/file2
> }
>=20
> PACKAGES =3D+ "${PN}-conf"
>=20
> ROOTFS_POSTPROCESS_COMMAND_${PN}-conf +=3D
> "${@bb.utils.contains("IMAGE_BASENAME", "poky-qtec-image-netboot",
> "dropbear;", "dropbear2;", d)}"
> Any ideas?

Official documentation is not clear where all  =
ROOTFS_POSTPROCESS_COMMAND can be used, but using it in image recipes =
works reliably for me.

> Thanks in advance!
>=20
> Daniel

Regards,
Devendra=

--Apple-Mail=_E04A2005-4977-49B0-BA83-0A927885C0A0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><meta=
 http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div dir=3D"auto" class=3D""><div dir=3D"ltr" =
class=3D""></div><div dir=3D"ltr" class=3D"">Hi Daniel,</div><div =
dir=3D"ltr" class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D"">Em 16 de nov. de 2021, =C3=A0(s) 11:49, Daniel Gomez &lt;<a =
href=3D"mailto:daniel@qtec.com" class=3D"">daniel@qtec.com</a>&gt; =
escreveu:<br class=3D""><br class=3D""></blockquote></div><blockquote =
type=3D"cite" class=3D""><div dir=3D"ltr" class=3D"">=EF=BB=BF<span =
class=3D"">Hi Devendra and Khem,</span><br class=3D""><span =
class=3D""></span><br class=3D""><span class=3D"">I'd like to ask about =
the 'recent' commit you integrated in the</span><br class=3D""><span =
class=3D"">android-tools recipe a few months ago:</span><br =
class=3D""><span class=3D""><a =
href=3D"http://git.openembedded.org/meta-openembedded/commit/meta-oe/recip=
es-devtools/android-tools/android-tools_5.1.1.r37.bb?id=3D4271cc28279b7914=
0fc6bbde32c9110aec8d1d86" =
class=3D"">http://git.openembedded.org/meta-openembedded/commit/meta-oe/re=
cipes-devtools/android-tools/android-tools_5.1.1.r37.bb?id=3D4271cc28279b7=
9140fc6bbde32c9110aec8d1d86</a></span><br class=3D""><span =
class=3D""></span><br class=3D""><span class=3D"">Basically, you are =
adding a postprocess rootfs command to the $PN-adbd</span><br =
class=3D""><span class=3D"">package to include the =
'/var/usb-debugging-enabled' file in your</span><br class=3D""><span =
class=3D"">rootfs image or not using the =
'ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd</span><br class=3D""><span =
class=3D"">+=3D' line.</span><br class=3D""><span class=3D"">I wonder if =
this is a new feature or perhaps an error, as I'm trying</span><br =
class=3D""><span class=3D"">to implement it in dunfell and it does not =
work as expected. Should</span><br class=3D""><span class=3D"">this work =
also in dunfell?&nbsp;</span>Are the rootfs postprocess =
commands</div></blockquote><blockquote type=3D"cite" class=3D""><div =
dir=3D"ltr" class=3D""><span class=3D"">executed inside the =
recipe?</span><br class=3D""></div></blockquote><br class=3D""><div =
class=3D"">I verified it at the time (on master pre hardknott) with =
rpi-sdimg<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp;image type</span>&nbsp;(from&nbsp;<span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">meta-raspberrypi)</span><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">&nbsp;set =
in&nbsp;</span>IMAGE_FSTYPES. Later, I tried to get it to work with wic =
/ bmap image fs type&nbsp;<span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">but haven=E2=80=99t been =
able</span><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D"">&nbsp;to</span>.</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div dir=3D"ltr" class=3D""><span =
class=3D"">Well, what I'm trying to do is to include a configuration =
file for the</span><br class=3D""><span class=3D"">dropbear recipe based =
on the IMAGE_BASENAME so I can include different</span><br =
class=3D""><span class=3D"">files depending on the image at recipe =
level. It works fine if I move</span><br class=3D""><span =
class=3D"">everything to the image recipe:</span><br class=3D""><span =
class=3D""></span><br class=3D""><span =
class=3D"">meta-qtec-distro/recipes-core/dropbear $ cat =
dropbear_%.bbappend</span><br class=3D""><span class=3D"">dropbear () =
{</span><br class=3D""><span class=3D""> &nbsp;&nbsp;&nbsp;touch =
${IMAGE_ROOTFS}${sysconfdir}/file1</span><br class=3D""><span =
class=3D"">}</span><br class=3D""><span class=3D""></span><br =
class=3D""><span class=3D"">dropbear2 () {</span><br class=3D""><span =
class=3D""> &nbsp;&nbsp;&nbsp;touch =
${IMAGE_ROOTFS}${sysconfdir}/file2</span><br class=3D""><span =
class=3D"">}</span><br class=3D""><span class=3D""></span><br =
class=3D""><span class=3D"">PACKAGES =3D+ "${PN}-conf"</span><br =
class=3D""><span class=3D""></span><br class=3D""><span =
class=3D"">ROOTFS_POSTPROCESS_COMMAND_${PN}-conf +=3D</span><br =
class=3D""><span class=3D"">"${@bb.utils.contains("IMAGE_BASENAME", =
"poky-qtec-image-netboot",</span><br class=3D""><span =
class=3D"">"dropbear;", "dropbear2;", d)}"</span><br =
class=3D""></div></blockquote><blockquote type=3D"cite" class=3D""><div =
dir=3D"ltr" class=3D""><span class=3D"">Any ideas?</span><br =
class=3D""></div></blockquote><div dir=3D"auto" class=3D""><br =
class=3D""></div><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D"">Official documentation is not clear where all =
&nbsp;ROOTFS_POSTPROCESS_COMMAND can be used, but using it in image =
recipes works reliably for me.</span></div><div class=3D""><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D""><br class=3D""></span></font><blockquote type=3D"cite" =
class=3D""><div dir=3D"ltr" class=3D""><span class=3D"">Thanks in =
advance!</span><br class=3D""><span class=3D""></span><br class=3D""><span=
 class=3D"">Daniel</span><br class=3D""></div></blockquote><br =
class=3D""><div class=3D"">Regards,</div><div =
class=3D"">Devendra</div></div></body></html>=

--Apple-Mail=_E04A2005-4977-49B0-BA83-0A927885C0A0--

