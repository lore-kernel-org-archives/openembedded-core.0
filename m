Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 20002719DA
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 19:53:51 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id k90so115396293wrc.3
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 11:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7ErjAp2XT7cFdmzYm3TLlSI9CZDzI/AUZLKDX+lOA5s=;
	b=GTlw6jJX/XnS0+Xlwk+Pg9ff6DcJikbwCkv1fkh0Axs3w4chBKOKh24hTJlP+zIglK
	LatUg5LCgFBuV8KAa0vOUYspDRFZ/GvQkbd6dv8BzSvRIEWD6BL6BNUaV6u5iQFRfp51
	esBG6BOpOqLj7BFDxEzO07WewjRBrdAv3VvbZKPw35Vf2OBRWisR59MDI2KzTZ/ZWpdK
	BgEtckMM7gRyYjH97fv1tBpqsVU8j+FsfqoIKIannbMgEW3xpcMbOfgPdMQslo2BPxgG
	YRryCXTYPtU6ToH+LJFuzxIqcts9p1AhxoheMT1LASqFjxEXdp3a7kr3IMZDah57uE9C
	GzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7ErjAp2XT7cFdmzYm3TLlSI9CZDzI/AUZLKDX+lOA5s=;
	b=q68J76XAS9mfH/eO1YMHPnBctAoIG6nKQZmT3hgAZPSteDCaTnbmaJW6TR2V4NCewf
	YLva+UuvnzY6iNO0hLeaO84tiNDykwq8w9xeqPVGYKLHEJNSd7BIp9/2SwDB4dWQPTrf
	3kZW9ELjsC2aMs68t4tK6k7ne2rKx2aqFvkiT+vj5oVRtkcp0SIeUiSSnxMt2xFBDQiB
	GZX5gkd1ktw17PSg+14Uc3/GVG7sOQGvaxfbxEi7srHIMvFz7KKe6qIgSxr5Wa6plBS2
	1LP85Gp7esiO3jYitZZ1DV8rhLcPM7NdGuYhFPSQMrtjSrQ77FoZPLlAfE3CUIXwcT2p
	DjRw==
X-Gm-Message-State: AMke39mZor9jH4blv7ObQefYhXQZAI/crT7pa2sS8B+gjfRWQRUv/06dwSimd/SzirVtwQ==
X-Received: by 10.223.174.199 with SMTP id y65mr10583595wrc.19.1486756431726; 
	Fri, 10 Feb 2017 11:53:51 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l130sm2785600wmf.0.2017.02.10.11.53.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Feb 2017 11:53:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Feb 2017 20:53:51 +0100
To: Bryan Evenson <bevenson@melinkcorp.com>
Message-ID: <20170210195351.GC3021@jama>
References: <DM5PR05MB295469CD2CBB36C236111A0DBB440@DM5PR05MB2954.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM5PR05MB295469CD2CBB36C236111A0DBB440@DM5PR05MB2954.namprd05.prod.outlook.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: libcurl vs. libcurl5 vs. libcurl4
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
X-List-Received-Date: Fri, 10 Feb 2017 19:53:53 -0000
X-Groupsio-MsgNum: 93186
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline

--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 03:41:44PM +0000, Bryan Evenson wrote:
> I'm on the dizzy branch and I'm working on updating my build tools to use=
 a more recent branch.  I have an image built using fido and I'm doing some=
 firmware upgrade testing.  I have a package that depends on libcurl and I'=
m getting some strange version dependencies that I'm trying to sort out.
>=20
> In my package recipe I have "RDEPENDS_${PN} =3D <number of unrelated pack=
ages> libcurl" to pull in the runtime depenency on curl.  When I build my i=
mage using the dizzy branch, libcurl gets built as libcurl5-7.37.1, but whe=
n I build my image using the fido branch libcurl gets built as libcurl4-7.4=
0.0.  As a result, by checking my package dependencies with "opkg info <my_=
package_name>" I see that the package dependency has changed from "libcurl5=
 (>=3D7.37.1)" to "libcurl4 (>=3D7.40.1)".
>=20
> Any ideas why the package name dropped from libcurl5 to libcurl4?  Is thi=
s something that has been fixed in a more recent branch?  If I'm reading th=
e dependencies correctly, opkg should still install libcurl-7.40.0 since my=
 package depends on libcurl4, correct?

See --enable-soname-bump option in curl.

This change in oe-core:
  commit 49c848018484827c433e1bcf9c63416640456f3e
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Tue Apr 28 22:34:22 2015 -0700
  Subject:  curl: Fix wrong assumption about sizeof off_t on largefile
    systems

    This issue was reported on poky ml as well see
    https://lists.yoctoproject.org/pipermail/poky/2013-December/009435.html

Causes this difference in curl_config.h between Dizzy and Fido:
diff 7.40.0-r0-dizzy/build/lib/curl_config.h
     7.40.0-r0-fido/build/lib/curl_config.h
878c877
< #define SIZEOF_OFF_T 4
---
> #define SIZEOF_OFF_T 8
Which in turn causes curl's configure script to stop bumping the SONAME
version.

That's why newer curl 7.40.1 produces libcurl4 while older 7.37.1
produced libcurl5.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJ4aTgAKCRA3VSO3ZXaA
HN4vAJ4+GfsH6W1c2RfxlwYfW99GI5hjewCfd8PV4xnBvPb7K5TkFFjYoRYGES8=
=wx1G
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
