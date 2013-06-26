Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6E0396A973;
	Wed, 26 Jun 2013 21:06:48 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so87364pab.27
	for <multiple recipients>; Wed, 26 Jun 2013 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version:x-mailer;
	bh=XO11pN8irO/fus1xlOeaHAEnP5HXJt22iAsKFwca9rE=;
	b=X4O1JN924FtE7imHcmPlnRMyP1PnO20sJxejFYFlmgVLnSyil9XAZrI6iEhVtLlo/6
	P/0punUezUJlncXZvbq0Iiq0arn3dNpK9yXunECuNZwqB42C8nAVFZp0JTYayUNmEd8c
	iqQKrkfp6QDW6bCmBdYTPPHUPtwGy+LDCntDAfSDpcK6sDEGO8uY1uX2oQgyA36x3Lrm
	UPlI8mEteo/45YFpPH4LZ+I9xP+aDXyPsZByh8bgRCGr1tbSYRnVTi/Sop9lG8yuI1FL
	GW1jDc50lqUDAPtTE74Qs/5CkGW04yRM2Rorz8qKK/OMiIsnQN3ReINTjhJ1/9i1rL6c
	36Jg==
X-Received: by 10.68.245.200 with SMTP id xq8mr2567853pbc.32.1372280809243;
	Wed, 26 Jun 2013 14:06:49 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id dc3sm29900102pbc.9.2013.06.26.14.06.47
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Jun 2013 14:06:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jun 2013 14:06:46 -0700
Message-Id: <1831F7C6-54BC-4E5F-BC00-1B8C17E8D1FD@gmail.com>
To: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
X-Mailer: Apple Mail (2.1508)
Cc: "yocto@yoctoproject.org \(yocto@yoctoproject.org\)"
	<yocto@yoctoproject.org>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: eglibc (would be 2.18) recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2013 21:06:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi All

I have put together eglibc recipes for upcoming 2.18 release and pushed =
to a contrib tree here

=
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/eglibc=
-2.18

They built angstrom/systemd-images fine and booted OK on all supported =
qemu machines
on OE-Core

Please test them out in your configurations and machines and provide =
feedback, lets weed out
the issue early

Thanks

-Khem=

