Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKdLn-0004DB-Mr
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 00:32:24 +0100
Received: by mail-pd0-f177.google.com with SMTP id y14so3290640pdi.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 16:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=AT8SZ3SwUHIJZPK5Vi+mVP3faJsgUG4WJWTZkIAfXRY=;
	b=q6UFNhcd4simPVNDJ1EWLpmNUcGtmbUwaueejQZJoekuVzJfYv7f4Dz68gSFq48uUi
	G3XP9F+9E2ZRDJKXZKbtW0FV3AZ8ncFTiQe+0rwMCr+ri3IZe1m2bUk0HbzmcIgv2YzS
	3Ysa68l+6Vsgy7eXH7dSMP+rA6WlhQfIr6TPoo20SC4XEdGF4seqMv9y3tIAxb0WsnRB
	uAMUooInYIl3Gb5rQxBJkaBzsJFChG5ZcekDzxm4y3tttL9vlhac6tYBnDfKbSI3YkpN
	EhADKKrs6/jWofX85R5Q9hAdnK9RqRavORNFo5MgpQ2KxUDvKmp5dNNDXU/Dh+FMnGvs
	8pkg==
X-Received: by 10.68.209.134 with SMTP id mm6mr25746212pbc.98.1364339718744;
	Tue, 26 Mar 2013 16:15:18 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id kl4sm19019745pbc.31.2013.03.26.16.15.16
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 16:15:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Laf0Zj+j___3MrwOqdWHMWapwBJb1TGXKSYT1=z59w9yA@mail.gmail.com>
Date: Tue, 26 Mar 2013 16:15:16 -0700
Message-Id: <EC39D001-4AEC-46A3-AA46-FA45FA91811B@gmail.com>
References: <1363816759-24737-1-git-send-email-obi@opendreambox.org>
	<CAJTo0LbXkrf=8ii=OfStD03jQXM_Rxy4baoshQ_VXttgydFgcA@mail.gmail.com>
	<E7E52452-31CB-497E-B1BE-35D9961884B4@gmail.com>
	<CAJTo0Laf0Zj+j___3MrwOqdWHMWapwBJb1TGXKSYT1=z59w9yA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: fix FILES_${PN}-syslog assignment
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
X-List-Received-Date: Tue, 26 Mar 2013 23:32:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 26, 2013, at 10:18 AM, "Burton, Ross" <ross.burton@intel.com> =
wrote:

> Hi Khem,
>=20
> On 21 March 2013 18:20, Khem Raj <raj.khem@gmail.com> wrote:
>> Ross, I have 198 update pactch in branch here
>>=20
>> =
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/sys=
temd-198&id=3D51d4993c7375a7339a3ee91cf6b24da25b2d9b50
>>=20
>> this one is good. Other two I need to address comments
>> can you pick this one too into your branch ?
>> so I can ride with you
>=20
> I hope you don't think that I've been ignoring this - I wanted a
> stable base to finish the integration branch and a new upstream
> version wasn't the stability I was after.  I'll look at merging this
> work tomorrow.

OK thanks for replying. I have rebased my branch on top of todays =
OE-Core


>=20
> Ross



