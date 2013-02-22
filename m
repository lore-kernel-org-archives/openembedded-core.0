Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U8tPw-0002xo-1N for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 15:16:11 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1ME6TxH013391; Fri, 22 Feb 2013 14:06:29 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q67aih4rWm5u; Fri, 22 Feb 2013 14:06:29 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1ME6KmE013387
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Feb 2013 14:06:26 GMT
Message-ID: <1361541563.9309.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Fri, 22 Feb 2013 05:59:23 -0800
In-Reply-To: <1361279644-17675-5-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
	<1361279644-17675-5-git-send-email-bjst@enea.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r1ME6TxH013391
Cc: "Rick.Yang" <rick.yang@enea.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] acl: Add ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Feb 2013 14:16:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-02-19 at 14:14 +0100, Bj=C3=B6rn Stenberg wrote:
> From: "Rick.Yang" <rick.yang@enea.com>
>=20
>=20
> Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
> ---
>  meta/recipes-support/attr/acl_2.2.51.bb            |   21 ++++++++++++=
++++
>  .../attr/files/add-runtest-target.patch            |   26 ++++++++++++=
++++++++
>  meta/recipes-support/attr/files/run-ptest          |    8 ++++++
>  3 files changed, 55 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-support/attr/files/add-runtest-target.=
patch
>  create mode 100644 meta/recipes-support/attr/files/run-ptest
>=20
> diff --git a/meta/recipes-support/attr/acl_2.2.51.bb b/meta/recipes-sup=
port/attr/acl_2.2.51.bb
> index 1c40b00..92d67e0 100644
> --- a/meta/recipes-support/attr/acl_2.2.51.bb
> +++ b/meta/recipes-support/attr/acl_2.2.51.bb
> @@ -4,3 +4,24 @@ PR =3D "r3"
> =20
>  SRC_URI[md5sum] =3D "3fc0ce99dc5253bdcce4c9cd437bc267"
>  SRC_URI[sha256sum] =3D "06854521cf5d396801af7e54b9636680edf8064355e51c=
07657ec7442a185225"
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"

Is the above line needed?

Cheers,

Richard



