Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 415576E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 02:22:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3L2MtZd019923
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 19:22:55 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.14]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0224.002;
	Mon, 20 Apr 2015 19:22:55 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] nss: improve the script signlibs.sh
Thread-Index: AQHQZqIysUVx54W0/UiChfQJYfDfgJ1W5lwA
Date: Tue, 21 Apr 2015 02:22:54 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAF0D2B688@ALA-MBA.corp.ad.wrs.com>
References: <1427249955-23047-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1427249955-23047-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.132]
MIME-Version: 1.0
Subject: Re: [PATCH] nss: improve the script signlibs.sh
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
X-List-Received-Date: Tue, 21 Apr 2015 02:22:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping, is this going to be merged?

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Wednesday, March 25, 2015 10:19 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] nss: improve the script signlibs.sh
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The *.chk files are installed in ${libdir} by nss, which is already known=
, no need to 'find' to get the file
> list, and 'ls' is more faster than 'find'.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-support/nss/nss/signlibs.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/nss/nss/signlibs.sh b/meta/recipes-supp=
ort/nss/nss/signlibs.sh
> index 1ec79f4..a74e499 100644
> --- a/meta/recipes-support/nss/nss/signlibs.sh
> +++ b/meta/recipes-support/nss/nss/signlibs.sh
> @@ -9,7 +9,7 @@
>  # calculated on the host where they really need to be done on the  # tar=
get
>=20
> -CHK_FILES=3D`find /lib* /usr/lib* -name "*.chk"`
> +CHK_FILES=3D`ls /lib*/*.chk /usr/lib*/*.chk 2>/dev/null`
>  SIGN_BINARY=3D`which shlibsign`
>  for I in $CHK_FILES
>  do
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

