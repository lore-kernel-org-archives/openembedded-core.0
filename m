Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6c0h-0000hH-J1
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 08:44:19 +0200
Received: by pbcwy7 with SMTP id wy7so613738pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 23:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=1GfUIvF54Ihco4Av8Y76ppVmYGObLitBsdJvqBxqR+Y=;
	b=rz+yulpw4PfM44Xkj3vs7ZZOsgahPysLx0NQ9U8PkK+cBNMSdh8Ux/lsExueVtBHW5
	zGVxwY2WTkLKSuPxMMzLm87McxhvvUkt8fnvivM1wdZ3ggWrFCZgk2hf7bJYdF3wye4s
	VjchUTBFacXjXVdqDRnIgqFMzyAWYZfQsnpxHtF7XfDhVRErw9qaR+ulwlOnLJPR/elF
	Gl7LMctJr68zwyhQ7DJ7d195F7DcBODCZM0E0e8EMWSa8KRVFbkfblOzYxLlI5paoHSf
	lWiy5FSkT7mTS3jx8tqfzIeD8RLA2gqJKvGU/kfO4DK5cjC02foytRjgd1hzft2NQAXS
	ODIQ==
Received: by 10.66.87.66 with SMTP id v2mr1212838paz.71.1346221925287;
	Tue, 28 Aug 2012 23:32:05 -0700 (PDT)
Received: from sa-nc-common4-151.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPS id
	pf10sm18664602pbc.56.2012.08.28.23.32.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Aug 2012 23:32:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAGiJk9eNZ05-Ai9+bGVBCzxsBBLRMW_JLYrJoBECiyBd74Y=sA@mail.gmail.com>
Date: Tue, 28 Aug 2012 23:32:01 -0700
Message-Id: <B3CDAA28-6110-40A8-9D3C-8986E7E517B3@gmail.com>
References: <CAGiJk9dvZ=_eSZwcXRnsfwo+h0x9fWJnCapuSCVz_HftgJAw6g@mail.gmail.com>
	<1485327.Nf27BjiNnc@helios>
	<CAGiJk9dU3=Z+iTe0=v5rpQbFRsnBwQEJ_4Ywz0h+CaSR+xaZ=A@mail.gmail.com>
	<CAMKF1sp5PQiCyMRUD8_PG_cA8Ougu2jOmUwW9Hg2Hpv+2HChxw@mail.gmail.com>
	<CAGiJk9eNZ05-Ai9+bGVBCzxsBBLRMW_JLYrJoBECiyBd74Y=sA@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
X-Mailer: Apple Mail (2.1486)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Package re-order fallouts?
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
X-List-Received-Date: Wed, 29 Aug 2012 06:44:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 28, 2012, at 11:15 PM, Samuel Stirtzel =
<s.stirtzel@googlemail.com> wrote:

>=20
> The package re-ordering happened in OE-Core and _not in Angstrom_ how
> is this Angstrom related?
>=20

I misunderstood I think you are referring to=20

commit b41b2bc584756956a48c9c5f91e7337e821105b2
Author: Saul Wold <sgw@linux.intel.com>
Date:   Thu Jun 28 13:33:42 2012 -0700

    bitbake.conf: Add PACKAGE_BEFORE_PN to PACKAGES


and=20

commit 66c36bcb7d9368718453265e58bd5e3c854c786a
Author: Saul Wold <sgw@linux.intel.com>
Date:   Tue Jun 5 04:52:21 2012 -0700

    bitbake.conf: reorder PACKAGES list
   =20
    This change re-orders the PACKAGES list to move PN to the end of the =
list
    this will ensure that base package gets the final bits since the =
packaging
    is greedy. We can then have -dev and other package get bits first.
   =20


yes layers need to adjust to cope with it.=


