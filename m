Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1St0fJ-000580-4k
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 20:14:01 +0200
Received: by weyr6 with SMTP id r6so3577496wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 11:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=t2TtShS3OJApW+Ycz2c6xAK1ZDr0PVU50YKNitCOZaM=;
	b=CNhSVU5alQ0N+VThmoVjO092CgFqaBDocnhuM5iD6RYasjYEI+UWdwWSbZr3iQSC/a
	ITANMmvrSWQGP6r83s9Zqo4Ojca7CDZSDbzXQO2L7kpfgBvYhLQL2aZWYnph2t+1kupE
	QBPcIYX24FR+AtlmzHJbwbV7vXPVmw/PVBD3O3OZRHtcSJW+7uCe/BHDFL2H4UCBtW2W
	bXsK/0Wab+YV59o7tXCRgRfdy8CX3MqW0p87zOseAQpXBAPxKulsgcdnUqtBjmSJhC7h
	W384i1rxwhJlt3L1cvvJTxXWnVEuv/AXEWxzjBB2+wgeYyIdStO/aemxGi6d5hQN1aAv
	Zs5g==
Received: by 10.180.98.138 with SMTP id ei10mr29825892wib.1.1342980155323;
	Sun, 22 Jul 2012 11:02:35 -0700 (PDT)
Received: from [10.46.148.181] ([92.69.213.29])
	by mx.google.com with ESMTPS id bc2sm18203342wib.0.2012.07.22.11.02.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Jul 2012 11:02:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <alpine.DEB.2.02.1207221140590.4364@oneiric>
Date: Sun, 22 Jul 2012 20:02:31 +0200
Message-Id: <AAF22030-F4D6-47BD-905B-29D1E63804BA@dominion.thruhere.net>
References: <alpine.DEB.2.02.1207221035050.18352@oneiric>
	<alpine.DEB.2.02.1207221140590.4364@oneiric>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQknZz5MMUVYxdOpqM3F6woiK1IyUD9LPdQ0Tw2aRtm5d5Tw4wOWPNyTzhGAbqd1+Kt4mVgJ
Subject: Re: "bitbake -c fetch gcc-cross-initial" from github appears to be hanging
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
X-List-Received-Date: Sun, 22 Jul 2012 18:14:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jul. 2012, om 17:41 heeft Robert P. J. Day het volgende =
geschreven:

> On Sun, 22 Jul 2012, Robert P. J. Day wrote:
>=20
>>=20
>>  long story short, this fixes the problem, but i'm going to guess
>> that's not really the proper solution:
>>=20
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc =
b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> index 43d77ec..478e34e 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> @@ -36,7 +36,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
>>                    =
file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>> 		   =
file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8"
>>=20
>> -SRC_URI =3D =
"git://github.com/mirrors/gcc.git;branch=3D${BRANCH};protocol=3Dgit \
>> +SRC_URI =3D =
"git://gcc.gnu.org/git/gcc.git;branch=3D${BRANCH};protocol=3Dgit \
>> 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
>> 	   file://100-uclibc-conf.patch \
>>            file://gcc-uclibc-locale-ctype_touplow_t.patch \
>>=20
>>=20
>=20
>  never mind, github seems to be fine now.  no idea what that was all
> about.

If someone is wrong with github it usually shows up on =
https://status.github.com/

regards,

Koen=


