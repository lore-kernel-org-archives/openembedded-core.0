Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9D560132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 13:20:02 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id a108so27759730qge.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 05:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3dWGQZ2nDhM7fJp1xhH/+5PoDZ3TIU30hDtt5BJsaVE=;
	b=c3Sa9Uy/vL8MsX5JxiuKeMGrCTFyN0oK+qwLMP8zGB4bPZOgDTZqMYA37YGAMdPc4V
	7y50CiLE8mq6iuM14a8Gknui4IeziycBgREhYSnirbP2xgATm64svb0mY6mI9aoNt78B
	ZcfX7DcjQuRP1Ep+t6Bv0IZj4Adc+GsmlKYWzY/vH3f3VbK1Xr6n2s/yrsjKl4L8ruOE
	nHOGmN+ho/HILjfkTEI7Henq5G0S1Fg15aL+CEqIMMsLG93hutN+H6bXKOuC/gQlvauM
	OWhJDsufrzOpWmZJZ1M9jNLfdY3LNVS6WRHifHPtxkg6B7mnhMjsGgeyMDYx2RJ8vDQ/
	AlQw==
X-Gm-Message-State: ALoCoQl7KFWUqrzqdIJWYUfrKcmE3V3Zb9FY/qe8FqwlU5wZn2bKy55/yPC5YLfT/xLFln+XEe5x
X-Received: by 10.140.39.179 with SMTP id v48mr759854qgv.77.1422537604033;
	Thu, 29 Jan 2015 05:20:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 29 Jan 2015 05:19:43 -0800 (PST)
In-Reply-To: <1422052818-3276-1-git-send-email-denis@denix.org>
References: <1422052818-3276-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Jan 2015 13:19:43 +0000
Message-ID: <CAJTo0Lau6UXJcwycbQmk0ebcp48sg9+_9G02ae=19MBhPFQ4nQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Thu, 29 Jan 2015 13:20:04 -0000
Content-Type: multipart/alternative; boundary=001a11c131f691a8dc050dca5844

--001a11c131f691a8dc050dca5844
Content-Type: text/plain; charset=UTF-8

On 23 January 2015 at 22:40, Denys Dmytriyenko <denis@denix.org> wrote:

>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2014.07.bb => u-boot
> -mkimage_2015.01.bb} (45%)
>

u-book-mkimage-native is failing on some autobuilders:

| In file included from tools/default_image.c:18:0:
| include/image.h:877:27: fatal error: openssl/evp.h: No such file or
directory
|  # include  <openssl/evp.h>

https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/builds/170/steps/BuildImages/logs/stdio

Non-deterministic build dependency on openssl?

Ross

--001a11c131f691a8dc050dca5844
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2015 at 22:40, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D":2lp" class=3D"" style=3D"overflow=
:hidden">=C2=A0rename meta/recipes-bsp/<span class=3D"">u</span>-<span clas=
s=3D"">boot</span>/{<a href=3D"http://u-boot-mkimage_2014.07.bb" target=3D"=
_blank"><span class=3D"">u</span>-<span class=3D"">boot</span>-mkimage_2014=
.07.bb</a> =3D&gt; <a href=3D"http://u-boot-mkimage_2015.01.bb" target=3D"_=
blank"><span class=3D"">u</span>-<span class=3D"">boot</span>-mkimage_2015.=
01.bb</a>} (45%)</div></blockquote></div><br>u-book-mkimage-native is faili=
ng on some autobuilders:</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra"><div class=3D"gmail_extra">| In file included from tools=
/default_image.c:18:0:</div><div class=3D"gmail_extra">| include/image.h:87=
7:27: fatal error: openssl/evp.h: No such file or directory</div><div class=
=3D"gmail_extra">| =C2=A0# include =C2=A0&lt;openssl/evp.h&gt;</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"https:/=
/autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/builds/170/step=
s/BuildImages/logs/stdio">https://autobuilder.yoctoproject.org/main/builder=
s/nightly-fsl-ppc/builds/170/steps/BuildImages/logs/stdio</a><br></div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Non-determinist=
ic build dependency on openssl?</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div></div>

--001a11c131f691a8dc050dca5844--
