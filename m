Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TLdTv-0000Bf-QA
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 19:20:35 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so4923464pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2012 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=q+6t2IN1egYIMVrfDV15Wl8hz+o3kVP27bypIRfzMeM=;
	b=gvJm/kT2hIjwWKlkB9l+/qJ2FFXrw8pf3aftzXNhu1PdGUDrzbQ513+z/WX8EXUySq
	s2gHXPX8bpaYc6oJ6XIwOaaGHBugPcsRYJJLOb7eTNUgRC3cTFD7vF2dxMnx2SBZ5z7x
	Ws1eW1Ewq2mPVk+u94/OLt17t4+wY0Ct9c8il4uUitBGCAbQq/lP+wA4qgR2mef7HDkI
	GRZ/ksI4a4CUaBhJakYB66ST9yFt/p1COH/HF5rjYEALr4ovbfAVJEwh5mrhIi9X5a0o
	z4EoBC73VUaBay9zA6ysiOPLSc17u+DMx6ix9uF0YpYHqWHr1o3A1vX8pyTQXYkN8Cm8
	lxzQ==
Received: by 10.68.211.67 with SMTP id na3mr59151736pbc.21.1349802447288;
	Tue, 09 Oct 2012 10:07:27 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	po4sm12668779pbb.13.2012.10.09.10.07.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 10:07:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2072868.bxk9nbbmYZ@helios>
Date: Tue, 9 Oct 2012 10:07:21 -0700
Message-Id: <FD0C6F48-3B88-4335-8450-4ACB13ADD6A2@gmail.com>
References: <cover.1349689653.git.jackie.huang@windriver.com>
	<2072868.bxk9nbbmYZ@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] ruby: Add from OE-Classic and update to 1.9.3-p194
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
X-List-Received-Date: Tue, 09 Oct 2012 17:20:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 9, 2012, at 3:38 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> Hi Jackie,
>=20
> On Tuesday 09 October 2012 14:36:53 jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>=20
>> * I sent this months ago but was told that oe-core is not the right =
place,
>>  however, we think it makes sense to add ruby to complete the =
scripting
>>  language set of: python, perl, ruby, so I re-send it.
>=20
> I have to say, my opinion is the same now as it was then. Ruby support =
is=20
> certainly useful to have, and we have had requests for it; but unlike =
Perl and=20
> Python which are needed by many other things, nothing we have in =
OE-Core=20
> actually needs Ruby; thus it really belongs in another layer IMHO.
>=20

I guess yes reluctantly, unless we have two different ruby apps which =
show
up in different layers then we have a stronger case.

> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



