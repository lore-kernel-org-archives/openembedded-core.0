Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 936BD6FD21
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 09:27:56 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id r20so595801wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 02:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=U5zI0tpFlmg316K1DTuyHF3jDoNsxnr204Lkv+pk2j8=;
	b=PSOe/vcNLzdaitrcgqbInYSyUX5Upk08x/EQjGRjyDeLTEMvLYySrdYp1bY4qK3mET
	mBZ6qrntLXYnbHx6AbzUTF7EJvlnDbZbLwq7S8XKyC3T1HDMdrz0/oO8YMiltCralOlF
	GzrOKpUNfVI0c3rsYqU2+oDy2V1osAVt5tinH40NlhJ6qc9r5+VA9zPzxH9hP+IL4MRz
	efqZMBWo5Ync5++fDBwzJmLZeVvDAeI5fBboOTWWPb5WhA9HDdZ+dwSWBBGeovuyWGji
	0sNL492SiZIwrcoyJZI0H7FrfssrAa8MmJqAWKLLqzfZomA6E/nRtzWNJ/nD50A6QhOo
	FgkQ==
X-Gm-Message-State: ALoCoQkECmicAMUX/+vikuBr6uq3zTRmIUyl/xLxEpJxIqFvHVGxZhEHhwpxDeOq4UxLX99oTpj/
X-Received: by 10.194.238.134 with SMTP id vk6mr2298761wjc.93.1402046876590;
	Fri, 06 Jun 2014 02:27:56 -0700 (PDT)
Received: from ?IPv6:2001:610:612::e0a5:b64d:b69f:f4f3?
	([2001:610:612:0:e0a5:b64d:b69f:f4f3])
	by mx.google.com with ESMTPSA id
	b16sm11529580wjx.45.2014.06.06.02.27.55 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Jun 2014 02:27:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20140606091700.GW2426@jama>
Date: Fri, 6 Jun 2014 11:27:53 +0200
Message-Id: <5E9C5A13-3147-406A-9717-656B9334D451@dominion.thruhere.net>
References: <1402025177-7694-1-git-send-email-yaoxp@cn.fujitsu.com>
	<20140606091700.GW2426@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lvm2.inc: EXTRA_OECONF is been overwrited
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
X-List-Received-Date: Fri, 06 Jun 2014 09:27:58 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 6 jun. 2014, om 11:17 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Thu, Jun 05, 2014 at 11:26:17PM -0400, Yao Xinpan wrote:
>> EXTRA_OECONF has been assigned before =91EXTRA_OECONF =3D =
"--with-usrlibdir=3D${libdir}"=92.
>>=20
>> So, =91EXTRA_OECONF =3D "--with-usrlibdir=3D${libdir}"=92 should be =
changed to
>> =91EXTRA_OECONF +=3D "--with-usrlibdir=3D${libdir}"=92.
>>=20
>> Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
>> ---
>> meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc =
b/meta-oe/recipes-support/lvm2/lvm2.inc
>> index c6a9ec0..71f782a 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
>> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
>> @@ -47,4 +47,4 @@ FILES_${PN} +=3D "${libdir}/device-mapper/*.so =
${base_libdir}/udev"
>> FILES_${PN}-dbg +=3D "${libdir}/device-mapper/.debug"
>>=20
>> RDEPENDS_${PN} =3D "bash"
>> -EXTRA_OECONF =3D "--with-usrlibdir=3D${libdir}"
>> +EXTRA_OECONF +=3D "--with-usrlibdir=3D${libdir}"
>=20
> Please send it to openembedded-devel@lists.openembedded.org with right
> subject tag (see README file)


And just collaps the 2 lines into a single EXTRA_OECONF. I don't know =
how that EXTRA_OECONF below RDEPENDS got through review, but it =
shouldn't have.=

