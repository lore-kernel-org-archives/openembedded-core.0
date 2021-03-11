Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.7025.1615473470214295759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 06:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d6jFfxdL;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id e10so2107691wro.12
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 06:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:in-reply-to:references:mime-version
         :date:user-agent;
        bh=z4k5bM+frGl93YzMaA3EorX1Raah0Mz76UEnX6I0Wqk=;
        b=d6jFfxdLcu0TF4gshBGeAXGS45CX8yC9R6g20Ma+abxZSuaNwo0ubWKczfSREAkcoR
         VycRZXhHujXmUxHo1PY9xe2+dGLHduPsOZbcIVLh6BJNZlDti9oPUJVweArQT6md1S2i
         8+OjIrEbQq4IIXsNvTReMu5YWbu647zTo6wfCE5i7FCYSbEG50cRJFBOaGCex9uP53Gk
         71Q454X36puNcoO6seFqLXzoDcHUeAkZDj6JHOmjXt1mn/L8emGmq1jmyiz4aRD42fB/
         kXB9x0UeNliZQXZXsL6d5kgDl8cD504r8CFrpy2t4qakR2ivZA53Suc42nmh1aZqwqxM
         lJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:in-reply-to
         :references:mime-version:date:user-agent;
        bh=z4k5bM+frGl93YzMaA3EorX1Raah0Mz76UEnX6I0Wqk=;
        b=P2EIJxEwR+eNzErK0ABLMxM1mZqG8o220FZncAGbQKdCOC7Vyuy92uBtGOMjuOPrpr
         YmtzLSEr8ut/yztc3DEPnwV45hyPpaGQL5HRmkjhfgafKgD5kTGtemKHIPfHHQkMsLrC
         UiKiw4ys+OVr0BJ7wO9L+ke6ScjMGswfSJS9TrgcPTXgUsN70jBIc7MKnQub4uz4zPkM
         DCWyf+hvmhvAi3KqA6j02Op0RhT4PylgHuQaF9lknk2RU7oCf1CMwO9DMd48JRTz+xBj
         2M9G5EDP0RsVN/2+6cloqEszMGlvRCqCKUJtsNcB50jlFHJG15wvmIb/DGIsVqbpWTjZ
         YhgA==
X-Gm-Message-State: AOAM531AMn+gi7QX60+bcqPftOLGnJRn2WXF/msAyYsbJOcM9zme3YC5
	Epft1ZsKEBOKGuYbItAY3b4=
X-Google-Smtp-Source: ABdhPJxin1NZ7uyfHHkmXgV1OcClfhwJEay/5FOnV67lks9rAVFayjGol2VJxlZ2eAtZ5Avy6vYX3A==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr8907044wrv.186.1615473468756;
        Thu, 11 Mar 2021 06:37:48 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id u3sm3903671wrt.82.2021.03.11.06.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 06:37:47 -0800 (PST)
Message-ID: <ba3011b9f5cc6938e96b10d21a0b5510880e6f38.camel@gmail.com>
Subject: Re: [PATCH v9] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org, Kory Maincent
 <kory.maincent@bootlin.com>
In-Reply-To: <bf29e1132e8959b1e9b22f8131f0785f0200f0f5.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210309135606.508593-1-luca.boccassi@gmail.com>
	 <681b7ba8baca230a2b95f5c1fc40e1b5108e9a70.camel@linuxfoundation.org>
	 <539920c0108d13a48eb63650be96c97435c11dca.camel@gmail.com>
	 <291a86bde929406603821b08b1fe36cfecf19103.camel@gmail.com>
	 <bf29e1132e8959b1e9b22f8131f0785f0200f0f5.camel@linuxfoundation.org>
MIME-Version: 1.0
Date: Thu, 11 Mar 2021 14:37:40 +0000
User-Agent: Evolution 3.30.5-1.2 
X-Groupsio-MsgNum: 149287
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-N1DOrLteozgwgnBWF+sV"

--=-N1DOrLteozgwgnBWF+sV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-03-11 at 10:31 +0000, Richard Purdie wrote:
> On Thu, 2021-03-11 at 10:15 +0000, Luca Boccassi wrote:
> > On Wed, 2021-03-10 at 18:28 +0000, Luca Boccassi wrote:
> > > On Tue, 2021-03-09 at 23:43 +0000, Richard Purdie wrote:
> > >=20
> > >=20
> > > No problem at all, it's absolutely fine to postpone, I am in no
> > > immediate rush as I have local backports in use. As long as we get
> > > things sorted at some point it's all good for me, so please don't del=
ay
> > > other patches because of this.
> > >=20
> > > > I'm a little unclear if debian renaming was allowed before the spli=
t and if
> > > > so, why it is disabled in the split version. I suspect there is a m=
issing
> > > > MLPREFIX somewhere causing the multilib issue too.
> > >=20
> > > I do not remember why the DEBIAN_NOAUTONAME was added at this point.
> > > I'll try to send a new version tomorrow.
> >=20
> > So without DEBIAN_NOAUTONAME these are the package names:
> >=20
> > libuuid1-2.36.2-r0.core2_64.rpm
> > libuuid-dbg-2.36.2-r0.core2_64.rpm
> > libuuid-dev-2.36.2-r0.core2_64.rpm
> > util-linux-uuid-src-2.36.2-r0.core2_64.rpm
> >=20
> > that's going to be a problem as they don't match anymore, right? Since
> > they used to be util-linux-libuuid, etc. Although the poky image build
> > completed just fine...
>=20
> The above looks fine, they don't have to match. I think this would match=
=20
> what happens to the package before your patch too although I've not=20
> checked.
>=20

Ok, sent v10.

The other issue was a missing rm -f ${D}/lib64/libuuid* - is there a
better way to handle all of this than this line? ${libdir} doesn't seem
to match in some cases so I have to manually specify lib/libx32/lib64,
is there a better variable to use?

do_install_append () {
	rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir=
}/libuuid* ${D}/lib/libuuid* ${D}/libx32/libuuid* ${D}/lib64/libuuid*
}

--=20
Kind regards,
Luca Boccassi

--=-N1DOrLteozgwgnBWF+sV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBKKw8ACgkQSylmgFB4
UWIUaQf/f9YI3B6Sf+PiFPn4M4OwMVPy1kLhm/ggm0MNTQZa9PD3e6cafwmG8TH/
HiRt8FxMRWk/y8jo1ogptuYKhNKO4mPkRbGSGtBAOshjxGDQiYGlGQwQ5uWWetrr
akMHjLlh2JthO8HmbuwWwTbR08NdzXLkyWRUI0cH+2xuAZJL9WMGWyulsK4OKQjC
iPYISUbxzHzr1nOnOSZG3B/Fvob0sEL6ZeNAgTd7vl4VyWtVZajwaK+U3xrHMJnB
/fERsvsQC5C0yYtdH215PB92iNM11Bo45j0V6zQhSN5kqcPigdS0sc4EGJD3t7ML
mh1ypONXvDj4DvuKopNjiBuO5mm5VA==
=EXuO
-----END PGP SIGNATURE-----

--=-N1DOrLteozgwgnBWF+sV--
