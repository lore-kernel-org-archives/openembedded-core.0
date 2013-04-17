Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1USU4P-0006Te-5E
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 17:15:52 +0200
Received: by mail-pa0-f48.google.com with SMTP id lj1so966953pab.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=J2Ne/sdVPPSE3gyQNG2xSBXp0PYHrzZdo8vgxvZSG1o=;
	b=vIBorlvVdz0f3p2Z3R+ejQuDFxrC9YJUsZQKq7gfnPyQGDKmlK8iMx4wXtGCwBj9j2
	Z1jwJxBeKVeHR8p49MgkSyy7OOx4l4XkhpL6P7QLdgELBl+n/5zbYgsxyyBonN0iOAkR
	e/H6eIEzntzf7JfXMy1eBKaxUrOExeMl0zMU1VxpXnwQizGrWeU0eqczpUt8OWJ1Z60g
	qLcWfG0H01iY6ubFZfQarJLoUigLRFzLSGp9YG0U75O2YuAgbYMRfg6HD0rWZ0D11aBn
	KNuPR19UmKKvZXiri/D0CgD42BHeABy9xE+ma9+JQQf2YtSaKOPKtSQi5yysF6lKj3gC
	Nt9A==
X-Received: by 10.66.246.168 with SMTP id xx8mr9185969pac.107.1366210636690;
	Wed, 17 Apr 2013 07:57:16 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id xz4sm6565378pbb.18.2013.04.17.07.57.15
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 07:57:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <18219582.KT7bte5u1O@helios>
Date: Wed, 17 Apr 2013 07:57:13 -0700
Message-Id: <A4E33256-746E-4C88-AA56-D56ACB80CB8D@gmail.com>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<CE6CCFD7-CDBA-4669-9EA4-02BBA59EDE5E@gmail.com>
	<18219582.KT7bte5u1O@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Wed, 17 Apr 2013 15:16:01 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Apr 17, 2013, at 1:28 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Tuesday 16 April 2013 23:42:08 Khem Raj wrote:
>> On Apr 16, 2013, at 11:28 PM, Andreas M=FCller =
<schnitzeltony@googlemail.com>
>> wrote:
>>> sorry again me with another issue. I updated all layers from master
>>> few hours ago and built from scratch. On first boot with systemd
>>> postinst never finishes. I see only:
>>>=20
>>> [**  } A start job is running for Run pending postinsts
>>>=20
>>> and ** are moving around.
>>>=20
>>> Does anybody else face this one?
>>=20
>> ran into same issue. I disabled post installs to run on boot
>=20
> Could you guys please try to debug this and find out what is hanging =
here,=20
> because with core-image-minimal and systemd I don't see this problem, =
the run-
> postinsts script finishes as expected.


does minimal image have rpm post installs ?

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre



