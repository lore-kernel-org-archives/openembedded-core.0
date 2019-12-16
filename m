Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 04C4A7F88A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 13:25:36 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id f9so2059092ual.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 05:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cUx0vR2LTH2ZbDCA+4bYWWPI8RxWLL7QyncSnNEIfWE=;
	b=Rw0SdH9/53nnSlIZRyEZLduMo7wM1U31wW1Trqa9ZbtWFyZQ8xdIpzGSFRwvJuhFaX
	c6iehACC3oqj8Fczj9ipzSLufOyyy6c+TGpJ595Tp06acmrZJ31boQe3ZCv+ijUlb113
	FC73nEAq55wCSN/MeILYefPKxRavl1MToenVtpP70KQDVS7/l6aXztvgFMTaKgIyg2yU
	oi34bM359d3KQMiWIJetRl8aJ6zBlGREaMYqwOcTU//Q8XxZP7SvR2tiZnKFC6sLbMo/
	Kj8FYu4GXjnJuzYLIt4D/t3X1nNE7cc4tQkSztSRn2gm1t9zHk+UL6F96CuZ+pu8Bcj+
	QLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cUx0vR2LTH2ZbDCA+4bYWWPI8RxWLL7QyncSnNEIfWE=;
	b=DBbBbZGOanT8yONPC+YII8HaZq/XXTyHujgmHITAorGIGQVfUE9wkWn3Gsia05oRSU
	f1r6dvP7AIO+L2Q/XfxQrvdQTxSRRC732KrtxpuawwhaZ8XKjGuCX7R/gnSaxdhRhpN+
	lPDUo3RQ64sG2FdgAvWFHg56lwmh/kc6ifdG0nQTshxmp+cM8CqyUa284z3O8+e5pJnC
	0gZMMNWGdodBIlQGeVb/tsRV7OUvQngsvJK3fRCtvBhzqGOieh+sJ+FZaWeCDhzAsJnE
	LyZkxp/CD/N2PoN/3eOOCEuwux/ED1GlfifQNl7ZYtjjgLaLYrbGbdfpZQgcFpcShIhf
	FKFA==
X-Gm-Message-State: APjAAAWKaPD2QtVtoyD7z3aP6IG3cpL9NrA5QHvC2hDWiy8Kp/lNidH7
	VNUW7yBrQLFXrKGEq0ANP2xxZKzucUE7hgEl3QYtRP+t
X-Google-Smtp-Source: APXvYqyG7gkl4dvR0RqDFkT0e6QYgx1bYZNxxnQUh7s+8wzjQ/zmLYP9O/Msnr444hiFGZslrcGk8h5Zz2UGRi2PP1c=
X-Received: by 2002:ab0:6894:: with SMTP id t20mr23847781uar.100.1576502737706;
	Mon, 16 Dec 2019 05:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-3-alex.kanavin@gmail.com>
	<b4e0b39cda58583411b3e6c05cb0566053e6cdb1.camel@linuxfoundation.org>
In-Reply-To: <b4e0b39cda58583411b3e6c05cb0566053e6cdb1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Dec 2019 14:25:26 +0100
Message-ID: <CANNYZj9tf5c9_XOn1P-tTXSSHjKUSp6QMfsNYX_swJAp+h7Krg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/30] gettext: update to 0.20.1
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
X-List-Received-Date: Mon, 16 Dec 2019 13:25:37 -0000
Content-Type: multipart/alternative; boundary="000000000000ab23890599d22562"

--000000000000ab23890599d22562
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Dec 2019 at 12:03, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2019-12-12 at 19:14 +0100, Alexander Kanavin wrote:
> > License-Update: URLs changed from http to https
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
> In an effort to try and get to the bottom of which patches cause which
> failures I ran the gettext updates pieces by themselves (patches 2-5).
>
> systemtap fails:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1354
>
> the main a-full build in case there are other issues:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/580
>
> I know there is a fix for the check-layer/mingw pieces in master-next
> of meta-mingw, just forgot to set that branch.
>

Thanks, there are also failures in meta-gpl2, for which I will also make
patches.
Systemtap issue is now fixed.

Alex

--000000000000ab23890599d22562
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 15 Dec 2019 at 12:03, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2019-12-12 at 19:14=
 +0100, Alexander Kanavin wrote:<br>
&gt; License-Update: URLs changed from http to https<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<br>
In an effort to try and get to the bottom of which patches cause which<br>
failures I ran the gettext updates pieces by themselves (patches 2-5).<br>
<br>
systemtap fails:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/50/build=
s/1354" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/50/builds/1354</a><br>
<br>
the main a-full build in case there are other issues:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/580" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/83/builds/580</a><br>
<br>
I know there is a fix for the check-layer/mingw pieces in master-next<br>
of meta-mingw, just forgot to set that branch.<br></blockquote><div><br></d=
iv><div>Thanks, there are also failures in meta-gpl2, for which I will also=
 make patches. <br></div><div>Systemtap issue is now fixed.</div><div><br><=
/div><div>Alex<br></div></div></div>

--000000000000ab23890599d22562--
