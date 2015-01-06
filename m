Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id CE336729C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 16:37:33 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id i50so3760514qgf.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 08:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/RlBG/iu6NI8KuO55tZla9BebCE07gzFEVIQwWknphY=;
	b=htMWBO5cHQXSeXQaDfizjoV7ZYMba9i69WRRyLxDYUt0rCpApsDjxSlnGwyrDwTpby
	dpvG3Rz3aju6nf9q5uxzP/9+vegCs4VzlAVSFOp4RhYoMfgOBUI9a+7hoQcxVtiBpZln
	Ee4SVoRSHYTcdq/5lmj7UZBWeL+fMGJH30aCQotmtaK+iN6SmS0UEfRQ309+bXe4McZG
	cUPWCpc3y2z3V9y8gf+h/7H2KhlP1XOH8Q869ekIrZAvLrROBfqkxtY8AhndoxfuJ2P8
	gDgmOEJV2SyYTSqYSh2oGS35vhoQfbsVyww9jTX6x+fxw1egZur//rsbD2hhAXNDC171
	SH7A==
X-Gm-Message-State: ALoCoQn4QfR24q6eWtSjiTVcTM4/nIclwu0EWplrt9UcfSOzhSZCrStthUFgsd49AFYWEgCrF26p
X-Received: by 10.224.25.139 with SMTP id z11mr120943595qab.17.1420562253652; 
	Tue, 06 Jan 2015 08:37:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 6 Jan 2015 08:37:13 -0800 (PST)
In-Reply-To: <7bfbcb4ca6a19b4377fa223f10c69309a8a009b7.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
	<7bfbcb4ca6a19b4377fa223f10c69309a8a009b7.1420558836.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jan 2015 16:37:13 +0000
Message-ID: <CAJTo0LYq8Bm7opRJwq0yEuwpuGYPZcxnW_baKbeD+koQbw1taA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/12] gnu-efi: Upgrade to 3.0w
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
X-List-Received-Date: Tue, 06 Jan 2015 16:37:33 -0000
Content-Type: multipart/alternative; boundary=047d7bea31c482bb8e050bfe6c79

--047d7bea31c482bb8e050bfe6c79
Content-Type: text/plain; charset=UTF-8

On 6 January 2015 at 15:42, Saul Wold <sgw@linux.intel.com> wrote:

> --- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
> +++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0w.bb
> @@ -8,6 +8,7 @@ SRC_URI = "
> http://downloads.sourceforge.net/gnu-efi/gnu-efi_3.0u.orig.tar.gz \
>             file://parallel-make.patch \
>             file://parallel-make-archives.patch \
>            "
> +
>  SRC_URI[md5sum] = "d15d3c700e79a1e2938544d73edc572d"
>  SRC_URI[sha256sum] =
> "3c0d450d5829204ca05dcb3b2aae772e52c379b7c7e09146759c6315606f934e"
>

No change to the checksums, presumably they didn't brute-force a sha256sum
attack to do that. ;)

Ross

--047d7bea31c482bb8e050bfe6c79
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2015 at 15:42, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mail=
to:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":6bu" class=3D"a3s" s=
tyle=3D"overflow:hidden">--- a/meta/recipes-bsp/gnu-efi/<a href=3D"http://g=
nu-efi_3.0u.bb" target=3D"_blank">gnu-efi_3.0u.bb</a><br>
+++ b/meta/recipes-bsp/gnu-efi/<a href=3D"http://gnu-efi_3.0w.bb" target=3D=
"_blank">gnu-efi_3.0w.bb</a><br>
@@ -8,6 +8,7 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.sourceforge.n=
et/gnu-efi/gnu-efi_3.0u.orig.tar.gz" target=3D"_blank">http://downloads.sou=
rceforge.net/gnu-efi/gnu-efi_3.0u.orig.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://parallel-make.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://parallel-make-archives.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;d15d3c700e79a1e2938544d73edc572d&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;3c0d450d5829204ca05dcb3b2aae772e52c379b7=
c7e09146759c6315606f934e&quot;</div></blockquote></div><br>No change to the=
 checksums, presumably they didn&#39;t brute-force a sha256sum attack to do=
 that. ;)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--047d7bea31c482bb8e050bfe6c79--
