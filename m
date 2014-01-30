Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 00FEB6E9CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 11:08:50 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1W8pUI-0003OO-Mc from Noor_Ahsan@mentor.com ;
	Thu, 30 Jan 2014 03:08:50 -0800
Received: from SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 30 Jan 2014 03:08:50 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.95]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.02.0247.003; Thu, 30 Jan 2014 11:07:32 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] libcgroup: Add bison-native and flex-native
	in depends
Thread-Index: AQHPHRiinLyWfKMNHkqZeAl2D6w8ZZqdHQEQ
Date: Thu, 30 Jan 2014 11:08:47 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994E73E4DC6@EU-MBX-03.mgc.mentorg.com>
References: <1391005066-15501-1-git-send-email-noor_ahsan@mentor.com>
	<1391016950.24655.74.camel@ted>
In-Reply-To: <1391016950.24655.74.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 30 Jan 2014 11:08:50.0569 (UTC)
	FILETIME=[A79C5F90:01CF1DAB]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcgroup: Add bison-native and flex-native in depends
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
X-List-Received-Date: Thu, 30 Jan 2014 11:08:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sent another patch for version 0.41.

Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
Sent: Wednesday, January 29, 2014 10:36 PM
To: Ahsan, Noor
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libcgroup: Add bison-native and flex-native =
in depends

On Wed, 2014-01-29 at 19:17 +0500, Noor, Ahsan wrote:
> From: Noor <noor_ahsan@mentor.com>
>=20
> * libcgroup require native packages for bison and flex. Added those
>   in its DEPENDS.
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  meta/recipes-core/libcgroup/libcgroup_0.38.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/libcgroup/libcgroup_0.38.bb=20
> b/meta/recipes-core/libcgroup/libcgroup_0.38.bb
> index 8bd0ead..711229f 100644
> --- a/meta/recipes-core/libcgroup/libcgroup_0.38.bb
> +++ b/meta/recipes-core/libcgroup/libcgroup_0.38.bb

It appears we have version 0.41 in master. Could you send patches built and=
 tested against master please.

Cheers,

Richard

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

