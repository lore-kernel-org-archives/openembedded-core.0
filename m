Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RkUmW-00048X-PY
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:02:01 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Jan 2012 21:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94158552"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 09 Jan 2012 21:54:30 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 10 Jan 2012 13:53:12 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.88]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.223]) with mapi id
	14.01.0355.002; Tue, 10 Jan 2012 13:53:11 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] distro_tracking_fields.inc: upgrade
	tcf-agent
Thread-Index: AQHMz0/jr6ktJTHjTECz2jgY4YF79ZYFFYWg
Date: Tue, 10 Jan 2012 05:53:11 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FC9A7DF@SHSMSX102.ccr.corp.intel.com>
References: <cover.1326169288.git.dexuan.cui@intel.com>
	<6bf0833652d572e4de886d0e7f2725ad8da0ff84.1326169288.git.dexuan.cui@intel.com>
In-Reply-To: <6bf0833652d572e4de886d0e7f2725ad8da0ff84.1326169288.git.dexuan.cui@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/1] distro_tracking_fields.inc: upgrade tcf-agent
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 06:02:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, please use the new commit:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/man=
ual_check&id=3D54282a3d4109fe4e97f0acf3b848dc04e68c7d7f
(I have "force" pushed to my dcui/manual_check already)=20

In the old commit MANUAL_CHECK_DATE, the year is 2011 and now it's 2012! :-=
)=20


Thanks,
-- Dexuan


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf Of Dexuan Cui
> Sent: Tuesday, January 10, 2012 12:23 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] distro_tracking_fields.inc: upgrade tcf-ag=
ent
>=20
> Upgraded the field RECIPE_MANUAL_CHECK_DATE.
> Also changed the MAINTAINER to Lianhao who volunteered to take the
> recipe.
>=20
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc
> b/meta/conf/distro/include/distro_tracking_fields.inc
> index cc87d5c..d1f0c82 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -2891,8 +2891,8 @@
> RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tcf-agent =3D "1+ years"
>  RECIPE_LATEST_RELEASE_DATE_pn-tcf-agent =3D "Jul 07, 2011"
>  RECIPE_COMMENTS_pn-tcf-agent =3D ""
>  RECIPE_LAST_UPDATE_pn-tcf-agent =3D "Jul 21, 2011"
> -RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent =3D "Nov 17, 2011"
> -RECIPE_MAINTAINER_pn-tcf-agent =3D "Dexuan Cui
> <dexuan.cui@intel.com>"
> +RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent =3D "Jan 10, 2011"
> +RECIPE_MAINTAINER_pn-tcf-agent =3D "Lianhao Lu <lianhao.lu@intel.com>"
>=20
>  RECIPE_STATUS_pn-liburcu =3D "green"
>  DISTRO_PN_ALIAS_pn-liburcu =3D "Fedora=3Duserspace-rcu Ubuntu=3Dliburcu0=
"
> --
> 1.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


