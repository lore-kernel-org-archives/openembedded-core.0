Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id EB0F16FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 22:15:28 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id o66so103305616ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 15:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=11TDTQ5d9zp45IUwG3lVXA9vaGSJHeB1giuh6gFuu4M=;
	b=fUuXybMQGkmFRblt6KOOxF9otggvrfFORu5NwPUxyJh0mKPNZhk96WJv04gdj1aHMj
	Avd1UdnuVpGdpppdp8TWd4arWMYwFbvTMfQhElJJmHP8Qw7Gfyu4OLOXF1b92g9HmhPh
	1tMxnF19mM5UF577FhViecBKIAOYm0L8Csi8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=11TDTQ5d9zp45IUwG3lVXA9vaGSJHeB1giuh6gFuu4M=;
	b=M5JG29W8Vvt+X2jdR7Z/63V7suL/uk7nKeqOF646CfGpvvr4PwIQoW19JB1Q7jpk5B
	WZVFpyYFpgmGOIdQdkZoDcyCQnPvxe7KTN0gsXtlMdTd858PhUzmeph+KpG7DLgNjw2N
	iOXC5vDocL+lA+3bnCtrI7NCuK9R3HA1cODC6fvC33TDCBzXXbY5Cd5vr67lNMSIRCXE
	WzTTB6aumhUKU0N8mfsgYvP9tkLSy2s1eO/E0rLFMIhtqKH75b6nasB/pv5smBUNssv9
	15tpH7KXGL+Qw1G2y2xWytn1pGQj5M5zwa/ir5Knl3KquzeMhslcpUs6NE865WpG70M1
	ifYA==
X-Gm-Message-State: AOPr4FVcKrXoOK2zohhfqJip9r5Wd+PQgDv2IbEdA82F86DBKstA4oPXGn6twqmeo/UQjQ==
X-Received: by 10.37.97.73 with SMTP id v70mr6329459ybb.39.1461795329161;
	Wed, 27 Apr 2016 15:15:29 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:a8f1:8916:9925:ea71])
	by smtp.gmail.com with ESMTPSA id
	p17sm3064945ywp.45.2016.04.27.15.15.27
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 15:15:27 -0700 (PDT)
Date: Wed, 27 Apr 2016 18:15:25 -0400
From: Tom Rini <trini@konsulko.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160427221525.GB19598@bill-the-cat>
References: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461766856-27881-2-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461766856-27881-2-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/4] u-boot: basic support of dtb append for verified boot
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
X-List-Received-Date: Wed, 27 Apr 2016 22:15:34 -0000
X-Groupsio-MsgNum: 81331
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 04:20:53PM +0200, Yannick Gicquel wrote:

> This introduces a new uboot-sign.class to support U-Boot verified boot.
>=20
> This part delivers the new class file, with related environment variables=
, and
> a new task intended to run before do_install task and which performs the
> concatenation of the u-boot-nodtb.bin and the device tree blob. The 'cat'
> command used overrides the u-boot.bin in both DEPLOYDIR & build dir to
> propagate the changes in later tasks (do_install, do_package, etc.)
>=20
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXITn9AAoJEIf59jXTHXZSEBAP/3fhImE4t5FrVAko0ONipkqm
wWn+iNBZHpSxsGUHDtQNCNJ8SCN1PtokEOhVbhVNQR61Q5cXxD52dVlMdH86Uy3H
YAude6yM6W8QrdtVkdJAu5+CxhTxZJdrffbSHNhDoDb3svPlQ2WhhHQzVeSB8cOu
ljdUSRIYfu4ZBzD01ant5baVROXlqBotUgkqFYcoMcll600BX3dL128C2SOorZE1
m4UPA4vijjWsLnOYqaM09+NGEd9EMcfZT0aQwJ+vQ3/cMYd03yBws7+G91o1vxli
s1yGiVQctzWKOAqfJT5/XHFYH7YZrqcXQEWq5Y0PdSGbEhmVIyHEoUyfA1Kr2v9R
jeyEYpaQJYOZKzqBSqFz7DeyRU0G7o7j5Os0H5iurKSJ815E/8nYZqt6o4WEnyPJ
CC9uCZFwlU1A8P/cfisbDQ/Y7ldr6CACzKRHiuL9BgsIZ0BevP/ESkAZLrbGSPzo
dJ+vtWO/wv3ASV97nxx8up67O0uDfP2psOyFO/bMqAXwgAvVZZ1lDfRJiZbGSEXz
3rMqRSwEuRcYJiq/E5CHoL1R2XKL1DUmMLThCpkv9+nzvVr96WxXuoITKYSrGSif
SWvT5Nebj1NaPnqG5JhmLifX0pJKO3b07duZKjFvtSAXuC+n1CkpYIIB3BO5YD/L
jGblykul4fi35gcpS4NG
=Jmoy
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
