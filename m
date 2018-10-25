Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF5478F5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 09:05:42 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t10-v6so8426251wrn.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 02:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wWIhKvDXaCs4pcz5KFpkOYBAoVW75e7nuukoYmXClr4=;
	b=m/IOR/Vy/+x62pctOUu5tkbwbocjBWAyBmFgnhtz45DmSoN8NZpkX13kA+IYTZmR6h
	Y5Vem/aSKGoKPd7IAjyZyw0Z1YJBRXPCY34xWpd4or9cQ/499azmTtmzg0QcupqOK2q4
	iT6ACJe/bQxuyfK2eOm3vxKlHC2u0duovP2sCXcUVH8tnBoidQSgCtLx9dcL8sjpteXh
	Iact1Xwj5cWaoMVBxYPvjqfC8MhnAQUzQOCydo1I5Dks4FBWYaZ7XemRoNAyACXGMwNo
	RWUkWdCXbWVD4qQTX8p1vAOw4+Pv1VdqAtc+qis4GuG1gKtm7g4bbXn+AtwyXeqkvSoC
	JR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wWIhKvDXaCs4pcz5KFpkOYBAoVW75e7nuukoYmXClr4=;
	b=a4iI4+p3zHihvmuNJJpQAxeYD0A+1UFdLlYnj6UcblLOFyBB9rbJubMw9+XyzoE9sz
	hoXbiVtUQxtsF0NSe/EEgirus5+6FIHkyGIe6XyPTOIitj9VJmy/UHhLA3Oo9/AfV27f
	Q9f4GVVlkTj1rGzt4VSDjS6EpUxgG4ExlQhuMOKv+L7B9V/INQ7t+o9Ke8re4cWHZ+FM
	nfQjKOicgvSLNcCJtCygyBv5AeXu9HXGrFMi/wasOjHncLOMdPKFmLcO+KRZaKptT6oT
	UMjBaJe31odK/zfakLGQG/CX3CE5Q2TnPVadDH1/sx21mlZeEb9DuI4g9E1G6sXTwXHa
	cTFQ==
X-Gm-Message-State: AGRZ1gIpHaGzMT0EFfZdLhBUkljLbUp/VAIrDJfY7KCWNgKBfOPoYk2I
	ajYBon460+ab0nrzur5e8fA3zGj8y73d9rR3QmA=
X-Google-Smtp-Source: AJdET5dzwbAeXmREo038HYfexpqlg/VR0ow0FKrNWhAt415wm0tbClp/s4zvmv3npDGoSwtpEFOUhdpw5k2nYN4yJEc=
X-Received: by 2002:a5d:4c84:: with SMTP id z4-v6mr983449wrs.75.1540458343622; 
	Thu, 25 Oct 2018 02:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20181017164326.67111-1-mark.hatle@windriver.com>
	<20181017164326.67111-4-mark.hatle@windriver.com>
	<CAJTo0LY3gqvFDMzg48s0q4kZZ=WPpdj8u+jb-7gXFGmA-MBbPw@mail.gmail.com>
	<A6C49273-61A8-44B5-8E5C-65DE81A27B29@gmail.com>
In-Reply-To: <A6C49273-61A8-44B5-8E5C-65DE81A27B29@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 25 Oct 2018 11:05:33 +0200
Message-ID: <CA+chaQcXnq4YOBB5vey9F_0c9oABs5M1xZW_Xgedn966qqVARQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] weston: Remove machine specific append
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
X-List-Received-Date: Thu, 25 Oct 2018 09:05:43 -0000
Content-Type: multipart/alternative; boundary="0000000000005cee74057909e8d0"

--0000000000005cee74057909e8d0
Content-Type: text/plain; charset="UTF-8"

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12938

On Thu, Oct 25, 2018 at 10:36 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> As far as I know virglrenderer works rather well now, and we should take
> it into use. WebOS already has support for it.
> https://lwn.net/Articles/767970/
>
> Alex
>
> On 18 Oct 2018, at 12.24, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Wed, 17 Oct 2018 at 17:44, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> -EXTRA_OECONF_append_qemux86 = "\
>
> +EXTRA_OECONF_append_x86 = "\
>
>                WESTON_NATIVE_BACKEND=fbdev-backend.so \
>
>                "
>
>
> This forces all x86 Westons that are not running inside X11 to use
> fbdev instead of drm.
>
> Two questions:
> 1) does qemu still need fbdev or does virtio/drm work now?  (iirc, we
> still have a crippled qemu here)
> 2) Can this be overridden in a config file instead
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005cee74057909e8d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><a href=3D"https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D12938">https://bugzilla.yoctoproject.org/show_bug.cgi=
?id=3D12938</a><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr">On Thu, Oct 25, 2018 at 10:36 AM Alexander Kanavin &lt;<a href=3D"mailt=
o:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"auto">As far as I know virglrender=
er works rather well now, and we should take it into use. WebOS already has=
 support for it.=C2=A0<div><a href=3D"https://lwn.net/Articles/767970/" tar=
get=3D"_blank">https://lwn.net/Articles/767970/</a><br><div><br></div><div>=
Alex<br><div dir=3D"ltr"><br>On 18 Oct 2018, at 12.24, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><=
span>On Wed, 17 Oct 2018 at 17:44, Mark Hatle &lt;<a href=3D"mailto:mark.ha=
tle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt; wrote=
:</span><br><blockquote type=3D"cite"><span>-EXTRA_OECONF_append_qemux86 =
=3D &quot;\</span><br></blockquote><blockquote type=3D"cite"><span>+EXTRA_O=
ECONF_append_x86 =3D &quot;\</span><br></blockquote><blockquote type=3D"cit=
e"><span> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \</span=
><br></blockquote><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;</s=
pan><br></blockquote><span></span><br><span>This forces all x86 Westons tha=
t are not running inside X11 to use</span><br><span>fbdev instead of drm.</=
span><br><span></span><br><span>Two questions:</span><br><span>1) does qemu=
 still need fbdev or does virtio/drm work now? =C2=A0(iirc, we</span><br><s=
pan>still have a crippled qemu here)</span><br><span>2) Can this be overrid=
den in a config file instead</span><br><span></span><br><span>Ross</span><b=
r><span>-- </span><br><span>_______________________________________________=
</span><br><span>Openembedded-core mailing list</span><br><span><a href=3D"=
mailto:Openembedded-core@lists.openembedded.org" target=3D"_blank">Openembe=
dded-core@lists.openembedded.org</a></span><br><span><a href=3D"http://list=
s.openembedded.org/mailman/listinfo/openembedded-core" target=3D"_blank">ht=
tp://lists.openembedded.org/mailman/listinfo/openembedded-core</a></span><b=
r></div></blockquote></div></div></div>-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000005cee74057909e8d0--
