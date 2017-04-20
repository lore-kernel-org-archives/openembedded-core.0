Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id BBD9F773B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 16:48:52 +0000 (UTC)
Received: by mail-yb0-f181.google.com with SMTP id 6so31102621ybq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=ALj9/e7Zl8qM6/hLwhAN1PvGMXmJoTBxDzFR2OD2/e4=;
	b=d05PtMrFO+FwSN0OY55chuhgws2KalcKnQsycDPSCayvEmluelVwWQDRQDnaM8q/a+
	gGwyskkzEs3LcTfQkM2us7QPg3HpQKQhUlJY3vkzhslaxZ039WPV9e3li14WSifonziB
	oFVWrpmjVYOJF1gTmx+GMgvQwkGawRvRstRjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=ALj9/e7Zl8qM6/hLwhAN1PvGMXmJoTBxDzFR2OD2/e4=;
	b=f12gyZOYOzbB31MDxqSheSOjtlZt3RUE8KNeeVkBXT2X4JC0sCmcBNCILjCWRq4jf/
	yrT5QlBY050ezfNvTIQt/GOFuT9nI/YQ1waPlkoD245IRRK7ucjtgQtHQfSgAn3feMpj
	ID/Ke0j+sUFzngxEC6m7oGoP7jBigPVcv7bUYzGXdDdV60c7+wewqPxNn8cavEBfOtMy
	8+6h3peRBSaBEXL9BZNuuf2teF/gYRjmN+hI3Ahu8MhymkDPI/jP6WSxZgiYpUPfBXjA
	u5Y22g0FqVKpt1i/fxpCkdOkA+Kle24kyiSHrnpx3P2QR/TcVBX9HLNE4kIyjn5gmOZ9
	X/fw==
X-Gm-Message-State: AN3rC/6uUtY/sFMbtVe9+VvZd55gx7ZjER0sspxKSI4mb2aJHUztYSI7
	k9ugJoE245buUjKE
X-Received: by 10.98.152.78 with SMTP id q75mr8647831pfd.256.1492706933532;
	Thu, 20 Apr 2017 09:48:53 -0700 (PDT)
Received: from yct-lpt.lan (50-39-165-23.bvtn.or.frontiernet.net.
	[50.39.165.23]) by smtp.gmail.com with ESMTPSA id
	p68sm11536002pga.6.2017.04.20.09.48.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Apr 2017 09:48:52 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Michael Halstead <michael@yoctoproject.org>
References: <4130d91cdc58431bbea8292c7cc30498@XBOX02.axis.com>
	<CAJTo0LbNUuNXdnXw3QRU+LfSfHSNa4PcWPRhe0B2N0RVhH68Xw@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <3f5a2d43-819b-230b-534c-89d304f7f5c8@linuxfoundation.org>
Date: Thu, 20 Apr 2017 09:48:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbNUuNXdnXw3QRU+LfSfHSNa4PcWPRhe0B2N0RVhH68Xw@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building logrotate for older releases is broken
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
X-List-Received-Date: Thu, 20 Apr 2017 16:48:54 -0000
X-Groupsio-MsgNum: 96493
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="OHo0NbKIcTV2Vem1pwGn4LeSriViFrRPJ"

--OHo0NbKIcTV2Vem1pwGn4LeSriViFrRPJ
Content-Type: multipart/mixed; boundary="wKsBqw4TFPl8RfhIAx8KjwFjoqq328Ql6";
 protected-headers="v1"
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Michael Halstead <michael@yoctoproject.org>
Cc: "Richard Purdie (richard.purdie@linuxfoundation.org)"
 <richard.purdie@linuxfoundation.org>, Robert Yang
 <liezhi.yang@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Message-ID: <3f5a2d43-819b-230b-534c-89d304f7f5c8@linuxfoundation.org>
Subject: Re: [OE-core] Building logrotate for older releases is broken
References: <4130d91cdc58431bbea8292c7cc30498@XBOX02.axis.com>
 <CAJTo0LbNUuNXdnXw3QRU+LfSfHSNa4PcWPRhe0B2N0RVhH68Xw@mail.gmail.com>
In-Reply-To: <CAJTo0LbNUuNXdnXw3QRU+LfSfHSNa4PcWPRhe0B2N0RVhH68Xw@mail.gmail.com>

--wKsBqw4TFPl8RfhIAx8KjwFjoqq328Ql6
Content-Type: multipart/alternative;
 boundary="------------2B5CD39FB69E42638810CD9B"
Content-Language: en-US

--------------2B5CD39FB69E42638810CD9B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/20/2017 09:12 AM, Burton, Ross wrote:
>
> On 20 April 2017 at 13:51, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>> wrot=
e:
>
>     The integration of this patch into OE-Core has broken building old
>     releases that rely on fetching the logrotate-3.9.1.tar.gz tar ball
>     with MD5 checksum 4492b145b6d542e4a2f41e77fa199ab0 from the mirror
>     at http://downloads.yoctoproject.org/mirror/sources/
>     <http://downloads.yoctoproject.org/mirror/sources/>. Can you please=

>     change the recipe to not call the downloaded tar ball the same name=

>     as it had in Jethro, Krogoth and Morty (given that the checksums do=

>     not match), and then restore the original tar ball in the mirror?
>
>
> Eek, of course. :(
>
> Staged a revert locally for pyro/master.
>
> Michael, would it be possible to restore this older logrotate tarball
> to the mirror?  We might need donations of a tarball...
>
I've restored "4492b145b6d542e4a2f41e77fa199ab0  logrotate-3.9.1.tar.gz"
on downloads.yoctoproject.org and set it so it can't be overwritten.

Please let me know if anything else is required.

> Ross

--=20
Michael Halstead
Linux Foundation / SysAdmin


--------------2B5CD39FB69E42638810CD9B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    On 04/20/2017 09:12 AM, Burton, Ross wrote:<br>
    <blockquote type=3D"cite"
cite=3D"mid:CAJTo0LbNUuNXdnXw3QRU+LfSfHSNa4PcWPRhe0B2N0RVhH68Xw@mail.gmai=
l.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On 20 April 2017 at 13:51, Peter
            Kjellerstedt <span dir=3D"ltr">&lt;<a
                href=3D"mailto:peter.kjellerstedt@axis.com"
                target=3D"_blank" moz-do-not-send=3D"true">peter.kjellers=
tedt@axis.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=3D":2g2" class=3D"a3s aXjCH m15b8b6ba7bbbf4b1">The
                integration of this patch into OE-Core has broken
                building old<br>
                releases that rely on fetching the
                logrotate-3.9.1.tar.gz tar ball<br>
                with MD5 checksum 4492b145b6d542e4a2f41e77fa199a<wbr>b0
                from the mirror<br>
                at <a
                  href=3D"http://downloads.yoctoproject.org/mirror/source=
s/"
                  rel=3D"noreferrer" target=3D"_blank"
                  moz-do-not-send=3D"true">http://downloads.yoctoproject.=
<wbr>org/mirror/sources/</a>.
                Can you please<br>
                change the recipe to not call the downloaded tar ball
                the same name<br>
                as it had in Jethro, Krogoth and Morty (given that the
                checksums do<br>
                not match), and then restore the original tar ball in
                the mirror?<br>
              </div>
            </blockquote>
          </div>
          <br>
          Eek, of course. :(</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">Staged a revert locally for
          pyro/master.</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">Michael, would it be possible to
          restore this older logrotate tarball to the mirror?=C2=A0 We mi=
ght
          need donations of a tarball...</div>
        <div class=3D"gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    I've restored "4492b145b6d542e4a2f41e77fa199ab0=C2=A0
    logrotate-3.9.1.tar.gz" on downloads.yoctoproject.org and set it so
    it can't be overwritten. <br>
    <br>
    Please let me know if anything else is required.<br>
    <br>
    <blockquote type=3D"cite"
cite=3D"mid:CAJTo0LbNUuNXdnXw3QRU+LfSfHSNa4PcWPRhe0B2N0RVhH68Xw@mail.gmai=
l.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Michael Halstead
Linux Foundation / SysAdmin
</pre>
  </body>
</html>

--------------2B5CD39FB69E42638810CD9B--

--wKsBqw4TFPl8RfhIAx8KjwFjoqq328Ql6--

--OHo0NbKIcTV2Vem1pwGn4LeSriViFrRPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY+OZyAAoJEGpkljW6QlqV0gYP/3zub6J9yV1p1PbmkRzXecqk
IFg1YIXITiqqbQ/RRN3IKrR7vngV/e6SSTYiZLbXc4fY2grTQ0VPNCoOkLNQvIwe
G5XE3kbqZTViUPm8t0WPrrXzJrhGNgEyjhd+oeYKjKzCUYbmehtXlyh1Bd/4b4lr
gaw/JVnaIWU1aUwjLhpe0GBo+ZTJgKnSwgB8ukE1rGRnlP0pM/qj0Wjl2ISzZ5rU
nJ562kjiU79KqeUiwDYZDmHql5nVtThX+wamsc9ldLs36GZWj6GEIy79gTF4eM8A
j5TiiNEerczDaYAt5uSs7hZpP3n1Rg4YVHR9+qIg1nAJnd8kbBlNeaNWmOcZnQL8
vOYPz05m2ujI87y5e0OM+Hd+VFrlK1pgyp+rmDeMBNTVgctJDCxCB8NdArQU1zOY
6+/ulhnIFV5TrasaqIjbut5gYIJ57ltKRzrVQ+gwTVVeZX1wO8I7sv/m/bP3xiKF
nliixM8qRxbyIqdWStzFqFz7KLXMPDvxm6NWHUj6Uwex/+PgSECVqRg7DCJehnSH
Bk2G0yXaLPi1MAhHtNf8yMEm7iVsjmYRuCN2lghCqX3eR+/DN5ZnjsldttGSSH8d
Z9XdNcfn7mYNuXn+ez0Rd4Tw4lQHlhxYh5O5OestySRVvEmcDR8Zx/M+GIEqbaKi
uMjrGnNn+sZWuDeNJdZF
=2Kk1
-----END PGP SIGNATURE-----

--OHo0NbKIcTV2Vem1pwGn4LeSriViFrRPJ--
