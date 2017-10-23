Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8535371974
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 16:40:58 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id n195so6198393itg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 09:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y5K6cw2GZZaZhWLlMsrj5QktkFDievhCDbGvBGL2WXg=;
	b=fWEsFLGgQT5kPhB+XTS3edTXrikudNvVBvLc/oEyCndRo6mwgOQ+EP4LlReMJ3wKuH
	uJ0Ar2hdw22IiTsB+zgYvSvgRD0gJl1nt5oXW6dNaeymte+A2JkvfrsS5JKLYoLrK5ia
	AV3FzWTZLDK5VA7Ck23CP2EQveKl71g8aXHf1VfP0DR8cVn3uNG+ausWgXB9LQOflYkU
	gEbzZnfIHBN1mLnNCucEX8B/miaOl4gwpIZEKkQ0FMcOmXnXwdfELlgpsUsPCfAXn+Fe
	GYzQ547182Qd3GFGqjszFa82Wn+6auIKqKETnZQbXq8O55MpurO8VxjAuGzTslcaNS9Q
	e8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y5K6cw2GZZaZhWLlMsrj5QktkFDievhCDbGvBGL2WXg=;
	b=VP5lpb1gitsuVF5Ea36KGECeMnDQWxEKIIgfvSzqeaHTJ7oNQ9CctUDna8zu8Z1i10
	+teMDN2tmG4aUwP4MpQjo0N+jbU5KLuYRCMdGK3s3zp2NQxb5vippRR+6TborGP4jlIe
	T8BBZ1cOiUmVnaXUChLl8V4lSs9S/iKvlgK7X72wjTXeA6zA4GKu0N/gb63Lf75319Zl
	yBaWZuL2+oTnHEtq+xMqImo28IoXRKS13gZH3QGXKNJ5v4UjHJj+39RpqcBPIkUe51Ce
	5EmGDWRcD08nAFGIhL3dsuLyL8xeltNZmWWdpA6FcxFlwljISlxpPZLWTSMm13pjeyS1
	of5A==
X-Gm-Message-State: AMCzsaVIe9sCpiHh/mJ7W8OYiwLDucVzxWLsa6yxQkvI04robfMteDfp
	eci0EN6N+mPfRUnfP3pRrrcYkBj3MSKUd78ZvGLAlQ==
X-Google-Smtp-Source: ABhQp+RgQQZE4haAuKlrVZknpVVEh+pRlw/OvLUevhC8Qa27jqCSkfGg0xOzE7YHuSJkz8KslN/46lDprcXhAKhchA0=
X-Received: by 10.36.81.21 with SMTP id s21mr10103668ita.144.1508776859535;
	Mon, 23 Oct 2017 09:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 23 Oct 2017 09:40:39 -0700 (PDT)
In-Reply-To: <CAMKF1soAg8N10P-xPpdffvUoqHQjR7__j3ssxsfRik-69=bmXQ@mail.gmail.com>
References: <CAMKF1srGH8tNmFMvqRmV0jXQz+HAVwrXYw1v6EoZQZrb_poDrg@mail.gmail.com>
	<CAJTo0LaHVjE+C9mv7h8c1LQ-Sx-u5PsbxQEeDjp-2e9itvqYkQ@mail.gmail.com>
	<CAMKF1soAg8N10P-xPpdffvUoqHQjR7__j3ssxsfRik-69=bmXQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Oct 2017 17:40:39 +0100
Message-ID: <CAJTo0LaZTxcaadGhce-CuiLYY7zCVja8LomrvOvyQGurbrDrJw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: devtool modify errors on second recipe
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
X-List-Received-Date: Mon, 23 Oct 2017 16:40:58 -0000
Content-Type: multipart/alternative; boundary="001a113a7146c222f2055c397cfe"

--001a113a7146c222f2055c397cfe
Content-Type: text/plain; charset="UTF-8"

On 23 October 2017 at 17:32, Khem Raj <raj.khem@gmail.com> wrote:

> ok cool. point me if you can before I find, I will cherry-pick and try
>

"cooker: fix watching directories with Python 3.6+"

Ross

--001a113a7146c222f2055c397cfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 October 2017 at 17:32, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex">ok cool. point me if you can before I find, I will c=
herry-pick and try<br></blockquote><div><br></div>&quot;cooker: fix watchin=
g directories with Python 3.6+&quot;<div><span style=3D"color:rgb(0,0,0);fo=
nt-family:Arial,Helvetica,sans-serif;font-size:medium"></span>=C2=A0</div><=
div>Ross</div></div></div></div>

--001a113a7146c222f2055c397cfe--
