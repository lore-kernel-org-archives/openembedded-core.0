Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id E76F86A9E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 12:38:28 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id p11so1341113pdj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 05:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=MQXvnBrOsJIzeV67lHaPd3FVLt2Y95r186xHGbMo4Kw=;
	b=AXzSc3EZkF1pVpzq1jDB7sM93sfnkv0pybiIabOWz2bDxF/6Cmb8y68SdAtR3cetR8
	L78VwuqablTx8AAMSKA306PIkrdR5MLf/OkwJf+ErUhRHIAo+cFoI9KIOO6DW1xTX520
	BBpYglixOCN28K40rzpU/mlWzScMYMlce8ffUqeBS40yer9UQ266XO218bF7/P9txGm/
	9QGClxS92sqBzz+c9WYcEN8Lo9wk8Mq9jym+7HejHCX6AtKgjQhkcgDLTaKwT3v+Vrk5
	/LD+mBkK6TfNlah50gNXgvfjjweNE2I0+IFjNiD44FeRLZPX3WwPIOUa/DLRl4ahFGZT
	3UzA==
X-Gm-Message-State: ALoCoQk3GSqac+YQYbP9nf40jXFSGCXD5pAYQDvcmImwXZLBQTR89qiSnCZDfCDCq1DPv8GRWQju
MIME-Version: 1.0
X-Received: by 10.66.155.102 with SMTP id vv6mr413525pab.89.1375879109710;
	Wed, 07 Aug 2013 05:38:29 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Wed, 7 Aug 2013 05:38:29 -0700 (PDT)
In-Reply-To: <20130807122314.GF17450@ibawizard.net>
References: <51F18346.2@windriver.com> <20130807122314.GF17450@ibawizard.net>
Date: Wed, 7 Aug 2013 13:38:29 +0100
X-Google-Sender-Auth: wHmeaqHCx-2hvTRxMLqKs_z4348
Message-ID: <CAOMwXhMxD=FW3R2sCptL7Ov4usAEuNKDMjg6JRzYrypnYdGCrg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Add lua to oe-core.
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
X-List-Received-Date: Wed, 07 Aug 2013 12:38:29 -0000
Content-Type: multipart/alternative; boundary=047d7b86e3a896a76904e35ad1ab

--047d7b86e3a896a76904e35ad1ab
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I support updating lua if nothing breaks.


On Wed, Aug 7, 2013 at 1:23 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:

> Randy MacLeod <randy.macleod@windriver.com> [2013-07-25 15:57:58]:
>
> > lua-5.2.2 is current, see: http://www.lua.org/download.html
> > so we'd likely uprev and send that version.
>
> Just FYI Lua 5.2 has quite a lot of changes to Lua 5.1[1].  So I wouldn't
> consider it as an drop-in replacement for Lua 5.1. Simply said it's not
> compatible out of the box.
>
> > oe-core.git $ grep -r lua * | egrep -v 'valuat|valuable|uargp|rpm'
> > meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb:
> >              --without-lua \
>
> For example lighttpd uses Lua 5.1.
>
> 1. http://www.corsix.org/content/look-lua-52-work3
>
> -- ynezz
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b86e3a896a76904e35ad1ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">I support updating lua if nothing breaks.</span><br></div><div class=3D"g=
mail_extra"><br><br><div class=3D"gmail_quote">On Wed, Aug 7, 2013 at 1:23 =
PM, Petr =C5=A0tetiar <span dir=3D"ltr">&lt;<a href=3D"mailto:ynezz@true.cz=
" target=3D"_blank">ynezz@true.cz</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Randy MacLeod &lt;<a href=3D"mailto:randy.ma=
cleod@windriver.com">randy.macleod@windriver.com</a>&gt; [2013-07-25 15:57:=
58]:<br>

<br>
&gt; lua-5.2.2 is current, see: <a href=3D"http://www.lua.org/download.html=
" target=3D"_blank">http://www.lua.org/download.html</a><br>
&gt; so we&#39;d likely uprev and send that version.<br>
<br>
Just FYI Lua 5.2 has quite a lot of changes to Lua 5.1[1]. =C2=A0So I would=
n&#39;t<br>
consider it as an drop-in replacement for Lua 5.1. Simply said it&#39;s not=
<br>
compatible out of the box.<br>
<br>
&gt; oe-core.git $ grep -r lua * | egrep -v &#39;valuat|valuable|uargp|rpm&=
#39;<br>
&gt; meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.32.bb" t=
arget=3D"_blank">lighttpd_1.4.32.bb</a>:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--without-lua \<br>
<br>
For example lighttpd uses Lua 5.1.<br>
<br>
1. <a href=3D"http://www.corsix.org/content/look-lua-52-work3" target=3D"_b=
lank">http://www.corsix.org/content/look-lua-52-work3</a><br>
<br>
-- ynezz<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote></div><br></div>

--047d7b86e3a896a76904e35ad1ab--
