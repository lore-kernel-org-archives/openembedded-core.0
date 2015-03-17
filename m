Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 107056AC43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 01:48:11 +0000 (UTC)
Received: by padcy3 with SMTP id cy3so81817496pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 18:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=E1LVXPDMy+WQRmBneJKzLc5VJYSUT4K2wZjShkToHpU=;
	b=ZghlEUSE2ua7c1MS/3r1+LWf2gU2vPxxTvtxB+zlqDc9aPfFQWAt0eXmo9wM9OvHOk
	gk2lXcCOBkIzHvfhZ4FCTeiPb0kWMhjJCfyc5WnX7iS30luiAz+3GugJnhEid9CApUUu
	7Xjz3t6G5+IvcLKzqr0ihbmsir2iAxLwsXkpLc9osEu6kcQKZnMgsoKH2GyT87JzCgvn
	RqveB8z5J6EV4OHIKy0SNCciClxQybgQ14g9aJIOmKgrylb8t4OwH+/20rc6JXWRm5yy
	Lp1aXHZpWqHFGjaENHR+H//OD8O3uDiuhhN6mqvHQ61CNisD3hsHP2PhbV1j6BrFoQJ2
	E7EQ==
X-Received: by 10.66.149.106 with SMTP id tz10mr145070317pab.90.1426556892483; 
	Mon, 16 Mar 2015 18:48:12 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:d067:1bcc:844a:613d?
	([2601:9:3580:84c:d067:1bcc:844a:613d])
	by mx.google.com with ESMTPSA id
	yf6sm19398207pab.26.2015.03.16.18.48.10
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Mar 2015 18:48:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1426556101-32053-1-git-send-email-sgw@linux.intel.com>
Date: Mon, 16 Mar 2015 18:48:11 -0700
Message-Id: <C27BBC55-806F-40DE-8CE4-1A43F8B975C5@gmail.com>
References: <1426556101-32053-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] openssl: fix libssl.pc to use libcrypto
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
X-List-Received-Date: Tue, 17 Mar 2015 01:48:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 16, 2015, at 6:35 PM, Saul Wold <sgw@linux.intel.com> wrote:
>=20
> The 1.0.2 version of libssl requires that libcrypto be linked so don't
> keep it private anymore.
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> .../openssl/fix_Makefile_creation_of_libssl.patch        | 16 =
++++++++++++++++
> meta/recipes-connectivity/openssl/openssl_1.0.2.bb       |  1 +
> 2 files changed, 17 insertions(+)
> create mode 100644 =
meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.=
patch
>=20
> diff --git =
a/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libss=
l.patch =
b/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libss=
l.patch
> new file mode 100644
> index 0000000..e76ab2e
> --- /dev/null
> +++ =
b/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libss=
l.patch
> @@ -0,0 +1,16 @@
> +Upstream-Status: Pending
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +
> +Index: openssl-1.0.2/Makefile.org
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.2.orig/Makefile.org
> ++++ openssl-1.0.2/Makefile.org
> +@@ -381,7 +381,7 @@ libssl.pc: Makefile
> + 	    echo 'Description: Secure Sockets Layer and cryptography =
libraries'; \
> + 	    echo 'Version: '$(VERSION); \
> + 	    echo 'Requires.private: libcrypto'; \
> +-	    echo 'Libs: -L$${libdir} -lssl'; \
> ++	    echo 'Libs: -L$${libdir} -lssl -lcrypto'; \

There must be a reason why upstream changed it to be private. What is =
the reason ?
since reverting like this can have consequences, we need to understand =
this.

> + 	    echo 'Libs.private: $(EX_LIBS)'; \
> + 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > =
libssl.pc
> +=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2.bb =
b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
> index 79537f9..a980855 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
> @@ -37,6 +37,7 @@ SRC_URI +=3D "file://configure-targets.patch \
>             file://Makefiles-ptest.patch \
>             file://ptest-deps.patch \
>             file://run-ptest \
> +            file://fix_Makefile_creation_of_libssl.patch \
>            "
>=20
> SRC_URI[md5sum] =3D "38373013fc85c790aabf8837969c5eba"
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


