Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7673D60670;
	Tue, 12 Jan 2016 23:23:39 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id cy9so347303876pac.0;
	Tue, 12 Jan 2016 15:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:cc:to:mime-version;
	bh=3XYBQsRNVY11t1JCKHRlLA9x15MzKokslLCQMekiTYc=;
	b=PHRz88no29Ng9FS9K9cY8/eZU4Z393yEVf5zU7zLcm+o4rIfDpQrsN9XPJLRVeboOq
	AXDnuGFXbN1UUngxAsBkc+dBmcE7YUADQG60+iIifFJKqjPKNTQo0F7YHzSsE4qopiWN
	OJjuFE7rGgYO4X+ora5X2ZwvmUskkKmhzmt66vSO7MtRibmRsFie3uY1gJL0QW0F0jDu
	XYDOjMLBFC2TZwXU/4mMPdji/6A8K9+f65EgFPuOrTFR1xJt3OC02L9XAM1MjhyfvVxw
	qdlhRskPMOYjXgv2tP1rXoaog7UZ0FVtzuXjAwJAyaPV+L/J4BUKABEYWAJKknqrLtJ8
	DgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:cc:to
	:mime-version;
	bh=3XYBQsRNVY11t1JCKHRlLA9x15MzKokslLCQMekiTYc=;
	b=jIYrWjZSThf9vpHZakY/dFfpgCVNUubdzgnwAVWwC9b91wup7R3IKy8irDd21tMCYa
	Y/+D1q3vm6A7IVHZ3AMd5HbZthhiNk0mMQOtKCFk3IrAPS8Vtl9vIJnl/PspDWHWZqNe
	BY7i+tgrDY3ki4hChgpqZ9l+VSqQG4qUbxGXDVQE7xgzA3pew8ombAaB+DGNEvQWB6nG
	Eu2hRcFxrWWl6Ph6oZaWS7pYweMSvlgUX987unLU2IBM8nqxTIQZg5ihh0rGtqySiqeQ
	H5doOvgJFFlh7zBnXCnJWj5m84kmeQKwlDZ8BECy3ancii/hs8FZLZgsmYZRaYIY+3nm
	tWJw==
X-Gm-Message-State: ALoCoQkMzlozIu4TnlxoJ3QrriUkkhGwSRqpjs36XVSW0U4TAqTd4tQuh40sXSdy0BdH9uCuVJEOaIhiB/bZyw87Ntk4G2Fzng==
X-Received: by 10.66.189.200 with SMTP id gk8mr26761457pac.36.1452641020075;
	Tue, 12 Jan 2016 15:23:40 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:5819:3c63:1381:916a?
	([2601:646:8802:5d5c:5819:3c63:1381:916a])
	by smtp.gmail.com with ESMTPSA id
	l14sm32744781pfb.73.2016.01.12.15.23.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jan 2016 15:23:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Tue, 12 Jan 2016 15:23:33 -0800
Message-Id: <39606447-07D3-4F1F-93A1-CB9C77114535@gmail.com>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Cached size of off_t
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
X-List-Received-Date: Tue, 12 Jan 2016 23:23:41 -0000
X-Groupsio-MsgNum: 75959
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E804F38C-5F94-416D-91F1-150791842E7D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E804F38C-5F94-416D-91F1-150791842E7D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi

We cache size of off_t in site files and the value is 4 in most cases


meta/site/arm-linux:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
meta/site/ix86-common:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
meta/site/nios2-linux:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
meta/site/powerpc32-linux:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
meta/site/x32-linux:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D8}
meta/site/x86_64-linux:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D8}


However this value is wrong when largefile support is enabled (which is =
default) on
most OE based distros. It also lands us in nasty bugs which are =
complicated to uncover
eg. the curl issue

=
http://git.openembedded.org/openembedded-core/commit/?id=3D3c58712465494e4=
41c4036a7cf21d2e6d343efab

and just in OE-Core more e.g. grub2,libsndfile1,pax are showing same =
symptoms.

I think this value should be left for configure to compute and
autotools.bbclass should pass --{enable|disable}-largefile based upon
DISTRO_FEATURES enabling largefile support

Do we see any downsides or point I might have missed

Thank you
-Khem


--Apple-Mail=_E804F38C-5F94-416D-91F1-150791842E7D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaVivoACgkQuwUzVZGdMxR03ACeKG5AF+XX9pDo2RxFeqBs5Jwq
rGcAmwaVWcLYrEtUD4SOjJYD62ePwwMS
=j6pn
-----END PGP SIGNATURE-----

--Apple-Mail=_E804F38C-5F94-416D-91F1-150791842E7D--
