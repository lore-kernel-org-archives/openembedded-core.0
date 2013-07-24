Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id EB48660656
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:34:24 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf11so224043pab.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 22:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=AjkJ8sKyhzwiRhhHfAJgNKIAIqENv+y6Kmr6lpEFp2I=;
	b=AB2TJTIXqsFPFO7tOzoB25WfZCfZp2F6rHhBPVrQgiYgIjbaqTqNtCaYr5GWIh3cWO
	5a/OFmD4RTUcoy7e5ka83Dl5Cl/L0Vo4O2RUtDUrVURIWDfy/OddAOlu9wm5VUTIzsnP
	zF3orLAT/LU34LmpNDPLBJ6gEDLBgknahDopIngtV9xnSVNl+N1LzeY4Ia+IVrGA2r3U
	h8oOVRB30YFAgPgdWneJHA9iOYiyWOpH6ZsOn3JrHBPjOLvw1qqtnaOe8bHuOWIk2lyI
	9fSuLQSe25MyJrg33EUchT6Nncr8T6cDz6UVJYbIQ9QEdsmnJ/cRqxeqJ18KTHRWdoCq
	fAGQ==
X-Received: by 10.68.36.132 with SMTP id q4mr40423754pbj.118.1374644065837;
	Tue, 23 Jul 2013 22:34:25 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	qv4sm45602520pbc.16.2013.07.23.22.34.24 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 22:34:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <947336a1ef2b936328ba6fcf519d55a4eda7085d.1374643300.git.rongqing.li@windriver.com>
Date: Tue, 23 Jul 2013 22:34:23 -0700
Message-Id: <8651FFE5-8500-4151-A4DF-BE780516C6CC@gmail.com>
References: <cover.1374643300.git.rongqing.li@windriver.com>
	<947336a1ef2b936328ba6fcf519d55a4eda7085d.1374643300.git.rongqing.li@windriver.com>
To: <rongqing.li@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: ignore qemu output, and check its return code
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
X-List-Received-Date: Wed, 24 Jul 2013 05:34:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 23, 2013, at 10:24 PM, <rongqing.li@windriver.com> wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> qemu prints errors sometime, but it works well, the error information
> can be captured by rpm, and lead to rpm failure. like:
>=20
> 	$export D=3D/tmp/rootfs;.../usr/bin/qemu-i386 -L $D \
> 		-E LD_LIBRARY_PATH=3D$D/usr/lib:$D/lib $D/bin/udevadm =
hwdb --update --root $D
> 	qemu: Unsupported syscall: 240


hmm this is a qemu issue and I bet qemu is segfaulting
This should be fixed. Can you try porting=20

http://lists.gnu.org/archive/html/qemu-devel/2010-02/msg00870.html

To qemu please ?

Then you won't need this patch.


