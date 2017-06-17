Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB4460939
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jun 2017 08:28:42 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id g83so6333206qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jun 2017 01:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g7k78K4xHN4HkPWSce1DsWHBUnBmVDxDy4JoG4w1N3A=;
	b=D6XLa01NzxTSH33LAG2kxqQ9+/FZ+HP3g78kV48atcbvbEXDfZY9H4o59KaTN3a4dD
	5aWdvQgDhCPjycU9ggqQfI68BCbmQJgWCTmCEB8S2Q9//yx48lxCdp17PfCaZJosqPKV
	jaZVq+iRPZWCVFA/pko1ur2OaoZ1FS9NnVkxXlotzX4sKqAAuOUymMyAna6V/L7piHdU
	jS59ekQmGq/WbfT11I8DKXQFILOOsOVIT81iCjC4fv1f9dgdkyte/oYB2CWxNP9HkIO+
	rQvz6GFp5VNZKKk3vrc3Hk3W/XTY7zG1Cr48YJAwlkMcCv2bioNfAuSApkH/sOmIDzht
	Pl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g7k78K4xHN4HkPWSce1DsWHBUnBmVDxDy4JoG4w1N3A=;
	b=MtsjBb1lnPZOxeXTmPn62K0TURjzS5T2c6LEXULKQrNW5IKXtA6Rcz3N8YpBpAPPQa
	7a0Vro21QB9tPQBjx447VuuM/PR4qiXFLtG8xxW+S3ILbavieOz2SuIQeqfx5pxZ+1Zk
	ebK9rxqKlj4iM2nREabXFODC3MPpzt7MCmc80pWQZteCil/yr9xf3r2676aNmC48ih1V
	Haoq8biX39LKDENX03PsNVtnWkV7F1A5oo7FzxdtXaoba2dSdfYcVl9k5WdzGciPwd5a
	q6+sC+v2u4ANN3LpJ/H3OZjeRcsFy7kucb6k/HZxcqbwT6b60rY5hfsWHqJDMUH0+N9r
	AeRA==
X-Gm-Message-State: AKS2vOx1V3r/Qzt05z5PxYBTO5m9FJNmFKPnYVmkPgg6NWG/qII1RHV0
	xuqreVakytMcK7M0t8+LwOQfXvAMIDl4
X-Received: by 10.55.181.69 with SMTP id e66mr16561125qkf.109.1497688123550;
	Sat, 17 Jun 2017 01:28:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Sat, 17 Jun 2017 01:28:23 -0700 (PDT)
In-Reply-To: <CAMKF1so4Lz2T5Gc1NNCWKLAjV9N_BVEdJFDUxKFqTAzdUyNAfw@mail.gmail.com>
References: <1497640847-9108-1-git-send-email-ross.burton@intel.com>
	<CAMKF1so4Lz2T5Gc1NNCWKLAjV9N_BVEdJFDUxKFqTAzdUyNAfw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 17 Jun 2017 09:28:23 +0100
Message-ID: <CAJTo0LbP+XTWdXy8xcfuoQm7Nf1T+tOeoTFjyeW-L4gt+axgyQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] epiphany: remove unused intltool build-dependency
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
X-List-Received-Date: Sat, 17 Jun 2017 08:28:44 -0000
Content-Type: multipart/alternative; boundary="94eb2c05d22296bd19055223b0ef"

--94eb2c05d22296bd19055223b0ef
Content-Type: text/plain; charset="UTF-8"

On 17 June 2017 at 02:11, Khem Raj <raj.khem@gmail.com> wrote:

> is https://bugzilla.yoctoproject.org/show_bug.cgi?id=9374
> no more relevant then ?
>

Correct: I've a local extension to insane.bbclass that checks for intltool
build dependencies but no use of intltool macros.

https://git.gnome.org/browse/epiphany/commit/configure.ac?h=3.24.2&id=b74f5c614e4cb9886e8ff6404f220b23df212be4
was the upstream commit to move away from intltool to standard gettext.

Ross

--94eb2c05d22296bd19055223b0ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 June 2017 at 02:11, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204=
,204);padding-left:1ex"><div id=3D"gmail-:75b" class=3D"gmail-a3s gmail-aXj=
CH gmail-m15cb39ba3861c4c5">is <a href=3D"https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D9374" rel=3D"noreferrer" target=3D"_blank">https://bugzi=
lla.yoctoproject.<wbr>org/show_bug.cgi?id=3D9374</a><br>
no more relevant then ?<br></div></blockquote><div><br></div><div>Correct: =
I&#39;ve a local extension to insane.bbclass that checks for intltool build=
 dependencies but no use of intltool macros.</div><div><br></div><div><a hr=
ef=3D"https://git.gnome.org/browse/epiphany/commit/configure.ac?h=3D3.24.2&=
amp;id=3Db74f5c614e4cb9886e8ff6404f220b23df212be4">https://git.gnome.org/br=
owse/epiphany/commit/configure.ac?h=3D3.24.2&amp;id=3Db74f5c614e4cb9886e8ff=
6404f220b23df212be4</a> was the upstream commit to move away from intltool =
to standard gettext.</div><div><br></div><div>Ross=C2=A0</div></div><br></d=
iv></div>

--94eb2c05d22296bd19055223b0ef--
