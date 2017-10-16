Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id E72A6780C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 21:46:04 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id 72so69157itk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4BxBGUm5anQhz+3IjLBMumY1EXRw+hLbDmMBdFowRrw=;
	b=siRL2CBTaZtIWPMtSSiSa24Vv+YLgubS1YG5F8+a3ky2KpVi22xYqi4C4uqFw86Gna
	N8S5TBPyRUloYm7tCY2QFKSgTCvZyS5vw4A1GVSI/aM4Cox7C2y3iF4EujFqLEWYG7dX
	cSi2wxKtClLB3EoagdiEpG/y3Dm8OodvEsB7hr5CTO+xEd9oCiEtn48bIGgvafWqOZQt
	qtwtrTR6CJNhuNfOf/J7yRKwxCX1gh4ZZ39b3HnBJwd1NC/PTxE2QITqSFEwLr7BjnHk
	IxiaPzCzHxZmtUyJ7NBtnat6lhHy0mn7RD/xJ92KONI2U0kRQoqrnsYTcfMDS+7RC5ym
	sNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4BxBGUm5anQhz+3IjLBMumY1EXRw+hLbDmMBdFowRrw=;
	b=F2umMnxqYH/QG743YL+7t0peNWrJAd9sqxV+lMNd954Zl1XRQ34zCfDrnF+8cLcv7k
	WHTXwuCnlSLeIU2+MC7mzpQDJ8bp7BQBJfxljPDRUk5YdJKvDWYifXV1kkfF/dSxd2GE
	ERCvn85gjf8vawhWwFF3ZJ8LpoK/SKQvw/C8Hk0Hgj5Emu7KtrQsoiXSniY5/+9qXIPS
	8vyYdEfKYJm2Shv8mhETqW3k72MZJgHte6d1s+Rabgu2VQvJOluVKuRNmpgG6vHv1rgx
	JyFlD6ujRrFE//kYest/mpjzBwnwKxYxoNm/qUoptNGJk9LxJRtd9Iz92Y0q/Zttm7Gg
	talw==
X-Gm-Message-State: AMCzsaVvIdcduJGjYpsNF8Edc8n9dSZEMAZ+4kE46tCwZeAVtyqOSpL3
	hLFE40W45zmmCmoCD3Yr8a2FaZWDdMws9/dnMifNTQ==
X-Google-Smtp-Source: ABhQp+QBDHxf1MbkSkhzKvZroFcopJ0BaiE2Hjzs9N79F1EHZb/0m2ZksjC3zIi7x7Y5/mTQw9JFCi9JQMACLqBM/4k=
X-Received: by 10.36.116.5 with SMTP id o5mr2949463itc.132.1508190365817; Mon,
	16 Oct 2017 14:46:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 16 Oct 2017 14:45:45 -0700 (PDT)
In-Reply-To: <1507756545-30087-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1507756545-30087-1-git-send-email-jose.a.lamego@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Oct 2017 22:45:45 +0100
Message-ID: <CAJTo0LaW02YE1dEP+duJPL2g2TprCiNYyNqdPDQ7XiA=b5rdVQ@mail.gmail.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-numpy: upgrade to 1.13.3
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
X-List-Received-Date: Mon, 16 Oct 2017 21:46:05 -0000
Content-Type: multipart/alternative; boundary="001a114a9e5e023f71055bb0efb9"

--001a114a9e5e023f71055bb0efb9
Content-Type: text/plain; charset="UTF-8"

On 11 October 2017 at 22:15, Jose Lamego <jose.a.lamego@linux.intel.com>
wrote:

> -SRC_URI[md5sum] = "6d459e4a24f5035f720dda3c57716a92"
> -SRC_URI[sha256sum] = "de020ec06f1e9ce1115a50161a38bf
> 8d4c2525379900f9cb478cc613a1e7cd93"
> +SRC_URI[md5sum] = "c1d433e5973e548809e80c9118474b73"
> +SRC_URI[sha256sum] = "4c6b4eef790528bebb7ec9590d74cc
> 193868940fe68e4109a91c196df"
>

ERROR: python3-numpy-1.13.3-r0 do_fetch: Fetcher failure for URL: '
https://github.com/numpy/numpy/releases/download/v1.13.3/numpy-1.13.3.tar.gz'.
Checksum mismatch!
File: '/home/ross/Yocto/downloads/numpy-1.13.3.tar.gz' has sha256 checksum
4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df72d8094 when
4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df was expected
If this change is expected (e.g. you have upgraded to a new version without
updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] = "c1d433e5973e548809e80c9118474b73"
SRC_URI[sha256sum] =
"4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df72d8094"

Looks like the copy/paste for the checksum was truncated, no idea how this
built!

I've fixed locally and am build testing now.

Ross

--001a114a9e5e023f71055bb0efb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 October 2017 at 22:15, Jose Lamego <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:jose.a.lamego@linux.intel.com" target=3D"_blank">jos=
e.a.lamego@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_ext=
ra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;borde=
r-left-color:rgb(204,204,204);padding-left:1ex">-SRC_URI[md5sum] =3D &quot;=
<wbr>6d459e4a24f5035f720dda3c57716a<wbr>92&quot;<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>de020ec06f1e9ce1115a50161a38bf<wbr>8d4c2=
525379900f9cb478cc613a1e7<wbr>cd93&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>c1d433e5973e548809e80c9118474b<wbr>73&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>4c6b4eef790528bebb7ec9590d74cc<wbr>19386=
8940fe68e4109a91c196df&quot;<br></blockquote><div><br></div><div>ERROR: pyt=
hon3-numpy-1.13.3-r0 do_fetch: Fetcher failure for URL: &#39;<a href=3D"htt=
ps://github.com/numpy/numpy/releases/download/v1.13.3/numpy-1.13.3.tar.gz">=
https://github.com/numpy/numpy/releases/download/v1.13.3/numpy-1.13.3.tar.g=
z</a>&#39;. Checksum mismatch!</div><div>File: &#39;/home/ross/Yocto/downlo=
ads/numpy-1.13.3.tar.gz&#39; has sha256 checksum 4c6b4eef790528bebb7ec9590d=
74cc193868940fe68e4109a91c196df72d8094 when 4c6b4eef790528bebb7ec9590d74cc1=
93868940fe68e4109a91c196df was expected</div><div>If this change is expecte=
d (e.g. you have upgraded to a new version without updating the checksums) =
then you can use these lines within the recipe:</div><div>SRC_URI[md5sum] =
=3D &quot;c1d433e5973e548809e80c9118474b73&quot;</div><div>SRC_URI[sha256su=
m] =3D &quot;4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df72d80=
94&quot;</div><div><br></div><div>Looks like the copy/paste for the checksu=
m was truncated, no idea how this built!</div><div><br></div><div>I&#39;ve =
fixed locally and am build testing now.</div><div><br></div><div>Ross</div>=
</div></div></div>

--001a114a9e5e023f71055bb0efb9--
