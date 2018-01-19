Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5B82870016
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 17:59:21 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 16so2299043wry.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 09:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2QWJo0vt62hLTLjpVKXWcALP44kd5oF31UN3EVHVWCA=;
	b=mSOitBWLQwYDlLtpBe+XMq70ZYYy7Oajwow4sc4l2vW3cCye0dRKOBV8XGpm8svGme
	1GlZzTBvOhnamPaROsxHyazSBBPjsuK+Z+YYGZS0LszWhbA+38bwGjA/A9EB5IEM66IH
	TL+rP8khuWF9yCvtx80Xp6ATmaGVHUW3Wx1jL1kG+8qx09tKHjjYueAi5qvj8P55BPwY
	UNQ6PH7BgHWY2iQgI+CYXlbbup2AtAC1tmkzdvTy7DVjDw97aJFi6R/FzVk70j/m/wBx
	HjUYUAlPekuwYe9o7KHyP4oECQYWdvsdZaihmBkbDkYyhDkm0Gwd6QoBU7sddmVqf0mU
	XOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2QWJo0vt62hLTLjpVKXWcALP44kd5oF31UN3EVHVWCA=;
	b=ZSTzXNvtVoBydDjCgF5r7/SP2Oj+OOKzrJ7wDyj9P20Y+1Cx6D56NHrjRynnNH+MAR
	Vwq11J/Eep6F05XgdZZ5ky9FHF982wCKsmiYTifPSxi4oaRjRlssjEfNiqcu1HgBVtnX
	5f4oweR6mfXipYOGTZwj+yVipwLiU5/lYIUX5dg399rS6VofQTkTmsExP5hI8Mjac/5t
	ZXc26ZAJ0tx6SCN8InlxMRn/sXkqXbSIeT6wlPIMnZMqgCVyXfpPpIxaY9HmRcnGutz3
	7L/oC846UKGYPXnjH0dnGI7oMmDlwwjxC07qAAY02QLFozgcnRtJJ8WvKlZJpHnVMOTs
	ihAw==
X-Gm-Message-State: AKwxytf6oAt1MrQip2cawpsBkDlvO0tsQo7JW+7Us7Lr4hkLzsrXU4Ts
	FrWFqBJd4iFixbNbnO6qHhCIB9lCumaGWcQg8RXGbg==
X-Google-Smtp-Source: ACJfBosdRAu7zTPe94H60lyrJbF3WYhUlJhOvcv4QKoRs1lszp5Y53VqU0AZ9oy5KMplPdho76Z+wjEvtRw+AU7BTbM=
X-Received: by 10.223.192.13 with SMTP id z13mr10625865wre.58.1516384762237;
	Fri, 19 Jan 2018 09:59:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 19 Jan 2018 09:59:21 -0800 (PST)
In-Reply-To: <ced1db99-56e4-584e-775a-a345197a00bf@linux.intel.com>
References: <151627986059.9023.14010623458474127186@git.openembedded.org>
	<20180118125101.2F92F235ED3@git.openembedded.org>
	<CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com>
	<CAJTo0LYJrDXkSG3zhEowg2UbFyYvoAPKKDUKoGd8qQ_yfBwCCA@mail.gmail.com>
	<CA+chaQczyj5GwNbcPrWsUAeyGv6Lo3MCaanRNpc5dj0BD96+nA@mail.gmail.com>
	<ced1db99-56e4-584e-775a-a345197a00bf@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 19 Jan 2018 18:59:21 +0100
Message-ID: <CA+chaQcum56vWjDunvXB-iWHV097SyLUiQusOVwgTkisPzQOTA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 08/08: json-glib: update to 1.4.2
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
X-List-Received-Date: Fri, 19 Jan 2018 17:59:21 -0000
Content-Type: multipart/alternative; boundary="089e08e59d03189862056324d769"

--089e08e59d03189862056324d769
Content-Type: text/plain; charset="UTF-8"

I have gobject-introspection-data in DISTRO_FEATURES_BACKFILL_CONSIDERED.

I am able to reproduce this with nodistro after adding:
DISTRO_FEATURES_remove = "gobject-introspection-data"
or the same to DISTRO_FEATURES_BACKFILL_CONSIDERED.

This one is with require conf/distro/include/security_flags.inc
http://errors.yoctoproject.org/Errors/Details/164873/

this one is without security_flags.inc:
http://errors.yoctoproject.org/Errors/Details/164874/

The older version was building fine with gobject-introspection disabled.


On Fri, Jan 19, 2018 at 4:07 PM, Alexander Kanavin <alexander.kanavin@linux.
intel.com> wrote:

> On 01/19/2018 04:06 PM, Martin Jansa wrote:
>
>> qemuarm, qemux86, raspberrypi3 and few more arm MACHINEs.
>>
>
> I just tried with qemux86 - builds fine, and the g-i files are present in
> the packages.
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e08e59d03189862056324d769
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have=C2=A0gobject-introspection-<wbr>data in DISTRO=
_FEATURES_BACKFILL_<wbr>CONSIDERED.</div><div><br></div><div>I am able to r=
eproduce this with nodistro after adding:</div><div>DISTRO_FEATURES_remove =
=3D &quot;gobject-introspection-data&quot;<br></div><div>or the same to=C2=
=A0DISTRO_FEATURES_BACKFILL_<wbr>CONSIDERED.</div><div><br></div><div>This =
one is with=C2=A0require conf/distro/include/security_<wbr>flags.inc</div><=
div><a href=3D"http://errors.yoctoproject.org/Errors/Details/164873/" targe=
t=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/164873/</a>=
<br></div><div><br></div><div>this one is without security_flags.inc:</div>=
<div><a href=3D"http://errors.yoctoproject.org/Errors/Details/164874/">http=
://errors.yoctoproject.org/Errors/Details/164874/</a><br></div><div><br></d=
iv><div>The older version was building fine with gobject-introspection disa=
bled.<br></div><div><br></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Fri, Jan 19, 2018 at 4:07 PM, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.<wbr>intel.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-m_2060=
654830307083999gmail-">On 01/19/2018 04:06 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
qemuarm, qemux86, raspberrypi3 and few more arm MACHINEs.<br>
</blockquote>
<br></span>
I just tried with qemux86 - builds fine, and the g-i files are present in t=
he packages.<br>
<br>
Alex<span class=3D"gmail-m_2060654830307083999gmail-HOEnZb"><font color=3D"=
#888888"><br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--089e08e59d03189862056324d769--
