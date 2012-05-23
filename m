Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SXCgQ-00059d-0A
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 16:37:02 +0200
Received: by eekd49 with SMTP id d49so2488486eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 07:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=1EUa204HbNiJ+lMeEEK+WgVRqNvCpyEUjNbYKVHQzGI=;
	b=g+U6xz1hKa9/+Lt8pYHQBKYYQiqiHiUWEbQYKJ1zy2lDla4/Eo6hJTIJkgSY6SfM/R
	hsw0IDoCAzExpT5y89llIAHhwYMhMm+9vqw8ZcUA1vzTgHnOrEZ3A+DCYrLjJqqAyN1r
	3b0ldJRVMB6C6UZqj6fC9GyjUBY4cJ+tyPQBwL3E7iG2GAbnWk//2o1q+XLJKYtlcxpn
	DvRmXbSfLBE6BG166ZXF0cGEm3XosV1T5FoWxEFEyQlZDmYVls7uVtGJisRowHnPwQsQ
	aFV6VTl4Q5PwUxda1cIjlMhJMEKarJFmBF7l5NkCrjOQjet6yJpR4J1yohe2kPsR8bCU
	m4Yw==
Received: by 10.213.22.212 with SMTP id o20mr1330404ebb.67.1337783211901;
	Wed, 23 May 2012 07:26:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v7sm123894780eem.6.2012.05.23.07.26.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 07:26:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FBCF0B9.40503@linux.intel.com>
Date: Wed, 23 May 2012 16:26:48 +0200
Message-Id: <0F0EDA1B-C376-4EFC-86D7-6A779A92FAD8@dominion.thruhere.net>
References: <1337771338-12407-1-git-send-email-valentin.popa@intel.com>
	<4FBCF0B9.40503@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmKXy2b12siDB2xEIe/LWknsf/kh2zQj4Krb8czl5NP9z27HKx0YvyMSKfyaHKXdp7/nXTw
Subject: Re: [PATCH] xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 23 May 2012 14:37:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mei 2012, om 16:14 heeft Saul Wold het volgende geschreven:

> On 05/23/2012 04:08 AM, Valentin Popa wrote:
>> From: valentin<valentin@valentin-linux.(none)>
>>=20
>> The licenses are the same, only some white
>> spaces added/removed.
>>=20
>> Signed-off-by: valentin<valentin.popa@intel.com>
>> ---
>>  .../xz/{xz_5.0.3.bb =3D>  xz_5.1.1alpha.bb}           |   10 =
+++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>  rename meta/recipes-extended/xz/{xz_5.0.3.bb =3D>  xz_5.1.1alpha.bb} =
(72%)
>>=20
> Why update to an "Alpha" Version, clearly we want to wait for the =
released version.

xz is not getting updated a lot and this release should bring parallel =
xz support. I asked about this a few weeks ago here, but didn't get much =
response: =
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/018706.h=
tml

regards,

Koen=


