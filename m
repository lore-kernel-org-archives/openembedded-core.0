Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6C1785A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:48:00 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id 6so2695621itl.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cRUnXlO98T27PY+MzKFfDwSXuL8D6szutP9dnxs8/CY=;
	b=MwFR7XqiYCmBv9XzbRK3N0+FaEpKr+GarBawLywoVBTsvaGGJguKS+RmX3JQ5lg4im
	7Y6qZdlFkhHxI/l2fBYOcsqQ31my23rBeV8I95GjZg4TWuklRLU3JcRAtNjvtOnx8MOe
	fMMhxbu+m9qXBUa0t6qunYGrSekdQSUaF2fUoBbn32oPg7OtqnAw8605eaXfszXIpC/o
	otsxaro55mvJWRcN/HAkljS23Yvz5Kvzsa5QN0jGQekyO22lHHVOeIuAkHw8g8dL7JdE
	/mJzqZ+IT0vFD48bxJuzyozcmLEcTvCIgxIiY68cTyW9O2R5UuyS1CBn2xRHdCoYcEKP
	Y1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cRUnXlO98T27PY+MzKFfDwSXuL8D6szutP9dnxs8/CY=;
	b=fImi4S+P3wnLBtOpPTOPqHxqGwrNb+lIBUfPYktpfKF2fvafeQFiDGYssIGIY02PDg
	dVYpbivq2RdCNt9SZvrD6b8LpE9wNzTui7ufzziZHCNzSSVpENj+6Se01g36fgG1H5My
	h2EVb/wnkXYH7/lAfuDxumqFtct4pw2+iXkV7q6V1mNBBhDnLhQzonnJrtQigZavqPyc
	aAeiVNwWxX7vJKBxSViqObF9qHl4wIMoLX1cAbFMfyjH2bp/HnHKCJSkOxha/Y1BuOUv
	Yyu0jN6YF+A7vSny8mVdcVg7j3hrtiPDkkcIa9Qwp7csqQ+wEgTvjH9XsqBLB2WgDjDn
	N0IQ==
X-Gm-Message-State: AHPjjUifU1Oq0rAwC68ec998rcEI8SnV1L1+QULWQksM+QtaFoCBmrnV
	ISOWyVZbBxMU94Af47dFPLYJEclUaPo4OjGVvXdDFCDF
X-Google-Smtp-Source: AOwi7QABbu6Ib3C8Cuz16ViVVFE/OX3rac9Fcn2/10bou3PsjRUv8PP7vrZ+czrdY9RMcCLrLjboh291bgwjKluP3VE=
X-Received: by 10.36.181.73 with SMTP id j9mr4478247iti.6.1505476081721; Fri,
	15 Sep 2017 04:48:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 15 Sep 2017 04:47:41 -0700 (PDT)
In-Reply-To: <20170915113408.37844-1-jussi.laako@linux.intel.com>
References: <20170915113408.37844-1-jussi.laako@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Sep 2017 12:47:41 +0100
Message-ID: <CAJTo0LZ7PNfmVSDCB8Bdvc4iFEBbOMHX6QLD0QH9_AwqO-2pog@mail.gmail.com>
To: Jussi Laako <jussi.laako@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libgcrypt: provide libgcrypt-config wrapper around pkg-config
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
X-List-Received-Date: Fri, 15 Sep 2017 11:48:00 -0000
Content-Type: multipart/alternative; boundary="f403045d9e4211ef13055938f75c"

--f403045d9e4211ef13055938f75c
Content-Type: text/plain; charset="UTF-8"

On 15 September 2017 at 12:34, Jussi Laako <jussi.laako@linux.intel.com>
wrote:

>  .../libgcrypt/{libgcrypt_1.8.0.bb => libgcrypt_1.8.1.bb}    | 13
> ++++++-------
>

oe-core is feature frozen, so if you can split this patch into the config
change and then the upgrade we can consider the config for 2.4, leaving the
upgrade for when master opens.

> +           file://libgcrypt-config-wrapper.patch \

You forgot to add this file to the git commit.

-FILES_${PN}-dev += "${bindir}/hmac256"
> +FILES_${PN}-dev += "${bindir}/hmac256 ${bindir}/libgcrypt-config"
>

binconfig class does this for you.

Ross

--f403045d9e4211ef13055938f75c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 15 September 2017 at 12:34, Jussi Laako <span dir=3D"lt=
r">&lt;<a href=3D"mailto:jussi.laako@linux.intel.com" target=3D"_blank">jus=
si.laako@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-=
left-color:rgb(204,204,204);padding-left:1ex">=C2=A0.../libgcrypt/{<a href=
=3D"http://libgcrypt_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">libgcry=
pt_1.8.<wbr>0.bb</a> =3D&gt; <a href=3D"http://libgcrypt_1.8.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">libgcrypt_1.8.1.bb</a>}=C2=A0 =C2=A0 | 13 ++++=
++-------<br></blockquote><div><br></div><div>oe-core is feature frozen, so=
 if you can split this patch into the config change and then the upgrade we=
 can consider the config for 2.4, leaving the upgrade for when master opens=
.</div><div><br></div><div><span style=3D"font-size:12.800000190734863px">&=
gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libgcrypt-config-</spa=
n><wbr style=3D"font-size:12.800000190734863px"><span style=3D"font-size:12=
.800000190734863px">wrapper.patch \</span><br style=3D"font-size:12.8000001=
90734863px"></div><div><span style=3D"font-size:12.800000190734863px"><br><=
/span></div><div><span style=3D"font-size:12.800000190734863px">You forgot =
to add this file to the git commit.</span></div><div><span style=3D"font-si=
ze:12.800000190734863px"><br></span></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex">-FILES_${PN}-dev=
 +=3D &quot;${bindir}/hmac256&quot;<br>
+FILES_${PN}-dev +=3D &quot;${bindir}/hmac256 ${bindir}/libgcrypt-config&qu=
ot;<br></blockquote><div><br></div><div>binconfig class does this for you.=
=C2=A0</div><div><br></div><div>Ross</div></div></div></div>

--f403045d9e4211ef13055938f75c--
