Return-Path: <trini@konsulko.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id D798675EE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:08:53 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so117125633qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 05:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/UK+TRCXHf4LJKUVrRV+gJwv4UxR/xfHDG2oxjrru/Y=;
	b=PZMQ8ujCRclvf7+QJ57hzbtAUUfVBHWR7puHfkPmuiZ+h265BfWXTPx4V/WGvNRf0o
	JsKX9qD2w5nh2nouo/f0S0ao6EFb92Wm4NDmlVJtB8ZO33eRJ2m7YP80eBE+nO6H/SOx
	9KxEKfDT/uwDvESS+nVDEi32sADoyq43hKvuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=/UK+TRCXHf4LJKUVrRV+gJwv4UxR/xfHDG2oxjrru/Y=;
	b=jrBbTPaI7XOQ1JiRbkwip3tJvxw5rYl+GePUDe3G7zqxs7Ub/FZUD4vEPmh1vWaBcA
	arvcPgwhaTF4UidEr7USERm2y4RN+dAakhD+7mr9AANIXmHyUYmJ/UlZ05ka0UVvv2Iz
	Lq+Gj04jKR45bmvTxhxnjRtwGs13tegz+5MID9IQxFMghkDuBEB+RZLGerDDIqKJToCG
	ivGzBxM3OYrlIdvgZegAzRNy1qHEt2Xs0454U50rxeQ5dlc3zYuUYCNDUVgILSIniSgk
	wEQ8akxA6TJeLDp47jTwzmI/0P5Ba7XOMdimy98+ti+uzsgQ59BcO/NkZdTFZorjpiMO
	xkog==
X-Gm-Message-State: ALoCoQnBZLYOpVY8Xu104MA0maStH7R3yi4qOiQzuGhEAqau4/gEUjJcRh0lsb08EPOsa+s0M+U8
X-Received: by 10.140.30.101 with SMTP id c92mr3955288qgc.74.1447160933472;
	Tue, 10 Nov 2015 05:08:53 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-230-22.ec.res.rr.com. [75.180.230.22])
	by smtp.gmail.com with ESMTPSA id
	74sm1238953qha.41.2015.11.10.05.08.52
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 10 Nov 2015 05:08:52 -0800 (PST)
Date: Tue, 10 Nov 2015 08:09:35 -0500
From: Tom Rini <trini@konsulko.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20151110130935.GU8499@bill-the-cat>
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
	<563B56B6.6070307@pseudoterminal.org>
	<CAP9ODKrhSmSsx1aSY0oyoqYeV8zHm_NVtp3mH=4X8zX-BEmL3w@mail.gmail.com>
	<563B6674.1030106@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <563B6674.1030106@pseudoterminal.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 10 Nov 2015 13:08:55 -0000
X-Groupsio-MsgNum: 73163
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GAvX+JaMaI2IseJS"
Content-Disposition: inline

--GAvX+JaMaI2IseJS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2015 at 03:23:48PM +0100, Carlos Rafael Giani wrote:
> On 11/05/2015 03:22 PM, Otavio Salvador wrote:
> >Hello Carlos,
> >
> >On Thu, Nov 5, 2015 at 11:16 AM, Carlos Rafael Giani
> ><dv@pseudoterminal.org> wrote:
> >>So, this is because of the TOOLCHAIN_OPTIONS ?
> >>Also, what about the ${CC} ? Right now it won't work properly with clan=
g for
> >>example.
> >The clang is problem might involve us to rework something but all this
> >needs to be based on last U-Boot releases; we shouldn't put
> >workarounds and hacks on OE-Core without good reasons.
> >
> >Has the clang been tested with 2015.10?
>=20
> Still, then I'd add something to output an error message like
> "U-Boot can only be compiled with gcc". Right now, the error
> messages that would occur would be highly confusing and misleading.

U-Boot supports clang, but it's not as well tested as other things.
However, this patch is still wrong as we do not want to try and force
flags to gcc, just like we don't with the kernel.  For more on U-Boot,
see doc/README.clang (And then possibly do some fixups, I'm not having
super luck with it right now, but I'm in a bit of a rush right now).

--=20
Tom

--GAvX+JaMaI2IseJS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJWQeyOAAoJEIRElH1W1v7Nzt4P/Ro1lG949wz4v7eq2V9o4d5r
MYEuznWXBPDLTP+LO3knoL3Ed2VOYP7hdnVYU1IRtcMROooZeQzWMZhVR96MAGOR
nIJFJWX6R9Xh0tRye/bZ+rZX+fjNhQI1nmFV7hkMCRru75DYkX9bAzlNN6kSA+yC
2M26TxeaKzlFP/9I4ZBCiagDUCOazn9E0ni+SZLvCRi5PdlYLNVmnW4dODAManrV
R17sR0KAXc3IndkZkJ/h7mR4goP2cnspLOvwpnzZ7uZ43UX+Sg2shJQJQyoz/+ac
R7LASvuyhBHKsP0CNPYDzykFrCqpDV5Ht6X3zdJfYtVAuzW0WNn/4sHfxJclpPv+
EnVzLyLRTpQGCHv5tS1tz1dHQiB0xjxrfTLJkqqYEXmFsiSHZm1HL6KNMxhbZjSI
67rlLMnkI/kfF0pyC9wIRf3J/ULq93tr4AFWpo5b3jaqak+MYG3C8iPZ8PqtM5tk
7pCuMsw8g5vvXmLGrPovfeNRRHjCrirRTScLxdJYSfbdtjPTiLcO51Sp/3Hydezd
Uq9oEmy2HI7Z2uAUejZb+lUKRcWtGIX8LirTCAl+hodbDG+cg8Fc2bg+I6veu7JK
BrC5E7q5Pv6MyRnXwaEFIaI+6+pOmcRNpghCYXq2PCWnSuvZlTyWRORSxdTxcb6b
xRPUogualja4fW8X5tWA
=LIdm
-----END PGP SIGNATURE-----

--GAvX+JaMaI2IseJS--
