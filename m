Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1816F782CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 17:07:33 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id u42so27196021ioi.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 09:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qUqaTt5MlKcEuJ3IW+KLybacuiuYaIvHyUEk2QHIKEk=;
	b=RMdE/Q0X3ujESBWPbrKVNgXVaKL9zFC9VSJkonfFp77+2LaXY6wu3aPEyLCwxaJ71Q
	igNQdJ9QPFtPmpIhp91hIZ2r5rinkCebZV3OajnDMiMmD4+FFrJrfDWvw7WC7wSvMhcM
	CLrKU7tcuXxXhtcxJiUsMBFlU2fH8Wc3jfmZXWuEk1DNSg5vlub8W07dR82gxHtsqkS3
	GCexY49iqXS+1TDlcrstZh/jJJ+kfOA9/4Z9gWmFUdzbpTIqu+xFgSwcHDPT4USj6Btb
	1TR4Es4swEUV5JAmjc8J+r2yFkPtwX3I2EBS5uSh42TiIe13eYRS3tANG1xFCdBKJ4Ya
	S47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qUqaTt5MlKcEuJ3IW+KLybacuiuYaIvHyUEk2QHIKEk=;
	b=ouBiTBXvvVgzGrZDWkOshMiAjFp6gfskMJbaJzsrIwMtk6rKa6IBs+qRnf7wlclYOO
	MIL1/GMbbzVmQPRSZe8EnbGUMLCghf0YaaNomh8I/lU0yVBVxi/8qTGdlifV8JksLQ11
	ZfSl/clcMC34Q+lf0VP7Z6Dg1kVfIUIAmCQb5+zM/CgXQD6SWSPyBNOtbFZe0iG5RGo6
	DhpF5fg/JrsJfEqXKkJn6ywcjwqyg9bOk9xggRpo/8xvd36wo5+WFFpfi2j/29GviVKF
	tFAgcd7aO/gKQOQ/giBwCj8paFQ7D9lERtotaJxx5b1kZkGiODtFrOWUvJGcv4e5WgeU
	Mkmg==
X-Gm-Message-State: AJaThX6E0SF1nkd44H4/rKV3b1ZXRWtPDlvet+42wXeMGyf4siZ3KOXM
	44GoO+oK7mTwRpcluHEK7hKRM+ei6IAqlDnQ+1J0Tw==
X-Google-Smtp-Source: AGs4zMag8MSfdCE1GYdfBu0GTSvfV15G6p+ERAp26Q6zAgslLVbi4gMknXkDygdyHvotG5uhL5Mu0O6B30sneg3l+Y8=
X-Received: by 10.107.146.195 with SMTP id u186mr28093113iod.37.1511456854923; 
	Thu, 23 Nov 2017 09:07:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Thu, 23 Nov 2017 09:07:14 -0800 (PST)
In-Reply-To: <1355ffaccf3da8419c4067047000b68c2f83cda6.1511294278.git.akuster808@gmail.com>
References: <cover.1511294278.git.akuster808@gmail.com>
	<1355ffaccf3da8419c4067047000b68c2f83cda6.1511294278.git.akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Nov 2017 17:07:14 +0000
Message-ID: <CAJTo0LY14hO2kvvCyF8WyB1bvEHGG6Cg_LQ7TmbphLDeU9GTxg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] nettle: update to 3.4 and cleanup
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
X-List-Received-Date: Thu, 23 Nov 2017 17:07:34 -0000
Content-Type: multipart/alternative; boundary="94eb2c0553b2ee74c9055ea9785c"

--94eb2c0553b2ee74c9055ea9785c
Content-Type: text/plain; charset="UTF-8"

On 21 November 2017 at 20:01, Armin Kuster <akuster808@gmail.com> wrote:

>  SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz \
>

So I've just discovered that this server is sending broken HTTP headers and
fetching this tarball doesn't work for anyone with wget 1.19.2.

I've told the maintainer and changed the recipe to use the GNU mirror.

Ross

--94eb2c0553b2ee74c9055ea9785c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 November 2017 at 20:01, Armin Kuster <span dir=3D"lt=
r">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808=
@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0SRC_URI =3D &quot;<a =
href=3D"http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz" rel=3D"noref=
errer" target=3D"_blank">http://www.lysator.liu.se/~<wbr>nisse/archive/${BP=
}.tar.gz</a> \<br></blockquote><div><br></div><div>So I&#39;ve just discove=
red that this server is sending broken HTTP headers and fetching this tarba=
ll doesn&#39;t work for anyone with wget 1.19.2.</div><div><br></div><div>I=
&#39;ve told the maintainer and changed the recipe to use the GNU mirror.</=
div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--94eb2c0553b2ee74c9055ea9785c--
