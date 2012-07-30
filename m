Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Svs3y-0001Oo-Vm
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 17:39:19 +0200
Received: by pbbrq2 with SMTP id rq2so8774523pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=8kR14QcjzdA77KMPJIkWNgT0qEh095zvq9w53l6tMag=;
	b=kOa95g71u9peL+5Ga0zQ2he4ptkwnRpsQ2z0bN58h/UXS7n5YZsuepbEZfO3hn5i8m
	3Uc2z8Ub99rwaRYL+IxPJSV/lGpLij0gir8TEMp2UwJiRvGf55UddTfpf4sxDXXPGKpF
	YsFb16rkowUV1/bRKr43zbAOIsTWfvH+WVQXStKgdaNlEAmusnR9yNL8NSGPTcSzS3Ey
	jXR5DQHuuS+FxsT5F1g969GtZpm3xpL03LU9wxo+SmMjEF51XP+Q4uOY+CpRRLsCcdG6
	Q8EfmyQWPXdH4JEud4rGSODKs7cIbscErbp5OtPFd6hrjJj3j2OElOfBISW/o3P2b3iF
	wxcA==
Received: by 10.68.242.228 with SMTP id wt4mr13913132pbc.89.1343662062152;
	Mon, 30 Jul 2012 08:27:42 -0700 (PDT)
Received: from [192.168.1.66] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id gf3sm8106095pbc.74.2012.07.30.08.27.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 08:27:41 -0700 (PDT)
References: <1343597225-9805-1-git-send-email-raj.khem@gmail.com>
	<1649088.OayoHGzzEP@helios>
In-Reply-To: <1649088.OayoHGzzEP@helios>
Mime-Version: 1.0 (1.0)
Message-Id: <1C0DDC6B-F51F-4F12-B785-06D63CB028BF@gmail.com>
X-Mailer: iPad Mail (9B206)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jul 2012 08:27:40 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm.bbclass: Accomodate dash when using arrays
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
X-List-Received-Date: Mon, 30 Jul 2012 15:39:19 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On Jul 30, 2012, at 2:26 AM, Paul Eggleton <paul.eggleton@linux.intel.com> w=
rote:

> On Sunday 29 July 2012 14:27:05 Khem Raj wrote:
>> we were assigning local variable to an array coming through
>> positional arguments. local is a non posix contruct thats
>> also supported by dash luckily but operates differently in this
>> case it exapnds the array before assignment. so
>>=20
>> local pkgs=3D"$@"
>>=20
>> turns into pkgs=3Dlocale-base-en-us locale-base-en-gb
>>=20
>> ant we see errors
>>=20
>> run.do_rootfs.25593: 932: local: locale-base-en-gb: bad variable name
>>=20
>> So lets not use defining and assigning local in one go
>> first define a local and then the assignment
>=20
> Oops, sorry about that.
>=20
> However, in the other thread you said package_rpm.bbclass was "full of=20
> bashisms" - is there only this one?


I was referring to use of local since that is not posix but it seems it's so=
 prevalent that even dash has extension for it so we are ok with dash and ba=
sh there=20
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


