Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SaSYB-0000pF-K8
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 16:09:59 +0200
Received: by wibhm14 with SMTP id hm14so592232wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=YF4FjateSzkJLuLJeHgqiG+adcMQHpTEOD4PP0a/344=;
	b=bGdWvO8ZF5/JzlqwDeSOXkyiFLICY7TdWRlhz2bvVzgo6wLHbJ7GYoxexfp/Yk+qML
	/VytAwC+kZynUqetHoGKPaKHuWCv3YG4QAAcWtSIErQ60slstFV3WyQwmp+VGgDmDx3T
	NgQyreczSyDCVQhANXcTZ6QsOLwtLgzRWHsORW+zTO2Ha18ypQB9Xr8Gyj0EWR44855j
	Ugknh7Hnzu29aJ/n2xAYdBPMKFHz4cR/fVk7YMUs+kYQxBACHLtfyIv42kPikvhKZGdm
	R7fW6LltbZVNhT0lOrvaeFCF7NBkNppzWl4hBjUzBN1xhhE5l1UHToLQIImJD0zdIUUl
	LOZQ==
Received: by 10.216.135.204 with SMTP id u54mr2160316wei.40.1338559178480;
	Fri, 01 Jun 2012 06:59:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.181.16 with HTTP; Fri, 1 Jun 2012 06:59:18 -0700 (PDT)
In-Reply-To: <20120531230633.70344cfb@wrlaptop>
References: <cover.1338515870.git.chris_larson@mentor.com>
	<367a51d945217c0a11caab13e71fe83a557a6872.1338515870.git.chris_larson@mentor.com>
	<20120531230633.70344cfb@wrlaptop>
From: Chris Larson <kergoth@gmail.com>
Date: Fri, 1 Jun 2012 06:59:18 -0700
Message-ID: <CABcZAN=eWQ2axLAex1RzBdx+HTmomPpsq_6Vq32t3HDE6QJP-Q@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] external-sourcery: extract src and dest sysroot paths from gcc
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
X-List-Received-Date: Fri, 01 Jun 2012 14:09:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2012 at 9:06 PM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> On Thu, 31 May 2012 19:00:04 -0700
> Christopher Larson <kergoth@gmail.com> wrote:
>
>> +CSL_MULTILIB_ARGS[i586] =3D "-msgxx-glibc"
>> +CSL_MULTILIB_ARGS[i686] =3D "-msgxx-glibc"
>> +CSL_MULTILIB_ARGS[core2] =3D "-msgxx-glibc"
>> +CSL_MULTILIB_ARGS[x86] =3D "-msgxx-glibc"
>> +CSL_MULTILIB_ARGS[x86-64] =3D "-msgxx-glibc"
>> +CSL_MULTILIB_ARGS[ppce500] =3D "-te500v1"
>> +CSL_MULTILIB_ARGS[ppce500mc] =3D "-te500mc"
>> +CSL_MULTILIB_ARGS[ppce500v2] =3D "-te500v2"
>> +CSL_MULTILIB_ARGS[ppce600] =3D "-te600"
>
> I would suggest that these be ?=3D assignments.
>
> Rationale: =C2=A0There is more than one Sourcery toolchain out there, and
> they sometimes differ in these. =C2=A0It'd be nice if a hypothetical vend=
or
> using a hypothetical custom variant of the Sourcery toolchain could use
> these configuration files with nothing more than a few variable
> assignments. =C2=A0:)

Good point, I'll change that and send a v2. Thanks.
--=20
Christopher Larson


