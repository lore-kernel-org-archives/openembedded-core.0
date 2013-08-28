Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 65A836BC09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 06:23:46 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so5778103pbc.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 23:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=DpSBPn6MNbHfPLJ6j+EYP6FtSy/TJ4528SeBJdCGm0A=;
	b=oaetlEr945JZqCodf4Hf70paTEGKnhhcRWqPO+AtGkPn0xQ7o86XheVXLFhPwTd0fo
	dHJX0Ik4eyGEOGeMjWIA9K8J3FXI6+b4y4O5zBRAHYCMZaqLTGB2+qESqxqUU9R8ZJ+Z
	9Zhaobs0SedEZNStPXxH6h40aHLzS3gCIVEKGfTbs8tlsn7l9XKVvmvnBCxduozZ12dH
	IWalpWMCwBl/44tM35WkNE3hjob3aCXCAq+SN99wUN7gT5CleMK4SI5qtINpZ+ncsgEz
	p3thMRiLAAMrU767LcCazbesGmkiuyV0B6UtNuETB//AaQvHzbXpInUatO3fPJNhliix
	kn3Q==
X-Received: by 10.68.228.230 with SMTP id sl6mr25282822pbc.98.1377671026941;
	Tue, 27 Aug 2013 23:23:46 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	tr10sm29061336pbc.22.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 23:23:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130827181558.GA3544@jama>
Date: Tue, 27 Aug 2013 23:23:46 -0700
Message-Id: <8456E437-1564-4435-9752-25272E60389A@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<317e5f0060239db963b826eb9b569170cf9e07dd.1372456294.git.raj.khem@gmail.com>
	<20130826133254.GR3544@jama>
	<677CFE60-700A-4057-92B5-58E6BB906202@gmail.com>
	<20130827074531.GU3544@jama> <20130827074818.GV3544@jama>
	<A0DA14FE-EC85-4F83-93CA-E704C828501D@gmail.com>
	<20130827181558.GA3544@jama>
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
X-List-Received-Date: Wed, 28 Aug 2013 06:23:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 27, 2013, at 11:15 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> before do_package but not before do_configure
>=20

I have thusly changed it to a DEPENDS and pushed the reworked patch to =
pull tree here
=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/pyt=
hon3&id=3D1b18148bb97b366393bf62c24cc0b90cd8d2b8b5

>>=20
>>>=20
>>> That something is python lzmamodule packaged in python3-misc :)
>>>=20
>>> setup.py:
>>>       # LZMA compression support.
>>>       if self.compiler.find_library_file(lib_dirs, 'lzma'):
>>>           exts.append( Extension('_lzma', ['_lzmamodule.c'],
>>>                                  libraries =3D ['lzma']) )
>>>       else:
>>>           missing.append('_lzma')
>>>=20
>>=20
>=20


