Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFC0V-0004Ig-K8
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 00:19:52 +0100
Received: by mail-pb0-f50.google.com with SMTP id up1so4227828pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 16:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=G6CcvEP1ak++xQjsBMaxBnd46KhHcj2Irv/lrY7OWqk=;
	b=NEm5ZLbQmshJU88rr8lblJpF6969SQOgusNcY+94pNJDmHgRrNbFMkA40XqfmubHZW
	ntIo0tTbTGHc3bqnOFtbuxVQvFoqhM6RzF7KYDFMR2nttWjHyhtsPKCfKGwMOdqT6/0+
	UENvVG6u5jiyPKaT7iMfmYfgMXTTMlmmmyuwRZXDvPf80e3JT0EPbZsxlXNylYp5Bw0L
	xBc/wJQs+UGK4SOn4hlMwECU7TE5RN4i78o9IVRSsn4sSrm/fLw6NUzQoBQX7846H6fN
	l+TtbWdw918WwmV/lrnnyxer0bgbH5viruS8gYqZvQNtv91ZS8xzNl2OQtDMqueLxesj
	nZCg==
X-Received: by 10.68.170.193 with SMTP id ao1mr28641315pbc.129.1363042992264; 
	Mon, 11 Mar 2013 16:03:12 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	rr14sm22213294pbb.34.2013.03.11.16.03.10
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 16:03:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1C3733EF-6163-4090-949C-5B73BBE02DEB@dominion.thruhere.net>
Date: Mon, 11 Mar 2013 16:03:09 -0700
Message-Id: <8D545500-9892-4FC1-B4DF-825AD4219165@gmail.com>
References: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
	<8f815c617b69812e749a5a197a3903fe8daaf645.1362873102.git.raj.khem@gmail.com>
	<1C3733EF-6163-4090-949C-5B73BBE02DEB@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] systemd: Package hwdb data
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
X-List-Received-Date: Mon, 11 Mar 2013 23:19:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 11, 2013, at 7:00 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

>=20
> Op 10 mrt. 2013, om 00:54 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:
>=20
>> Create a new package to hold the hwdb.d
>> Fixes the packaging warning as well.
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/recipes-core/systemd/systemd_198.bb |    4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd_198.bb =
b/meta/recipes-core/systemd/systemd_198.bb
>> index 381a67b..9fc4704 100644
>> --- a/meta/recipes-core/systemd/systemd_198.bb
>> +++ b/meta/recipes-core/systemd/systemd_198.bb
>> @@ -105,7 +105,7 @@ python populate_packages_prepend (){
>> }
>> PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
>>=20
>> -PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs =
${PN}-analyze"
>> +PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs =
${PN}-analyze ${PN}-hwdb"
>>=20
>> USERADD_PACKAGES =3D "${PN}"
>> GROUPADD_PARAM_${PN} =3D "-r lock"
>> @@ -168,6 +168,8 @@ FILES_${PN} =3D " ${base_bindir}/* \
>>                /lib/udev/rules.d/99-systemd.rules \
>>               "
>>=20
>> +FILES_${PN}-hwdb =3D "/lib/udev/hwdb.d"
>> +
>=20
> It's a udev hwdb, so calling it systemd-hwdb would be very misleading.

OK I had it called udev-hwdb until I thought otherwise and changed it

> And aren't you missing a RRECOMMENDS?

I think Ross already has this taken care of so this patch might be moot.=


