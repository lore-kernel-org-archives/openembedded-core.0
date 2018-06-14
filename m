Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3CC760A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 10:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 31754189B5;
	Thu, 14 Jun 2018 12:54:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id SpHpEFhEnZSv; Thu, 14 Jun 2018 12:54:53 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 995F5189B2;
	Thu, 14 Jun 2018 12:54:53 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 792BF1E06E;
	Thu, 14 Jun 2018 12:54:53 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CA251E06C;
	Thu, 14 Jun 2018 12:54:53 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 14 Jun 2018 12:54:53 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 5F2A02EC5;
	Thu, 14 Jun 2018 12:54:53 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 14 Jun 2018 12:54:53 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 14 Jun 2018 12:54:53 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 14 Jun 2018 12:54:53 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]  [PATCH] Fix build error when enable archiver.
Thread-Index: AQHUArxrcy8GdmWJZkedEneXZg2zlKRflOzQ
Date: Thu, 14 Jun 2018 10:54:53 +0000
Message-ID: <afabcbb9e34e435d8beba477ed3b51ba@XBOX02.axis.com>
References: <1527973443-39251-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1527973443-39251-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] Fix build error when enable archiver.
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
X-List-Received-Date: Thu, 14 Jun 2018 10:54:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Lei Maohui
> Sent: den 2 juni 2018 23:04
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] Fix build error when enable archiver.
>=20
> The error is as fllowing:
> ERROR: Task do_deploy_archives in
> virtual:native:/yocto/poky/meta/recipes-extended/newt/libnewt_0.52.20.bb =
depends upon non-existent task
> do_package_write_rpm in virtual:native:/yocto/poky/meta/recipes-extended/=
newt/libnewt_0.52.20.bb
> ERROR: Command execution failed: 1
>=20
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta/classes/nopackages.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bb=
class
> index 559f507..d9ddfac 100644
> --- a/meta/classes/nopackages.bbclass
> +++ b/meta/classes/nopackages.bbclass
> @@ -10,3 +10,4 @@ deltask do_package_write_ipk_setscene
>  deltask do_package_write_deb_setscene
>  deltask do_package_qa_setscene
>  deltask do_packagedata_setscene
> +deltask do_deploy_archives
> --
> 1.9.1

This cannot be correct. If I am not mistaken, then this would=20
effectively disable the archiver class from outputting anything for=20
native packages.

//Peter


