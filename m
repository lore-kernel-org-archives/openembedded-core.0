Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5027F610
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 04:18:02 +0000 (UTC)
IronPort-SDR: XYof5o7d6kh4QJjfag6/jA1seYuC9LSR8Txq/fKoVU/C76wZWnif0QwxyI5TOW48bGkvyfYaOk
	+F+MQXUZVvVgm6ifTbm/pmi1KZ6NwGqHLLSEd2YwW1ZhpiwG63Jciz37Gk/YjWc7AQw5O7op2k
	4aDMFMHR+OyuncPVkVVdqI0Bt86TGrCUOPfKzs66oce2gDHMikulD+9m44aoRgzppgg74Vm1R8
	Be6IG/5X4KO+9XjZtTXhvbvOnoK7TZolCTe8GYPp9+KOz7ApbYLse9xGH8uVXSAa6g+yoKThC5
	ETA=
X-IronPort-AV: E=Sophos;i="5.68,265,1569276000"; 
   d="scan'208";a="2034850"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Thread-Topic: [OE-core] [PATCH] insane: file-rdeps: Readability only
Thread-Index: AQHVkq2Vkl57RCxtVUWhrg0jSoK9Mqd6Z2FQ
Date: Mon, 4 Nov 2019 04:18:00 +0000
Message-ID: <6785171c21834732bb313e64f502a78a@XBOX03.axis.com>
References: <20191104011638.26010-1-douglas.royds@taitradio.com>
In-Reply-To: <20191104011638.26010-1-douglas.royds@taitradio.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: file-rdeps: Readability only
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
X-List-Received-Date: Mon, 04 Nov 2019 04:18:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Douglas Royds via
> Openembedded-core
> Sent: den 4 november 2019 02:17
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] insane: file-rdeps: Readability only
>=20
> Mostly just longer (and hopefully more meaningful) variable names.
>=20
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/classes/insane.bbclass | 84 ++++++++++++++++++++-----------------
>  1 file changed, 45 insertions(+), 39 deletions(-)

[cut]

The print statements below look like leftover debug statements.

> @@ -956,6 +959,7 @@ python do_package_qa () {
>      taskdeps =3D set()
>      for dep in taskdepdata:
>          taskdeps.add(taskdepdata[dep][0])
> +    print("taskdeps =3D %s" % taskdeps)
>=20
>      def parse_test_matrix(matrix_name):
>          testmatrix =3D d.getVarFlags(matrix_name) or {}
> @@ -975,7 +979,9 @@ python do_package_qa () {
>                  errorchecks.append(g[testmatrix[e]])
>          return warnchecks, errorchecks
>=20
> +    print("packages =3D %s" % packages)
>      for package in packages:
> +        print("package =3D %s" % package)
>          skip =3D set((d.getVar('INSANE_SKIP') or "").split() +
>                     (d.getVar('INSANE_SKIP_' + package) or "").split())
>          if skip:
> --
> 2.17.1

//Peter


