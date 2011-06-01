Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRegy-0003s6-7h
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:14:08 +0200
Received: by fxm19 with SMTP id 19so4111945fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 23:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=nXsoJhYKMJqkIELt4K22BuVjOlAYrlwTeZFot2yj5MQ=;
	b=bSqUPhb+k+aNQSUyRCfNpQGpmy5y4d0U8Y3nIxJdpqfnLHWVc8+fiDyBGD5nQiOKEA
	GGz4+LVw2HZse0IKjNw9ov2lE/GVI4meEOCTYqs/TtVmdSdhxaBpZm++ZCNLb22MN5Sx
	BnkG+o8AvuvPGxKoZOBxVnT4X91gJ05gzmaWU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aLYTsXEs1Xe7QDYtsJbhgAJJoKQ7mBh37+OrqBRo2ej1r0wENHUtoTWlvbbk1lETMZ
	Rbhy1gT/gTIT6fpMXY/xsdLYEv22xKhRnptyTgCATbEjsB+bVrjOa2oBoeB8s0ia2b08
	dtsCY0HlTZ3nUxAA0x+XX9o+YCJTM8DAmfmtg=
Received: by 10.223.99.153 with SMTP id u25mr7677126fan.112.1306908657883;
	Tue, 31 May 2011 23:10:57 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id b26sm248415fak.24.2011.05.31.23.10.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 23:10:56 -0700 (PDT)
Date: Wed, 1 Jun 2011 08:10:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: raj.khem@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110601061050.GA3281@jama.jama.net>
References: <4DE5CDA3.1020000@linux.intel.com>
 <4DE5D4AC.4090805@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4DE5D4AC.4090805@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] tcmode-default: disable ARMv7 Optimization for qt4-x11-free
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 06:14:08 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 10:57:00PM -0700, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 05/31/2011 10:26 PM, Saul Wold wrote:
> > [YOCTO #1030]
> >=20
> > This diables the ARMv7 optimizations that cause the compiler to fail
> > with the following error
> >=20
> > | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h: In function
> > 'void qt_removeObject(QObject*)':
> > | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35:
> > error: output number 1 not directly addressable
>=20
> this is a coding error you can fix the source code I guess instead of
> pessimising the whole package

FWIW: I haven't seen it in my armv7-a builds (nokia900), but I'm using
gcc-4.6 from meta-oe.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k+w/mQv8wyuph6w0--
