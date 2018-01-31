Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6D15678548
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:40:23 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id x190so8158734ywd.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HqJAUIGgHYcRZ6jBXbudjBZ6qFE/tU0mpYT6THOG/QE=;
	b=lAS60QPL/EEKmLNyz0kfEYqAG4EeeBksfPEzeE3H5JaPQTYEKlOMEN462kdsup4fws
	A9baIkmb61R8OioCMqIaqcXEqs6T/fq6bu+66oGveWv3SZLGdtCx/PDZk4pa5jw7F33e
	PPHtM3cdsRqJeF/PUSgX0kgZQcssUFyoyU1h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HqJAUIGgHYcRZ6jBXbudjBZ6qFE/tU0mpYT6THOG/QE=;
	b=XmWZ8nmUD6gf7uaQ5ZQ60NEzt5JyG3obyJ6UMHQEHqjfHe2aQVFoschGUvmS9rC2j9
	84VnpUZZuM070vxCJZhg5evQY5OttprWrsWIruHZj7Iy1AS3Yfnc3if9fe6q9V4WSJ2J
	svTCxq3oultTwupu8+x0kEgPqKuDQXWrigcIx1LdVYllO7QPSJ8rJiF1LjMMD/gJ+/8g
	a+9tieR9yEkm1Hy6RjuGaMBFV3JmBHWXS418fM6FpXKB4ogynKBeU87oSTb84RuCZK49
	GEx/CrC35XOzNNXSDrRssSi88S67iBKWY6etFo8PlY7+Azm6KSYgL6/zAJ3egn537tNF
	i5Vw==
X-Gm-Message-State: AKwxyteDHPglCz+rnQrPqdG0zfhkSQ1TGB9WOfR9INSmS2lL46A3DXXw
	4Zn7a8Y830KO5Z11nBXXz0wVSTSKlBE=
X-Google-Smtp-Source: AH8x227SYkXzQT2zOBE+9lIBGel+w//5q3kd++KrLMtjpbFx2m3HWnG7NkT8LRE/gYDfjbPf/OVTcA==
X-Received: by 10.13.236.206 with SMTP id v197mr22674158ywe.492.1517420424252; 
	Wed, 31 Jan 2018 09:40:24 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	i5sm6436705ywi.70.2018.01.31.09.40.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 09:40:23 -0800 (PST)
Date: Wed, 31 Jan 2018 12:40:20 -0500
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180131174020.GA6711@bill-the-cat>
References: <1517420277-6542-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1517420277-6542-1-git-send-email-trini@konsulko.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] security_flags.inc: Use SECURITY_X_LDFLAGS
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
X-List-Received-Date: Wed, 31 Jan 2018 17:40:23 -0000
X-Groupsio-MsgNum: 107644
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2018 at 12:37:57PM -0500, Tom Rini wrote:

> We need to ensure that all xorg modules are linked with
> SECURITY_X_LDFLAGS to ensure that they will be able to resolve their run
> time dependencies.  Replace the incomplete list here with globs for both
> video and input modules.
>=20
> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> I admit that I'm not sure if this, or an explicit list of all of the
> modules in both oe-core (we are missing some today) and
> meta-openembedded (or per-recipe updates there) would be best.  I'm
> starting with a patch that does a glob as that will cover what we have
> today as well as in the future.
> ---
>  meta/conf/distro/include/security_flags.inc | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

D'oh, disregard this version, I'll post a v2 that actually works, oops,
sigh...

--=20
Tom

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJacf+EAAoJEIf59jXTHXZSGncP/2eVnY2HbPoUb33iK9E6vv/o
24/1KfwsWsRQAMTS7c/ZGgingyl1gKdpnZjGo2GrMFdW6bt5UtfnyoIVEsIPxKHh
MPXNL+JrvhVKEdeWnfQMKVU2OEZPbPD+KOQy3nTnuDHd5WZdQWyz6xTuHw0DUgJL
cdmU6t1mZyumFnJGLy1JbyttQfpBhsrEi7cCVBurOtPojUVE8nwjbwoiVF5Ztmui
5S0uBUc4MohpwFXincPmFlo+uhHOYpZUszKA/KNFrzgf/+syAFXf+HX/QTvPvnme
iErnVw6mwzZnBScHlqoKQYGWghz5p2bJR0EOCP+vf43HzraGFWKSjSLuxBy2qJEB
563kY+h0KihrIks4hloaqOYFYcAoy776F9nfVh2yvxMPhFLUl1ahC8ZZsIbrYQaM
QTDElfQ3R3puSzKo4qVdSTRl0tqXkpFRzIeddIFDl+ENkIE9AeCykSJoPZk6Hbf+
tqtppmblnfIqgEqvVRe0/wPkj+gyzDZGKs/DXKlAuYlIKfAdtcYBAdEQ5P7W+yrZ
6NrGQpeuGC0pxhkhaemlQGq0NTMbOnxGX4FY7sT2AXn4e4Mz8eOP85s0yVuaFVQc
cQgeuyD8JMRq+AqQtwHpBi0fhpYOdUiYq+wXDnaV1WdLAT4jp/b1L53VKvidYB3a
QHyj3Lcjl/tQWhFhastJ
=Fk8x
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
