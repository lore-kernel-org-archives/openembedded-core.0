Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 92B7F6069D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 23:47:01 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t25so2496448pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2016 16:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=cTuiVp0AsUV+r4LqI5NTuwsYGEs2BqA33C8wrz0+92E=;
	b=UfGSto5ZakysFDBSW/Skt9F72i2aCGcVrTA9MXu+N0dEhDS1IpDu/F2q68jWiVq1+b
	Zkn86ZuCMRim6vjTjFlJEzMEUOn7WpAr/aGelGxKvnG930CzB8AwNe/Tx4+Q06fBXf2q
	cL89N8M7tEBaV+I/rZNvBHUOVVMMArAzaRADOJDcxOqVrsf4cQUW1EO7oYPWAXuexR4f
	TT674kqaoh+HLirtqFzMp6dxrDJuOOuwOPcmPOYztCVv6DfgfpmH3m0vVjkG4+X+eFIi
	7mxD5EmzJrrKj3K9Sx/1d+tT1SXzLFEutBYM54DRwrGkfEgzcwnmYNI+27pi3SHuMrf3
	85gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=cTuiVp0AsUV+r4LqI5NTuwsYGEs2BqA33C8wrz0+92E=;
	b=X79Z1cnYY4yCNylSEPH75BrgFCtZm+he9T4b6odmCzT8uLl+/rzh+wlK8mYv82QKpw
	OAPRMQyaOl+p4x9RLO6BTzkiK7YH1FyWoqRUlWq0hYJqIAj+dlIfOho/x3JPtGZ4AXkp
	02b7m6fyoB/Ltf+AFnQzb0S6bg5W0fjiRDlQ7mWHu3lRrIzbAYzKewNGm6QTLPMmkW56
	DAfek8ti2d/0fNbpza+9NKQtGpw2czcU5oPtSayxh9gIUxTbv6QvD0DIq1HJGtc47Ozb
	URbbvfLQAKVZXamPEz+NFQRYWFFTQ+YrvsWo7X3yiXOLhvUpFMPIV7N5bZzbTRsGcfBo
	F3lg==
X-Gm-Message-State: AA6/9RlTaZHJIGIz6MjdktbujsQSy8RcptBkbCXM/TsSPgi9TlMnbDmGyfIxQ2gnfZbRQw==
X-Received: by 10.98.88.68 with SMTP id m65mr32742402pfb.58.1475452023699;
	Sun, 02 Oct 2016 16:47:03 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:4b8:204d:45de:e844?
	([2601:646:8882:b8c:4b8:204d:45de:e844])
	by smtp.gmail.com with ESMTPSA id
	tn5sm42477936pac.6.2016.10.02.16.47.02
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 16:47:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1475265162.git.pkj@axis.com>
Date: Sun, 2 Oct 2016 16:46:56 -0700
Message-Id: <BDFF4C48-609C-4318-A6F6-55CE0950A5DC@gmail.com>
References: <cover.1475265162.git.pkj@axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Avoid unnecessary dependency on awk in devtool deploy-target
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
X-List-Received-Date: Sun, 02 Oct 2016 23:47:02 -0000
X-Groupsio-MsgNum: 87778
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0A47100E-8E4E-4D3F-A7B5-072AD923E072";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0A47100E-8E4E-4D3F-A7B5-072AD923E072
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 30, 2016, at 12:53 PM, Peter Kjellerstedt =
<peter.kjellerstedt@axis.com> wrote:
>=20
> After updating to Krogoth, our developers were faced with the
> following error message when using devtool deploy-target:
>=20
> /tmp/devtool_deploy.sh: line 23: awk: not found
>=20
> This is of course due to the fact that we do not have awk installed in
> our products. However, the use of awk in devtool deploy-target is
> completely unnecessary. It is already using sed, and sed is fully
> capable of extracting the information that awk was used for.

sed or awk both are individual packages, some other user may complain =
they don't
have sed installed. it would be good to know if we document this =
dependency for
using devtool.

>=20
> //Peter
>=20
> The following changes since commit =
a75b79a9e9d76db8f75af64c3792c7a1bbfd15b8:
>=20
>  genericx86-64.conf: Add SERIAL_CONSOLES_CHECK =3D "ttyS0" (2016-09-30 =
16:52:22 +0100)
>=20
> are available in the git repository at:
>=20
>  git://git.yoctoproject.org/poky-contrib pkj/devtool-minus-awk
>  =
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dpkj/devtool-min=
us-awk
>=20
> Peter Kjellerstedt (1):
>  devtool: deploy-target: Avoid unnecessary dependency on awk on the
>    target
>=20
> scripts/lib/devtool/deploy.py | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --
> 2.9.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_0A47100E-8E4E-4D3F-A7B5-072AD923E072
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfxnHUACgkQuwUzVZGdMxTlVgCfTOroZ4eyQQsI5RFHd3HAlBWf
ZgQAoIbzOs66ZkjXn9igGWR50/Ceq32O
=vLWj
-----END PGP SIGNATURE-----

--Apple-Mail=_0A47100E-8E4E-4D3F-A7B5-072AD923E072--
