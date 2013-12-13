Return-Path: <Fahad_Arslan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 86A4F6E243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 11:49:47 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VrRFa-0002xS-TY from Fahad_Arslan@mentor.com ;
	Fri, 13 Dec 2013 03:49:46 -0800
Received: from SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 13 Dec 2013 03:49:47 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.95]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.02.0247.003; Fri, 13 Dec 2013 11:49:45 +0000
From: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] libffi: Copy headers to more common include
	path.
Thread-Index: AQHO92Jfig5Oprdm80qsYrExPzV8EJpQ2G0AgAErTgM=
Date: Fri, 13 Dec 2013 11:49:44 +0000
Message-ID: <2B9C97B395470A40B9E9E5D469BCD9FA0155D384@EU-MBX-03.mgc.mentorg.com>
References: <1386870464-41010-1-git-send-email-fahad_arslan@mentor.com>,
	<1386871038.504.19.camel@ted>
In-Reply-To: <1386871038.504.19.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
X-OriginalArrivalTime: 13 Dec 2013 11:49:47.0017 (UTC)
	FILETIME=[6BF09790:01CEF7F9]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libffi: Copy headers to more common include path.
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
X-List-Received-Date: Fri, 13 Dec 2013 11:49:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My understanding was that headers should be placed under ${includedir} inst=
ead of =0A=
${libdir}. Isn't it the practice or am I missing something?=0A=
=0A=
Thanks,=0A=
Fahad=0A=
________________________________________=0A=
From: Richard Purdie [richard.purdie@linuxfoundation.org]=0A=
Sent: Thursday, December 12, 2013 10:57 PM=0A=
To: Arslan, Fahad=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] libffi: Copy headers to more common include =
path.=0A=
=0A=
On Thu, 2013-12-12 at 22:47 +0500, Fahad Arslan wrote:=0A=
> Signed-off-by: Fahad Arslan <fahad_arslan@mentor.com>=0A=
> ---=0A=
>  meta/recipes-gnome/libffi/libffi_3.0.13.bb |    5 +++++=0A=
>  1 file changed, 5 insertions(+)=0A=
>=0A=
> diff --git a/meta/recipes-gnome/libffi/libffi_3.0.13.bb b/meta/recipes-gn=
ome/libffi/libffi_3.0.13.bb=0A=
> index db0841e..07dd7d1 100644=0A=
> --- a/meta/recipes-gnome/libffi/libffi_3.0.13.bb=0A=
> +++ b/meta/recipes-gnome/libffi/libffi_3.0.13.bb=0A=
> @@ -22,3 +22,8 @@ inherit autotools=0A=
>  FILES_${PN}-dev +=3D "${libdir}/libffi-${PV}"=0A=
>=0A=
>  BBCLASSEXTEND =3D "native nativesdk"=0A=
> +=0A=
> +do_install_append() {=0A=
> +    install -d ${D}${includedir}=0A=
> +    cp -r ${D}${libdir}/libffi-${PV}/include/* ${D}${includedir}/ || tru=
e=0A=
> +}=0A=
=0A=
Why? Shouldn't whatever is using them look for them in the correct=0A=
location?=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=

