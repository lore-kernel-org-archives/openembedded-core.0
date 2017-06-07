Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAE871B13
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 10:21:41 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id c10so4552795qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cHih0w/SuOl4c4RyO5G2exo3IkhgTrgU2Ptav/TpDUI=;
	b=P9zp5TNb5eDYLrE8LPF39juemTdIkeM2412sUe1NCnMly6AwrxrXHIcCikFZuSCXVD
	XK4ffA0grqgGLUS6ACflsWimwmG2rUvGCG9+tZKjDyRYNTBB2oa31Efrt9okKQAzceAv
	bxcHHcC8RuwGmx2MN6tWmyH57ybTZvqqVm8j6sOQT6Mz7FssrCQ+2pcFKIJxlBUeh0nz
	G/hq6dVg1SssikwaQ+0I1Fwt481ufG/+e843sxKbP0IYgLgaPs/pNYX8e3tSNCmYmVrP
	TGyeSpejn/U6rktRJsQRwQ2nqjYGEirPKOw0eUfMa4yyVbHL+s4anaPTSBegqH78QEYn
	owOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cHih0w/SuOl4c4RyO5G2exo3IkhgTrgU2Ptav/TpDUI=;
	b=I4ztjKMTw77Kawll6FxTAPK8NjQJHAyfUTqzk4TeV5tB16k8CMeKT2kSEfOFX9Ycv3
	+nJG/CSHB/B1dmYqnG/AjlCbFUAv0Otlt1D9O5dgW+WG5NydAgQJo+TNx/du9YtV6XOs
	jw2h3noc7E4taOjh88+VJ/cmnkmgnyRbH9F1NiDiv0rH8ty0j5bbX7l9RWQ0PVKXoKFL
	y+i4PR7dVi5Xhd5EtVrOm9g6OMYkYSEDpWVZE6gfyzVyYzl5EBsMHr3nQ4W+XnwPne/s
	x8/XU279MKpeO6+uCxUih6QbF3LzpTfe8P25BdLFL/WIvtNCyGiya6lAl0lv9+9npYf6
	zhKA==
X-Gm-Message-State: AODbwcD7f8fGZwPavWqeZNTiYiI/oDXtrbQo3MDf8cboEaJukhjiTXfW
	7iBFsLPWBm33IGuxYsys54wckYPVIe8uNKQ=
X-Received: by 10.200.43.99 with SMTP id 32mr38620689qtv.6.1496830903276; Wed,
	07 Jun 2017 03:21:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 7 Jun 2017 03:21:22 -0700 (PDT)
In-Reply-To: <20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
References: <a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
	<20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jun 2017 11:21:22 +0100
Message-ID: <CAJTo0LYe=7Ug3wJSWwPX5VT=cy7GDe0Kf79uPFmC1tMj-0b-6Q@mail.gmail.com>
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] runtime/dnf: Add new dnf test cases
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
X-List-Received-Date: Wed, 07 Jun 2017 10:21:42 -0000
Content-Type: multipart/alternative; boundary="001a1146fb46476ae405515c1ae7"

--001a1146fb46476ae405515c1ae7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 15 May 2017 at 14:50, <jose.perez.carranza@linux.intel.com> wrote:

> Add test cases to test =E2=80=9Cexclude=E2=80=9D and =E2=80=9Cinstallroot=
=E2=80=9C options, also modify
> the logic of filtering packages on the feed to have all the packages
> needed by the tests.
>

Fails all over the autobuilder, for example:

http://errors.yoctoproject.org/Errors/Details/143886/

Ross

--001a1146fb46476ae405515c1ae7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 May 2017 at 14:50,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jose.pere=
z.carranza@linux.intel.com" target=3D"_blank">jose.perez.carranza@linux.int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;bord=
er-left-color:rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">Add=
 test cases to test =E2=80=9Cexclude=E2=80=9D and =E2=80=9Cinstallroot=E2=
=80=9C options, also modify<br>
the logic of filtering packages on the feed to have all the packages<br>
needed by the tests.<br></span></blockquote></div><div class=3D"gmail_extra=
"><br></div>Fails all over the autobuilder, for example:</div><div class=3D=
"gmail_extra"><br><a href=3D"http://errors.yoctoproject.org/Errors/Details/=
143886/">http://errors.yoctoproject.org/Errors/Details/143886/</a><br></div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a1146fb46476ae405515c1ae7--
