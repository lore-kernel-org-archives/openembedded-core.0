Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 99DA260745
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 18:40:11 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id b62so221079493iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 11:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5Tcns8P3PLImRj0eZKvr6U33IH0v8syd7B+y0D1O6bc=;
	b=jLDwwQSKBM4QWT+uWM9cRfWeg1K/AbO9YnW/Pq7FVPlgu4A1ZXHOUcS2bNxB1SXxSp
	Ua0K9Ut7fBWluLJ/EI3z+zQSNBkX5Nh49rOH7FzBvULno4w9Zp4qLOAAb1z2QtbWIErR
	j8rjJqwzF8401TqQiDkBJnNKpiW1QsCFydI0PgQXILfBVwdXoRpCRDGOqanbyTZoUuQA
	lJmiCdkQ5JddYe6SakJlOZNdelQg/vYX91MLDmJCZy6yBx9g3XI/KJRWL56+6yiOR+gA
	vruaUSBYaK4ZY1gs/09cqrMQHIIYpqOryx6kvX6yGCJc9+lFT5e22q/y19cH7ZgwGqFf
	2TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5Tcns8P3PLImRj0eZKvr6U33IH0v8syd7B+y0D1O6bc=;
	b=JGq0aQk0GkIDWDItaWj0a5CuahIh9WVSmsGASYUoT3BGZyf9dP9Ov6HwwWQI+TIUTz
	wZDaH85SUvdB+GYFmvH8sWYe0I5/aR6+13v3L+Vda2FEcdiZj862ENsI8cyWZBAi5dV8
	5C2egRtr2m7xBAe78uWKkj9lQDAz+ePq2zM8RIGiQVgR3XYdDf20LEJJ3bMF+hRIcr87
	LogFHR5g0eY6ynSSgPnQQ4kBGHP3TRgsaBtJmP4EjuN8uufmnyeVvMPOuYnARdO54QzM
	P+lUzOXAuruBG+OmYMHQeGiPtHFyc1ZvJ1UJar0BRdZistg+8Z9eFzPDKZzAxFcdZm4q
	Dzjw==
X-Gm-Message-State: AEkoouv3iYwO85FCSo/MKj9i/WKEkUh65j2qPH+H0FDflLSCAW5tzz3zYGsuJd8AyKasMYoozy/fbuxPHOR2nI5s
X-Received: by 10.107.135.142 with SMTP id r14mr70171009ioi.133.1470163211405; 
	Tue, 02 Aug 2016 11:40:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 11:39:51 -0700 (PDT)
In-Reply-To: <b4c92879-346c-5b0c-e678-fe2eb922259b@xilinx.com>
References: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
	<20160728132014.GH5926@bill-the-cat>
	<CAJTo0Lbdc8tOYB9u3ybdFwCXoOZU_M6x+tg_wUSbydnwtXbs+A@mail.gmail.com>
	<20160728134732.GM5926@bill-the-cat>
	<b4c92879-346c-5b0c-e678-fe2eb922259b@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 19:39:51 +0100
Message-ID: <CAJTo0LbFsd_ZNawVNHU5cQo8gb=6UupiYd5jFnVzrJ5Ci4smbg@mail.gmail.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] u-boot.inc: Enable EXTERNALSRC build
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
X-List-Received-Date: Tue, 02 Aug 2016 18:40:12 -0000
Content-Type: multipart/alternative; boundary=001a113eccbcfa66aa05391b0b5f

--001a113eccbcfa66aa05391b0b5f
Content-Type: text/plain; charset=UTF-8

On 2 August 2016 at 19:13, Manjukumar Harthikote Matha <
manjukumar.harthikote-matha@xilinx.com> wrote:

> I tried building master (poky and meta-ti) with this patch, it does work,
> but needs change in u-boot-ti.inc (for do_install_append and
> do_deploy_append, changing ${S} references to ${B})
>
> Git cloned ti-u-boot and used ti-u-boot-2016.05 branch
>
> I added these in my local.conf
>
> INHERIT += "externalsrc"
> EXTERNALSRC_pn-u-boot-ti-staging = "/<path>/ti-u-boot"
>

I was able to replicate my build failure using MACHINE=beaglebone (from
meta-yocto-bsp, but it has no u-boot bbappend) and no externalsrc.  Did you
test that combination?

Ross

--001a113eccbcfa66aa05391b0b5f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 August 2016 at 19:13, Manjukumar Harthikote Matha <span dir=3D"ltr">&l=
t;<a href=3D"mailto:manjukumar.harthikote-matha@xilinx.com" target=3D"_blan=
k">manjukumar.harthikote-matha@xilinx.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div id=3D":ua" class=3D"a3s aXjCH m1564c789b50dbbdc=
">I tried building master (poky and meta-ti) with this patch, it does work,=
 but needs change in u-boot-ti.inc (for do_install_append and do_deploy_app=
end, changing ${S} references to ${B})<br>
<br>
Git cloned ti-u-boot and used ti-u-boot-2016.05 branch<br>
<br>
I added these in my local.conf<br>
<br>
INHERIT +=3D &quot;externalsrc&quot;<br>
EXTERNALSRC_pn-u-boot-ti-staging =3D &quot;/&lt;path&gt;/ti-u-boot&quot;</d=
iv></blockquote></div><br>I was able to replicate my build failure using MA=
CHINE=3Dbeaglebone (from meta-yocto-bsp, but it has no u-boot bbappend) and=
 no externalsrc.=C2=A0 Did you test that combination?</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbcfa66aa05391b0b5f--
