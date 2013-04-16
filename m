Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1US92C-0006C2-Lb
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 18:47:08 +0200
Received: by mail-ea0-f175.google.com with SMTP id r16so323955ead.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 09:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=rLcpWqa1Cmv7DixciyTpvBS3TalG4V/pSdiT3L2wIZo=;
	b=Avo07iUTFj2Foh3TXcEJrjG7p6k/xvjM0sLAR85UMGXtbQwebawz2rI8AgMJus4TMS
	p8O8TDzt0j+dXuQ2poaGlvB7VfutT2dUHwbmbg6h5U/mnM9vvQIIfcHn4bxfVHjeex6d
	yoV+yvnqBtRRhrtCdl84dzYupT5ZrohgkuQDqFoOllhJfJgawEjH7M47YEYfffXOxmWc
	lh79Rr8Pgm2/CbpXxHCB+qqokFQBt/46EUX5k7Qz1EzKRdng7RcE3s0Q8znvvn+Otaf2
	AcZDLFimwAsBxmpW2GoDqWTJhtv45ZQuSAcDOoqMTBejrIA027QrP+hxeeFYTnx9hA7W
	urJw==
X-Received: by 10.15.22.199 with SMTP id f47mr7768887eeu.11.1366129778101;
	Tue, 16 Apr 2013 09:29:38 -0700 (PDT)
Received: from ?IPv6:2001:610:612::393b:5029:6966:1da4?
	([2001:610:612:0:393b:5029:6966:1da4])
	by mx.google.com with ESMTPS id cb50sm3735031eeb.14.2013.04.16.09.29.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 09:29:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1366127627.8670.98.camel@ted>
Date: Tue, 16 Apr 2013 18:29:35 +0200
Message-Id: <1CEA2C6F-2993-40DD-AC27-34B1A763BA0F@dominion.thruhere.net>
References: <1366112971-3644-1-git-send-email-koen@dominion.thruhere.net>
	<1366127627.8670.98.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQncdBn+gORiNua75E5IeYWh7n4Yhemr7EzOUkWO71uuCMzhptcJP6LPBacJeh3wm1OC12Am
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] seperatebuilddir.inc: disable seperate build dir for consolekit
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
X-List-Received-Date: Tue, 16 Apr 2013 16:47:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 apr. 2013, om 17:53 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Tue, 2013-04-16 at 13:49 +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/conf/distro/include/seperatebuilddir.inc | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/conf/distro/include/seperatebuilddir.inc =
b/meta/conf/distro/include/seperatebuilddir.inc
>> index a9ca240..f60dc5c 100644
>> --- a/meta/conf/distro/include/seperatebuilddir.inc
>> +++ b/meta/conf/distro/include/seperatebuilddir.inc
>> @@ -78,7 +78,9 @@ B_pn-compositeproto =3D "${SEPB}"
>> B_pn-compositeproto-native =3D "${SEPB}"
>> #B_pn-connman =3D "${SEPB}"
>> #B_pn-connman-gnome =3D "${SEPB}"
>> -B_pn-consolekit =3D "${SEPB}"
>> +#B_pn-consolekit =3D "${SEPB}"
>> +#| =
/build/setup-scripts/build/tmp-angstrom_next-eglibc/work/cortexa8hf-vfp-ne=
on-angstrom-linux-gnueabi/consolekit/0.4.5-r10/ConsoleKit-0.4.5/pam-ck-con=
nector/pam-ck-connector.c:64:26: fatal error: ck-connector.h: No such =
file or directory
>> +#| compilation terminated.
>> B_pn-console-tools =3D "${SEPB}"
>> B_pn-coreutils =3D "${SEPB}"
>> B_pn-coreutils-native =3D "${SEPB}"
>=20
> Neither my local builds or the autobuilder see this. Any idea why some
> builds would fail and others would work?

No idea, it was building fine, then I enabled seperate-builddir, removed =
TMPDIR, kicked off a build and ck started failing, so I disabled SEPB, =
-c clean and it started working again. This is on quadcore i7, make -j8, =
spinning rust.

So far it's the only recipe failing over here for OE-core and seperate =
builddir.

regards,

Koen=


