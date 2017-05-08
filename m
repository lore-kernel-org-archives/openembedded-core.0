Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 68AE171A91
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 15:18:29 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1d7kQg-0003SI-3c from Awais_Belal@mentor.com ;
	Mon, 08 May 2017 08:18:30 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Mon, 8 May 2017 16:18:27 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Mon, 8 May 2017 16:18:27 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] GUI based images
Thread-Index: AQHSx+kRuNkV7b8ke0y+WmQtFZfPpaHqPVkAgAACwACAAAEFgIAASzdi
Date: Mon, 8 May 2017 15:18:26 +0000
Message-ID: <1494256705828.91940@mentor.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<CAJTo0LY67aoeeHiNXDSA+FYmEYMQdw3tq1_N7+N=a9xq9nyPiw@mail.gmail.com>,
	<935aef85-53ff-b5a6-5ce0-f95128778dd2@linux.intel.com>
In-Reply-To: <935aef85-53ff-b5a6-5ce0-f95128778dd2@linux.intel.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Mon, 08 May 2017 15:18:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Generally, we have resources for maintaining only one GUI desktop in=0A=
> oe-core layer, and right now that is Sato. If you're okay with XFCE,=0A=
> that is provided via meta-xfce layer=0A=
=0A=
I should probably quote every email on this thread and say THANKS! for the =
information and explanation.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>=0A=
Sent: Monday, May 8, 2017 4:47 PM=0A=
To: Burton, Ross; Belal, Awais=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] GUI based images=0A=
=0A=
On 05/08/2017 02:43 PM, Burton, Ross wrote:=0A=
=0A=
> Obviously if you're happy to say "I target desktop users" then there's=0A=
> meta-gnome, meta-xfce, and so on.=0A=
=0A=
I would not recommend meta-gnome, as it's not well maintained, and=0A=
should be used only for adding specific gnome apps to an image. It=0A=
doesn't define any full 'gnome images' or 'gnome packagegroups' that=0A=
would provide an integrated desktop.=0A=
=0A=
Alex=0A=
=0A=

