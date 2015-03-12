Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2626073B6A;
	Thu, 12 Mar 2015 16:27:55 +0000 (UTC)
Received: by padbj1 with SMTP id bj1so21726981pad.12;
	Thu, 12 Mar 2015 09:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=NGz/StgNcF2gbIYY/chDoVeRYvZriMNxXXQROuyEswo=;
	b=BQSv0uqnp7LQQXWhcURK8ldis5q5BamTaZoyxL9SM4MDF7ZtH52qD8dF7UfSsnRc7u
	hyfrVJEe04ISfCosfeNBvHDYRg2K6jI72Wk4QnN6wmPy7ezYJxJV/ytlABaz8f1GpgN7
	/m2mMLVLuNjJ3WMi4McVrsnAxM5VQg+bNWEIG6/X4OneTW+saKda/vm774PpAMBjBiHI
	FZHx5ADyuBmisoss0/u482NqzbZzFapWHNojm4/t2D0Z6wcWJnUQeGgR1tGQ+/CQiA1X
	38JqMi8iP2pJpCto3V/+BJ61+9QoZOd62tRUb2gLWeHJwuY805DFhaPk/Gds9JZqJVxT
	1Qvw==
X-Received: by 10.70.52.8 with SMTP id p8mr91692713pdo.27.1426177676859;
	Thu, 12 Mar 2015 09:27:56 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id r8sm11819949pdp.10.2015.03.12.09.27.55
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Mar 2015 09:27:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <1C32BA8A-B6B1-4CD6-A980-72C07E978FA2@gmail.com>
Date: Thu, 12 Mar 2015 09:27:53 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	yocto <yocto@yoctoproject.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
X-Mailer: Apple Mail (2.2070.6)
Subject: clang cross compiler for OE available in meta-clang
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
X-List-Received-Date: Thu, 12 Mar 2015 16:27:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi All,

Finally, clang/llvm is now in a working state as a cross compiler in =
meta-clang layer

https://github.com/kraj/meta-clang

Currently, It will build clang and stage it along with gcc cross =
compilers, default remains
as it is. If you wish to compile an additional recipe using clang you =
will add following two entries per recipe


TOOLCHAIN_pn-<recipe> =3D "clang"
DEPENDS_append_pn-<recipe> =3D " clang-cross "

to conf/clang.conf=20

and it will start using clang for that component. Right now it only has =
one entry for =E2=80=98lzo=E2=80=99 :)
I am hoping to have this list grow soon

Right now, its only the cross compiler, which means compiler runtime is =
still same from gcc
and binutils are used in same way

Eventually, I will add compiler-rt and libc++ as well and also add =
cross-canadian builds of clang and make it cohabit in SDK
along with gcc.

If you would like to help trying/porting recipes to use clang/llvm or =
improve the layer, please lend your hand

Thanks for your time

-Khem


