Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 64BB378644
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 11:32:18 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id n134so1613171itg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 03:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hBSAD2V+s346250feAzJ67FxVZSoS+Jfug4gIfvju+4=;
	b=LWV8m8liRYtBJhnDfEdj02qZlueN8Pn43jFQ9TKcI/5PMcaaqxe5N/SWSDbqmDLPN4
	W3vSb47Sl7IpUu6cZRP6VQ3ytyyvBwhtXt/5UhXKm9q86T0wUlOalab3AsvHrCx7a/HZ
	1aSlrMB18ZxM9YdnT0lChpYiB4PVuic7oXasOR3iFzj+HRyESr2zdgMxf/VrbeQE51va
	T+kvErZYHx7qh5+2wqVmlE5sLPLChtZvJH4oCxyTEmmc3RKjFImWqU94Qm5DA17Jd+7R
	HfyBL3n7Mp59SNKnKGsukKmICU3QReM+S3r0mlfUGSB0XP8V3bhkewiHMZxMRoFtcHVI
	c0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hBSAD2V+s346250feAzJ67FxVZSoS+Jfug4gIfvju+4=;
	b=fFX7d8J32YgeEDt6Bq6QZ+A2dzGrfHDw5RaxP7ZSSNguHRsFnqwfxW5pUIjVGAECHb
	zP6NTYMYfRGWW+uqc+78M/NoirKbxZ4h6duFbRVcGKcTQWP3+iNmOzFtGCJ1FWfYzjrM
	O2touWmg2f7d4snQ0uxItXNo2IDvkKnrB46knCC0BnnjlOjHQmg57nrZcx4hOAyX36pY
	wCp/40d2kFaoFx5EFOc7otZPnWH1un4An8SIgjvGZGA4jmTv6JrvlOdMvHEZFPD+zMfw
	6YoUQAD0MJ5cfBh5lySdZOZ+/vGOu1ZTydUMXumXUas7NwgjjJVJ3cor6isC0yEhXeNa
	loMA==
X-Gm-Message-State: AJaThX7//JWyK+c7amrHEAL9O4bX22EI9TDwGOYob1C2tM72zfoGXI/p
	c+EKITgWeqNmDHPksm5lJhUaFeCQdKJRTFnlLFK54A==
X-Google-Smtp-Source: AGs4zMYq1rr7W4hmLNxmMXxMJ7GAihgGLyMqsQHn1qTqAaYkB3XqmxIye5T10VQnd5+bUv20R1sxe/LDxCnivL4yMrM=
X-Received: by 10.36.120.11 with SMTP id p11mr1447652itc.10.1511263940323;
	Tue, 21 Nov 2017 03:32:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Tue, 21 Nov 2017 03:31:59 -0800 (PST)
In-Reply-To: <a738dbce-f217-54a3-c633-7945dafd462e@windriver.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
	<cbb65333-4bc3-ec34-ffed-da65fc767030@windriver.com>
	<CADkTA4O=gNCQLLJ5Yu5MM7T2kbEb1=RFjb=Va0vUoS1VW7CEYA@mail.gmail.com>
	<a738dbce-f217-54a3-c633-7945dafd462e@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Nov 2017 11:31:59 +0000
Message-ID: <CAJTo0LZNDCQNS9pCphNowjKTN-3ArhtCs2QMXz37FKkMTGujDA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: fix formatting IDE storage does not trigger "change" uevents
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
X-List-Received-Date: Tue, 21 Nov 2017 11:32:19 -0000
Content-Type: multipart/alternative; boundary="001a114a9b5e533eaa055e7c8efd"

--001a114a9b5e533eaa055e7c8efd
Content-Type: text/plain; charset="UTF-8"

On 21 November 2017 at 07:00, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> 1. Tweak kernel-cache to remove CONFIG_IDE for all available bsp.
>     It require necessary test to prove it is safe to remove it.
>     If the test is OK, I will send patch to yocto mailing list.
>

I know you have your own huge autobuilder framework inside WR but I'll
happily throw a patch against oe-core at the public autobuilders for extra
testing.

Ross

--001a114a9b5e533eaa055e7c8efd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 November 2017 at 07:00, Hongxu Jia <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.j=
ia@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <div class=3D"m_-1761857646591655639moz-cite-prefix">1. Tweak kernel-ca=
che to remove CONFIG_IDE for all available bsp.<br></div></span>
    =C2=A0=C2=A0=C2=A0 It require necessary test to prove it is safe to rem=
ove it.<br>
    =C2=A0=C2=A0=C2=A0 If the test is OK, I will send patch to yocto mailin=
g list.<br></div></blockquote><div><br></div><div>I know you have your own =
huge autobuilder framework inside WR but I&#39;ll happily throw a patch aga=
inst oe-core at the public autobuilders for extra testing.</div><div><br></=
div><div>Ross=C2=A0</div></div></div></div>

--001a114a9b5e533eaa055e7c8efd--
