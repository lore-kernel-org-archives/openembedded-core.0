Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9768E7404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:06:11 +0000 (UTC)
Received: by vkfp126 with SMTP id p126so105260497vkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 10:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=re3TEmAWtm9Q3cNsUAu2W4ML/2PB8B4/eOVcieGMZkw=;
	b=oNYt2bcpRWE91UE+GpmDemmBw9DlNaS0BlVBXLaEYzqq05L/RUjYaX8F0a3iHk74z5
	eF4kKDSWDFFHJBGBurjDuI8WgMzctxx1vOODi+n1/jt6y3kZYVSkdpZDUDX/+08RTpLb
	Cp4o+XaNF6oDA8N24IczIzAedqkjq9eq/C7L3lq/OAj7+jhxw8ltSV8IXXehYJKhUgHN
	wpcsJ9Or2WkibQystcw80+72vRFEJ/Pbzc35xMqsRiPwudQOTKfhUvd0XYstMWnPLLn+
	I8rUR4JrsiPam/1Bm6j6tQnJDN+Hi+kUFwZ7ISIXSGcgB4KU1XsUS9w4Dx+Ni9vBLiY/
	DnwQ==
X-Received: by 10.31.16.41 with SMTP id g41mr29948127vki.158.1442423171333;
	Wed, 16 Sep 2015 10:06:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.203.2 with HTTP; Wed, 16 Sep 2015 10:05:51 -0700 (PDT)
In-Reply-To: <1442423012-22426-1-git-send-email-kergoth@gmail.com>
References: <1442423012-22426-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 16 Sep 2015 10:05:51 -0700
Message-ID: <CABcZAN=oneksZsfnay2mKsL9ELhgJQMzfBd9NOz_kYgf3BNfag@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] recipetool: add 'newappend' sub-command
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
X-List-Received-Date: Wed, 16 Sep 2015 17:06:11 -0000
Content-Type: multipart/alternative; boundary=001a11c003d6be4209051fe05028

--001a11c003d6be4209051fe05028
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 16, 2015 at 10:03 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> This sub-command creates a bbappend for the specified target and prints the
> path to the bbappend. The -w argument, as with some of the other recipetool
> commands, will make a version-independent bbappend.
>
> Example usage: recipetool newappend meta-mylayer virtual/kernel
>
> [YOCTO #7964]
>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>


v2 change: as Paul suggests, uses get_bbappend_path now.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c003d6be4209051fe05028
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Sep 16, 2015 at 10:03 AM, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">This sub=
-command creates a bbappend for the specified target and prints the<br>
path to the bbappend. The -w argument, as with some of the other recipetool=
<br>
commands, will make a version-independent bbappend.<br>
<br>
Example usage: recipetool newappend meta-mylayer virtual/kernel<br>
<br>
[YOCTO #7964]<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">=
kergoth@gmail.com</a>&gt;</span></blockquote></div><br>v2 change: as Paul s=
uggests, uses get_bbappend_path now.<br>-- <br><div class=3D"gmail_signatur=
e"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Found=
er - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Soft=
ware Engineer, Mentor Graphics</div></div>
</div></div>

--001a11c003d6be4209051fe05028--
