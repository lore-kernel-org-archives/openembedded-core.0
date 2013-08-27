Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id BE68E61F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 18:10:34 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so5151185pdi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 11:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=D/GrUlV4yAQMdu2nR+TM1kwdb/cP7isVnFzTHFVanog=;
	b=dIpo6JXhuGCxchk70u9AUAcCZmb500vG+vGUE8qQKjUmOE8pwUc5BoUw87FfSbGMWJ
	cOtfrFy+c7h0H+MzgO6igg7zHkJ2xuxy4j1AgZnEJtjTVwyHl0ZunAWxYGlehXf1hIdW
	qeDSQifctyxzoBeWG98mzyrZLledzjF2XyHN9ust8gcSpGsMAQjtnRYdOeqEdRV1rWN0
	GUYAJH8fwmAYqJL8ZRPH6mjWATscc2s9q6j5PV+M+SaNNc7CHcmI2um1TZ+KeV3Tg5jq
	eoDMVcXMes4RNeJRX3poYyIe+Jex+NzXqaWMENyeomJdPMoxEnDi1IJkT/9fKMN+qWhf
	TILw==
X-Received: by 10.66.196.110 with SMTP id il14mr15751422pac.130.1377627035593; 
	Tue, 27 Aug 2013 11:10:35 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	zv11sm28400758pab.3.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 11:10:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130827074818.GV3544@jama>
Date: Tue, 27 Aug 2013 11:10:34 -0700
Message-Id: <A0DA14FE-EC85-4F83-93CA-E704C828501D@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<317e5f0060239db963b826eb9b569170cf9e07dd.1372456294.git.raj.khem@gmail.com>
	<20130826133254.GR3544@jama>
	<677CFE60-700A-4057-92B5-58E6BB906202@gmail.com>
	<20130827074531.GU3544@jama> <20130827074818.GV3544@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/24] python3: Add recipes
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
X-List-Received-Date: Tue, 27 Aug 2013 18:10:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 27, 2013, at 12:48 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

>>=20
>> python3_3.3.2.bb: Add liblzma to RDEPENDS for python3-misc
>>=20
>> doesn't look like right fix, something in python3-misc is linked to
>> liblzma
>>=20
>> DEBUG: calculating shlib requirements for python3-misc
>> DEBUG: python3-misc: Dependency libpython3.3m.so.1.0 requires package =
libpython3
>> DEBUG: python3-misc: Dependency libc.so.6 requires package eglibc
>> DEBUG: python3-misc: Dependency liblzma.so.5 requires package liblzma
>> DEBUG: python3-misc: Dependency libbz2.so.0 requires package libbz2
>> DEBUG: python3-misc: Dependency libcrypt.so.1 requires package eglibc
>>=20
>> so you should add it to DEPENDS not RDEPENDS (Adding it to RDEPENDS
>> hides this message from test-dependencies.sh, but support for lzma in
>> python3-misc would stay nondeterministic).


why ? wont RDEPENDS ask for getting it built before ?

>=20
> That something is python lzmamodule packaged in python3-misc :)
>=20
> setup.py:
>        # LZMA compression support.
>        if self.compiler.find_library_file(lib_dirs, 'lzma'):
>            exts.append( Extension('_lzma', ['_lzmamodule.c'],
>                                   libraries =3D ['lzma']) )
>        else:
>            missing.append('_lzma')
>=20


