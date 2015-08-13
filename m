Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 04B2D766D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 19:34:13 +0000 (UTC)
Received: by qgeg42 with SMTP id g42so38519685qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 12:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3DiizvYA6APVZetJXfP3w0xbVmbn3dTfqoadgskWu6o=;
	b=ffLmt45qNTcBzCIsVigVOMRHdx07zWN9u0YfLR6fxUg4DNXT/ZfMj9C4XZlhyGG7ij
	JNTvH0yGKNav/syU/bQglNqbTnPBaEL/bj//Q0WxMhkEZwoJH4IabornNyWklU323AZ8
	dJw1lxUns8vksI1X/HmDmZDyZJW9QvI8LFJyAyOpImitrXN7swkn46gMqMwGNWdVOnMX
	ixTDsuCOai8R3EOxXVx00RKZSSVI7ZNB1I33MCGyFVyi/51DJ1BVHD72rTDIkpEFbF9/
	Ps7+75fvAcqw+Xbdqn/jIk0LcfFPmIkDd7xxZJsZoRhog6UJux4OhDUf7wQv/I45EECo
	ZLzQ==
X-Gm-Message-State: ALoCoQmItbeNwTq08jLdPJ/ffVK73KBRXuu1QC/VgP1k6MO789ZGUeOFsi3CPvz4158to3721Tx8
X-Received: by 10.140.237.204 with SMTP id i195mr36008830qhc.93.1439494453341; 
	Thu, 13 Aug 2015 12:34:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Thu, 13 Aug 2015 12:33:54 -0700 (PDT)
In-Reply-To: <55CCF0A8.4010409@windriver.com>
References: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<757e0230b801d19350e30523d62ac9b963c542bf.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LbpYSNWZ39Vik4U8eT-+B+tg4-RpY+0nsDphLA5a-wOQA@mail.gmail.com>
	<CAMKF1sqHK5q-Xq9Gv4wae4MZdSw57e_OVyc_kdFkWgeAKd8v+g@mail.gmail.com>
	<55CCF0A8.4010409@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Aug 2015 20:33:54 +0100
Message-ID: <CAJTo0LYBo=G3MoxVrepxSKhASSQgOH4jz+r-M5UBWOBWnSbvTA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] package_deb.bbclass: Handle exception when encoding non-ASCII characters
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
X-List-Received-Date: Thu, 13 Aug 2015 19:34:17 -0000
Content-Type: multipart/alternative; boundary=001a1135a0308c4afe051d366b9b

--001a1135a0308c4afe051d366b9b
Content-Type: text/plain; charset=UTF-8

On 13 August 2015 at 20:31, Mark Hatle <mark.hatle@windriver.com> wrote:

> RPM isn't really utf-8.. it's more single 8-bit characters...  UTF-8 (1
> byte
> characters) work fine.. multibyte are not promised to work.
>
> If you need special encoding (more then 8-bit characters) then you should
> be
> using 'po' style files to translate the 8-bit chars to localized
> versions...
>
> So checking (and fixing) the strings for various things is a good idea for
> RPM
> at least.
>

In the common case of "maintainer's name isn't ASCII" you don't want it
translated, and assuming UTF-8 everywhere mostly works.

Ross

--001a1135a0308c4afe051d366b9b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 August 2015 at 20:31, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":u6" class=
=3D"a3s" style=3D"overflow:hidden">RPM isn&#39;t really utf-8.. it&#39;s mo=
re single 8-bit characters...=C2=A0 UTF-8 (1 byte<br>
characters) work fine.. multibyte are not promised to work.<br>
<br>
If you need special encoding (more then 8-bit characters) then you should b=
e<br>
using &#39;po&#39; style files to translate the 8-bit chars to localized ve=
rsions...<br>
<br>
So checking (and fixing) the strings for various things is a good idea for =
RPM<br>
at least.</div></blockquote></div><br>In the common case of &quot;maintaine=
r&#39;s name isn&#39;t ASCII&quot; you don&#39;t want it translated, and as=
suming UTF-8 everywhere mostly works.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1135a0308c4afe051d366b9b--
