Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9A636601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 09:37:53 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ahwHY-0004Be-Vd from Awais_Belal@mentor.com ;
	Mon, 21 Mar 2016 02:37:53 -0700
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.44]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Mon, 21 Mar 2016 09:37:52 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH][RFC] systemd-serialgetty: allow baud rate
	overriding
Thread-Index: AQHRgXc7/bxP6WDNZ0SxFZikMVo0gJ9jp5d8
Date: Mon, 21 Mar 2016 09:37:50 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FB928FE@EU-MBX-02.mgc.mentorg.com>
References: <1457352632-4609-1-git-send-email-awais_belal@mentor.com>,
	<53D8DD3F-C83D-4179-9974-28EE2960F85A@gmail.com>
In-Reply-To: <53D8DD3F-C83D-4179-9974-28EE2960F85A@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] systemd-serialgetty: allow baud rate overriding
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
X-List-Received-Date: Mon, 21 Mar 2016 09:37:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Khem,=0A=
=0A=
Thanks a lot for replying. Do I need to resend with RFC removed or will thi=
s do?=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Khem Raj [raj.khem@gmail.com]=0A=
Sent: Saturday, March 19, 2016 5:35 AM=0A=
To: Belal, Awais=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH][RFC] systemd-serialgetty: allow baud rate ov=
erriding=0A=
=0A=
> On Mar 7, 2016, at 4:10 AM, Awais Belal <awais_belal@mentor.com> wrote:=
=0A=
>=0A=
> In case a getty is required on a UART which is not being=0A=
> used as the kernel console, the current agetty invocation=0A=
> fails to obey the baud rate configured through the=0A=
> SERIAL_CONSOLES variable because it uses --keep-baud.=0A=
>=0A=
> Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> ---=0A=
> meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service | 2 +=
-=0A=
> 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.=
service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.servi=
ce=0A=
> index 182167b..e8b027e 100644=0A=
> --- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service=
=0A=
> +++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service=
=0A=
> @@ -21,7 +21,7 @@ IgnoreOnIsolate=3Dyes=0A=
>=0A=
> [Service]=0A=
> Environment=3D"TERM=3Dxterm"=0A=
> -ExecStart=3D-/sbin/agetty -8 -L --keep-baud %I @BAUDRATE@ $TERM=0A=
> +ExecStart=3D-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM=0A=
=0A=
this looks good.=0A=
=0A=
> Type=3Didle=0A=
> Restart=3Dalways=0A=
> RestartSec=3D0=0A=
> --=0A=
> 1.9.1=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> Openembedded-core mailing list=0A=
> Openembedded-core@lists.openembedded.org=0A=
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=
=0A=

