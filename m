Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0775D6BAB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 17:37:51 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id q10so3727520pdj.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=nxUUyliXO2ak7iebhmOFceqNBDpLCoywYcNEwSPtGqw=;
	b=muNiY0JZskOnthYpuvLHkKeUcaQwc+tQUsqUAQWjNcpi7TsR9Yus7pwafbHsFuHnwI
	o1DF8d3p6bR2VwX6WgAWK1/Hro0GDaCkEdJ5vL+tgYGVgoeYFweaHN/vbRaVV8y5qo4g
	Fy3/MHJJGh0HJo8+Wr+F78WAPnynJJjL4visI6W0cFhYfsaOco09vrSIElbA6R5EQy03
	P4rcj7uUamr9sdwTKQU6E86qTHmrCPNauv+B4ae2dQiUyBOVSBoXqifPJ9RyMsfGHAxs
	bRnTDopsTvDBqZUcRK4bNeLY7OMXJRfuWaRbR7Wa9KnH8U0mj9dzJ101l1mEqHeJ8sok
	NFhQ==
X-Received: by 10.68.252.135 with SMTP id zs7mr2865546pbc.194.1377538671661;
	Mon, 26 Aug 2013 10:37:51 -0700 (PDT)
Received: from edchang-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ct4sm10167479pbb.41.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 10:37:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130826133254.GR3544@jama>
Date: Mon, 26 Aug 2013 10:38:03 -0700
Message-Id: <7644CAFB-4399-44D0-A07C-4C1D4A6AE7B1@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<317e5f0060239db963b826eb9b569170cf9e07dd.1372456294.git.raj.khem@gmail.com>
	<20130826133254.GR3544@jama>
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
X-List-Received-Date: Mon, 26 Aug 2013 17:37:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 26, 2013, at 6:32 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> When testing this on another host I got:
>=20
> ERROR: This autoconf log indicates errors, it looked at host include
> and/or library paths while determining system capabilities.
> Rerun configure task after fixing this. The path was
> =
'/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/python3/3.3.2-r0.0/Python-3.=
3.2'
> ERROR: Function failed: do_qa_configure
> ERROR: Logfile of failure stored in:
> =
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/python3/3.3.2-r0.0/temp/log.d=
o_configure.13003
> ERROR: Task 58
> =
(/OE/shr-core/openembedded-core/meta/recipes-devtools/python/python3_3.3.2=
.bb,
> do_configure) failed with exit code '1'
>=20
>=20
> configure:6972: x86_64-oe-linux-gcc  -m64 -DNDEBUG -fno-inline
> --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -c -O2 -pipe =
-g
> -feliminate-unused-debug-types  -I/usr/include/ncursesw conftest.c >&5
> cc1: warning: include location "/usr/include/ncursesw" is unsafe for
> cross-compilation [-Wpoison-system-directories]
> conftest.c:63:19: fatal error: conio.h: No such file or directory
> #include <conio.h>
>                   ^
> compilation terminated.

interesting. since I think I have a patch in there to address the =
contamination issue.
see =
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/pyt=
hon3&id=3D1b4847faa6af86516b4ff451d9cc44f565c7d398
whats your build host OS ?


>=20
>=20
> and from test-dependencies.sh run there is undeterministic lzma
> dependency:
>=20
> WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-misc/latest =
lost dependency on  liblzma

Thanks, I will add that explicitly.


>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


