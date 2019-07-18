Return-Path: <jean-tiare.le-bigot@easymile.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 16C897EF4F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 12:48:29 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d17so26930468qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=easymile.com; s=easymile;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zWujlDh6kPnO/tGGqwQDVZWng6eLKlZfpMyEkW9MIRU=;
	b=Xyg3a5hdQxyLi2RHAhoahvj1msA/iWaMqVNXeq6yBIZtT7nvQuM7v6aRuGRyBBcyuS
	xLeEMQz40BX5lVoUaOoG3WxYyY6nZ/5x2AVBuSPQLJzjNm6LiGgNymA607FKqTKyBGi2
	Vyb+iRC1Mc4bsGuyiUQheJ+5bT2syE6L8x09c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zWujlDh6kPnO/tGGqwQDVZWng6eLKlZfpMyEkW9MIRU=;
	b=C0iwTSb2OBWrHN/frpube+bVkMzw/JUpaXkAwK3Lu3lO4ARAfyIlJBsllm9j7CrKQd
	C0wyxp6gcOeKHA2T0iOx9gzISLgzWtisw+STW7rcbX6ExXzFoBSuU8smbViF9Li6Mm1B
	FKmwHketUV8twazCzss1Jy5vpg4m2Tp2g0uZL7fUZdyfp6co8E+BNCMy8X6qjud/gS+Q
	BxKAFS3XGSzjP8uqKurecofOhS4eo1Id7717euFmpqfb7fq9J0x0QWfW7ExVNN7PZu1w
	xw7Bk+oAVTIJnYJNLHFMwR80NlkBkCawnr2FKo98+uO/H+Xs7JGWYwnw+FFQCUPQnZ3U
	jDlg==
X-Gm-Message-State: APjAAAVYKA7Hu66EfmW+iKD62dHeEx0vV/znP6ysqW+xkbJ59vj0MRhO
	73hPTs4L+E+AYmzJKmPLBPOwFunq4kgN5PUIOhPA/Q==
X-Google-Smtp-Source: APXvYqyolMmhRJMXqr+NY/L0ENLrTTGqBPFeJiYkALU0ee1qt55w9ykgHG1Cp16KCRc2HeaxNKRfBfudSrI47V6ztw0=
X-Received: by 2002:ac8:2a88:: with SMTP id b8mr29129638qta.331.1563454111045; 
	Thu, 18 Jul 2019 05:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190628101353.11933-1-jean-tiare.le-bigot@easymile.com>
	<CAPVBjxFRyEvgBoNN818RD0Lg9D1GjdBidxrit-PQ4cqVwxJswQ@mail.gmail.com>
	<0582005b00d2a7789ed794501c57064f265a0205.camel@linuxfoundation.org>
In-Reply-To: <0582005b00d2a7789ed794501c57064f265a0205.camel@linuxfoundation.org>
From: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
Date: Thu, 18 Jul 2019 14:48:19 +0200
Message-ID: <CAPVBjxEk1mg1gE+CDAc1Suiuie-sDD0ywsd2OL1Vgae8+eAFjA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: =?UTF-8?Q?Jo=C3=ABl_Esponde?= <joel.esponde@easymile.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Thu, 18 Jul 2019 12:48:30 -0000
Content-Type: multipart/alternative; boundary="000000000000e97024058df40693"

--000000000000e97024058df40693
Content-Type: text/plain; charset="UTF-8"

Oh ! Thanks. I was following
https://patchwork.openembedded.org/series/18376/# which is still "new".

Should I submit individual patches for backport to "thud" and "warrior"
branches ?

On Thu, 18 Jul 2019 at 14:28, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2019-07-18 at 13:57 +0200, Jean-Tiare Le Bigot wrote:
> > Do you have any feedback on this patch ?
> >
> > Thanks!
>
> It merged a while ago:
>
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=0df6cef5258ccd6bd137279aa610b6b1bce43640
>
> Cheers,
>
> Richard
>
>

-- 
Jean-Tiare Le Bigot

--000000000000e97024058df40693
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Oh ! Thanks. I was following <a href=3D"https://patch=
work.openembedded.org/series/18376/#">https://patchwork.openembedded.org/se=
ries/18376/#</a> which is still &quot;new&quot;.</div><div><br></div><div>S=
hould I submit individual patches for backport to &quot;thud&quot; and &quo=
t;warrior&quot; branches ?<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, 18 Jul 2019 at 14:28, Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Thu, 2019-07-18 at 13:57 +0200, Jean-Tiare Le Big=
ot wrote:<br>
&gt; Do you have any feedback on this patch ?<br>
&gt; <br>
&gt; Thanks!<br>
<br>
It merged a while ago:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D0df6cef52=
58ccd6bd137279aa610b6b1bce43640" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D0df6cef5258ccd6bd137279aa=
610b6b1bce43640</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr">Jean-Tiare Le Bigot<br></div></div>

--000000000000e97024058df40693--
