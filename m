Received: from mail-pd0-f170.google.com ([209.85.192.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1UL61B-0000VY-9r; Thu, 28 Mar 2013 07:09:01 +0100
Received: by mail-pd0-f170.google.com with SMTP id 4so3927384pdd.29
	for <multiple recipients>; Wed, 27 Mar 2013 22:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:content-type:content-transfer-encoding:subject
	:message-id:date:to:mime-version:x-mailer;
	bh=MhADakGvZwR1ERdbTZLak67XSAFsw2cFc8LdBBpIJ64=;
	b=l4S4iwHLddxgIKJzHEJoDBTm9mhvvOLia5taAhx0zIbFLFqn48fw/N+TQcPzeJxSWc
	AMRRUeypXPO2cv7qIVbHmcfz4aQV698Zym8nqqSrdyQrBx/EWPJNRaLK5TAPeRvJZyaO
	/13Tmg+CHAvKoWkdoH+Dh9zV7ZFIpbgI63LfYbjXxOm9SSd7rWyW60lascGnMm3CeD8L
	SCAdN6c0JxbAAkJpLKHihJgfXtQgi6PHnkpDOFP4JByKzD4u2+Jbaw+20knXtoiYo4Gt
	Mz5wfTXTtGneUT4GSp34okMd5ayxPXFHcAXNj7OyjX4/1Wef7pkrA0L0E/3Hs6DO3J5V
	IDBA==
X-Received: by 10.68.190.99 with SMTP id gp3mr34014706pbc.117.1364449914132;
	Wed, 27 Mar 2013 22:51:54 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id 1sm24190040pba.32.2013.03.27.22.51.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 22:51:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
Date: Wed, 27 Mar 2013 22:51:50 -0700
To: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
Subject: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Thu, 28 Mar 2013 06:09:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

All,

I have added gcc 4.8 recipes and the branch is here=20

git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8

cgit

=
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-4.=
8

Please test it out on your respective environments if you can.

To enable gcc 4.8 with OE-Core you would

in local.conf set

GCCVERSION =3D "4.8%"

and if you use angstrom. Please checkout 'next' branch of setup-scripts
and then in conf/local.conf

set

ANGSTROM_GCC_VERSION =3D "4.8%"

My testing so far has been building systems-image for all qemu machines =
and they
seem to boot as good as 4.7 did. But I am hoping for wider testing and =
finding issues
or very least improve the existing recipes for now and once the 1.4 =
release is done
we can then propose it for inclusion in OE-Core

Thanks for your time


-Khem=


