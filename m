Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B16174751
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 22:08:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5QM89Ua022958
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Jun 2018 15:08:09 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.237]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0399.000;
	Tue, 26 Jun 2018 15:07:56 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] gtk-immodules-cache: add
	conditional delay_to_first_boot
Thread-Index: AQHUDX6srfXE27ubCUSKCl7pf5V1IKRzX3wA//+5Y88=
Date: Tue, 26 Jun 2018 22:07:55 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F35021D1@ALA-MBD.corp.ad.wrs.com>
References: <20180626185120.86068-1-joe.slater@windriver.com>,
	<CANNYZj8-5gfrJMGc+6Fd4Jeff=B+mHodi0v7j2b25jw7D-8Oqg@mail.gmail.com>
In-Reply-To: <CANNYZj8-5gfrJMGc+6Fd4Jeff=B+mHodi0v7j2b25jw7D-8Oqg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.118.102]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gtk-immodules-cache: add conditional delay_to_first_boot
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
X-List-Received-Date: Tue, 26 Jun 2018 22:08:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Actually, it is a screw-up trying to deal with something that was already f=
ixed.  At least it never gets executed.=0A=
=0A=
Joe=0A=
________________________________________=0A=
From: Alexander Kanavin [alex.kanavin@gmail.com]=0A=
Sent: Tuesday, June 26, 2018 12:19 PM=0A=
To: Slater, Joseph=0A=
Cc: OE-core=0A=
Subject: Re: [OE-core] [oe-core][PATCH 1/1] gtk-immodules-cache: add condit=
ional delay_to_first_boot=0A=
=0A=
2018-06-26 20:51 GMT+02:00 Joe Slater <joe.slater@windriver.com>:=0A=
> -            bindir=3D${bindir}=0A=
> +            bindir=3D${bindir} || \=0A=
> +    $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} \=0A=
> +            mlprefix=3D${MLPREFIX}=0A=
=0A=
Please read the postinst_intercept script. It does not actually=0A=
execute qemu at all, and so never fails due to non-working qemu. It=0A=
only requests such execution at the end of package installation=0A=
transaction. Also, if such later qemu execution does fail, then the=0A=
postinst does get deferred to first boot automatically. How did you=0A=
come up with this patch?=0A=
=0A=
Alex=0A=

