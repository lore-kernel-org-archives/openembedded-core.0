Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id A860F65D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 13:18:42 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id m101so106667680ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 06:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ttne+ePlQJKz9tbXUca28pxDJM6tMg6ylJIIxz50lTw=;
	b=dOLWKDBcLIttHNqapVeoEevO34EPGwvYDM4ywYhKNZav3t+uR6V4F+uzuUwJY+kqkW
	kscGmFXwRURG10SkyOOgEyiNnxYkkpDnBQ8ahHCEXDtTPFf0bQu43lnX7rgqmfrOPkcu
	Lr6fRa+3z+tszCwbecU5Jz64HkTwI2El1zkmUQUbe+LUJwoxy3US1oKsqXNeqmJq7VWL
	PWKYLrjjqHwCbl6uTvAo+z5jwTf6+Auyj/+kO+oojZ4WGfyPvDFjmVht6hvbg0+2vDIk
	u3WaBoS/stlJAAcrQBw1iY1NMLY3SsnFkpqkoTunoXK9Jdi1KISWHiensK7rTG9KKJHx
	b9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ttne+ePlQJKz9tbXUca28pxDJM6tMg6ylJIIxz50lTw=;
	b=TO0IigmJPLqXnR4/Z4IDanFADjsLq+d3h71omwSeXF5kAm7pRO09VGfqmMYb/86TRz
	1fG+/SNtYu+uAyd0UayFsFwTCDmBGfbA/KqEDBgCsqDrXqA1Fb8tqs4o32XtltFUqroT
	BJHHdRy3xAl/URAV6fySEEIvo1GBkhZeim5NCh31QlH4KtvJIgiQMAG/a1IPuigk70bl
	VCbpd8NotKE6uQHbZSftv38GmyiifeLxR7Pldr/cGKd7OK0Bk91fScnDxBn84UjfOIP1
	W/cTkC6R2aAEHeASoyDWaDIgoNyqldPf/M7RyDTjeDN2/upndYVU5M2XqSPdDD4mkISg
	Mpjg==
X-Gm-Message-State: AEkoouuyM4h80RwZt4TdQHF7QyqtMZKgXsFeGeFmWj7hf1rTRZq0Zx9MrkVPz8RqJBAERJhHKGMPaTvj3yvN+l8c
X-Received: by 10.107.154.196 with SMTP id c187mr38755610ioe.99.1471353523546; 
	Tue, 16 Aug 2016 06:18:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 06:18:23 -0700 (PDT)
In-Reply-To: <20160812131549.32088-1-adrian.ratiu@ni.com>
References: <20160812131549.32088-1-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 14:18:23 +0100
Message-ID: <CAJTo0LYORQDBfrtEdkuhk7F1f=a2fgZP8fr34ZZtaoy110YUeQ@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub: split grub-editenv into it's own package
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
X-List-Received-Date: Tue, 16 Aug 2016 13:18:44 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e1c424a053a303033

--001a1140e81e1c424a053a303033
Content-Type: text/plain; charset=UTF-8

On 12 August 2016 at 14:15, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> +PACKAGES =+ "grub-editenv"
> +
> +FILES_grub-editenv = "${bindir}/grub-editenv"
>

Shouldn't grub rdepend, or at least rrecommend, grub-editenv?

Ross

--001a1140e81e1c424a053a303033
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 August 2016 at 14:15, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":xb" class=3D=
"a3s aXjCH m1567ee6952b129ce">+PACKAGES =3D+ &quot;<span class=3D"il">grub<=
/span>-editenv&quot;<br>
+<br>
+FILES_grub-editenv =3D &quot;${bindir}/<span class=3D"il">grub</span>-edit=
env&quot;</div></blockquote></div><br>Shouldn&#39;t grub rdepend, or at lea=
st rrecommend, grub-editenv?</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a1140e81e1c424a053a303033--
