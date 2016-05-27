Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 372066FF5B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 10:25:46 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id f8so69363204ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ceg+YuCE4hjd6QvogAlh9OTk1BdwiLmLwrt7sQrHLd4=;
	b=L9iTEO/+6D6Gkfzpu9x371fQcp8sDzQwXiC/wWyp32X4V40iLzZDBj8c2dDC7IDnwv
	67lVn/2hPkxZFgvHlqevOKidbdRWk5h+syHHFdLYoqckHY+/HRpVmrUBdKqAUazrdV1r
	ZGKPV2UklQcgUskijIDJlJ++UZTsHCaoYSv7OSkZGzl0sizFii/W0PhIIEaAUnOMueT/
	a5PAr5LqPfQkBKeiL80pvjmOPTEbzo9nBIn00WefolZ09R2y0B0UHirokkv26DEnC5Oc
	/wricrCRqOIBmV5G/8ss7iMT9zDX63dG5V5RP8e6yZedlULopbDjcvZNe6A2a0vzKk6h
	RvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ceg+YuCE4hjd6QvogAlh9OTk1BdwiLmLwrt7sQrHLd4=;
	b=SwnFmLIV5T2AHeJeydIuNFpb7WLocQHovBV2zHCJB59QCrPCrDcOZMnVOdxZegHa+d
	5gq4QmNRukKn5U0/bn+b/ttR9dPGPCgE72XXNLi5Cqu+RMpj+7ZlJulHejUIWhknhCkY
	T4QffWpwbDPFmwRGKRpDruvvU3aChDIvr8r+whV5zRSPIamnYQ3XMajGngWNUA3C686u
	B8gNEome1mAndZ/kg2Bnep1+jgTk/zd8tuysLkc8d5oJZIod8HxCTgy+TsTYqH29VR3o
	dZLXECVpNNh5rWKOGbzqW9JJZADXM6PX6zlPild1BhrjhO+4EfdMwbKfihWemP1H3dEb
	9Wcg==
X-Gm-Message-State: ALyK8tImjjVJjlvo3UJUD1DiB192fjHFct0CUUVypoPZWO0bMvJP/ZU3L2IMKoFdTWVQRa/KeCkblmkUK0otiK9y
X-Received: by 10.107.51.3 with SMTP id z3mr12202004ioz.148.1464344747420;
	Fri, 27 May 2016 03:25:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 27 May 2016 03:25:28 -0700 (PDT)
In-Reply-To: <20160527095518.21761-1-otavio@ossystems.com.br>
References: <20160527095518.21761-1-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 May 2016 11:25:28 +0100
Message-ID: <CAJTo0LbeFyt=hJnktpKY4YjPhgCd9ohRn=5kgqwbvMAjsEdmcA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] Improve SSL certificate handling
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
X-List-Received-Date: Fri, 27 May 2016 10:25:47 -0000
Content-Type: multipart/alternative; boundary=001a1144154e7fe6530533d0546d

--001a1144154e7fe6530533d0546d
Content-Type: text/plain; charset=UTF-8

Can you rebase to master as v1 was merged.

Cheers,
Ross

On 27 May 2016 at 10:55, Otavio Salvador <otavio@ossystems.com.br> wrote:

> This patchset leverage the OpenSSL certificate handling so it works
> aligned with Debian and other generic distributions regarding where
> the certificates are stored and how they are installed.
>
> This all started when debugging why SSL certificates were not working
> properly for a customer which was using QtWebEngine. It turned out to
> be the integration which was not complete so this patch addresses it.
>
> Changes in v2:
> - Add rdepends on openssl
>
> Otavio Salvador (3):
>   openssl: Add Shell-Script based c_rehash utility
>   ca-certificates: Use c_rehash utility
>   openssl: Ensure SSL certificates are stored on sysconfdir
>
>  meta/recipes-connectivity/openssl/openssl.inc      |  26 ++-
>  .../openssl/openssl/openssl-c_rehash.sh            | 210
> +++++++++++++++++++++
>  .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   1 +
>  ...01-update-ca-certificates-remove-c-rehash.patch |  46 -----
>  .../ca-certificates/ca-certificates_20160104.bb    |   3 +-
>  5 files changed, 231 insertions(+), 55 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
>  delete mode 100644
> meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
>
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144154e7fe6530533d0546d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you rebase to master as v1 was merged.<div><br></div><=
div>Cheers,</div><div>Ross</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On 27 May 2016 at 10:55, Otavio Salvador <span dir=3D"=
ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavi=
o@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
This patchset leverage the OpenSSL certificate handling so it works<br>
aligned with Debian and other generic distributions regarding where<br>
the certificates are stored and how they are installed.<br>
<br>
This all started when debugging why SSL certificates were not working<br>
properly for a customer which was using QtWebEngine. It turned out to<br>
be the integration which was not complete so this patch addresses it.<br>
<br>
Changes in v2:<br>
- Add rdepends on openssl<br>
<br>
Otavio Salvador (3):<br>
=C2=A0 openssl: Add Shell-Script based c_rehash utility<br>
=C2=A0 ca-certificates: Use c_rehash utility<br>
=C2=A0 openssl: Ensure SSL certificates are stored on sysconfdir<br>
<br>
=C2=A0meta/recipes-connectivity/openssl/openssl.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 26 ++-<br>
=C2=A0.../openssl/openssl/openssl-c_rehash.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 210 +++++++++++++++++++++<br>
=C2=A0.../recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2h.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2h.bb</a> |=C2=A0 =C2=A01=
 +<br>
=C2=A0...01-update-ca-certificates-remove-c-rehash.patch |=C2=A0 46 -----<b=
r>
=C2=A0.../ca-certificates/<a href=3D"http://ca-certificates_20160104.bb" re=
l=3D"noreferrer" target=3D"_blank">ca-certificates_20160104.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A05 files changed, 231 insertions(+), 55 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-=
c_rehash.sh<br>
=C2=A0delete mode 100644 meta/recipes-support/ca-certificates/ca-certificat=
es/0001-update-ca-certificates-remove-c-rehash.patch<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.8.3<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1144154e7fe6530533d0546d--
