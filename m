Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SqHaC-0007Ar-Ts
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 07:41:29 +0200
Received: by pbbrq2 with SMTP id rq2so7350088pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jul 2012 22:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=mTLILoj5s78Xw00gM9oqR9Q/l3lMBXN6KbFTbdI7Lg0=;
	b=VmiMtG8K88iynvEEEwWIAeFv4xpsbmzrZFI6/B+K7TDUIgkwGyHT7pDIyrX0JGqfWV
	P1LRZ1TIYjBTwii3YQvySNj41gQiPdOPix+gM9lWZKveIpioMD5xfYhoOiPDBO+6v7yU
	srFGAGgksKBlnUf/duRsRUr3H/f+eHzLorhtV/qcSzOxh5jq3fLMZf8fzZeeNbesJ3sx
	KgXbEL+FHx9xtc+/KzQGoc3a1XeBp0uoFJJU1FrFC3gczNHzBFc/3QmkdYHcLE58QBzU
	LGfM5bwoLML3zd4HrOy7H6zwNmPcRCw7MkFLjwIPB2QSeP/ZqVjikR2rg58i5xOTF5fn
	Z9Jg==
Received: by 10.66.76.231 with SMTP id n7mr13643532paw.68.1342330211383;
	Sat, 14 Jul 2012 22:30:11 -0700 (PDT)
Received: from [192.168.1.66] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id pp2sm9309818pbb.1.2012.07.14.22.30.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Jul 2012 22:30:10 -0700 (PDT)
References: <5002527B.30207@linux.intel.com>
In-Reply-To: <5002527B.30207@linux.intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <BB6F3D69-30B0-4EEA-95E8-353E6204C774@gmail.com>
X-Mailer: iPad Mail (9B206)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Jul 2012 22:30:09 -0700
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: eglibc update status?
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
X-List-Received-Date: Sun, 15 Jul 2012 05:41:29 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On Jul 14, 2012, at 10:17 PM, Saul Wold <sgw@linux.intel.com> wrote:

>=20
> Khem,
>=20
> Where are you with the update, I have noticed various updates to your egli=
bc branch, one recent one had a change to the mkelfimage svn variant, while i=
t seems there is not a git variant.
>=20
> Please let me know what your plans are here.

It's ready, I updated eglibc 2.16 recipe to use protocol instead of proto in=
 src uri
And I updated any recipes that were failing for world build with 2.16 or oth=
erwise if I could find time fixing them

I plan no more updates to this branch now

>=20
> Thanks
>=20
> --=20
>    Sau!
>=20
> Saul Wold
> Yocto Component Wrangler @ Intel
> Yocto Project / Poky Build System
>=20
>=20


