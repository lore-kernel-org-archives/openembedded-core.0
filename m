Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id EE6327762C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 17:27:37 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id 1so15525825qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 09:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KEHSBL+eDe4qKYyNnUyr6Dr32vCR0JpdZVuPpSUI3dU=;
	b=GI+5/zqiPE78+G24F0I8hvfEXjHq842/9KlseoLaQlaHSD4KyrJYaZdfrz43tqw655
	NGBiNR73EQSgovCGPzTGJLz6mNvXseljRtYz0YjOGETRZSalo18wOWpCI8VvEe1RUdGL
	BLz1b6Nth/j3aSeQkM4qPe7z3+r8VshX+ui2eZsYh66+saTc523QzBzsmIzuz6S0Lbbu
	OZf2CNM+xbmjpCB/5Jd+kPhzXVeH+3Zhwd5OhYC9iXva5P4GfBxR5ulKUGRZHMs2ihA5
	Fx98aAEIb4oQdGUpQ/DWc2YmxSsSEwILMOlmY5s1J2ws0z+gu6ewfTTS7Jp2bhtULyFk
	WLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KEHSBL+eDe4qKYyNnUyr6Dr32vCR0JpdZVuPpSUI3dU=;
	b=ioqO+d/nidlhZKATadzbsX3WhgYPcfld6u+wo4g3xTi+PRRtZQzdKaUcEjyLQRfXhb
	U5DKBqgEjU5GbXFQcgDsYD6nFihfjqYzYeuiRAi+0ItDBo62Uze8gRK8dzoA2KFnKRbh
	esTO77pzF2XxVkHE3FiFjvuOdEKJTEjfbqLoErt4dPqUkRz6ci+xoE8oy0pqeeVo70HR
	IJJfQFbo+/s6nBDalBMG8+7kKL4290NuRPfpCPPxEURDYyChrhVFYuhFeAnBtFJjvDZD
	GU3T93pgEMCo5C27ZNAl7LzQ5gsFUbccFOBHSTOuwyKRJMZui+Lekko4DV8hI5yP5yxz
	fM1g==
X-Gm-Message-State: AMke39kr4YoqFj5A2Y8ZRz5buVRmYFXhN9PxGFATYBxUO2dwD9FaGDzjvQs38t4R35xKJjXSOFmmi0IL9nKpsp7d
X-Received: by 10.237.39.158 with SMTP id a30mr19148001qtd.65.1488475658706;
	Thu, 02 Mar 2017 09:27:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Mar 2017 09:27:18 -0800 (PST)
In-Reply-To: <20170228090315.20376-1-andhorsthemke@gmail.com>
References: <20170228090315.20376-1-andhorsthemke@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Mar 2017 17:27:18 +0000
Message-ID: <CAJTo0LbiZVRwE6HPedaPaeXM-wHD4dq9JbhoOWzLx=S2XWvouw@mail.gmail.com>
To: Andreas Horsthemke <andhorsthemke@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lz4: upgrade to v1.7.5
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
X-List-Received-Date: Thu, 02 Mar 2017 17:27:38 -0000
Content-Type: multipart/alternative; boundary=f403045f26a4e534770549c2be74

--f403045f26a4e534770549c2be74
Content-Type: text/plain; charset=UTF-8

On 28 February 2017 at 09:03, Andreas Horsthemke <andhorsthemke@gmail.com>
wrote:

> +PACKAGES =+ "${PN}-cli"
> +DESCRIPTION_${PN}-cli = "Command line interface tools for the LZ4
> compression algorithm"
> +FILES_${PN}-cli = "${bindir}/*"
>

For compatibility and clarity, I'd say that PN should be the binaries and
there should be a liblz4 package with just the library in.

Ross

--f403045f26a4e534770549c2be74
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 February 2017 at 09:03, Andreas Horsthemke <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:andhorsthemke@gmail.com" target=3D"_blank">andhorsthemke@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2=
uj" class=3D"a3s aXjCH m15a83f6a6765c292">+PACKAGES =3D+ &quot;${PN}-cli&qu=
ot;<br>
+DESCRIPTION_${PN}-cli =3D &quot;Command line interface tools for the LZ4 c=
ompression algorithm&quot;<br>
+FILES_${PN}-cli =3D &quot;${bindir}/*&quot;<br></div></blockquote></div><b=
r>For compatibility and clarity, I&#39;d say that PN should be the binaries=
 and there should be a liblz4 package with just the library in.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--f403045f26a4e534770549c2be74--
