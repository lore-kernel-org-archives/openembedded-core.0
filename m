Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id E5D01601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:00:22 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so114151428igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 02:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PLf/13kLqajs7/dGGn1eOFHO0e2plBuzmopclnNo4eQ=;
	b=fUTLDCsyG0yhoJlRFZc3jOIOKSmWh6eHuzSicr4IJOWT2YudTsCXxqu3vRAKI0u+8V
	aaIBEIfnSwbyS31KhotLgwB4S+yQ/No/ykOu1GOEnbfZ4uo3vk5Tvmnmyx2rMzGvVXHk
	8dQdHXYROAMA2LRV2WpeIWsydwD5zPbAnAcxzBBy950YxZF6GaH6yWvyAgxDOgC53Np1
	2sxIRKfTO7qrjv7+O6F4NQ69zmxznMZPMCgJ+QioyNrn2t6RCjhukAjElHE/enhZak+d
	vbwTxTelIMRwIXj08d8qYM7fnAif6wlyoSWRLcAMExKuPZT6G5PprN2DzSS87gqZ76gx
	DwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PLf/13kLqajs7/dGGn1eOFHO0e2plBuzmopclnNo4eQ=;
	b=Y8iiUCRSpEbsS4YhYr0jrgP9wgIsA6IeGgLaoVouV/hgTgA0T3M9ESlJ+jNfGLVGMy
	DG2+v/Uyrx3GSykxtRc+nyJiYqGPoVTw5or/wa6ptoZ1ttEWMYPJPpWHFlsGJA2k1t7s
	NJ7kB4zjuc/9xFEcpL2zEm6z3b4oLfF+UnyueIhVteHK+fKFD/PCJlTqeDgQw14TSGyK
	r7Y/Kd3jDiTqZkTGVlPg+1jWfdR+Fkg0iH7rNkz5esYkHHgWC2FB2rwIQRN+P0u2lvNM
	vVfWXEa1hKs/7n1R22OPgqw8aaR3b7iXXPXzF3vBxVoSF63NIZPQu31+UgMOpgScgsBf
	zmGg==
X-Gm-Message-State: ALoCoQmSDjjJOXCQ+hboClEDjrwWaXstIuW9YVMLMxzaPTyeaosy9fL3GipgyzQ3jx0j4uQ8SCcA
X-Received: by 10.50.28.102 with SMTP id a6mr1244479igh.52.1449050423440; Wed,
	02 Dec 2015 02:00:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 02:00:04 -0800 (PST)
In-Reply-To: <1449049883-22195-1-git-send-email-fabrice.coulon@axis.com>
References: <1449049883-22195-1-git-send-email-fabrice.coulon@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 10:00:04 +0000
Message-ID: <CAJTo0LYQiNigDYA=wGf2rgJ4_0rSh7d8GdAmzSiuujqOErKf6Q@mail.gmail.com>
To: Fabrice Coulon <fabrice.coulon@axis.com>
Cc: Fabrice Coulon <fabrice@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Convert tests and valgrind config opts to PACKAGECONFIGs
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
X-List-Received-Date: Wed, 02 Dec 2015 10:00:23 -0000
Content-Type: multipart/alternative; boundary=089e01538710c0440a0525e75777

--089e01538710c0440a0525e75777
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 09:51, Fabrice Coulon <fabrice.coulon@axis.com> wrote:

> +PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind"
>

Don't you want to have a build-dependency on Valgrind here?

Ross

--089e01538710c0440a0525e75777
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 09:51, Fabrice Coulon <span dir=3D"ltr">&lt;<a href=
=3D"mailto:fabrice.coulon@axis.com" target=3D"_blank">fabrice.coulon@axis.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3p5"=
 class=3D"a3s" style=3D"overflow:hidden">+PACKAGECONFIG[valgrind] =3D &quot=
;--enable-valgrind,--disable-valgrind&quot;<br></div></blockquote></div><br=
></div><div class=3D"gmail_extra">Don&#39;t you want to have a build-depend=
ency on Valgrind here?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--089e01538710c0440a0525e75777--
