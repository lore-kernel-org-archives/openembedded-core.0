Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 278FD6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 20:01:13 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 38so51977398iol.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 13:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H+idwyTCs0YTLl5XiEes8Kw1fgIEvlRMBLu9NYcSPnw=;
	b=Bap6V/pPYdjMu7WqwXbcWD9EMV/eXwsr50OjbqaG0JyZIC2/Qr1AGSNzcbpJLBtb2R
	YT38g1ElyTe4oS41LgcuniS0lriin/1NxaJVhv7+I+e0Z8aZ4V6yeBfsY4Cb9/+AeOHj
	lyGT6ua/tSAhBnvjzMlrqHcnupuwDR2OKefMgjONPAbelm8PYHRrXCGWcWPuf4cIhONZ
	DHAdea6t4CjKKeM5yFtRs7L2jH5q3BUOd92KD73SCFMuOs4f4X2Zsz/J+zW8L9Zq7dnH
	C5zzP+H5bkmCsdoYXOEJAK/pIm+q4mmZEMDyXPNs0Nm4Lbl/ZSvVmDHFSlMOcI2lKSBi
	bp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H+idwyTCs0YTLl5XiEes8Kw1fgIEvlRMBLu9NYcSPnw=;
	b=ZCXA/4/rCXnwHmlijXoBXITU6HCk840dzryFY4BF909LIEeefLa5D4/KT3Q2E2phtN
	v3dtBkYQD9ihj1zBMgbMabGH9wPinbNyscMLMB/igNZKU6j6+SimJxGmypCmIZrYSrcP
	qFXTHIXn9KDxOnjmBzitwnbLQbpfqW0yLew1GjbRmkYzUqJuvnsR5iCLJEQJ1Roihvm3
	Od9VFHEys2F3sTyVyzeesBkSi942yIucZnGZ8BZD3sIFPiK7SKg4ioUvxf5fkgDNX79e
	MgAB4qpnHrQjF6OzW46ocSxMxoS4S5Tcqt9Zugn+hZmeWypSiPsW0cgsXrRHuy/dcrv+
	9aOg==
X-Gm-Message-State: AEkoouv2Cl5HXKQhevURXEWv22PEfnyBIh3F5X7qKM+aUNRzugBil4uf7e5qfhQEVHeVqq1HLjQIkljxngCZUvyF
X-Received: by 10.107.154.196 with SMTP id c187mr7107714ioe.99.1470859274187; 
	Wed, 10 Aug 2016 13:01:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 10 Aug 2016 13:00:53 -0700 (PDT)
In-Reply-To: <20160810155851.17172-1-adrian.ratiu@ni.com>
References: <20160810155851.17172-1-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Aug 2016 21:00:53 +0100
Message-ID: <CAJTo0LYN2OoK5qBJiLpa_5YJ_qBDCqjEpqeWacnNqQ48Ad9FnA@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND] kernel.bbclass: fix emit_depmod_pkgdata() workdir
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
X-List-Received-Date: Wed, 10 Aug 2016 20:01:14 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e8d9deb0539bd1c62

--001a1140e81e8d9deb0539bd1c62
Content-Type: text/plain; charset=UTF-8

On 10 August 2016 at 16:58, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> bitbake commit 67a7b8b02 "build: don't use $B as the default cwd for
> functions" breaks the assumption that this function is running under
> ${B}. This causes build failures because System.map is under ${B}.
>

For clarity, can the function simply always use absolute paths instead of
relying on cwd?

Ross

--001a1140e81e8d9deb0539bd1c62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 August 2016 at 16:58, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":22v" class=
=3D"a3s aXjCH m156752fbe7d5be7d">bitbake commit 67a7b8b02 &quot;build: don&=
#39;t use $B as the default cwd for<br>
functions&quot; breaks the assumption that this function is running under<b=
r>
${B}. This causes build failures because System.map is under ${B}.<br></div=
></blockquote></div><br>For clarity, can the function simply always use abs=
olute paths instead of relying on cwd?</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a1140e81e8d9deb0539bd1c62--
