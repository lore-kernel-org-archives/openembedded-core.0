Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id AC238606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 20:52:44 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id m101so174923245ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 13:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GyCaX+Y9h09jP8q1CR0P0Xtr9/nnipWaIClVxABgjf0=;
	b=Yz4EEQi+4TriyCkcf4KgiXIxZFQpkeafxANcGxttZhuqRVAlZOYDL/+u/LUj/iwtYD
	TW5pzKnLlMw/H2He6ouxHQxpGRlWk2/ouCHkgvmbHz0bKeVbCwkOUHWeTLj1u5MDM+Qk
	yW3Zs1/wBSa5/M2ndarF1MNZbpLXd5L9c8kSSQx3pnFs7SGCDNyXnuNM4vpWMPbEa3tG
	Z9Y7CZYDVsD+l22Kd0pNzuUvFFyH7AarH48DO94/3GZX97DaTcSXTu+cFjOFvY0hvBWR
	zH+LbM8+69y6AMhSs9KGSZABHyALp90o16BdduAarBE8Kq+9EvVxpude7K9zBUboHdxs
	z0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GyCaX+Y9h09jP8q1CR0P0Xtr9/nnipWaIClVxABgjf0=;
	b=V45JPOSFs7cTRo7LP1u1LRj9R4AA6AuDPBhh/JwZiHBxk1ZeHhuPh4ShRd+A9Glknj
	hgcsMaEUfeA/Xx1jFOEojfAfOaZqEnesGrhH+5jLFV5HAj/UL+Sh/ku6CTKM7KxrFWE2
	1djOVbHKytTGbNQ1qt6N2q4G6gPnGEWp3aKDak8h7zFW5VbAM6mwftiwhYIl+kZzahtM
	M+CL360FqAmldYofCyJmVWosH3KuC+xxn9wYHwdVA2lJJuWvPHQ/Y/w6NfCsms6RB45o
	0f145Wnwl130/mdVRV/s2VXdoZtKWVSK7wEhqK+VAFP1Os3tw1ysMQDiiPYBwam7BKcq
	ZbRQ==
X-Gm-Message-State: AEkoouuHT8g58b9yI85x/eyK7uRHUAXbvkk+2S6y8cSm69vfbmewd4WZTBX/eB2J7GbWdm/hzFtw6W9OlWlpra02
X-Received: by 10.107.138.212 with SMTP id c81mr21761320ioj.148.1469479964696; 
	Mon, 25 Jul 2016 13:52:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 25 Jul 2016 13:52:25 -0700 (PDT)
In-Reply-To: <1469436150-121312-1-git-send-email-jackie.huang@windriver.com>
References: <1469436150-121312-1-git-send-email-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jul 2016 21:52:25 +0100
Message-ID: <CAJTo0Lb_Dm-T8o-UDq-9mA_808xsvkuw+aWiCpStR3su-qWwWQ@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi-ui: use PACKAGECONFIG for gtk features
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
X-List-Received-Date: Mon, 25 Jul 2016 20:52:45 -0000
Content-Type: multipart/alternative; boundary=001a113ed9324cf68a05387bf785

--001a113ed9324cf68a05387bf785
Content-Type: text/plain; charset=UTF-8

On 25 July 2016 at 09:42, <jackie.huang@windriver.com> wrote:

> +AVAHI_GTK = "gtk gtk3"
>

As we've moved away from GTK+2 for oe-core I still think that the default
built should be with just GTK+ 3 and anyone who is still using ancient
software (gnome-disk-utility 2.32 was released in 2010) can enable it at
their distro level.

Ross

--001a113ed9324cf68a05387bf785
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 July 2016 at 09:42,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jackie.h=
uang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":x1" class=3D"a3s =
aXjCH m1562138f00751032">+AVAHI_GTK =3D &quot;gtk gtk3&quot;<br></div></blo=
ckquote></div><br>As we&#39;ve moved away from GTK+2 for oe-core I still th=
ink that the default built should be with just GTK+ 3 and anyone who is sti=
ll using ancient software (gnome-disk-utility 2.32 was released in 2010) ca=
n enable it at their distro level.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113ed9324cf68a05387bf785--
