Return-Path: <abelous@broadcom.com>
Received: from mail-gw1-out.broadcom.com (mail-gw1-out.broadcom.com
	[216.31.210.62])
	by mail.openembedded.org (Postfix) with ESMTP id C6EF86BBDC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 23:11:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,588,1389772800"; d="scan'208";a="18013198"
Received: from irvexchcas06.broadcom.com (HELO
	IRVEXCHCAS06.corp.ad.broadcom.com) ([10.9.208.53])
	by mail-gw1-out.broadcom.com with ESMTP; 04 Mar 2014 15:51:56 -0800
Received: from SJEXCHCAS05.corp.ad.broadcom.com (10.16.203.12) by
	IRVEXCHCAS06.corp.ad.broadcom.com (10.9.208.53) with Microsoft SMTP
	Server (TLS) id 14.3.174.1; Tue, 4 Mar 2014 15:11:00 -0800
Received: from SJEXCHMB06.corp.ad.broadcom.com ([fe80::65ea:1de7:41c4:e948])
	by SJEXCHCAS05.corp.ad.broadcom.com ([::1]) with mapi id 14.03.0174.001;
	Tue, 4 Mar 2014 15:11:00 -0800
From: Andrey Belous <abelous@broadcom.com>
To: Saul Wold <sgw@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Signed-off-by: Andrey Belous
	<abelous@broadcom.com>
Thread-Index: AQHPN+oY3Rz3GGrpNEOo+lmb5Tm36JrSEq4A//97L8A=
Date: Tue, 4 Mar 2014 23:11:00 +0000
Message-ID: <AC63B68CC9C36B4FBF9FD4FEEFE754AA20DAA4CA@SJEXCHMB06.corp.ad.broadcom.com>
References: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
	<53165C2A.10403@linux.intel.com>
In-Reply-To: <53165C2A.10403@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.16.203.100]
MIME-Version: 1.0
Subject: Re: [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
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
X-List-Received-Date: Tue, 04 Mar 2014 23:11:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes I overwriting more  , but other variable already with ?=3D and allow to=
 override them

-Andrey=20

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Tuesday, March 04, 2014 6:05 PM
To: Andrey Belous; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Signed-off-by: Andrey Belous <abelous@broadc=
om.com>

On 03/04/2014 12:40 PM, Andrey Belous wrote:
> Setting of a variable PREFERRED_PROVIDER_virtual/libc only if it doesn't =
have a value

The format of your commit message is backwards, you need to have a short=20
message with the filename:

tclibc-uclibc: <short message>

<long message>

Signed-off-by: ....


Also this kind of change is distro specific and could be in your distro=20
specific information, don;'t you need to override more of what's in here=20
if you are using a prebuilt library?

Sau!

> ---
>   meta/conf/distro/include/tclibc-uclibc.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distr=
o/include/tclibc-uclibc.inc
> index 9245112..a4d8c39 100644
> --- a/meta/conf/distro/include/tclibc-uclibc.inc
> +++ b/meta/conf/distro/include/tclibc-uclibc.inc
> @@ -8,7 +8,7 @@ LIBCEXTENSION =3D "-uclibc"
>   LIBCOVERRIDE =3D ":libc-uclibc"
>   OVERRIDES .=3D "${LIBCOVERRIDE}"
>
> -PREFERRED_PROVIDER_virtual/libc =3D "uclibc"
> +PREFERRED_PROVIDER_virtual/libc ?=3D "uclibc"
>   PREFERRED_PROVIDER_virtual/libiconv ?=3D "libiconv"
>   PREFERRED_PROVIDER_virtual/libintl ?=3D "gettext"
>   PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-eglibc"
>

