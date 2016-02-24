Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D551260125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:15:48 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id b205so34031042wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fYS5JsRcfTclD8wi6EB4+fT/egn8+jRv67kQZupb1mM=;
	b=PfFXtdA4s4UoqsH9ARKYgfCwOwidyfYsZX28wV1w0ALqDQw+icTAmn2McK2Eyuw6aT
	KqgRVZnj6Td5gpi0sHIMacWTOjR3EKe2S0a5lNjR6SjcIg8J7km1hsNMbSrmbllq+ENL
	NefnFN0lJ7WdmhU1cCbYW1cCwEy7X/0Vum7AaqPCt8OXdSv49Pp2Eq2o4ntEjk4hkGYD
	hmCZ6Y5UBs/sdCAD7C6bK+O57qleAQmfD0pZUdlQIrNFxeJhd658Evtqcnc47rmSJxVI
	ErG/9Hzzu8SOUs8CcbvB+LrbhIP5raw9m0KUy5nUNELtMXTizNGudw4/Drl4kYznsLrT
	Mjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=fYS5JsRcfTclD8wi6EB4+fT/egn8+jRv67kQZupb1mM=;
	b=MDI6DVdXsiXR3FgcpTZ7R4+l/P2cqXbYIOnJU356sQAiwybJDjR+pdYmiaw4Vl2z9a
	y1RSSR6+VEgdsw1huJqg+rKW8sIXB/u4JyItCeSXTqho7imRBPbeWLM4zQKfO/030enE
	GChfOa92Z9Tm1FPzzF8zjPjcDkfN69dsyWWyZkDJ0RFZqlC1x1l6iKS4yaAZggycnO22
	64DBk6ACiASJecHh9xaj7I/q0Xky+Oa4FAMIneIDlrhvkcfnmtKrBe1ID0z4i4ifvO0v
	4LVX2H8n0yfWe7PtxK/XxqCS483SN0oEDRi0tr8FYARaAmU7vekQVdgKurzVr+7h4S58
	LYaw==
X-Gm-Message-State: AG10YOR7JlEKhZUUG7E/5tnPwmPffBe4U5rL0mVMCVPKh4EzQtbbF87EwkKK9DNdlGrNzw==
X-Received: by 10.28.12.80 with SMTP id 77mr24074419wmm.19.1456319749314;
	Wed, 24 Feb 2016 05:15:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id s2sm2981437wjs.39.2016.02.24.05.15.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 05:15:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 14:16:54 +0100
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20160224131654.GF7560@jama>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<665b18beb51e5fbcfb033bdda22d7ba85b50f903.1455107972.git.alexander.kanavin@linux.intel.com>
	<CA+chaQe460XR_hNRMS3MyUh5KGMWjykiQKnVOh58FAg2zk0WVQ@mail.gmail.com>
	<56CDA358.8070108@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <56CDA358.8070108@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] ffmpeg: update to 2.8.6
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
X-List-Received-Date: Wed, 24 Feb 2016 13:15:51 -0000
X-Groupsio-MsgNum: 78593
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w3uUfsyyY1Pqa/ej"
Content-Disposition: inline

--w3uUfsyyY1Pqa/ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 02:34:32PM +0200, Alexander Kanavin wrote:
> On 02/24/2016 03:55 AM, Martin Jansa wrote:
> > Fails to build for qemuarm when thumb is enabled.
> >
> > Why was:
> > ARM_INSTRUCTION_SET =3D "arm"
> >
> > removed in
> > http://git.openembedded.org/openembedded-core/commit/?id=3D77dbf07293df=
15cd5473422abd678930d6277bb0
> >
> > without checking if it works?
>=20
> That line has no explanation of its intent and dates back to before=20
> 2009. I had also checked that ffmpeg builds fine with default qemuarm=20
> configuration (and just checked that it still does), so it was dropped=20
> as old cruft.
>=20
> I see that 'thumb' is in TUNE_FEATURES for qemuarm, but not sure if that=
=20
> is same as 'thumb is enabled'. How do I make it break?

"thumb" in TUNE_FEATURES only means that given MACHINE (with given
DEFAULTTUNE) is capable of executing thumb binaries.

The distro needs to set ARM_INSTRUCTION_SET to "thumb" in order to enable
actually using this TUNE_FEATURE.

With recent improvements in tune files you should clearly see that
default qemuarm builds are using TUNE_PKGARCH without "t" in it which
means that "thumb" isn't enabled.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w3uUfsyyY1Pqa/ej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbNrUUACgkQN1Ujt2V2gBxETACgnOmhfOQv/HcHfIPkfjj/L747
fEsAn2xbdkgBE39TNcjjkPx7YVXi7Chk
=ZYmD
-----END PGP SIGNATURE-----

--w3uUfsyyY1Pqa/ej--
