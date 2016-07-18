Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1B82060797;
	Mon, 18 Jul 2016 23:27:39 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id p64so647452pfb.1;
	Mon, 18 Jul 2016 16:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=rnA0KY86zRx/HbT9W4Zwyp438fsxhmqM1b0ye338/VU=;
	b=KrLxhNgdFP8w/ToX7sXT49gkckNQZ8ZOATQ3t37sbewkpSPlkhrqPF21xm8sJ6OWf4
	oqb67FiZGv3xKBp2oN5iiyXLPVmhNAMz+PQJpBfUqLfoBckerljO7HyD8HtxUBXH9MxE
	egsANjJ47K6yJOXi53EqQvAB6haHKiU/DjpQnnYP+QW2YT2xwOuYGfYe3X5efWX0ftGC
	M17T7HzF5f6xuOHPxwXtE9oUltX5zLYT40b8g2x1Q2J38x6ztCqD13WZWODajT1FrOOI
	q5cgLwAeRC8XUbXKwymAtC10sTskwiyLs7jYlaTfqnhNQZR4YBRAKBQLuF/cXHg0H1a2
	7xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=rnA0KY86zRx/HbT9W4Zwyp438fsxhmqM1b0ye338/VU=;
	b=On+E1RkXkOK+pU304L3VQfGIVKUDOeWTSKy05xNq1AmXzjeEb1tSBecznnCTxdnTfx
	kwTkUdFE87ttHJVTUuoW/t2xUHDLDVZP6kMe721tUKiY31rpKzaDFH2gWERouw44GpKu
	Cy//EZXrz3zRKaw/v0iaaPOUm5j/BydqrzhX6b5pEx1CfHbRLvBilmN3nHVMAFSp8uXa
	em+mzWtPlcs8VaL1Zxpp3i7OhXeT9mJk1bu37o+M2P7O61EEQlumwLgOSHasusGzxTB0
	uYhwH1BdN53lZWN7KjC82hlQCqqlugjWBntLftrlHVvEtjSOyW6EZNL0YfMhc7l3p8ds
	VKbw==
X-Gm-Message-State: ALyK8tK1badYzp5XFGgE2Y3iMJpwp7YPRpi4kCuE7v9ZvcV32bPl/w5g07scdWv9BX4q4w==
X-Received: by 10.98.49.133 with SMTP id x127mr49645286pfx.90.1468884460568;
	Mon, 18 Jul 2016 16:27:40 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:2dca:f3e2:ce03:4e42?
	([2601:646:8882:b8c:2dca:f3e2:ce03:4e42])
	by smtp.gmail.com with ESMTPSA id l82sm7432829pfk.8.2016.07.18.16.27.39
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jul 2016 16:27:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADkTA4OMij4vsjGfw9Vwjh3ymGYkJDUsAKou6=hU7f0Yt05FXA@mail.gmail.com>
Date: Mon, 18 Jul 2016 16:27:31 -0700
Message-Id: <FD626B02-4D25-4358-8983-298FD08E6240@gmail.com>
References: <CAJTo0LYNjoPfahXjaKEVP6ey=mY3MKDKK5DoCPB9Dp151UgFpw@mail.gmail.com>
	<1468880306.2228.69.camel@pbcl.net>
	<CADkTA4OMij4vsjGfw9Vwjh3ymGYkJDUsAKou6=hU7f0Yt05FXA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Removal of uclibc from oe-core?
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
X-List-Received-Date: Mon, 18 Jul 2016 23:27:40 -0000
X-Groupsio-MsgNum: 84659
Content-Type: multipart/signed;
	boundary="Apple-Mail=_624F99E3-A077-458D-92F8-F60EFC42C8EE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_624F99E3-A077-458D-92F8-F60EFC42C8EE
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_533A9CAB-D380-451D-ACBE-A5D9A7F21B14"

--Apple-Mail=_533A9CAB-D380-451D-ACBE-A5D9A7F21B14
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 18, 2016, at 3:48 PM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
>=20
>=20
>=20
> On Mon, Jul 18, 2016 at 6:18 PM, Phil Blundell <pb@pbcl.net =
<mailto:pb@pbcl.net>> wrote:
> On Mon, 2016-07-18 at 23:01 +0100, Burton, Ross wrote:
>=20
> > Now that musl is fairly mature I think it's time to take uclibc out =
to
> > pasture, where the pasture is possibly called meta-uclibc.
>=20
> I think this is a splendid idea.
>=20
> Agreed.
>=20
> But do we need a sharpened stake to make sure it doesn't come back ?

I think its just about time. Given the health of uclibc project and =
maintenance burden we impose on OE-Core, if someone
needs to have it beyond 2.1, please step up and we can create a new =
layer mnta-uclibc and it can be hosted there. but it
certainly should go out of OE-Core.

>=20
> Bruce
>=20
>=20
> p.
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_533A9CAB-D380-451D-ACBE-A5D9A7F21B14
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Jul 18, 2016, at 3:48 PM, Bruce Ashfield &lt;<a href="mailto:bruce.ashfield@gmail.com" class="">bruce.ashfield@gmail.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><br class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On Mon, Jul 18, 2016 at 6:18 PM, Phil Blundell <span dir="ltr" class="">&lt;<a href="mailto:pb@pbcl.net" target="_blank" class="">pb@pbcl.net</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class="">On Mon, 2016-07-18 at 23:01 +0100, Burton, Ross wrote:<br class="">
<br class="">
&gt; Now that musl is fairly mature I think it's time to take uclibc out to<br class="">
&gt; pasture, where the pasture is possibly called meta-uclibc.<br class="">
<br class="">
</span>I think this is a splendid idea.<br class=""></blockquote><div class=""><br class=""></div><div class="">Agreed.</div><div class=""><br class=""></div><div class="">But do we need a sharpened stake to make sure it doesn't come back ?</div></div></div></div></div></blockquote><div><br class=""></div><div>I think its just about time. Given the health of uclibc project and maintenance burden we impose on OE-Core, if someone</div><div>needs to have it beyond 2.1, please step up and we can create a new layer mnta-uclibc and it can be hosted there. but it</div><div>certainly should go out of OE-Core.&nbsp;</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra"><div class="gmail_quote"><div class=""><br class=""></div><div class="">Bruce</div><div class="">&nbsp;</div><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class="HOEnZb"><font color="#888888" class=""><br class="">
p.<br class="">
<br class="">
<br class="">
<br class="">
--<br class="">
_______________________________________________<br class="">
Openembedded-core mailing list<br class="">
<a href="mailto:Openembedded-core@lists.openembedded.org" class="">Openembedded-core@lists.openembedded.org</a><br class="">
<a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core" rel="noreferrer" target="_blank" class="">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br class="">
</font></span></blockquote></div><br class=""><br clear="all" class=""><div class=""><br class=""></div>-- <br class=""><div class="gmail_signature" data-smartmail="gmail_signature">"Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"</div>
</div></div>
-- <br class="">_______________________________________________<br class="">Openembedded-core mailing list<br class=""><a href="mailto:Openembedded-core@lists.openembedded.org" class="">Openembedded-core@lists.openembedded.org</a><br class="">http://lists.openembedded.org/mailman/listinfo/openembedded-core<br class=""></div></blockquote></div><br class=""></body></html>

--Apple-Mail=_533A9CAB-D380-451D-ACBE-A5D9A7F21B14--

--Apple-Mail=_624F99E3-A077-458D-92F8-F60EFC42C8EE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleNZekACgkQuwUzVZGdMxQ4DACgkFWhJ6aB5e/B8TNmP0wXmiaF
4A8AnAqSHd9GaV57mKt5s36QWQ5OaRHs
=aSta
-----END PGP SIGNATURE-----

--Apple-Mail=_624F99E3-A077-458D-92F8-F60EFC42C8EE--
