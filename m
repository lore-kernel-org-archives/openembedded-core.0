Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 31178605E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=1295; q=dns/txt; s=axis-central1;
	t=1583238552; x=1614774552;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=Bj6RBmBjROL32lklFiy1XwxGDmALgtXddK5iQXM1TWg=;
	b=ahux9yUIM8/Y5E1JZY5HSXmRZm7m3gMb8+bhgEegQK+LJSa05nIxC9iJ
	x1P4qhEniWWtGK7oi/FV6HKNzsxS8AMXSJBAIsLcGLq2bg/WZH/mfa3wd
	GHGvXvo3e1caFUT8tOx8rQeMakJ4eq/qMYJsAJnMXkv+9n4NhlD+q+kjc
	UG86472Z8mhK+VKAjsScXHxIEJMRYzyJtQokaaSIEjbSYvTDq5m82e0zC
	StDd4QiVE65VlqAbQ+cYmEHxjtwcdX8BSOHdc65rZ1DfEwbqUzjeWAZ7C
	7SX9wWQuKLdN1gHIR3Xkgp81imsXMfdB3YRVohiutSYw5+6x7wBivjng2 A==;
IronPort-SDR: jdOh3C7QK276NIlHqVpOXhSlWFuTwWm4l0nXWd7HcgC4ZjZlqulL0UlQBFr0tZu3g2EXG/rWht
	waEQYbxHYT6jglmoCpV+pRXwHrJQrP8xu7wixFsyUyh6AY6r+Jib2FdvDST2Eo5ECOepyqAOCP
	7Fp6rfjBNwRlsr7icqg0YjDY6dC44Sx9D7Zpuk+l6SgY9PWUfjyaa3x9EoE+v0F8kw3gt9DEIs
	+MDO1plBed3L4ty1ZKgKTo092gdCu86P91rTLwQZQD+IyIDng6j5Y4aOnaKtUh5YUndr47EMH5
	KMY=
X-IronPort-AV: E=Sophos;i="5.70,511,1574118000"; 
   d="scan'208";a="6040447"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Anders Wallin <wallinux@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] babeltrace: only check latest git tag version
	for	1.x.x
Thread-Index: AQHV8TCwcx826R85yU62d0113FgekKg2y9Rw
Date: Tue, 3 Mar 2020 12:29:10 +0000
Message-ID: <6fd917f010304276a503801ab9c2c40f@XBOX03.axis.com>
References: <20200303075132.25849-1-wallinux@gmail.com>
In-Reply-To: <20200303075132.25849-1-wallinux@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH] babeltrace: only check latest git tag version for	1.x.x
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
X-List-Received-Date: Tue, 03 Mar 2020 12:29:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Anders Wallin
> Sent: den 3 mars 2020 08:52
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] babeltrace: only check latest git tag version
> for 1.x.x
>=20
> version 2.x.x will be added with a new babeltrace2 recipe
>=20
> Signed-off-by: Anders Wallin <wallinux@gmail.com>
> ---
>  meta/recipes-kernel/lttng/babeltrace_1.5.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes=
-
> kernel/lttng/babeltrace_1.5.8.bb
> index c050dc674d..3268c5de9c 100644
> --- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D
> "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=3Dstable-1.5
>  	   file://run-ptest \
>  	  "
>  SRCREV =3D "054a54ae10b01a271afc4f19496c041b10fb414c"
> -UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)$"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>1+(\.\d+)+)$"

Change "1+" to "1" or you will match, e.g., "11" and "111".

>=20
>  S =3D "${WORKDIR}/git"
>=20
> --
> 2.25.1

//Peter


