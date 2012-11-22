Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbZW5-0004cm-K7
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 17:20:42 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so832491pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 08:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=oZ49QirG+m0v95s7Blhd9aFF9chDcl2hl+5/KNvKqOA=;
	b=mQoj9S82C6OMiQO3ZCUlul7i4EFt2NrBfOCP0QDUDuO+XcteEeziGbRjd92Z2oB30w
	0BXwOKZCRuciI36DzQ9kjeROhaAWnQ+bb0kQBpS79QDjJ3mjVWYXsYJ8kFZsluPasQAP
	YToGZ1SLRBkzPSa+df4jXREWZRE1gCPb2yNPG8121SpuKbOkLp9qr0E3EtcLjENkaabo
	tW+9cmZeg5RCKMib9kG1mW9nnyIKOzNf7ZVg3bXoz2VRnaiEVC6lmJx7pncG3qOFGw1Y
	AtYibZp+85sngflLikDgJFLzmbLFU4cLOYk6bTOAQQO2VH6bcMBomUxdDM2hjM10Eavv
	vCAA==
MIME-Version: 1.0
Received: by 10.68.252.4 with SMTP id zo4mr5791867pbc.126.1353600394273; Thu,
	22 Nov 2012 08:06:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 22 Nov 2012 08:06:34 -0800 (PST)
In-Reply-To: <1353600120-22967-5-git-send-email-bjst@enea.com>
References: <1353600120-22967-1-git-send-email-bjst@enea.com>
	<1353600120-22967-5-git-send-email-bjst@enea.com>
Date: Thu, 22 Nov 2012 14:06:34 -0200
X-Google-Sender-Auth: M5_yYyaSUSQRamACLCKaTogq1k4
Message-ID: <CAP9ODKqRcLvYPi1CyTxUe7g7UVN=7UEJAPD6e-Vr-ii56LEHjQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Bj=F6rn_Stenberg?= <bjst@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] Add ptest for dbus.
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
X-List-Received-Date: Thu, 22 Nov 2012 16:20:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 2:02 PM, Bj=F6rn Stenberg <bjst@enea.com> wrote:
> This patch adds a new recipe dbus-test to build and package the dbus test
> suite. The reason for a separate recipe is that the dbus test suite depen=
ds
> on dbus-glib, so it cannot be compiled at the same time as dbus.
>
> An RDEPENDS rule is added to the dbus recipe to include the dbus-test
> package into the image when ptest is enabled, since the standard -ptest
> suffix mechanism does not apply to this package.
>
> Signed-off-by: Bj=F6rn Stenberg <bjst@enea.com>
...
> @@ -9,6 +9,9 @@ X11DEPENDS =3D "virtual/libx11 libsm"
>  DEPENDS =3D "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', '=
x11', '${X11DEPENDS}', '', d)}"
>  DEPENDS_class-native =3D "expat-native virtual/libintl-native"
>  DEPENDS_class-nativesdk =3D "nativesdk-expat virtual/nativesdk-libintl v=
irtual/libx11"
> +RDEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-test', =
'', d)}"
> +RDEPENDS_class-native =3D ""

Maybe this could be handled in the native.bbclass?

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


