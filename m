Received: from outbound-relay8.guardedhost.com (outbound-relay8.guardedhost.com [216.239.133.208])
 by mx.groups.io with SMTP id smtpd.web09.4882.1606965638363063851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 19:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.208, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (tev-mx6.omnis.com [216.239.133.155])
	by outbound-relay5.guardedhost.com (Postfix) with ESMTP id 4Cmh1K3Xflz29cK;
	Thu,  3 Dec 2020 03:20:37 +0000 (GMT)
Received: from [192.168.1.14] (c-73-254-147-133.hsd1.wa.comcast.net [73.254.147.133])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPSA id 4Cmh1J4vNVz30M4;
	Thu,  3 Dec 2020 03:20:36 +0000 (GMT)
From: "Alan Perry" <alanp@snowmoose.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] [PATCH 1/2] iproute2: install tools to mirror install under Debian/Ubuntu
Date: Wed, 2 Dec 2020 19:20:35 -0800
Message-Id: <02AD4244-264F-4A35-942E-4A9490A92EBB@snowmoose.com>
References: <20201203015348.5e4de8a1@opendreambox.org>
Cc: openembedded-core@lists.openembedded.org
In-Reply-To: <20201203015348.5e4de8a1@opendreambox.org>
To: Andreas Oberritter <obi@opendreambox.org>
X-Mailer: iPhone Mail (18B92)
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: 834B2844-3516-11EB-B2D9-A4EDFA4FBE41
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx6.omnis.com
X-Virus-Status: Clean
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Good catch. Thanks.

> On Dec 2, 2020, at 17:02, Andreas Oberritter <obi@opendreambox.org> wrote:=

>=20
> =EF=BB=BFHi Alan,
>=20
>> +    mv ${D}${base_sbindir}/genl ${D}${sbindir}/genl
>=20
> this is going to break setups where ${base_sbindir} equals ${sbindir}, so y=
ou'll need make this conditional.
>=20
> Best regards,
> Andreas
