Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABDF65C5C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 10:04:25 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id q128so126048056iof.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Apr 2016 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tmz3uaNWZwfbY6MBA6ko5MADZU0yd9r+lMAQrPRy/1Y=;
	b=DkhpPvgIBRAR/nnHCRY2jLdl9vMudCPD88gZE/r+ywA6Xkow5DRkqPJ2emr/xuug2o
	vcAuP5+1O6XGUFyUaDdKBkIQSyhuq0WzKpibKqbyxd4u/xzM/1WVBGRsk3iySviBh8+B
	ad96mS3aCsx36UoNwuTlMip1N3hV5BSthtWi5aCHzNpZg4qjDFhimhxJVImlZVIIdti3
	8M+SxKG38pGm5A5tJQbKhNPpJkqQX6eBX6iJcfWPS/3VmdNbiUS/hOnDfS3c60SlpCQs
	lyDeiffTIn16Pj8fUVZGJZBbslWVcg3bDjY93S3Fo+EV1GpLm8elI3RHQSzg9p85k4tz
	+UBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tmz3uaNWZwfbY6MBA6ko5MADZU0yd9r+lMAQrPRy/1Y=;
	b=iVjkCDjY/pGP2Yf2yM/ts0S87gLIikhIRGUWdtkGv4TFvGyr3wSso08RVjs9OInBXe
	xBdwYd3g2ga7gUKZl0qpd/8/1mMBlAIdienBCqPZaEhtL75eTGQU6Unukg2hMOv6/5hi
	Zq/RGBYNW2oXnaJ5AerjpQ9jC57OfSMAhdzs7jKOan3KpAyl3HoFQc3+dg0kZI/BVyxr
	6WUkhGTt5QxHAv7pywSsXGBhOqPe+/iHlmJ5HV13Wn0jR6mD+NPuymu8qqYiINzjoWWt
	Dum10QiM1YiW28SeXwSAtzVKeqqQa13112ym8RUGLTAVT8w2SFm4JTVcM9ufn/Q1vfDQ
	pnxQ==
X-Gm-Message-State: AD7BkJK3iEeYaAkPQ1M3OAzuOMlk068pfMWBUHiajE74jNYnoElvKSoXYteZw6fpfgHuKe5/cxzUIjXAliV8h0QI
X-Received: by 10.107.135.74 with SMTP id j71mr9025777iod.133.1460109865967;
	Fri, 08 Apr 2016 03:04:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Fri, 8 Apr 2016 03:04:06 -0700 (PDT)
In-Reply-To: <1460106177-22822-1-git-send-email-rongqing.li@windriver.com>
References: <1460106177-22822-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Apr 2016 11:04:06 +0100
Message-ID: <CAJTo0La47_jBoFLh+UoMqshBec2BT+G76rrUK6Fa5x5gL82+KQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: add krb5 to PACKAGECONFIG
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
X-List-Received-Date: Fri, 08 Apr 2016 10:04:27 -0000
Content-Type: multipart/alternative; boundary=001a113f9218e4f5b9052ff651b8

--001a113f9218e4f5b9052ff651b8
Content-Type: text/plain; charset=UTF-8

On 8 April 2016 at 10:02, <rongqing.li@windriver.com> wrote:

> +PACKAGECONFIG[krb5] = "--with-gssapi-includes=${STAGING_INCDIR}/gssapi/, \
> +                       --without-gssapi,krb5"
>

If you're using pkgconfig why do you need to pass paths?

Ross

--001a113f9218e4f5b9052ff651b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 April 2016 at 10:02,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing=
.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":n5m" class=3D"a3s" =
style=3D"overflow:hidden">+PACKAGECONFIG[krb5] =3D &quot;--with-gssapi-incl=
udes=3D${STAGING_INCDIR}/gssapi/, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--without-gssapi,krb5&quot;<br></div></blockquote></div><br>If yo=
u&#39;re using pkgconfig why do you need to pass paths?</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f9218e4f5b9052ff651b8--
