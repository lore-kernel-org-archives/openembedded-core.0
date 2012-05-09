Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SS8ue-0002O3-V5
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 17:34:49 +0200
Received: by werb13 with SMTP id b13so319197wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 08:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=xaG/cDF8RKAbbhz76yVQKjQe7MGEZnCE2RHErHwU1KE=;
	b=mlrwq+8M0+5MINTPlLUoBH513RS9aaUMGV80LPPpjCXrTP/QkUs8h/6ZnyR6LuTCJF
	6vN9IlqQy2gwePt2UrkdJ4GIlJWQKhKCopzc8gZtPZFrGt/hgLpVlKHxw1/wlRWjctow
	maA5CDT3/pCnOUAmSzwAUfnU/ceH8fnHrcs7T1twT9tfWHSFB3pDMhGcsvc7xcVU0O2c
	qaOLewu3c2cVDgpU4ZKQoqC65FDHocT5oUUO4NwW2CU2TAdP47NGG4MIq3OcYypt7JTr
	4Sb+R9HuLnJc7/YYaCwSGd6Xx/V9EX2NJP0bPshKz71KvTUXQPa5qNmhxcq/ZtUwppKK
	DIpg==
Received: by 10.180.78.233 with SMTP id e9mr1339512wix.5.1336577096253;
	Wed, 09 May 2012 08:24:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 6sm37016148wiz.1.2012.05.09.08.24.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 08:24:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FAA8A03.50309@windriver.com>
Date: Wed, 9 May 2012 17:24:52 +0200
Message-Id: <033DD718-AA9D-4F09-9E06-13C14DBBB7AC@dominion.thruhere.net>
References: <cover.1336547713.git.liezhi.yang@windriver.com>
	<03d9cdca29477f34348a0f97138504441c5804fa.1336547713.git.liezhi.yang@windriver.com>
	<23E51582-C3C4-4673-B646-F29E74FEB428@dominion.thruhere.net>
	<4FAA84B3.1080108@windriver.com>
	<6122E5DC-EFF1-4592-AB36-22E9D68DF2BF@dominion.thruhere.net>
	<4FAA8A03.50309@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnNeazB5rDrvPuKD9ynfcb3xhPJ91Bbh53WNMefO/uBPgIwB1f5ubfxrkfHkdTOydVvsR9S
Subject: Re: [PATCH 2/2] rootfs_rpm.bbclass: don't remove rpmlib when INC_RPM_IMAGE_GEN=1
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
X-List-Received-Date: Wed, 09 May 2012 15:34:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2012, om 17:15 heeft Mark Hatle het volgende geschreven:

> On 5/9/12 10:01 AM, Koen Kooi wrote:
>>=20
>> Op 9 mei 2012, om 16:52 heeft Mark Hatle het volgende geschreven:
>>=20
>>> On 5/9/12 3:50 AM, Koen Kooi wrote:
>>>>=20
>>>> Op 9 mei 2012, om 10:20 heeft Robert Yang het volgende geschreven:
>>>>=20
>>>>> Don't remove rpmlib when INC_RPM_IMAGE_GEN=3D1, otherwise the
>>>>> list_installed_packages would get nothing in the second build.
>>>>=20
>>>> What happens when I do a build, enable INC_RPM_IMAGE_GEN and do =
another build?
>>>=20
>>> The intention is that only the packages that have been =
changed/upgraded will be installed.  Instead of the whole image being =
generated from scratch each time.
>>=20
>> That's what INC_RPM_IMAGE_GEN does, yes. What I'm asking is how this =
patch addresses the sequence I outlined above.
>=20
> Explain what you mean by "build".
>=20
> Using the following:
>=20
> . ./oe-init-build-env build-test
> <setup local.conf w/ rpm packaging and INC_RPM_IMAGE_GEN>
> bitbake core-image-core
> --- time passes, git pull pulls in changes ---
> bitbake core-image-core
>=20
> The second "build", only the changed packages will be added to the =
image.
>=20
> You you are using different build directories, then it doesn't re-use =
anything.  The purpose of this is incremental software development =
within a single build directory.

You are still missing my point. The patch is broken if you change =
INC_RPM_IMAGE_GEN=


