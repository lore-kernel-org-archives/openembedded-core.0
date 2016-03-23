Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8ACDF607F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 11:53:40 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id c63so35232870iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 04:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5rn+qvbXGI7DB6rAznZPY8zfbaXdryfwQy5m5HWKd7Y=;
	b=fguVpBMXw80obI/cwhYrYKmTxob92o4NkDAo9xNZnwisnsl4ZAac+nkz8dm8e1piJY
	wgyRhicd+Yr6S2NGzp3BcZ0Vr1KZfcsnggh6MAs2fZvGPNcaFaIbN1ATNZ69wREgXmTu
	K9nRq5qdfPLdhZW6TXSn6AsjsDYFXtd7zLk5m/1b+qClWMtOpdEGt7LoxeYDbiNA7+rG
	mF4T9GFfbviFvng6IvJCemH8JsQsxb+F28QvfmYoswLg1sY4NZRlVARRa0dbMXKKSZ4a
	66VKNpclSTq95Q58mm1z1vlwPZoatZSJyeO+PBZEI3oke2hPtoNi+J50FEfC0r41NGRn
	pPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5rn+qvbXGI7DB6rAznZPY8zfbaXdryfwQy5m5HWKd7Y=;
	b=T5OjLRwxiKK8DiCqNGs0vKvDOh3R4uElfEslveuCRyBQnlRJDNLSkv+iwV0aGRozjg
	8rO/OUitc0C2d1Fbn4guQbXiGyx4AhEhBJgre4PPu72HSwWTI/WnWGr5eF01vkDhOGHi
	IBTXA3rxBM2Nb45mg5CJt6bnXhFJw5Eo/mB2oBsuw1h+zmuLs/yOPw5run8/I/GfswHx
	cYRdJBb4rD/tMmx8uRoz+1TCSCcLIPCAWSiSg0BCYpTKHmNJOwMNirb3Z7V0RAMt4uDo
	pEFGgS9/U8g423Ow79p7Pcal7mRLrtJGwLu/WzqrphPduYs46M3+w2ZvXzq3s7PedXA8
	5f8A==
X-Gm-Message-State: AD7BkJKCaTD+WhdmIVVBcy0nkkhMDsPuIcWjoGIM0v1O6QnynMdHZPnGfG+w4OOktlsl2rymFA1icfOMpCyU80vq
X-Received: by 10.50.43.226 with SMTP id z2mr24236303igl.78.1458734008969;
	Wed, 23 Mar 2016 04:53:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Mar 2016 04:53:09 -0700 (PDT)
In-Reply-To: <1458690727-23015-3-git-send-email-alejandro.franco@linux.intel.com>
References: <1458690727-23015-1-git-send-email-alejandro.franco@linux.intel.com>
	<1458690727-23015-3-git-send-email-alejandro.franco@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Mar 2016 11:53:09 +0000
Message-ID: <CAJTo0LZCVdHk=bAZjbzWC8gZOKbugNBLyD0yNFu-ZqLGOUFcDQ@mail.gmail.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	Benjamin Esquivel <benjamin.esquivel@intel.com>,
	Andreas Schultz <aschultz@tpip.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/3] icecc.bbclass: expand package arch
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
X-List-Received-Date: Wed, 23 Mar 2016 11:53:40 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f46d65b0052eb5fa84

--047d7bfea0f46d65b0052eb5fa84
Content-Type: text/plain; charset=UTF-8

On 22 March 2016 at 23:52, Alex Franco <alejandro.franco@linux.intel.com>
wrote:

> +    package_arch = d.getVar("PACKAGE_ARCH", False)
> +    if '${' in package_arch:
> +        package_arch = d.expand(package_arch)
>

Just pass True to getVar().

Ross

--047d7bfea0f46d65b0052eb5fa84
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2016 at 23:52, Alex Franco <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:alejandro.franco@linux.intel.com" target=3D"_blank">alejandro.franco@li=
nux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":fnh" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 package_=
arch =3D d.getVar(&quot;PACKAGE_ARCH&quot;, False)<br>
+=C2=A0 =C2=A0 if &#39;${&#39; in package_arch:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 package_arch =3D d.expand(package_arch)</div><=
/blockquote></div><br>Just pass True to getVar().</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bfea0f46d65b0052eb5fa84--
