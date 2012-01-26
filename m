Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RqNIW-0000vF-0X
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 12:15:20 +0100
Received: by wibhq7 with SMTP id hq7so277694wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 03:07:32 -0800 (PST)
Received: by 10.180.84.133 with SMTP id z5mr3301990wiy.10.1327576052500;
	Thu, 26 Jan 2012 03:07:32 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cb8sm4822708wib.0.2012.01.26.03.07.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 03:07:31 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1327425023.19643.100.camel@ted>
Date: Thu, 26 Jan 2012 12:07:25 +0100
Message-Id: <20319846-61AA-4377-997D-B770D23E2ED9@dominion.thruhere.net>
References: <1327425023.19643.100.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: "Garman, Scott A" <scott.a.garman@intel.com>
Subject: Re: [PATCH] shadow: Split securetty into a separate recipe
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
X-List-Received-Date: Thu, 26 Jan 2012 11:15:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 jan. 2012, om 18:10 heeft Richard Purdie het volgende geschreven:

> The securetty file is machine specific whilst the rest of the shadow =
recipe
> is not. Unfortunately making the recipce machine specific is both =
inefficient
> and also causes dependency problems since parts of the system such as =
the useradd
> code depend upon it and this introduces a machine specific element to =
sstate
> checksums which should not be machine specific.
>=20
> To resolve this, this patch separates out the file into a separate =
recipe
> meaning the machine specific components are isolated.

A word of warning for people with binary feeds: rebuild shadow for all =
your machines before uploading, otherwise you'll be greeted with error =
messages about missing securetty packages during upgrade. Opkg itself =
can't handle the upgrade properly since it will install dependencies =
first, so it errors out with "/etc/securetty already provided by =
shadow", so use --force-overwrite.

I can't think of a way of doing this change without causing the above =
problems :(

regards,

Koen=


