Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id F05E3605BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 16:19:02 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id c47so318637552qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 08:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tTc8BT4MiMUm3LBXm7ugs3C1/NAZsAJsxCS6PX0Ts48=;
	b=EAcL7ri1GlDOgm6RbxQf7nCejBzYf00zAwvmXH63COxhKPdquHaB8cAWwcD3UCYEOp
	M8kn7z+LRMHH60eXFg/CX7K4wkmiCXeREGu2vpGZPtOlNedBvnNWaKBhDFVoEFkeYM7/
	QLktXwAYldxh2O9PIRpZcfA0JzaYenbN8u8omWolNr5VLp7SgzYngtxD9QiiggQJGMze
	allb7ZU6rD3kzZXHgCF/UEMmcqevgVnCT3sudQLLSvlRVdymPajT2Dt3zEaWHujEiFoY
	3pbMhYilotwcQbyGF/fSo514kn99hBKGnKm3KqdasKXAO55WbkZQeQEY2lgddvMvO5uR
	9HVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tTc8BT4MiMUm3LBXm7ugs3C1/NAZsAJsxCS6PX0Ts48=;
	b=dYxfZZ/7kZmt3vAfJ4gm9LhUAdERc6A6FbXJ9+q9xOB6xU53p7KmEvw3P3n8Xa5u6I
	0ZG6cTPSRmcoi8qctl71WuQLFBvRi4jRSVWuYFx6YUv/Lz6GGLKzumaC2OSc7opZ2iuN
	WplFjzrqQvLuEflYecdCNomyGp9hbAXo10/XsgXA4i/8kR7Waa63aRvSqJLeueje1gfD
	vBEWxUomQw8k0L/igQPnz48s8si+ZnOLsomGOLuZT4F8N2852TSXYhKoFKncEGsUynZo
	qStpcex9mmeIkIoReeZZvL83dZUxtHGv9wne8wezV8wv/V577WAGsJetTfc5y2lStXKp
	YC2Q==
X-Gm-Message-State: AKaTC011E4OLxRh16AOg4R2ExcMF5PmJcp4bUubO2HtMq+YwTEJjpa0d0mPaWuUJZ79xfWGMhGft8APYSqF0fhAr
X-Received: by 10.237.34.46 with SMTP id n43mr55842728qtc.105.1480954743904;
	Mon, 05 Dec 2016 08:19:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 5 Dec 2016 08:18:43 -0800 (PST)
In-Reply-To: <1480687192-4813-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1480687192-4813-1-git-send-email-fabio.berton@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Dec 2016 16:18:43 +0000
Message-ID: <CAJTo0LaPMyELP89ZvUoi5kEnH_ToGt_bxMuRwWN1ooYWxeUWCA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add RPROVIDES bootloader
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
X-List-Received-Date: Mon, 05 Dec 2016 16:19:03 -0000
Content-Type: multipart/alternative; boundary=001a11377e1870a3ed0542eba564

--001a11377e1870a3ed0542eba564
Content-Type: text/plain; charset=UTF-8

On 2 December 2016 at 13:59, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> This change allow to install u-boot in /boot partition using
> MACHINE_ESSENTIAL_EXTRA_RDEPENDS variable e.g.:
>
> MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "bootloader"
>
> This is usefull when system has only one partition and u-boot,
> kernel and device tree need to be installed in /boot.
>

What does this give you over just MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=
"u-boot"?

Ross

--001a11377e1870a3ed0542eba564
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2016 at 13:59, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossyst=
ems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1yx" class=3D"a3s aXjCH m158bfd741a2acefe">This change allow to instal=
l u-boot in /boot partition using<br>
MACHINE_ESSENTIAL_EXTRA_<wbr>RDEPENDS variable e.g.:<br>
<br>
MACHINE_ESSENTIAL_EXTRA_<wbr>RDEPENDS +=3D &quot;bootloader&quot;<br>
<br>
This is usefull when system has only one partition and u-boot,<br>
kernel and device tree need to be installed in /boot.<br></div></blockquote=
></div><br>What does this give you over just MACHINE_ESSENTIAL_EXTRA_RDEPEN=
DS +=3D &quot;u-boot&quot;?</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11377e1870a3ed0542eba564--
