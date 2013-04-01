Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1UMfS2-0003cW-78
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 16:11:10 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 8C0E520CA5;
	Mon,  1 Apr 2013 09:54:03 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute3.internal (MEProxy); Mon, 01 Apr 2013 09:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=bcHg9MmujStmt3Ns9mudJb
	fe6ts=; b=TsK4epHHdGpJgDEU3JzSHaIypVFpjbOkZ0nNlW5v6dy7fso6ATiwYO
	B7O+2v4j/d+M/HuQUI6ynSPQgcT8VKE/gKpky1hUbcsNhxaIqo3mRWGa7pRrCB9r
	BIMX+RRQBd/GGwpG2yzfuVQbFg/Y0/8gIgT0kBjpxv+XcsGbqzNMY=
X-Sasl-enc: NAB0rGWV7nrj6QDwRcYET+5Qy9M9bS08ey7UCed7dpPY 1364824443
Received: from [192.168.1.3] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1BEEF20006F;
	Mon,  1 Apr 2013 09:54:03 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
In-Reply-To: <CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<20130328122110.GA5105@jama>
	<35803143-FAED-48CC-9FD1-1E216B3A575C@gmail.com>
	<A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
	<D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
	<CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
Date: Mon, 01 Apr 2013 09:54:01 -0400
Message-ID: <1364824441.24754.20.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
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
X-List-Received-Date: Mon, 01 Apr 2013 14:11:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-03-29 at 13:50 +0100, Andreas M=C3=BCller wrote:

> Anybody an idea why I get this when building from scratch:
>=20
> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv=
7a-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
> 'systemd': No such file
> | make[2]: *** [org.freedesktop.systemd1.Manager.xml] Error 1
> | make[2]: *** Waiting for unfinished jobs....

http://lists.freedesktop.org/archives/systemd-devel/2013-February/008751.=
html




